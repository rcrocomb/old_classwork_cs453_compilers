/*!
 *  Author: Robert Crocombe
 *  Class: CS453 Fall 04
 *  Professor: Debray
 *  Other People's Code Used: No
 */

#include "codelist.h"

#include "parser_utils.h"
using namespace parser_utils;

#include "variable_info.h"
#include "array_info.h"
#include "function_info.h"

#include <fstream>
#include <sstream>
#include <iostream>
using std::cout;
using std::endl;

#include <iomanip>
using std::setfill;
using std::setw;

////////////////////////////////////////////////////////////////////////////////
// Macros
////////////////////////////////////////////////////////////////////////////////

#define DA_ASM "\nprint_int:\n\
    li $v0, 1\n\
    lw $a0, 0($sp)\n\
    syscall\n\
    jr $ra\n\
\n\
print_string:\n\
    li $v0, 4\n\
    lw $a0, 0($sp)\n\
    syscall\n\
    jr $ra\n"

////////////////////////////////////////////////////////////////////////////////
// Static variable
////////////////////////////////////////////////////////////////////////////////

operation_to_assembly_map * codelist::asm_map_ = 0;
std::string codelist::DEBRAY_ASM(DA_ASM);

////////////////////////////////////////////////////////////////////////////////
// Constructors and destructor
////////////////////////////////////////////////////////////////////////////////

codelist::codelist(void):
    code_(0),
    data_(0),
    asm_text_(0)
{
    if (!asm_map_)
    {
        asm_map_ = new operation_to_assembly_map();
        operation_map *op_map = three_code::build_operation_map();
        load_asm("mips_assembly", op_map);
        delete op_map;
    }

    code_ = new code_list();
    data_ = new code_list();
    asm_text_ = new asm_list();
}

codelist::codelist(const codelist &l)
{
    code_ = new code_list();
    code_list::const_iterator i = l.code_->begin();
    const code_list::const_iterator e = l.code_->end();
    for ( ; i != e; ++i)
    {
        code_->push_back(new three_code(*(*i)));
    }

    data_ = new code_list();
    i = l.data_->begin();
    const code_list::const_iterator de = l.data_->end();
    for ( ; i != de; ++i)
    {
        data_->push_back(new three_code(*(*i)));
    }
}

codelist::~codelist(void)
{
    // delete three code (but not stuff inside three code)
    code_list::iterator c_i = code_->begin();
    const code_list::iterator c_e = code_->end();
    for ( ; c_i != c_e; ++c_i)
    {
        delete *c_i;
    }

    // delete global variable list (but not global variables themselves)
    code_list::iterator d_i = data_->begin();
    const code_list::iterator d_e = data_->end();
    for ( ; d_i != d_e; ++d_i)
    {
        delete *d_i;
    }

    // delete assembly text.
    asm_list::iterator j = asm_text_->begin();
    const asm_list::iterator ae = asm_text_->end();
    for ( ; j != ae; ++j)
    {
        delete *j;
    }

    delete code_;
    delete data_;
    delete asm_text_;
}

////////////////////////////////////////////////////////////////////////////////
// Private
////////////////////////////////////////////////////////////////////////////////

void
codelist::load_asm(const std::string &filename, operation_map * const o)
{
    const int FILE_LINE_LENGTH = 255 + 1;

    std::ifstream in(filename.c_str());
    if (!in)
    {
        RUNTIME_ERROR("Unable to open asm input file '%s'\n", filename.c_str());
    }

    char raw_line[FILE_LINE_LENGTH];
    while (1)
    {
        in.getline(raw_line, FILE_LINE_LENGTH);

        if ( (strlen(raw_line) > 0) && (raw_line[0] == '#')) continue;
        if ( (strlen(raw_line) == 0) && (!in.eof())) continue;

        if (in.eof())
        {
            break;
        }

        if (in.fail())
        {
            RUNTIME_ERROR("failure while reading '%s'\n", filename.c_str());
            break;
        }

        // get operation for which we are generating assembly
        std::string operation(raw_line);
        if (o->count(operation) == 0)
        {
            RUNTIME_ERROR("No operator by the name of '%s' found in map\n",
                          raw_line);
        }

        // smoosh all assembly pieces from each line into one big
        // string and put this string into a map keyed off the value
        // of the enumeration of the operation.
        std::string assembly;
        in.getline(raw_line, FILE_LINE_LENGTH);
        while (strlen(raw_line) != 0)       // should stop on blank line
        {
            if (raw_line[0] != '#')         // comments
            {
                assembly += raw_line;
                assembly += "\n";
            }
            in.getline(raw_line, FILE_LINE_LENGTH);
        }
        (*asm_map_)[(*o)[operation]] = new std::string(assembly);
    }
}

/*!
*/

std::string
codelist::generate_global_variable
(
    const variable_info * const v,
    int * const size
)
{
    std::ostringstream o;
    o << v->name() << ":\t";
    if (v->is_const())
    {
        switch(v->type())
        {
        case INT_TYPE:
            o << ".word " << v->value() << "\n";
            *size = MIPS_INT_SIZE;
            break;
        case BOOL_TYPE:     // intermediate results only!
        case CHAR_TYPE:
            o << ".byte '" << static_cast<char>(v->value()) << "'\n";
            *size = MIPS_CHAR_SIZE;
            break;
        default:
            RUNTIME_ERROR("codelist::generate_global_variable: Invalid type "
                          "for var '%s' when generating assembly\n", PNAME(v));
        }

    } else
    {

        switch(v->type())
        {
        case INT_TYPE:
            o << ".space " << MIPS_INT_SIZE << "\n";
            *size = MIPS_INT_SIZE;
            break;
        case BOOL_TYPE:     // intermediate results only!
        case CHAR_TYPE:
            o << ".space " << MIPS_CHAR_SIZE << "\n";
            *size = MIPS_CHAR_SIZE;
            break;
        default:
            RUNTIME_ERROR("codelist::generate_global_variable: Invalid type "
                          "for var '%s' when generating assembly\n", PNAME(v));
        }
    }

    o << "\n";
    return o.str();
}

/*!
    All global variables: includes string constants.
*/

std::string
codelist::generate_global_array
(
    const array_info * const a,
    int * const size
)
{
    std::ostringstream o;
    o << a->name() << ":\t";

    if (a->data())
    {
        // array with data.  Must be a string constant
        o << ".asciiz " << a->stringify_data() << "\n";
        *size = a->size() + 1;  // + 1 for '\0'
    } else
    {
        // regular array.
        switch(a->type())
        {
        case INT_TYPE:  *size = a->size() * MIPS_INT_SIZE; break;
        case CHAR_TYPE: *size = a->size(); break;
        default:
            RUNTIME_ERROR("Invalid type for array '%s' when generating asm\n",
                          PNAME(a));
        }
        o << ".space " << *size << "\n";
    }
    o << "\n";
    return o.str();
}

/*!
    Global variables and global arrays are handled differently.
*/

std::string
codelist::translate_data
(
    three_code * const data,
    int * const variable_size
)
{
    data->dest->global(true);

    variable_info * v = dynamic_cast<variable_info *>(data->dest);
    if (v)
    {
        return generate_global_variable(v, variable_size);
    }

    array_info * a = dynamic_cast<array_info *>(data->dest);
    if (a)
    {
        return generate_global_array(a, variable_size);
    }

    RUNTIME_ERROR("codelist::generate_global -- insanity for '%s'!\n",
                  PNAME(data->dest));
}


/*!
    This is all screwed up.  There's duplicate stuff being done, and
    the opcode-specific stuff, while was supposed to be isolated to
    one routine, kinda got mixed around and junk.  Not poking at it
    now, though.
*/

std::string
codelist::translate( three_code * const code, int * const stack_offset)
{
    if (!asm_map_)
    {
        RUNTIME_ERROR("codelist::translate No map from operation to assembly!");
    }

    if (!code)
    {
        RUNTIME_ERROR("codelist::translate No three-code supplied!");
    }

    if ( !((*asm_map_)[code->op]))
    {
        operation_map *op_map = three_code::build_operation_map();
        std::string x = reverse_lookup(code->op, *op_map);
        delete op_map;
        RUNTIME_ERROR("No matching assembly for op '%s'", x.c_str());
    }

    std::string op_text("# ");
    op_text += code->stringify();
    std::string subbed(*(*asm_map_)[code->op] );

// substitute labels with actual variable position info

    replace_loads(code->src_1, &subbed, " x");   // substitute lw or lb
    replace_loads(code->src_2, &subbed, " y");

    replace_stores(code->src_1, &subbed, " x");  // substitute sw or sb 
    replace_stores(code->src_2, &subbed, " y");
    replace_stores(code->dest, &subbed, " z");

    handle_opcode_specific_cases(code, &subbed);

    replace_source_label(code->src_1, &subbed, " x");
    replace_source_label(code->src_2, &subbed, " y");
    replace_dest_label(code, &subbed, " z");

    subbed = op_text + subbed;
    return subbed;
}

/*!
    Just about everything except the arithmetic/logical/comparison opcodes
    have "special needs".
*/

void
codelist::handle_opcode_specific_cases
(
    const three_code * const code,
    std::string * const assembly
)
{
    using namespace std;

    const string::iterator b = assembly->begin();
    // blick.
    const string x_label(" x");
    const string y_label(" y");
    const string z_label(" z");
    const int x_length = x_label.length();
    const int y_length = y_label.length();
    const int z_length = z_label.length();

    switch (code->op)
    {

    case OP_GOTO:
    {
        string::size_type p = assembly->find(x_label);
        if (p == string::npos) RUNTIME_ERROR("Substituting for GOTO");
        std::string replacement_string = " " + code->src_1->name();
        replacement_string += "\n";
        assembly->replace(p, x_length, replacement_string);
    }
    break;


    case OP_COND_BRANCH:
    case OP_FALSE_COND_BRANCH:
    {
        string::size_type p = assembly->find(y_label);
        if (p == string::npos) RUNTIME_ERROR("Substituting for a BRANCH");
        std::string replacement_string = " " + code->src_2->name();
        replacement_string += "\n";
        assembly->replace(p, y_length, replacement_string);
    }
    break;

    case OP_LABEL:
    {
        string::size_type p = assembly->find(x_label);
        if (p == string::npos) RUNTIME_ERROR("Substituting for a LABEL");
        assembly->replace(p, x_length, code->src_1->name()); 
    }
    break;

    case OP_ENTER_FUNCTION:
    {
        string::size_type p = assembly->find(x_label);
        if (p == string::npos) RUNTIME_ERROR("Finding label for ENTER_FUNC");
        // main is magical, and needs the ".globl" thingie so that
        // SPIM can find it.
        if ( code->src_1->name() == "__main")
        {
            assembly->replace(p, x_length,"    .globl main\nmain");
        } else
        {
            assembly->replace(p, x_length, code->src_1->name()); 
        }

        insert_local_variables(code->src_1, assembly);
    }
    break;

    case OP_ASSIGN_FROM_ARRAY:
    {

        array_info *a = dynamic_cast<array_info *>(code->src_1);
        if (!a) RUNTIME_ERROR("Hello, Satan here.  Just wanted to tell you that you suck.  Have a nice day.");

        //cout << "ASSIGN_FROM_ARRAY " << PNAME(code->src_1) << " is " << (a->local() ? "local" : "non-local") << endl;

        if (!a->local() && !a->global())
        {
            // parameter

            // need to use 'la' for local arrays, or 'lw' for arrays that
            // are parameters
            const std::string la("la");
            const std::string lw("lw");

            std::string::size_type p = assembly->find(la);
            if (p == std::string::npos)
            {
                RUNTIME_ERROR("Can't find 'la' in OP_ASSIGN_FROM_ARRAY");
            }

            assembly->replace(p, la.length(), lw);
        }


        replace_loads(code->src_1, assembly, " y");

        // no more "load"s in this string now that replacement has
        // been done for label 'y'.
        const std::string load("load");
        std::string::size_type p = assembly->find(load);
        if (p == std::string::npos)
        {
            RUNTIME_ERROR("Much badness in OP_ASSIGN_FROM_ARRAY");
        }

        std::string replacement;
        switch(code->src_1->type())
        {
        case CHAR_TYPE: replacement = "lb"; break;
        case INT_TYPE:  replacement = "lw"; break;
        default: RUNTIME_ERROR("Unknown type replacing load for '%s'",
                               PNAME(code->src_1));
        }
        assembly->replace(p, load.length(), replacement);
        
        fix_array_shifts(code->src_1, assembly);
    }
    break;

    case OP_ASSIGN_TO_ARRAY:
    {
        array_info *a = dynamic_cast<array_info *>(code->src_1);
        if (!a) RUNTIME_ERROR("And Jesus looked upon then, and lo, he spake: \"Truly thine code sucketh greatly and long, my brother.\"");

        //cout << "ASSIGN_TO_ARRAY " << PNAME(code->src_1) << " is " << (a->local() ? "local" : "non-local") << endl;

        if (!a->local() && !a->global())
        {
            // I think globals should be treated like locals, using
            // 'la.  Because then the resulting assembly is
            //      la __global_name
            // which looks right.
            //      lw __global_name
            // to me looks like you get the datum at __global_name[0]


            // need to use 'la' for local arrays, or 'lw' for arrays that
            // are parameters
            const std::string la("la");
            const std::string lw("lw");

            std::string::size_type p = assembly->find(la);
            if (p == std::string::npos)
            {
                RUNTIME_ERROR("Can't find 'la' in OP_ASSIGN_TO_ARRAY");
            }

            assembly->replace(p, la.length(), lw);
        }


        const std::string store("store");
        std::string::size_type p = assembly->find(store);
        if (p == std::string::npos)
        {
            RUNTIME_ERROR("Much badness in OP_ASSIGN_TO_ARRAY");
        }

        std::string replacement;
        switch(code->src_1->type())
        {
        case CHAR_TYPE: replacement = "sb"; break;
        case INT_TYPE:  replacement = "sw"; break;
        default: RUNTIME_ERROR("Unknown type replacing store for '%s'",
                               PNAME(code->src_1));
        }
        assembly->replace(p, store.length(), replacement);
        replace_loads(code->src_1, assembly, " z");
        replace_loads(code->src_2, assembly, " y");
        fix_array_shifts(code->src_1, assembly);
    }
    break;

    case OP_LEAVE_FUNCTION:
        return_value_if_gotta(code, assembly);
        break;

    case OP_CALL_FUNCTION:
    {
        int offset =replace_function_params(code->src_1, code->src_2, assembly);

        string::size_type pos_x = assembly->find(x_label);
        field_info *f = code->src_1;
        if (pos_x == string::npos)
        {
            RUNTIME_ERROR("Couldn't find x label in CALL to function '%s'",
                           PNAME(f));
        }
        // target function is in 'x'
        assembly->replace(pos_x, x_length, " " + f->name()); 

        string::size_type pos_z = assembly->find(z_label);
        if (pos_z == string::npos)
        {
            RUNTIME_ERROR("Couldn't find z label in CALL to function '%s'",
                           PNAME(f));
        }

        // where return value should go is in 'z'
        if (code->src_1->type() == VOID_TYPE)
        {
            // adjust stack pointer back up past parameters
            std::ostringstream o;
            o.str("");
            o << "\n    la $sp, "
              << setw(1) << setfill('0') << offset << "($sp)\n";
            std::string::size_type begin_line = assembly->rfind("\n", pos_z);
            std::string temp = o.str();
            assembly->replace(begin_line, temp.length(),temp);
            // XXX: Hey, is this right?  Doesn't it kinda depend upon
            // how long 'temp' is and stuff?  Seems fragile.
        } else
        {
            // adjust stack pointer back up past parameters
            std::ostringstream o;
            o.str("");
            o << "\n    la $sp, "
              << setw(1) << setfill('0') << offset << "($sp)\n";
            std::string::size_type begin_line = assembly->rfind("\n", pos_z);
            std::string temp = o.str();
            assembly->insert(begin_line, temp);

            // Assembly for getting return value from a function: 'z'
            // is the source of this return value
            data_info *d = code->dest;
            o.str("");
            o << " ";
            if (d->global())
            {
                o << d->name() << "\n";
            } else
            {
                o << setw(1) << setfill('0') << d->place() << "($sp)\n";
            }
            // pos_z has to be updated because of the insert() above.
            string::size_type pos_z = assembly->find(z_label);
            assembly->replace(pos_z, z_length, o.str());
        }
    }
    break;

    case OP_ASSIGN:
        break;

    case OP_DUMMY:
    {
    }
    break;

    default:
        ;
    }
}

/*!
    Only fixes loads for the SIZE of the variable being loaded from:
    nothing else.
*/


void
codelist::replace_loads
(
    const field_info * const f,
    std::string * const assembly,
    const char * const label
)
{
    if (!f) return;
    if (!assembly) return;

    using namespace std;
    string::size_type label_pos = assembly->find(label);
    if (label_pos == string::npos)
    {
        return;
    }

    // find last newline before label_pos
    std::string::size_type  begin_line = assembly->rfind("\n", label_pos);
    if (begin_line == std::string::npos) begin_line = 0;

    const string load("load");
    string::size_type load_pos = assembly->find(load, begin_line);
    if ( (load_pos != string::npos) && (load_pos < label_pos))
    {
        const string lw("lw");
        const string lb("lb");
        const string::iterator b = assembly->begin() + load_pos;
        switch (f->type())
        {
        case INT_TYPE: assembly->replace(load_pos, load.length(), lw);
                       break;
        case BOOL_TYPE:     // intermediate results only!
        case CHAR_TYPE: assembly->replace(load_pos, load.length(), lb);
                       break;
        default: RUNTIME_ERROR("Unknown type for variable '%s' when replacing loads.  Type is '%s'", PNAME(f), f->stringify_type().c_str());
        }
    }
}

/*!
    Only fixes stores for the SIZE of the variable being stored to:
    nothing else.
*/

void
codelist::replace_stores
(
    const field_info * const f,
    std::string * const assembly,
    const char * const label
)
{
    if (!f) return;
    if (!assembly) return;

    using namespace std;
    string::size_type label_pos = assembly->find(label);
    if (label_pos == string::npos)
    {
        return;
    }

    // find last newline before label_pos
    std::string::size_type  begin_line = assembly->rfind("\n", label_pos);
    if (begin_line == std::string::npos) begin_line = 0;

    // old_newline_pos should be last newline before the label.  Do
    // the replacement from there.

    const string store("store");
    string::size_type store_pos = assembly->find(store, begin_line);
    if ( (store_pos != string::npos) && (store_pos < label_pos))
    {
        const string sw("sw");
        const string sb("sb");
        switch (f->size())
        {
        case MIPS_INT_SIZE:  assembly->replace(store_pos, store.length(), sw);
                             break;
        case MIPS_CHAR_SIZE: assembly->replace(store_pos, store.length(), sb);
                             break;
        default:
            RUNTIME_ERROR("Unknown type size when replacing store: '%s'",
                          PNAME(f));
        }
    }
}

void
codelist::replace_source_label
(
    const field_info * const f,
    std::string * const assembly,
    const char * const label
)
{
    if (!f) return;
    if (!assembly) return;

    using namespace std;
    string::size_type place = assembly->find(label);

    const data_info *d = dynamic_cast<const data_info *>(f);

    if (place != string::npos)
    {
        if (f->global())
        {
            assembly->replace(place, strlen(label), " " + f->name());
        } else if (d && d->local())  // local variable
        {
            std::stringstream o;
            o << " " << setw(1) << setfill('0') << d->place() << "($sp)";
            assembly->replace(place, strlen(label), o.str());
        } else if (d) // parameter
        {
            std::stringstream o;
            o << " " << setw(1) << setfill('0') << d->place() << "($fp)";
            assembly->replace(place, strlen(label), o.str());
        } else
        {
            RUNTIME_ERROR("replace_source_label: Very Bad Things for '%s' while replacing label '%s' in the assembly:\n%s", PNAME(f), label, assembly->c_str());
        }
    }
}

/*!

*/

void
codelist::replace_dest_label
(
    const three_code * const tc,
    std::string * const assembly,
    const char * const label
)
{
    if (!assembly) return;

    using namespace std;
    string::size_type place = assembly->find(label);
    const int size = strlen(label);


    const string::iterator b = assembly->begin() + place;

    // XXX: not such a hot name anymore now that I have to use src_1
    //
    // This junk should go in opcode-specific someplace, I think.  Poo.
    if (place != string::npos)
    {
        switch (tc->op)
        {
        case OP_GOTO:           // fall-through
        case OP_COND_BRANCH:
        case OP_FALSE_COND_BRANCH:
        case OP_LABEL:
        case OP_ENTER_FUNCTION:
            assembly->replace(place, size, " " + tc->src_1->name()); 
            break;

        case OP_CALL_FUNCTION:
            // stuff moved to opcode-specific thingie
            break;

        default:

            // arithmetic/logical/comparison operations
            if (tc->dest->global())
            {
                assembly->replace(place, size, " " + tc->dest->name());
            } else if (tc->dest->local())   // local var, use sp
            {
                std::stringstream o;
                o << " "
                  << setw(1) << setfill('0') << tc->dest->place()
                  << "($sp)\n";
                assembly->replace(place, size, o.str());
            } else  // function parameter: use fp
            {
                std::stringstream o;
                o << " "
                  << setw(1) << setfill('0') << tc->dest->place()
                  << "($fp)\n";
                assembly->replace(place, size, o.str());
            }
        }
    }
}

/*!
    Two sizes of array.  To calculate the byte offset of a certain
    element of the array, we have to use the size of the element to
    calculate an offset from the starting address of the array.  This
    does that.
*/

void
codelist::fix_array_shifts
(
    const field_info * const f,
    std::string * const assembly
)
{
    using namespace std;

    const std::string char_string = "CHAR: ";
    const std::string int_string = "INT: ";

    switch(f->type())
    {
    case INT_TYPE:
    {
        // delete CHAR: line
        string::iterator b= assembly->begin();
        string::size_type char_pos = assembly->find(char_string);
        string::size_type bol = assembly->rfind("\n", char_pos);
        string::size_type eol = assembly->find("\n", char_pos);
        assembly->erase(b + bol, b + eol);

        // delete INT: part
        string::size_type int_line_start = assembly->find(int_string);
        assembly->erase(b + int_line_start,
                        b + int_line_start + int_string.length());
    }
    break;
        
    case CHAR_TYPE:
    {
        // delete INT: line
        string::iterator b = assembly->begin();
        string::size_type int_pos = assembly->find(int_string);
        string::size_type bol = assembly->rfind("\n", int_pos);
        string::size_type eol = assembly->find("\n", int_pos);
        assembly->erase(b + bol, b + eol);

        // delete CHAR: part
        string::size_type char_line_start = assembly->find(char_string);
        assembly->erase(b + char_line_start,
                        b + char_line_start + char_string.length());
    }
    break;

    default:
        RUNTIME_ERROR("fix_array_shift: unknown type for '%s'", PNAME(f));
    }
}

/*!
    Replaces keyword PARAMS with all the pushes needed to put a
    function call's parameters on the stack.
*/

int
codelist::replace_function_params
(
    const field_info * const f,
    const field_info * const source_f,
    std::string * const assembly
)
{
    if (!f || !source_f)
    {
        RUNTIME_ERROR("replace_function_params: NULL pointer.");
    }

    using namespace std;
    const string params("PARAMS");

    const function_info *func = dynamic_cast<const function_info *>(f);
    if (!func)
    {
        RUNTIME_ERROR("Trying to replace parameters for non-function '%s'",
                      PNAME(f));
    }

    const function_info *source_func = dynamic_cast<const function_info *>(source_f);
    if (!source_func)
    {
        RUNTIME_ERROR("Trying to call a function using a non-function '%s'",
                      PNAME(source_f));
    }

    string::size_type params_pos = assembly->find(params);
    if (params_pos == string::npos)
    {
        RUNTIME_ERROR("No keyword '%s' for OP_ENTER_FUNCTION?\n",
                      params.c_str());
    }

    string::size_type begin_line = assembly->rfind("\n", params_pos);
    string::size_type end_line = assembly->find("\n", params_pos);
    if (begin_line == string::npos) begin_line = 0;

    // if func(void), then nothing to do
    if (!func->parameters())
    {
        // delete that line to strip out PARAM keyword
        assembly->erase(begin_line, end_line - begin_line);
        return 0;
    }

    if (!source_func->parameters())
    {
        RUNTIME_ERROR("How can these not match: '%s' from '%s'",
                      PNAME(func), PNAME(source_func));
    }

    std::vector<std::string> param_asm;
    const param_vector * const p = source_func->parameters();
    const param_vector * const dest_p = func->parameters();

    //cout << "source params are " << *p << endl;
    //cout << "dest  params are " << *dest_p << endl;

    const param_vector::const_reverse_iterator b = p->rbegin();
    param_vector::const_reverse_iterator i = p->rbegin();
    const param_vector::const_reverse_iterator e = p->rend();

    //const param_vector::const_reverse_iterator dest_b = dest_p->rbegin();
    param_vector::const_reverse_iterator dest_i = dest_p->rbegin();

    // everything consumes 4 bytes on the stack for parameters:
    // 1. ints are passed by value
    // 2. chars are sign-extended
    // 3. arrays are passed by reference (4-byte pointer)

    // extra one because stack points to last currently used entry,
    // and not where new entry should go.
    const int BASE_OFFSET = 1 * MIPS_INT_SIZE;
    int frame_offset = BASE_OFFSET;
    std::ostringstream o;
    for ( ; i != e; ++i, ++dest_i)
    {
        o.str("");
        data_info *dest_param = *dest_i;

        array_info *a = dynamic_cast<array_info *>(*i);
        if (a)
        {
            array_info *dest_a = dynamic_cast<array_info *>(dest_param);
            if (!dest_a)
            {
                RUNTIME_ERROR("Source array is '%s' but destination is not an array: '%s'", PNAME(a),PNAME(dest_param));
            }

            // if parameter is an array, do this
            if (a->global())
            {
                // store address of global array at proper place on stack
                o << "    la $t2, " << a->name() << "\n"
                  << "    sw $t2, "
                  << setw(1) << setfill('0') << -frame_offset << "($sp)\n";
                // do not move sp or will screw up locals!
            } else if (a->local())
            {
                // get the address of the array off the stack
                // store it on parameter stack
                o << "    la $t2, " << setw(1) << setfill('0') 
                  << a->place() << "($sp)\n"
                  << "    sw $t2, " << -frame_offset << "($sp)\n";
            } else  // parameter
            {
                // a function parameter: address is positive off fp
                o << "    lw $t2, " << setw(1) << setfill('0') 
                  << a->place() << "($fp)\n"
                  << "    sw $t2, " << -frame_offset << "($sp)\n";
            }
        } else
        {
            // if parameter is a variable, do this
            variable_info *source_v = dynamic_cast<variable_info *>(*i);
            variable_info *dest_v = dynamic_cast<variable_info *>(*dest_i);

            if (!source_v)
            {
                RUNTIME_ERROR("Not variable or array in params: '%s'\n",
                              PNAME((*i)));
            }

            if (source_v->global())
            {
                // get value of global into register $t2
                switch (source_v->type())
                {
                case INT_TYPE:
                    o << "    lw $t2, " << source_v->name() << "\n";
                    break;
                case CHAR_TYPE:
                    o << "    lb $t2, " << source_v->name() << "\n";
                    break;
                default:
                    RUNTIME_ERROR("replace_function_params: unknown type for "
                                  "global variable '%s'", PNAME(source_v));
                }
            } else if (source_v->local())
            {
                // get value of local into register $t2
                switch (source_v->type())
                {
                case INT_TYPE:
                    o << "    lw $t2, "
                      << setw(1) << setfill('0') << source_v->place()
                      << "($sp)\n";
                    break;
                case BOOL_TYPE:
                case CHAR_TYPE:
                    o << "    lb $t2, "
                      << setw(1) << setfill('0') << source_v->place()
                      << "($sp)\n";
                    break;
                default:
                    RUNTIME_ERROR("replace_function_params: unknown type for "
                                  "local variable '%s'", PNAME(source_v));
                }
            } else
            {
                // get value of parameter into register $t2
                dest_v->place(frame_offset);
                switch (source_v->type())
                {
                case INT_TYPE: 
                    o << "    lw $t2, "
                      << setw(1) << setfill('0') << source_v->place()
                      << "($fp)\n";
                    break;
                case CHAR_TYPE:
                    o << "    lb $t2, "
                      << setw(1) << setfill('0') << source_v->place()
                      << "($fp)\n";
                    break;
                default:
                    RUNTIME_ERROR("replace_function_params: unknown type for "
                                  "parameter variable '%s'", PNAME(source_v));
                }
            }

            // now that value is in $t2, put that register on stack
            o << "    sw $t2, " << -frame_offset << "($sp)\n";
        }

        param_asm.push_back(o.str());
        frame_offset += MIPS_INT_SIZE;
    }

    // adjust stack pointer so it is at top of parameters
    //
    // note that we increment frame_offset right before we break out
    // of the loop, so the offset is off by 1 count of MIPS_INT_SIZE.
    // That's why the subtraction.
    int param_offset = frame_offset - 1 * MIPS_INT_SIZE;

    o.str("");
    o << "    la $sp, "
      << setw(1) << setfill('0') << -param_offset << "($sp)\n";

    std::string all_params = "";
    int end = param_asm.size();
    for (int j = 0; j < end; ++j)
    {
       all_params += param_asm[j]; 
    }
    all_params += o.str();

    assembly->replace(begin_line, end_line - begin_line, all_params);
    return param_offset;
}

/*!
    This is where I figure out the stack pointer offsets for local variables.

    I calculate the offsets to be used by other three code operations.

    Also, I move the stack pointer in case any subroutines are called.

    Yes, I calculate offsets for unused variables.  Life's like that.
*/

void
codelist::insert_local_variables
(
    field_info * const func,
    std::string * const assembly
)
{
    if (!assembly)
    {
        RUNTIME_ERROR("insert_local_variables: No assembly!");
    }
    const std::string::iterator b = assembly->begin();

    // find position of keyword
    const std::string LOCAL_LABEL("LOCAL");
    std::string::size_type local_pos = assembly->find(LOCAL_LABEL);
    if (local_pos == std::string::npos)
    {
        RUNTIME_ERROR("Missing keyword '%s' in function entrance",
                      LOCAL_LABEL.c_str());
    }
    std::string::size_type  begin_line = assembly->rfind("\n", local_pos);
    std::string::size_type  end_line = assembly->find("\n", local_pos);
    if (begin_line == std::string::npos) begin_line = 0;
    else ++begin_line;


    // make sure we're dealing with a function
    function_info * const f = dynamic_cast<function_info *>(func);
    if (!f)
    {
        RUNTIME_ERROR("Parameter passed to OP_ENTER_FUNCTION wasn't a function: '%s'", PNAME(func));
    }

    // see if function has any local variables
    param_vector * const p = f->locals(); 
    if (!p) RUNTIME_ERROR("Argh!  Missing locals vector for '%s'", PNAME(func));
    if (p->size() == 0)
    {
        // has no parameters -- void
        // delete line to strip out LOCAL keyword
        assembly->erase(begin_line, end_line - begin_line);
        return;
    }

    param_vector::const_reverse_iterator i = p->rbegin();
    const param_vector::const_reverse_iterator e = p->rend();

    // go from local variable at top of stack (closest to stack
    // pointer) to bottom of stack (farthest from stack pointer,
    // closest to frame pointer), i.e. from last declared variable to
    // first declared.
    int stack_offset = 0;
    std::stringstream o;
    for ( ; i != e; ++i)
    {
        data_info *d = *i;

        const array_info *a = dynamic_cast<const array_info *>(d);
        if (a)
        {
            int element_size = MIPS_CHAR_SIZE;
            switch (d->type())
            {
            case CHAR_TYPE: break;
            case INT_TYPE: 
                element_size = MIPS_INT_SIZE;
                if (stack_offset % MIPS_INT_SIZE != 0)
                {
                    // fix array alignment
                    stack_offset +=   MIPS_INT_SIZE
                                    - (stack_offset % MIPS_INT_SIZE);
                }
                break;
            default:RUNTIME_ERROR("Unknown type for local array '%s'",PNAME(d));
            }
            d->place(stack_offset);
            stack_offset += d->size() * element_size;
        } else
        {
            switch (d->type())
            {
            case BOOL_TYPE:
            case CHAR_TYPE: break;
            case INT_TYPE:
                if ((stack_offset % MIPS_INT_SIZE) != 0)
                {
                    // fix alignment
                    stack_offset +=   MIPS_INT_SIZE
                                    - (stack_offset % MIPS_INT_SIZE);
                }
                break;
            default: RUNTIME_ERROR("Unknown type for local var '%s'", PNAME(d));
            }
            d->place(stack_offset);
            stack_offset += d->size();
        }
        o << "# stack offset after '" << d->name() << "' is " << stack_offset << "\n";
    }

    // make sure that sp starts from aligned position
    //
    // This will put some pad between the first declared local
    // variable and the frame pointer.  Example:
    //
    // int x;
    // char a,b;
    //
    //  low address     x byte 0        0
    //                  x byte 1        
    //                  x byte 2
    //                  x byte 3
    //                  a byte 0        4
    //                  b byte 0        5
    //             fp-> old fp byte 0   6
    //  high address 
    //
    //  See, can't have 'x' be offset 6 bytes from fp: it won't be
    //  aligned.  So have to move 'sp' down 8 bytes and leave 2 bytes
    //  of padding after 'b'.
    //
    //  Note that I'm doing this even if there are no
    //  alignment-requiring types.
    if ((stack_offset % MIPS_INT_SIZE) != 0)
    {
        // fix alignment
        stack_offset +=   MIPS_INT_SIZE - (stack_offset % MIPS_INT_SIZE);
    }

    o << "# stack offset after final alignment is " << stack_offset << "\n";
    o << "    la $sp, " << -stack_offset << "($sp)\n";

    assembly->replace(begin_line,
                      end_line - begin_line,
                      o.str());
}

/*!
    Puts together code that gets return value from a function if it has one.
*/

void
codelist::return_value_if_gotta
(
    const three_code * const code,
    std::string * const assembly
)
{
    if (!code)
    {
        RUNTIME_ERROR("No freakin' three code op in return_value_if_gotta");
    }

    if (!assembly)
    {
        RUNTIME_ERROR("return_value_if_gotta: No assembly!");
    }
    const std::string::iterator b = assembly->begin();

    // find position of keyword
    const std::string RETURN_LABEL("RETURN");
    std::string::size_type return_pos = assembly->find(RETURN_LABEL);
    if (return_pos == std::string::npos)
    {
        RUNTIME_ERROR("Missing keyword '%s' in function entrance",
                      RETURN_LABEL.c_str());
    }

    std::string::size_type  begin_line = assembly->rfind("\n", return_pos);
    std::string::size_type  end_line = assembly->find("\n", return_pos);
    if (begin_line == std::string::npos) begin_line = 0;

    // make sure we're dealing with a function
    function_info * const f = dynamic_cast<function_info *>(code->src_1);
    if (!f)
    {
        RUNTIME_ERROR("Parameter passed to OP_LEAVE_FUNCTION wasn't a function: '%s'", PNAME(f));
    }

    // no return value: returns 'void'
    if (f->type() == VOID_TYPE)
    {
        // delete keyword and bail.
        assembly->erase(b + begin_line, b + end_line);
        return;
    }

    // replace keyword with statement for doing assembly bits.
    // Variable to get return value from is in dest
    data_info *d = code->dest;
    if (!d)
    {
        // Not supposed to be returning void, but no variable to get
        // return value from.  Give up.
        assembly->erase(b + begin_line, b + end_line);
        return;
    }

    std::ostringstream o;
    o.str();
    if (d->global())
    {
        switch(d->type())
        {
        case INT_TYPE:  o << "    lw $t2, " << d->name() << "\n"; break;
        case CHAR_TYPE: o << "    lb $t2, " << d->name() << "\n"; break;
        default: 
            RUNTIME_ERROR("Returning unknown type from function '%s': source "
                          "is global variable '%s'",PNAME(f),PNAME(d));
        }
    } else if (d->local())
    {
        switch(d->type())
        {
        case INT_TYPE:  o << "    lw $t2, " << d->place() << "($sp)\n"; break;
        case CHAR_TYPE: o << "    lb $t2, " << d->place() << "($sp)\n"; break;
        default: 
            RUNTIME_ERROR("Returning unknown type from function '%s': source "
                          "is local variable '%s'",PNAME(f),PNAME(d));
        }
    } else
    {
        switch(d->type())
        {
        case INT_TYPE:  o << "    lw $t2, " << d->place() << "($fp)\n"; break;
        case CHAR_TYPE: o << "    lb $t2, " << d->place() << "($fp)\n"; break;
        default:
            RUNTIME_ERROR("Returning unknown type from function '%s': source "
                          "is parameter variable '%s'",PNAME(f),PNAME(d));
        }
    }
    // put return value in return value register
    o << "    move $v0, $t2\n";

    assembly->replace(begin_line,
                      (return_pos + RETURN_LABEL.length()) - begin_line,
                      o.str());
}

////////////////////////////////////////////////////////////////////////////////
// Operators
////////////////////////////////////////////////////////////////////////////////

codelist &
codelist::operator =(const codelist &l)
{
    if (this != &l)
    {
        // dupe 'l' into 'c'
        code_list *c = new code_list();
        code_list::const_iterator i = l.code_->begin();
        code_list::const_iterator e = l.code_->end();
        for ( ; i != e; ++i)
        {
            c->push_back(new three_code(**i));
        }

        i = code_->begin();
        e = code_->end();
        for ( ; i != e; ++i)
        {
            delete *i;
        }
        delete code_;       

        code_ = c;
    }
    return *this; 
}

////////////////////////////////////////////////////////////////////////////////
// Interface
////////////////////////////////////////////////////////////////////////////////

void
codelist::generate_asm(void)
{
    code_list::iterator i = code_->begin();
    const code_list::iterator e = code_->end();

    // for each three code instruction
    std::string finished_asm;
    int stack_offset = 0;
    for ( ; i != e; ++i)
    {
        finished_asm = translate(*i, &stack_offset);
        asm_text_->push_back(new std::string(finished_asm));
    }
}

/*!
    Generate a list of globals and constants before every function.
*/

void
codelist::generate_data(void)
{
    code_list::iterator i = data_->begin();
    const code_list::iterator e = data_->end();

    if (i == e)
    {
        return;
    }

    // for each three code instruction
    std::string finished_data;
    int align_offset = 0;
    int variable_size = 0;

    asm_text_->push_back(new std::string("\t.data\n\n"));

    // for each global variable
    for ( ; i != e; ++i)
    {
        if ( (*i)->op != OP_GLOBAL)
        {
            std::ostringstream o;
            o << *i;
            RUNTIME_ERROR("Hey!  Not a global variable '%s'", o.str().c_str());
        }

        // do we have to add a .align directive?
        switch( (*i)->dest->type())
        {

        case INT_TYPE:
        {
            if ((align_offset % MIPS_INT_SIZE) != 0)
            {
                asm_text_->push_back(new std::string("\t.align 2\n\n"));
            }
            // so that we don't keep doing .align over and over again.
            align_offset += MIPS_INT_SIZE - (align_offset % MIPS_INT_SIZE);
        }
        break;

        case BOOL_TYPE:     // intermediate results only!
        case CHAR_TYPE:
            // no alignment restrictions
            break; 

        default:
            RUNTIME_ERROR("generate_data : unknown type for '%s'", PNAME((*i)->dest));
        }

        // now insert statement for variable
        finished_data  = translate_data(*i, &variable_size);
        align_offset += variable_size;
        asm_text_->push_back(new std::string(finished_data));
    }

    asm_text_->push_back(new std::string("\t.text\n\n"));
}

void
codelist::push_back(three_code * const c)
{
    if (!c)
    {
        RUNTIME_ERROR("codelist::push_back: pushing NULL pointer!\n");
    } else if (!code_)
    { 
        RUNTIME_ERROR("codelist::push_back: No code list!\n");
        return;
    }

    if ((code_->size() > 0) && c == code_->back())
    {
        std::ostringstream o;
        o << *c;
        //WARNING("Ignoring dupe: '%s'", o.str().c_str());
        return;
    }

    //cout << "Three code: " << *c << endl;
    code_->push_back(c);
}

void
codelist::pop_back(void)
{
    if (!code_)
    {
        RUNTIME_ERROR("codelist::pop_back: No code list!\n");
    }
    code_->pop_back();
}

void
codelist::push_data(three_code * const c)
{
    if (!c)
    {
        RUNTIME_ERROR("codelist::push_data: pushing NULL pointer!\n");
    } else if (!data_)
    {
        RUNTIME_ERROR("codelist::push_data: No data list!\n");
    }
    data_->push_back(c);
}

void
codelist::pop_data(void)
{
    if (!data_)
    {
        RUNTIME_ERROR("codelist::pop_data: No data list!\n");
    }
    data_->pop_back();
}

void
codelist::flush(void)
{
    generate_data();
    generate_asm();

    asm_text_->push_back(new std::string(DEBRAY_ASM));
}

void
codelist::display_asm(void) const
{
    asm_list::const_iterator i = asm_text_->begin();
    const asm_list::const_iterator e = asm_text_->end();
    for ( ; i != e; ++i)
    {
        std::cout << *(*i);
    }
}

////////////////////////////////////////////////////////////////////////////////
// Not in Class
////////////////////////////////////////////////////////////////////////////////

std::ostream &
operator <<(std::ostream &o, const codelist &l)
{
    code_list::const_iterator i = (l.code())->begin();
    const code_list::const_iterator e = (l.code())->end();
    for ( ; i != e; ++i)
    {
        o << *i;
    }
    return o;
}

const std::string &
reverse_lookup(const int op, const operation_map &op_map)
{
    static std::string temp;

    operation_map::const_iterator i = op_map.begin();
    operation_map::const_iterator end = op_map.end();
    for( ; i != end; ++i)
    {
        if (i->second == op)
        {
            return i->first;
        }
    }
    RUNTIME_ERROR("Operation without name in op_map?  Whut?!");
}

/*!
    Given map from operation to assembly to generate for that
    operation, outputs a list of the operation name followed by the
    assembly.  Example:

    OP_ADD
    lw $t0, x
    lw $t1, y
    add $t2, $t0, $t1
    sw $t2, z
*/

std::ostream &
operator <<(std::ostream &o, const operation_to_assembly_map &m)
{
    operation_to_assembly_map::const_iterator i = m.begin();
    const operation_to_assembly_map::const_iterator e = m.end();
    const operation_map * const op_map = three_code::build_operation_map();
    for ( ; i != e; ++i)
    {
        o << reverse_lookup(i->first, *op_map) << "\n" << i->second << "\n";
    }
    delete op_map;
    return o;
}

