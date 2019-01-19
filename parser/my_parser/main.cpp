/*!
    Author: Robert Crocombe
    Class: CS453 Fall 04
    Professor: Debray
    Other People's Code Used: No
   
    Recursive descent parser for the C-- spec.
  
    Fri Oct 22 01:07:36 MST 2004
  
    New and improved! Now with semantic-checking action!

    Tue Nov 23 17:28:38 MST 2004

    Holy Hanna, it works!
*/

#include <iostream>
using std::cout;
using std::cerr;
using std::endl;

#include <iomanip>
using std::setw;
using std::setfill;


#include <string>
#include <sstream>
#include <vector>
#include <sstream>

#include "tokens.h"

#include "parser_utils.h"
using namespace parser_utils;

#include "parser_data.h"
#include "symbol_table.h"
#include "semantics_bouncer.h"
#include "three_code.h"
#include "codelist.h"

#include "set_map.h"
#include "stack.h"

#include "field_info.h"
#include "variable_info.h"
#include "array_info.h"
#include "function_info.h"
#include "label_info.h"

#include "grammar_tokens.h"
using namespace grammar_tokens;

////////////////////////////////////////////////////////////////////////////////
// Globals
////////////////////////////////////////////////////////////////////////////////

extern char *yytext;

namespace
{
    int current_token;
    parser_data *pd;
    table_vector *tables;
    symbol_table *table;        // aliasing pointer to current symbol table
    codelist *code;

    // these are mostly for debugging and informational purposes
    int last_token;
    static stack<std::string> names;
    unsigned int tab_count;
    int where_I_was;
    // I don't think you can just hold the ptr, you have to copy the data.
    std::string last_yytext;

    const std::string DEBRAY_ASM("");
}

////////////////////////////////////////////////////////////////////////////////
// Macros
////////////////////////////////////////////////////////////////////////////////

#define ENTER(a) bookkeeping_in((a))
#define EXIT() bookkeeping_out();
#define CHECK_FOLLOW() bookkeeping_check_follow(__LINE__, __FILE__);
#define ERROR(a) generate_error((a), __LINE__, __FILE__);
#define MATCH(a) { where_I_was = __LINE__; match((a)); }
#define SYNTAX_RECOVERY(a, b, c) syntax_recovery((a),(b),(c))

////////////////////////////////////////////////////////////////////////////////
// Prototypes
////////////////////////////////////////////////////////////////////////////////

extern "C"
{
    int yylex(void);
}

// Debugging use, mainly
void bookkeeping_in(const int production);
void bookkeeping_out(void);
void bookkeeping_check_follow(int line, char *file);

// ERROR() macro got too ugly
void generate_error(char *message, int line, char *file);

// Recovery from syntax errors so that can continue parsing.
bool syntax_recovery ( const std::string &where,
                       const int production,
                       const char * const what);
// Token grabber and comparator.
void match(int expected_token);
variable_info *variable_lookup(const std::string &name);
array_info *array_lookup(const std::string &name);
function_info *function_lookup(const std::string &name);

data_info *insert_variable(const std::string &name,
                           const type_enum &type,
                           const bool is_array = false,
                           const unsigned int dims = 1);

bool insert_function(function_info * const func,
                     const param_vector * p,
                     const bool is_a_prototype);

void insert_param(param_vector * const v,
                  const std::string &name,
                  const type_enum &type,
                  const bool is_array = false,
                  const int dims = 1);

// Grammar productions
void program(void);
void program_prime(void);
void program_element(void);
void func_or_var_thing(const std::string &id, const type_enum &type_info);
void func_decl_or_body(function_info * const f, param_vector * const p);
type_enum func_type(void);
function_info *func_name_and_args(const type_enum &return_type,
                                  param_vector **p,
                                  const bool is_extern = false);
void func_decl_tail(const type_enum &return_type, const bool is_extern = false);
void func_body(function_info * const f);
param_vector *param_types(function_info * f);
void type_stmt(param_vector * const v);
void param_types_tail(param_vector * const v);
void buncho_var_decls(param_vector * p);
data_info *var_decl(const type_enum &type, const bool global = false);
bool array_decl_maybe(unsigned int * const array_dims);
void var_decl_tail(const type_enum &t,
                   param_vector * p,
                   const bool global = false);
bool array_maybe(void);
void stmt_sequence(function_info * const f);
void stmt(function_info * const f);
three_code *expr_maybe(function_info * const func);
three_code *for_A(function_info * const func);
three_code *for_B(function_info * const func);
three_code *for_C(function_info * const func);
void assg_or_id(function_info * const func);
void assg_or_id_prime(const std::string &s, function_info * const f);
three_code * assg(const std::string &s, function_info * const f);
three_code *assg_prime(const std::string &s, function_info * const f);
void id_paren_expr(const function_info * const callee,
                   param_vector * const p,
                   function_info * const caller);
void expr_tail(param_vector * const v, function_info * const func);

three_code *expr(function_info * const func);
three_code *expr_prime(three_code * tc_in,
                       function_info * const func);
three_code *and_expr(function_info * const func);
three_code *and_expr_prime(three_code * tc_in,
                           function_info * const func);
three_code *eq_expr(function_info * const func);
three_code *eq_expr_prime(three_code * tc_in,
                          function_info * const func);
three_code *cmp_expr(function_info * const func);
three_code *cmp_expr_prime(three_code * tc_in,
                           function_info * const func);
three_code *add_expr(function_info * const func);
three_code *add_expr_prime(three_code * tc_in,
                           function_info * const func);
three_code *mult_expr(function_info * const func);
three_code *mult_expr_prime(three_code * tc_in,
                            function_info *const func);
three_code *unary_expr(function_info * const func);
data_info *id_expr(function_info * const func);
data_info *id_expr_prime(const std::string &id,
                         function_info * const func);

////////////////////////////////////////////////////////////////////////////////
// Definitions
////////////////////////////////////////////////////////////////////////////////

/*!
    Handy routine for displaying process of parsing.  Uses a stack of
    routine names.

    Kinda got dependent on these names for generating error messages.  Oops.
*/

void
bookkeeping_in(const int production)
{

    names.push(set_map::reverse_lookup(production));
#if 0
    for (unsigned int i = 0; i < tab_count; ++ i) cout << "  ";
    // just did push, so can't be empty


    //cout << "Entering " << names.peek() << " with
    //f->global(true);
    //
    cout << "Entering " << names.peek() << " :: " << names.size() 
          << " current token == " << set_map::reverse_lookup(current_token)
          << " yytext = " << yytext << endl;

    ++tab_count;
#endif
}

/*!
    Converse of above: lets me see when we exit a production rule's
    function -- pops name and displays.  Syntax recovery can confuse this:
    the stack unwinding does not include popping these routine names, and
    though the syntax recovery procedure tries to figure out where we are,
    it is not always successful.
*/

void
bookkeeping_out(void)
{
#if 0
    static const std::string uhoh("...huh, I forgot where I am!\n");

    if (!tab_count) RUNTIME_ERROR("bookkeeping_out: tab_count negative\n");
    --tab_count;
    for(unsigned int i = 0; i < tab_count; ++ i) cout << "  ";
    if (names.empty()) names.push(uhoh);
    int size = names.size();
    cout << "Exiting " << names.pop() << " :: " << size << endl;
#else
    names.pop();
#endif
}

/*!
    This routine is for checking the FOLLOW sets of productions that
    can yield epsilon productions.  If there is a match, then this
    routine simply returns, and we can consider the epsilon production
    matched.  Elsewise, it calls error(), which throws an error and
    initiates syntax error recovery.

    This could go tremendously wrong if we ever lose track of where we
    are and then encounter an error:  names.peek() will be bad, and
    thus get_follow() and the resulting c_str() will not be cool.  Can
    this happen?  I'm not sure that it can.  Chance it.
*/

void
bookkeeping_check_follow(int line, char *file)
{
    if (!pd->in_follow(set_map::lookup(names.peek()), current_token))
    {
        error(smoosh("Failed to match FOLLOW set for production '%s':"
                     "\nWanted something from the set '%s'",
              names.peek().c_str(),
              (pd->get_follow()->get_vector(names.peek())).c_str()),
              yytext,
              current_token,
              last_yytext.c_str(),
              last_token,
              line,
              file);
    }
}

/*!
    This could go tremendously wrong if we ever lose track of where we
    are and then encounter an error:  names.peek() will be bad, and
    thus get_first() and the resulting c_str() will not be cool.  Can
    this happen?
*/

void
generate_error(char *message, int line, char *file)
{
    error(smoosh("%s\nWanted something from the set '%s'",
                 message,
                 (pd->get_first()->get_vector(names.peek())).c_str()),
          yytext,
          current_token,
          last_yytext.c_str(),
          last_token,
          line,
          file);
}

/*!
    This is basically on an approach invented by Nicholas Wirth, according
    to "Pragmatics of Programming Languages".  He apparently pioneered
    the idea of doing the following upon encountering a syntax error:

    (a) If while in the process of deleting tokens you can find a token
        in that production's FIRST set, try to restart parsing for that
        production on that token.
    (b) If in the same process you encounter something in the
        production's FOLLOW set, give up and return from the routine.

    So I'm kinda going with that, as well as catching the exceptions I
    throw at what seem to be strategic locations.  The aforementioned
    book describes Wirth's approach as substantially better than Panic
    Mode, somewhat better than context-sensitive Follow sets or Sync
    sets, and maybe not quite as neato as exceptions.  I figure
    combining exceptions with Wirth's approach should work okay.  It seems
    to.  I caught all of the syntax errors in the following testcase:

        extern bob(void) // error
        
        void
        function(int thingie, int xyz blah_de_dah) // error
        {
            int a;
            char b;
            void c; // ouch
        
            for (x = 1; x < 10; x = x + 42)
            {
                bob = / x; // whoops
            }
        
            while (1)
            {
                charlie = go + home + now;
                kaboom;  // drat it
            }
        
            bob = 1;
        }
*/

bool
syntax_recovery
(
    const std::string &where,
    const int production,
    const char * const what
)
{
    // try and keep debugging information in an okay state (success == iffy)
    names.pop_until(set_map::reverse_lookup(production));
    cerr << "Error while parsing " << where << "\n" << what
         << "Trying to sync again after " << where << "\n";
    while (   !pd->in_first(production, current_token)
           && !pd->in_follow(production, current_token))
    {
        if (current_token == EOF)
        {
            ERROR(smoosh("EOF trying to recover while parsing %s\n", what));
        }
        match(current_token);
    }
    if (pd->in_first(production, current_token))
    {
        cerr << "Okay, gonna try and restart on the text '" <<yytext<< "'\n\n";
        EXIT();
        // Rather than have function pointers, just return true/false
        // and let the decision be made by the caller.
        return true;
    }
    // something in FOLLOW set found
    cerr << "Found a token '" << yytext <<"' for something that follows this.  "
         << "Gonna return and see what happens\n\n";
    // else return
    return false;
}

/*!
    Semi-canonical match() routine.  If current_token !=
    expected_token, then we have:

    (a) syntax error
    (b) error in grammar

    Assuming the former (me == perfect), throw an exception on this
    syntax error and attempt recovery.
*/

void
match(int expected_token)
{
    if (current_token != expected_token)
    {
        cerr << "Match was called from line " << where_I_was << endl;
        ERROR("match()");
    }
    last_token = current_token;
    last_yytext = yytext;
    current_token = yylex();
}

/*!
    Eh.  Handles any number of scopes from inside out.  Returns the
    first reference to a variable by the name 's', or NULL if no match.
*/

variable_info *
variable_lookup(const std::string &s)
{
    variable_info *v = 0;
    table_vector::reverse_iterator i = tables->rbegin();
    const table_vector::reverse_iterator e = tables->rend();
    for( ; !v && (i != e); ++i)
    {
        v = (*i)->variable_lookup(s);
    }
    if (v) return v;

    // In case I had to prefix the variable with "__".  Hackity hack
    // hack.
    i = tables->rbegin();
    for( ; !v && (i != e); ++i)
    {
        v = (*i)->variable_lookup("__" + s);
    }
    return v;
}

array_info *
array_lookup(const std::string &s)
{
    array_info *a = 0;
    table_vector::reverse_iterator i = tables->rbegin();
    const table_vector::reverse_iterator e = tables->rend();
    for( ; !a && (i != e); ++i)
    {
        a = (*i)->array_lookup(s);
    }
    if(a) return a;

    // In case I had to prefix the variable with "__".  Hackity hack
    // hack.
    i = tables->rbegin();
    for( ; !a && (i != e); ++i)
    {
        a = (*i)->array_lookup("__" + s);
    }
    return a;
}

function_info *
function_lookup(const std::string &s)
{
    function_info *f = 0;
    table_vector::reverse_iterator i = tables->rbegin();
    const table_vector::reverse_iterator e = tables->rend();
    for( ; !f && (i != e); ++i)
    {
        f = (*i)->function_lookup(s);
    }
    if (f) return f;

    // In case I had to prefix the function with "__".  Hackity hack
    // hack.
    //
    // I don't think this can possibly happen.
    i = tables->rbegin();
    for( ; !f && (i != e); ++i)
    {
        f = (*i)->function_lookup("__" + s);
    }
    return f;
}

/*!
    Called when I want to insert a new variable.
*/

data_info *
insert_variable
(
    const std::string &name,
    const type_enum &type,
    const bool is_array,
    const unsigned int dims
)
{
    if (table->exists(name))
    {
        SEMANTICS("Cannot insert variable '%s'.  Already defined.",
                  name.c_str());
    }

    //cout << "Symbol_table: insert " << name << endl;

    if (is_array)
    {
        array_info *a = 0;
        switch(type)
        {
        case CHAR_TYPE:     // fall-through
        case INT_TYPE:      // fall-through
        case ERROR_TYPE:
            a = new array_info(name, type, dims);
            break;
        default: SEMANTICS("insert_variable: unknown array type");
        }
        table->insert(a);
        return a;
    } else
    {
        variable_info *v = 0;
        switch(type)
        {
        case CHAR_TYPE:     // fall-through
        case INT_TYPE:      // fall-through
        case ERROR_TYPE:
            v = new variable_info(name, type);
            break;

        default: SEMANTICS("insert_variable: unknown variable type");
        }

        table->insert(v);
        return v;
    }
}

/*!
    Outer two bit tests are for:
        exists
        is a function

    00  doesn't exist and not a function    -- can't happen here
    01  doesn't exist and is a function     -- insert new stuff
    10  exists and not a function           -- ERROR
    11  exists and is a function            -- more testing required

    Inner tests for 11 are these bits:
        existing function_info is a prototype
        new function info is a prototype

        00 info not a prototype && this !prototype -- 2 defns -- ERROR
        01 info not a prototype && this prototype -- proto after defn -- ERROR
        10 info is a prototype && this !prototype -- OKAY
        11 info is a prototype && this prototype -- 2 prototypes -- ERROR

    So insertion happens for:

    (a) no existing info
    (b) what info exists is a prototype and new info is a definition

    Proper type of insertion is selected by value of 'prototype'

    Returns true if entry was in existance and we simply added to it,
    or false it we added a new entry (no entry already existed)
*/

bool
insert_function
(
    function_info * const f,
    const param_vector * p,
    const bool should_be_prototype
)
{
    bool exists = false;
    if (!f)
    {
        SEMANTICS("Something bad has happened related to identifier '%s'",
                  PNAME(f));
    }

    const char * const name = PNAME(f);

    // 11 exists && function
    if ( table->exists(name) && table->is_a_function(name))
    {
        function_info * const g = function_lookup(name);

        // 11 existing prototype && new prototype
        if (g->has_prototype() && should_be_prototype)
        {
            // 2 prototypes -- ERROR
            SEMANTICS("Trying to define 2nd prototype for %s",name);
        } else if  (g->has_definition() && should_be_prototype)
        {   // 01 Existing is a defn, this is a prototype -- ERROR
            SEMANTICS("Prototype after definition for func %s", name);
        } else if (g->has_definition() && !should_be_prototype)
        {   // 00 -- existing defn, and this is a defn
            SEMANTICS("Second definition for function %s", name);
        }
        
        // 10 -- existing prototype && this !prototype -- OKAY

        // test this definition to see if types and parameters match.
        // 'f' is definition and 'g' is a prototype
        if (f->type() != g->type())
        {
            SEMANTICS("Return type mismatch for '%s' in prototype vs defn",
                      PNAME(f));
        }

        //if(p)cout << "Found definition for " << PNAME(f) << " with params " << *p << endl;
        //else cout << "Found definition for " << PNAME(f) << " with void params "<< endl;

        g->defn_params(p);
// XXX: Why did I do this?
//        f->defn_params(p);          // hack!
        g->has_definition(true);

        g->test_proto_vs_defn(g);
        // The prototype has a lot of the "good" information, but it
        // mayn't have the correct parameter names.  So it's either
        // (a) Copy names from definition to parameters and then the
        // prototype's parameter list over the definition's
        // (b) Copy important bits (but not the names) from the proto over the
        // defn.  Thankfully the only important bit is the place() value.
        if (p)
        {
            const unsigned int size = p->size();
            const param_vector *gp = g->proto_params();
            if (size != gp->size()) RUNTIME_ERROR("Just kill me now.");
            for (unsigned int i = 0; i < size; ++i)
            {
                //cout << "For parameter " << PNAME((*p)[i]) << " overwriting place " << (*p)[i]->place() << " with " << (*gp)[i]->place() << endl;

                (*p)[i]->place((*gp)[i]->place());
            }
        }

        // survived.  Prototype and definition are the same, except
        // there may be differences in the names 'twixt prototype
        // parameters and definition parameters.  Names must be
        // unique for definition parameters, so test that now.

        g->test_param_name_uniqueness();
        exists = true;

    } else  if (table->exists(name)) // exists, but not a function -- ERROR
    {
        // 10 -- exists and  !func
        if (should_be_prototype)
        {
            SEMANTICS("Can't insert function prototype '%s': "
                      "already something with this name.", name);
        }
        else
        {
            SEMANTICS("Can't insert function definition '%s': "
                      "already something with this name.", name);
        }

    } else  // doesn't exist as a function or anything else
    {

        // Therefore we're inserting either:
        // (a) new defn without existing prototype
        // (b) new prototype for which there is no prototype or defn
        //     -- external or non-external

        if (should_be_prototype)
        {
            if (p)
            {
                // offsets from frame pointer
                //
                // base offset is 2: 1 for old fp, 1 for ra
                // 
                // XXX: ARGH!  I had the fp *above* the ra and fp, but
                // Debray's stuff shows it as below: i.e., the first
                // parameter is 0 bytes away.  I think that makes more
                // sense.  Give it a whirl.
                const int BASE_OFFSET = 0 * MIPS_INT_SIZE;
                const unsigned int size = p->size();
                for (unsigned int i = 0; i < size; ++i)
                {
                    (*p)[i]->place(i * MIPS_INT_SIZE + BASE_OFFSET);
                }
                f->proto_params(p);
            }
        } else
        {
            if (p)
            {
                // offsets from frame pointer
                const int BASE_OFFSET = 0 * MIPS_INT_SIZE;
                const unsigned int size = p->size();
                for (unsigned int i = 0; i < size; ++i)
                {
                    (*p)[i]->place(i * MIPS_INT_SIZE + BASE_OFFSET);
                }
            }
            // enforce rule for defn that no two params have same name.
            f->defn_params(p);
            f->has_definition(true);
            f->test_param_name_uniqueness();
        }

        // all functions go in global symbol table
        ((*tables)[0])->insert(f);
    }
/*
    cerr << "Inserting function '" << *f << "' as a "
          << (should_be_prototype ? "prototype" : "definition") << "\n";
*/
    f->has_prototype(should_be_prototype);

    return exists;
}

void
insert_param
(
    param_vector * const params,
    const std::string &name,
    const type_enum &type,
    const bool is_array,
    const int dims
)
{
    if (!params)
    {
        RUNTIME_ERROR("Null parameter vector for parameters '%s'!", name.c_str());
    }

    // Can't catch param name uniqueness here, because rule only
    // applys to definitions and not prototypes.  Since we don't know
    // yet what 'func' is, put this off 'til later.

    if (is_array)
    {
        array_info *a = 0;
        switch(type)
        {
        case INT_TYPE: a = new array_info(name, type, dims); break;
        case CHAR_TYPE: a = new array_info(name, type, dims); break;
        default: SEMANTICS("unknown array type for '%s'", name.c_str());
        }
        params->push_back(a);
    } else
    {
        variable_info *v = 0;
        switch(type)
        {
        case INT_TYPE: v = new variable_info(name, type); break;
        case CHAR_TYPE: v = new variable_info(name, type); break;
        default: SEMANTICS("unknown variable type for '%s'", name.c_str());
        }
        params->push_back(v);
    }
}

/*!
    Honcho routine.
*/

void
program(void)
{
    ENTER(PROGRAM);
    program_prime();
    EXIT();
}

/*!
    This is the production that strings together the top-level elements of a
    program: functions (both declarations and definitions) and global
    variables (both externs and regular globals).
*/

void
program_prime(void)
{
    ENTER(PROGRAM_PRIME);

    while (pd->in_first(PROGRAM_ELEMENT, current_token))
    {
        program_element();
    }
    CHECK_FOLLOW();       
/*
    if (pd->in_first(PROGRAM_ELEMENT, current_token))
    {
        program_element();
        program_prime();
    } else
    {
        CHECK_FOLLOW();       
    }
*/
    // else return (epsilon)
    EXIT();
}

/*!
    Ya got yer:

    (a) extern declarations
    (b) functions or globals of return type (functions) or type
        (globals) char or int.
    (c) functions with return type void or implicit int
*/

void
program_element(void)
{
    ENTER(PROGRAM_ELEMENT);
    type_enum return_type = INT_TYPE;   // implicit int
    std::string id;
    function_info * f = 0;
    try
    {
        switch (current_token)
        {
        case EXTERN:
        {
            MATCH(EXTERN);
            param_vector *p = 0;
            return_type = func_type();
            // MUST be a prototype only!  Parser should catch syntax error
            // if it isn't, so should be safe to assume it is a prototype.
            f = func_name_and_args(return_type, &p, true);
            bool exists = insert_function(f, p, true);
            if (exists) RUNTIME_ERROR("Totally weirded out at '%s'", PNAME(f));
            func_decl_tail(return_type, true);
            MATCH(SEMICOLON);
        }
        break;

        case INT:
        case CHAR:
            return_type = (current_token == INT) ? INT_TYPE : CHAR_TYPE;
            MATCH(current_token);
            MATCH(ID);
            id = last_yytext;    // save copy of identifier name
            // unknown whether func or var here: don't insert yet
            func_or_var_thing(id , return_type); // name, type
            break;
        case VOID:
            MATCH(VOID);
            return_type = VOID_TYPE;
        case ID:                        // fall-through
        {
            param_vector *p = 0;
            // definitely a function, either returning (a) void (b) int
            // (implicitly).  Could be prototype or definition.
            f = func_name_and_args(return_type, &p);
            func_decl_or_body(f, p);
        }
        break;

        default:
            ERROR("program_element()");
        }
    } catch (syntax_error &e)
    {
        bool restart = SYNTAX_RECOVERY("function/global declaration",
                                       PROGRAM_ELEMENT, e.what());
        if (restart) program_element();
        // else return
    }
    catch (semantic_error &e)
    {
        bool restart = SYNTAX_RECOVERY("function/global declaration",
                                       PROGRAM_ELEMENT, e.what());
        if (restart) program_element();
        // else return        
    }
    EXIT();
}

/*!
    (a) Parenthesis means function (declaration or definition)
    (b) brackets mean array declaration
    (c) comma means a bunch of declarations
    (d) means we're done with whatever we were doing (function or
        global declaration)

    This can never be called for an extern function.
*/

void
func_or_var_thing(const std::string &id, const type_enum &type)
{
    ENTER(FUNC_OR_VAR_THING);
    switch (current_token)
    {
    case LPAREN:
    {
        // okay, it's a function: insert function name 'identifier' and
        // return type
        function_info *f = new function_info("__" + id, type);
        param_vector *p = new param_vector();
        MATCH(LPAREN);
        p = param_types(f);
        MATCH(RPAREN);
        func_decl_or_body(f, p);
    }
    break;

    case LBRACKET:
    {
        unsigned int dims = 0;
        bool is_array = array_decl_maybe(&dims);
        if (is_array)
        {
            // Debray mentioned that he could have a global identifier
            // like 'j' which would then be interpreted by SPIM as an
            // opcode.  Therefore prefix with "__".
            data_info *f = insert_variable("__" + id, type, true, dims);
            f->global(true);
            code->push_data(new three_code(OP_GLOBAL, 0, 0, f));
        } else
        {
            SEMANTICS("Found '[' but yet not an array in func %s", id.c_str());
        }
        var_decl_tail(type, 0, true);
        MATCH(SEMICOLON);
    }
    break;

    case COMMA:
    {
        data_info * d =  insert_variable("__" + id, type);
        d->global(true);
        code->push_data(new three_code(OP_GLOBAL, 0, 0, d));
        var_decl_tail(type, 0, true);
        MATCH(SEMICOLON);
    }
    break;

    case SEMICOLON:
    {
        variable_info * v = dynamic_cast<variable_info *>(insert_variable("__"+ id, type));
        v->global(true);
        code->push_data(new three_code(OP_GLOBAL, 0, 0, v));
        MATCH(SEMICOLON);
    }
    break;

    default:
        ERROR("func_or_var_thing()");
    }
    EXIT();
}

/*!
    Match function body on opening brace
    Match a comma in case this is a string of function declarations.

    Entering the function, could have:

    (a) function declaration (prototype)
    (b) function definition (body)
*/

void
func_decl_or_body(function_info * const f, param_vector * const p)
{
    ENTER(FUNC_DECL_OR_BODY);
    bool exists;
    switch (current_token)
    {
    case LBRACE:
    {
        function_info * func = 0;
        MATCH(LBRACE);                       // know it's a function definition
        // could exist or not (yes if defn after prototype, no if defn w/out)
        exists = insert_function(f, p, false);
        if (exists)
        {
            // inserting a defn with existing prototype -- need to ensure 
            // info is all up-to-date: get info from symbol table.
            func = function_lookup(f->name());
            // NO DELETION HERE!
            //delete f;
        } else
        {
            func = f;
        }
        func_body(func);
        semantics::check_void_compatibility(func);
        MATCH(RBRACE);
    }
    break;

    case COMMA:
        // know that 'f' is a prototype
        exists = insert_function(f, p, true);
        if (exists) RUNTIME_ERROR("drat for multiple prototypes at '%s'",PNAME(f));
        func_decl_tail(f->type());  // other funcs will have same return type
        MATCH(SEMICOLON);
        break;

    default:
        // single prototype
        exists = insert_function(f, p, true);
        if (exists) RUNTIME_ERROR("drat for single prototype '%s", PNAME(f));
        MATCH(SEMICOLON);
    }
    EXIT();
}

/*!
    Functions can return these types, else epsilon (could be implicit int).

    returns (return type) of function
*/

type_enum
func_type(void)
{
    ENTER(FUNC_TYPE);
    type_enum return_type = INT_TYPE;
    switch (current_token)
    {
        case INT:  return_type = INT_TYPE; MATCH(INT); break;
        case CHAR: return_type = CHAR_TYPE; MATCH(CHAR); break;
        case VOID: return_type = VOID_TYPE; MATCH(VOID); break;
        default: CHECK_FOLLOW();
    }
    // else return (epsilon)
    EXIT();
    return return_type;
}

/*!
    (a) Function declaration (prototype)
    (b) Function definition

    Match the name and parameters of a function declaration OR definition.
*/

function_info *
func_name_and_args
(
    const type_enum &type,
    param_vector **p,
    const bool is_extern
)
{
    ENTER(FUNC_NAME_AND_ARGS);
    function_info *f = 0;
    MATCH(ID);
    std::string id(last_yytext);

    // Check to see if already have field by this name: 10
    if (table->exists(id) && !table->is_a_function(id))
    {
        // definite error: we are trying to create a function (either
        // prototype or definition), and ID already exists but isn't a
        // function (so it's not like we declared a prototype earlier
        // and are now defining the body)
        SEMANTICS("Non-function with this identifier '%s' already exists",
                   id.c_str());
    } else if (!table->exists(id))  // 0x
    {
        // (a) is a function (defn or decl) and no previous information exists.
        // could be extern (then definitely decl)
        if(!is_extern) f = new function_info("__" + id, type, is_extern);
        // can't futz with names of externs
        else f = new function_info(id, type, is_extern);
    } else  // 11
    {
        // (b) is a function with a (declaration or definition) already.
        //
        // So this could be:
        // (a) definition for a function that has a prototype -- perfectly OK
        //  (i) unless prototype is extern declaration.
        // (b) second definition for a function -- ERROR
        // (c) second prototype -- ERROR
        // (d) prototype for a function that already has a definition -- ERROR

        f = function_lookup(id);
    }

    MATCH(LPAREN);
    *p = param_types(f);
    MATCH(RPAREN);
    EXIT();
    return f;
}

/*!
    Could be a bunch of functions all with the same return type.
*/

void
func_decl_tail(const type_enum &return_type, const bool is_extern)
{

    ENTER(FUNC_DECL_TAIL);
    function_info * f = 0;
    param_vector * p = 0;
    bool exists = false;
    while (current_token == COMMA)
    {
        MATCH(COMMA);
        f = func_name_and_args(return_type, &p, is_extern);
        exists = insert_function(f, p, true);
        if (exists) RUNTIME_ERROR("drat in func_decl_tail @ '%s'", PNAME(f));
    }
    CHECK_FOLLOW();
    EXIT();
}

/*!
    Geez, can you tell I wasn't taking into account that you could do

        int x; char y; int z;

    Duh.  Hey, variables of one type should be good enough for
    everyone!  Anyway, match a function body: potentially variable
    declarations at the top (like C89), and then potentially a bunch
    of statements after that.  But could be empty.

    I don't see that I really need 'f', but just in case.  Maybe
    needed in the future when I have to actually generate code.

    Push a new symbol table on entrance, destroy when I leave.  The
    lookup routines search the one on the end (the innermost) to the
    first and outermost.  Insertion through pointer 'table' will be to
    this new, local table. Delete this symbol table when we exit, and
    change reference for insertion to global table.
*/

void
func_body(function_info * const f)
{
    ENTER(FUNC_BODY);

    table = new symbol_table();
    tables->push_back(table);

    code->push_back(new three_code(OP_ENTER_FUNCTION, f));

    /* Insert all the function's parameters as variables */
    const param_vector *p = f->defn_params();
    if (p)
    {
        for (unsigned int i = 0; i < p->size(); ++i)
        {
            data_info *param = (*p)[i];
            //cout << "Param is " << *param << endl;
            // Clones will be deleted when function goes out of scope.
            table->insert(param->clone());
        }
    }   // else void function

    param_vector * locals = f->locals();
    if (!locals) RUNTIME_ERROR("No local var list for '%s'", PNAME(f));
    data_info *decl = 0;

    // real beginning of function
    switch (current_token)
    {
    case INT:       // func w/ 1 or more variable declarations
    case CHAR:
    {
        const type_enum t = (current_token == INT) ? INT_TYPE : CHAR_TYPE;
        MATCH(current_token);

        // one variable decl
        decl = var_decl(t);
        if (!decl) RUNTIME_ERROR("Much badness in function '%s'", PNAME(f));
        locals->push_back(decl);
        decl->local(true);
        var_decl_tail(t, locals);
        MATCH(SEMICOLON);

        // 0 or more additional var decls
        buncho_var_decls(locals);

        stmt_sequence(f);
    }
    break;

    default:
        if (pd->in_first(STMT_SEQUENCE, current_token))
        {   // function that declares no variables
            stmt_sequence(f);
        }
        else 
        {   // empty function body or possibly error
            CHECK_FOLLOW();
        }
    }

    // If the last three code element in the list isn't a return
    // statement, then we'll add one.  This is for functions that get
    // around our simple-minded checks for validity.
    //
    // XXX: I'm not sure this'll work for functions that return a
    // value... might just pick up whatever value is in the return
    // value register, which is okay with me.
    if (   !code->code()->back()
        || (code->code()->back()->op != OP_LEAVE_FUNCTION))
    {
        code->push_back(new three_code(OP_LEAVE_FUNCTION, f));
    }

    // add globals as necessary
    code->generate_data();

    // generate assembly for this function
    code->generate_asm();

    code->display_asm();

    //cout << "CODE DESTRUCTOR START" << endl;
    // whoops.  I'm tired.  It goes.  Leak leak leak leak leak!
    delete code;
    //cout << "CODE DESTRUCTOR DONE" << endl;
    code = new codelist();
    delete table;
    tables->pop_back();
    table = tables->back();
    EXIT();
}

/*!
    Only called when we know we are at a function: either are getting
    the parameters for a declaration/prototype, or are at a function
    body/definition.

    Match a function's parameters.  Recover from syntax errors if possible.

    If at function body, should check for:
        (a) prototype and compare with parameters of prototype.  If
        mismatch, then error.
        (b) declared extern.  If so, then error.

    If at prototype, should check to see if:
        (a) already have prototype: then error.
        (b) already have seen definition, then error.

    For both, check to see if there is already a variable with this same name:

    "An identifier may be declared at most once as a global".

    Can return NULL vector if function accepts no arguments
*/

param_vector *
param_types(function_info * const f)
{
    ENTER(PARAM_TYPES);
    param_vector *p = 0;
    try
    {
        switch(current_token)
        {
        case VOID:
            MATCH(VOID);
            if (f && f->parameters())
            {
                SEMANTICS("Parameters mismatch for function '%s'.  "
                           "Expecting 'void', saw '%s'",
                           PNAME(f), f->stringify_parameters().c_str());
            } else if (!f)
            {
                RUNTIME_ERROR("NULL pointer in param_types: no func passed");
            }
            // function takes no parameters
            break;
        case INT:
        case CHAR:
        {
            p = new param_vector();
            type_stmt(p);
            param_types_tail(p);
        }
        break;

        default:
           ERROR("param_types()");
        }
    } catch (syntax_error &e)
    {
        bool restart = SYNTAX_RECOVERY("parameters",PARAM_TYPES,e.what());
        if (restart) param_types(f);
        // else return
    }
    EXIT();
    return p;
}

/*!
    Match a single type declaration of the form "type varname" with
    the possibility that it's an array.

    OKAY, I think all necessary information accounted for
*/

void
type_stmt(param_vector * const params)
{
    ENTER(TYPE_STMT);
    try
    {
        switch (current_token)
        {

        case CHAR:
        case INT:
        {
            const type_enum t = (current_token == INT) ? INT_TYPE : CHAR_TYPE;
            MATCH(current_token);
            MATCH(ID);
            std::string id(last_yytext);
            int dims = 0;
            bool is_array = array_maybe();
            insert_param(params, id, t, is_array, dims);
        }
        break;

        default:
            ERROR("type_stmt");
        }
    } catch (syntax_error &e)
    {
        bool restart = SYNTAX_RECOVERY("type statement",TYPE_STMT,e.what());
        if (restart) type_stmt(params);
        // else return;
    }
    EXIT();
}

/*!
    Allow for bunches of comma separated parameters.
*/

void
param_types_tail(param_vector * const params)
{

    ENTER(PARAM_TYPES_TAIL);
    while (current_token == COMMA)
    {
        MATCH(COMMA);
        type_stmt(params);
    }
    CHECK_FOLLOW();
    EXIT();
}

/*!
    Allow for 0 or more variable declarations at the top of a function.
*/

void
buncho_var_decls(param_vector * p)
{
    ENTER(BUNCHO_VAR_DECLS);
    try 
    {
        data_info * decl = 0;
        while ((current_token == INT) || (current_token == CHAR))
        {
            const type_enum t = (current_token == INT) ? INT_TYPE : CHAR_TYPE;
            MATCH(current_token);
            decl = var_decl(t);             // 1 var decl
            if (p && decl)
            {
                p->push_back(decl);
                decl->local(true);
            }
            var_decl_tail(t, p);            // 0 or more of same type
            MATCH(SEMICOLON);
        }
        CHECK_FOLLOW();         // epsilon (we're done) or error
    } catch (syntax_error &e)
    {
        bool restart = SYNTAX_RECOVERY("some variable declarations",
                                       BUNCHO_VAR_DECLS, e.what());
        if (restart) buncho_var_decls(p);
        // else return
    }
    EXIT();
}

/*!
    Sometimes we already know the type and just wanna match a variable
    name plus possibility of being an array.  Probably could fold into
    type_stmt, above, if me != lazy.

*/

data_info *
var_decl(const type_enum &type, const bool global)
{
    ENTER(VAR_DECL);
    data_info *decl = 0;
    try
    {
        MATCH(ID);
        std::string id(last_yytext);
        unsigned int dims = 0;
        bool is_array = array_decl_maybe(&dims);
        // All locals are inserted here!
        decl = insert_variable(id, type, is_array, dims);
        if (global)
        {
            decl->name("__" + decl->name());
            // global variables have their declarations recorded in
            // assembly immediately.  Why?  I forget.
            code->push_data(new three_code(OP_GLOBAL, 0, 0, decl));
            decl->global(true);
        } 
    } catch (syntax_error &e)
    {
        bool restart = SYNTAX_RECOVERY("variable declaration", VAR_DECL, e.what());
        if (restart) decl = var_decl(type, global);
        // else return
    }
    EXIT();
    return decl;
}

/*!
    Is the variable an array or no?
*/

bool
array_decl_maybe(unsigned int * const array_dims)
{
    bool is_array = false;
    ENTER(ARRAY_DECL_MAYBE);
    switch (current_token)
    {
    case LBRACKET:
        is_array = true;
        MATCH(LBRACKET);
        MATCH(INTCON);
        *array_dims = atoi(last_yytext.c_str());
        MATCH(RBRACKET);
        break;
    default:
        CHECK_FOLLOW();
    }
    // else return (epsilon)
    EXIT();
    return is_array;
}

/*!
    Lots of variable declarations of a single type
*/

void
var_decl_tail(const type_enum &t, param_vector * const p, const bool global)
{
    ENTER(VAR_DECL_TAIL);
    while (current_token == COMMA)
    {
        MATCH(COMMA);
        data_info * decl = var_decl(t, global);
        if (p && decl)
        {
            // var was inserted in symbol table in var_decl, but needs
            // to go into list of local variables here.  (If !p, then
            // this isn't a local variable declaration).
            p->push_back(decl);
            decl->local(true);
        }
    }
    CHECK_FOLLOW();
    EXIT();
}

bool
array_maybe(void)
{
    ENTER(ARRAY_MAYBE);
    bool is_array = false;
    if (current_token == LBRACKET)
    {
        MATCH(LBRACKET);
        MATCH(RBRACKET);
        is_array = true;
    }
    else
    {
        CHECK_FOLLOW();       
    }
    // else return (epsilon)
    EXIT();
    return is_array;
}

/*!
    Matches the regexp "stmt*"
*/

void
stmt_sequence(function_info * const f)
{
    ENTER(STMT_SEQUENCE);
    try
    {
        if (pd->in_first(STMT, current_token))
        {
            stmt(f);
            stmt_sequence(f);
        }
        else
        {
            CHECK_FOLLOW();       
        }
        // else return (epsilon)
    } catch (syntax_error &e)
    {
        SYNTAX_RECOVERY("a statement", STMT, e.what());
        // yar, no quitters be allowed!
        stmt_sequence(f);
    }
    EXIT();
}

/*!
    Syntax error recovery really bulked this up.  Anyhoo, the
    fundamental statements are:

    (a) for loops
    (b) while loops
    (c) if statements (maybe with trailing else clauses)
    (d) return statements
    (e) function calls or assignments
    (f) ';'

    Try and find these things and recover from any syntax errors while
    doing it.

*/

void
stmt(function_info * const func)
{
    ENTER(STMT);
    three_code *tc = 0;
    try
    {
        switch (current_token)
        {
        case IF:
        {
            label_info *if_false = new label_info(label_name("else"));
            label_info *end = new label_info(label_name("post_else"));
            table->insert(if_false);
            table->insert(end);

            try
            {
                MATCH(IF);
                MATCH(LPAREN);
                tc = expr(func);
                MATCH(RPAREN);
                semantics::check_bool_compatibility(tc->dest);
            } catch (syntax_error &e)
            {
                SYNTAX_RECOVERY("if() statement", STMT, e.what());
                // call stmt() below regardless
            }

            // branch based on result of 'f': code to compute result
            // was already added in expr()
            code->push_back(new three_code(OP_COND_BRANCH, tc->dest, if_false));
    
            // statement following the if().  Try to find that, at least
            //
            // code for stmt() will be inserted in stmt()
            stmt(func);

            // disambiguating rule: refuse to torture grammar any further
            if (current_token == ELSE)
            {
                // at end of 'then', add jump to go past else.
                code->push_back( new three_code(OP_GOTO, end));
                code->push_back(new three_code(OP_LABEL, if_false));
                MATCH(ELSE);
                stmt(func);
                code->push_back(new three_code(OP_LABEL, end));
            } else
            {
                code->push_back( new three_code(OP_LABEL, if_false));
            }
        }
        break;

        case WHILE:
        {
            label_info *while_loop_top = new label_info(label_name("top_of_while"));
            label_info *while_loop_bot = new label_info(label_name("bot_of_while"));
            table->insert(while_loop_top);
            table->insert(while_loop_bot);

            code_list *actual_code = code->code();
            code_list::iterator before_test;
            code_list::iterator after_test;

            try
            {
                MATCH(WHILE);
                code->push_back(new three_code(OP_GOTO, while_loop_bot));
                code->push_back(new three_code(OP_LABEL, while_loop_top));
                MATCH(LPAREN);

                before_test = actual_code->end();
                --before_test;
                tc = expr(func);
                ++before_test;  // now points to first 3code in test expr

                after_test = actual_code->end();
                --after_test;   // points to last 3code in test expr

                MATCH(RPAREN);
                semantics::check_bool_compatibility(tc->dest);
            } catch (syntax_error &e)
            {
                SYNTAX_RECOVERY("while() loop", STMT, e.what());
                // call stmt() regardless
            }
            stmt(func);
            ++after_test;

            // From beginning of while, jump to here
            code->push_back(new three_code(OP_LABEL, while_loop_bot));

            // Test to see if condition is true
            //code->push_back(tc);
            actual_code->splice(actual_code->end(), *actual_code,
                                before_test, after_test);

            // if so, jump back to top of loop and iterate, then test
            // again, etc., else fall through to later code
            code->push_back(new three_code(OP_FALSE_COND_BRANCH, tc->dest, while_loop_top));
        }
        break;

        case FOR:
        {
            label_info *for_top = new label_info(label_name("for_top"));
            label_info *for_bot = new label_info(label_name("for_bot"));
            table->insert(for_top);
            table->insert(for_bot);
            three_code *for_comparison = 0;
            code_list *actual_code = code->code();
            code_list::iterator before_B; 
            code_list::iterator before_C; 
            code_list::iterator before_stmt; 

            try
            {
                MATCH(FOR);
                MATCH(LPAREN);
                for_A(func);
                code->push_back(new three_code(OP_GOTO, for_bot));
                code->push_back(new three_code(OP_LABEL, for_top));

                code->push_back(new three_code(OP_LABEL, for_bot));
                before_B = actual_code->end();
                --before_B;
                for_comparison = for_B(func);

                before_C = actual_code->end();
                --before_C;
                for_C(func);
                ++before_C;

                MATCH(RPAREN);
            } catch (syntax_error &e)
            {
                SYNTAX_RECOVERY("for loop", STMT, e.what());
                // call stmt() below regardless
            }
            // stmt after for()
            before_stmt = actual_code->end();
            --before_stmt;
            stmt(func);
            ++before_stmt;

            // move loop body to before test for loop condition
            actual_code->splice(before_B, *actual_code, before_stmt, actual_code->end());
            // move increment to before test for loop condition
            actual_code->splice(before_B, *actual_code, before_C, actual_code->end());
            //
            // So code is now:
            //
            // Jump L1
            // L2:
            //      loop body
            //      increment
            // L1:
            //      test if should do loop
            // If yes, jump to L2, else continue

            code->push_back(new three_code(OP_FALSE_COND_BRANCH, for_comparison->dest, for_top));
        }
        break;

        case LBRACE:
            MATCH(LBRACE);
            stmt_sequence(func);
            MATCH(RBRACE);
            break;

        case RETURN:
            MATCH(RETURN);
            try 
            {
                tc = expr_maybe(func);
            } catch (semantic_error &e)
            {
                func->has_return(true); // prevents excessive errors
                throw;
            }

            if (!tc)
            {
                // No return value: ERROR unless function returns VOID
                if (func->type() != VOID_TYPE)
                {
                    // cheat: prevents excessive errors: we got one,
                    // we don't need another
                    func->has_return(true);

                    SEMANTICS("Void return statement in function %s which expects %s",
                    PNAME(func), func->stringify_type().c_str());
                }

                code->push_back(new three_code(OP_LEAVE_FUNCTION, func));

            } else
            {
                // tried to return something.  Might not work out, though.
                func->has_return(true);

                array_info *a = dynamic_cast<array_info *>(tc->dest);
                if (a)
                {
                    SEMANTICS("Trying to return an array with type '%s' "
                              "from function '%s' which expects to return "
                              "a variable of type '%s'",
                              tc->dest->stringify_type().c_str(),
                              PNAME(func),
                              func->stringify_type().c_str());
                }

                // trying to return a value: what is function's return type?
                switch (func->type())
                {
                case INT_TYPE:
                    semantics::check_int_compatibility(func,tc->dest);
                    break;
                case CHAR_TYPE:
                    semantics::check_int_compatibility(func,tc->dest);
                    break;
                case VOID_TYPE:
                    SEMANTICS("Trying to return a variable of type '%s' "
                           "for function '%s' which returns 'void'",
                           tc->dest->stringify_type().c_str(), PNAME(func));
                    break;
                default: SEMANTICS("Invalid return type '%s' for '%s'.",
                         func->stringify_type().c_str(), PNAME(func));
                }

                code->push_back(new three_code(OP_LEAVE_FUNCTION, func, 0, tc->dest));
            }


            MATCH(SEMICOLON);
            break;

        case ID:
            try
            {
                assg_or_id(func);
                MATCH(SEMICOLON);
            } catch (syntax_error &e)
            {
                SYNTAX_RECOVERY("assignment (declaration?) or maybe function call", STMT, e.what());
                stmt(func);
            }
            break;

        case SEMICOLON:
            MATCH(SEMICOLON);
            break;

        default:
            ERROR("stmt()");
        }
    } catch (std::exception &e)
    {
        // thinking about removing this
        bool restart = SYNTAX_RECOVERY("a statement", STMT, e.what());
        if (restart) stmt(func);
        // else return;
    }
    EXIT();
}

/*!

*/

three_code *
expr_maybe(function_info * const func)
{
    ENTER(EXPR_MAYBE);
    three_code *tc = 0;
    if (pd->in_first(EXPR, current_token))
    {
        tc = expr(func);
    }
    else
    {
        CHECK_FOLLOW();
    }
    // else return (epsilon)
    EXIT();
    return tc;
}

/*!
    Catch at for() loop level.
*/

three_code *
for_A(function_info * const func)
{
    ENTER(FOR_A);
    three_code *tc = 0;
    std::string id;
    switch (current_token)
    {
    case ID:
        id = yytext;
        tc = assg(id, func);
    case SEMICOLON:             // fall-through
        MATCH(SEMICOLON);
        break;
    default:
        ERROR("for_A");
    }
    EXIT();
    return tc;
}

/*!
    Catch at for() loop level.
*/

three_code *
for_B(function_info * const func)
{
    ENTER(FOR_B);
    three_code *tc = expr_maybe(func);
    if(tc) semantics::check_bool_compatibility(tc->dest);
    MATCH(SEMICOLON);
    EXIT();
    return tc;
}

/*!
    Catch at for() loop level.
*/

three_code *
for_C(function_info * const func)
{
    ENTER(FOR_C);
    three_code *tc = 0;
    std::string id;
    if (current_token == ID)
    {
        id = yytext;
        tc = assg(id, func);
    }
    else
    {
        CHECK_FOLLOW();
    }
    // else return (epsilon)
    EXIT();
    return tc;
}

/*!
    Catch higher than this.

    function call or variable or array entry
*/

void
assg_or_id(function_info * const func)
{
    ENTER(ASSG_OR_ID);
    std::string id;
    MATCH(ID);
    id = last_yytext;
    assg_or_id_prime(id, func);
    EXIT();
}

/*!
    Has *definitely* found an ID before this is called.

    identifier: name of function in which this is occuring
    var_name:   (a) name of variable being assigned to
                (b) name of array variable being indexed into
                (c) name of function being called

    Returns result of assignment or function call.
*/

void
assg_or_id_prime(const std::string &id, function_info * const caller)
{
    ENTER(ASSG_OR_ID_PRIME);
    switch (current_token)
    {
    // (a) simple variable assignment (b) reference to array value
    case ASSIGNMENT:
    case LBRACKET:
        // id here is:
        // (a) variable being assigned to
        // (b) array we're indexing
        assg_prime(id, caller);
        break;
    case LPAREN:
    {
        // definitely function call
        function_info *callee = function_lookup(id);
        if (!callee)
        {
            WARNING("Undefined function %s", id.c_str());

            // insert function with return type of ERROR_TYPE
            callee = new function_info("__" + id, ERROR_TYPE);

            // now create a single parameter of ERROR_TYPE
            param_vector *p = new param_vector();
            p->push_back(new variable_info("undefined_function", ERROR_TYPE));
            bool exists = insert_function(callee, p, false);
            if (exists)
            {
                RUNTIME_ERROR("Now I'm confused for '%s'!", PNAME(callee));
            }
        }

        param_vector *p = new param_vector();
        MATCH(LPAREN);
        id_paren_expr(callee, p, caller);
        MATCH(RPAREN);

        // this is a function call from a statement.  must have
        // void-ish return type.
        semantics::check_func_in_a_statement_compatibility(callee);

        // whoops.  Gotta create throw-away function.
        function_info *temp = new function_info(function_name("__temp_function"),caller->type());
        temp->defn_params(p);

        code->push_back(new three_code(OP_CALL_FUNCTION, callee, temp));
        // nothing to return
    }
    break;

    default:
        ERROR("assg_or_id_prime():");
    }
    EXIT();
}

/*!
    Catch higher than this.
*/

three_code *
assg(const std::string &id, function_info * const func)
{
    ENTER(ASSG);
    three_code * tc = 0;
    MATCH(ID);
    tc = assg_prime(id, func);
    EXIT();
    return tc;
}

/*!
    One of:

    (a) simple variable assignment: "x = BLAH" where BLAH is arbitrarily complex
    (b) array assignment: "x[INT] = BLAH" where INT is an INT_TYPE compatible
        expression

    Obviously the types on lhs and rhs have to be compatible, things
    have to exist, etc.
*/

three_code *
assg_prime(const std::string &id, function_info * const func)
{
    ENTER(ASSG_PRIME);
    three_code *tc = 0;
    if (current_token == ASSIGNMENT) // lhs = rhs
    {
        MATCH(ASSIGNMENT);

        // value to assign to variable with name 'id'
        tc = expr(func);
        variable_info *rhs = dynamic_cast<variable_info *>(tc->dest);
        if (!rhs)
        {
            // array or func -- either one is bad
            SEMANTICS("Trying to assign array or func '%s' to variable '%s'",
                       PNAME(tc->dest), id.c_str());
        }

        variable_info *lhs = variable_lookup(id);
        if (!lhs)
        {
            if (array_lookup(id))
                SEMANTICS("Trying to use array '%s' as a variable "
                          "(without an index) in assignment", id.c_str());
            else if (function_lookup(id))
                SEMANTICS("Trying to use function '%s' as lvalue in assignment",
                          id.c_str());

            // insert variable with error type, display message, then
            // continue
            WARNING("Variable %s is undeclared in assignment.", id.c_str());
            lhs = new variable_info(id, ERROR_TYPE);
            table->insert(lhs);
        }

        // see if lvalue is really an lvalue
        semantics::check_assignment_compatibility(lhs);

        // see if type of rvalue is compatible type of lvalue
        semantics::check_variable_compatibility(lhs, rhs);

        // do assignment.
        tc = new three_code(OP_ASSIGN, rhs, 0, lhs);
        code->push_back(tc);
    }
    else if (current_token == LBRACKET)
    {
        // array to assign to
        array_info *a = array_lookup(id);
        if (!a)
        {
            WARNING("No array with name %s in assignment", id.c_str());
            // so insert one
            a = new array_info(id, ERROR_TYPE);
            table->insert(a);
        }

        // index into this array
        MATCH(LBRACKET);
        three_code *index = expr(func);
        semantics::check_int_compatibility(index->dest);
        MATCH(RBRACKET);

        // thing to assign to array at this index
        MATCH(ASSIGNMENT);
        three_code *x = expr(func);
        variable_info *rhs = dynamic_cast<variable_info *>(x->dest);
        if (!rhs)
        {
            SEMANTICS("Trying to assign something weird to array '%s'",
                      PNAME(a));
        }

        // see if lvalue is really an lvalue
        semantics::check_assignment_compatibility(a);

        // see if type of rvalue is compatible type of lvalue: HACK!
        variable_info bob("", a->type());
        semantics::check_variable_compatibility(&bob, rhs);

        // generate code to do assignment
        tc = new three_code(OP_ASSIGN_TO_ARRAY, a, index->dest, rhs);
        code->push_back(tc);
    }
    else
    {
        ERROR("assg_prime");
    }
    EXIT();
    return tc;
}

// return 0 (NULL) on epsilon
//
// for function calls only, like "bob(x, y, z);}
//                                   ^^^^^^^^^ id_paren_expr part
// Gotta be a vector to support a bunch of expressions as function
// call arguments: e.g. "bob( 2 + 3, 4 / 1)".
//
// 'func' is function that is being called
//
// 'params' will collect the values to be passed to 'func' as
// parameters

void
id_paren_expr
(
    const function_info * const callee,
    param_vector * const params,
    function_info * const caller
)
{
    ENTER(ID_PAREN_EXPR);
    three_code *tc = 0;  // could be array or variable

    //cout << "Finding parameters for function call of " << PNAME(func) << endl;

    if (pd->in_first(EXPR, current_token))
    {
        tc = expr(caller);
        params->push_back(tc->dest);
        expr_tail(params, caller);

        // check to see if types of function call are compatible with
        // function being called
        callee->compare_params_with_call(params);
    }
    else if (!pd->in_follow(ID_PAREN_EXPR, current_token))
    {
        ERROR("id_paren_expr");
    }
    // else return (epsilon)
    EXIT();
}

void
expr_tail(param_vector * const params, function_info * const func)
{
    ENTER(EXPR_TAIL);
    if (current_token == COMMA)
    {
        MATCH(COMMA);
        // just to keep evaluating expr() cleanly distinct, else
        // v->push_back(expr(identifier));
        three_code *tc = expr(func);
        params->push_back(tc->dest);
        expr_tail(params, func);
    }
    else
    {
        CHECK_FOLLOW();
    }
    // else return (epsilon)
    EXIT();
}

/*!
    Data returned in three_code * has already been pushed, but this
    gives us a nice handle to it.
*/

three_code *
expr(function_info * const func)
{
    ENTER(EXPR);
    three_code *tc = 0;
    try
    {
        if (pd->in_first(AND_EXPR, current_token))
        {
            three_code *result = and_expr(func);
            tc = expr_prime(result, func);
        }
        else
        {
            ERROR("expr()");
        }
    } catch (syntax_error &e)
    {
        bool restart = SYNTAX_RECOVERY("an expression", EXPR, e.what());
        if (restart) tc = expr(func);
        // else return
    }
    if (!tc) ERROR("Null expr\n");
    EXIT();
    return tc;
}

/*!
    Returns:

    (a) BOOL_TYPE result of "f_in || f"
    (b) NULL pointer (epsilon production)

*/

three_code *
expr_prime(three_code * const tc_in, function_info * const func)
{
    ENTER(EXPR_PRIME);
    three_code *tc = 0;
    if (current_token == OR)
    {
        // If the first part of an OR is true, then we needn't compute
        // the second half (we short-circuit it).  Therefore we need a
        // label to be the target of a jump.  This is it.
        label_info *or_short_circuit = new label_info(label_name("or_circuit"));
        table->insert(or_short_circuit);

        code_list *actual_code = code->code();

        MATCH(OR);

        // Branch if the first half of the OR expression yielded a
        // result that is not equal to 0 (should be 1).
        code->push_back(new three_code(OP_FALSE_COND_BRANCH,
                                       tc_in->dest,
                                       or_short_circuit));
        code_list::iterator short_or = actual_code->end();
        --short_or;

        three_code *result =  and_expr(func);
        semantics::check_bool_compatibility(tc_in->dest, result->dest);
        tc = *(tc_in->dest) || *(result->dest);

        table->insert(tc->dest);
        func->push_local(tc->dest);


        // I need to set tc->dest such that it will be the right value to go
        // into the loop.  Because I don't set the loop variable when I jump to
        // 'and_short_circuit'.  I'm actualy inserting code before the
        // conditional branch, above, but I don't know the destination
        // of the overall && until here.
        actual_code->insert(short_or,
                            new three_code(OP_ASSIGN,tc_in->dest, 0, tc->dest));



        code->push_back(tc);
        // OR short circuit goes here
        code->push_back(new three_code(OP_LABEL, or_short_circuit));

        tc = expr_prime(tc, func);
    }
    else
    {
        CHECK_FOLLOW();
        tc = tc_in;
    }
    // else return (epsilon)
    EXIT();
    return tc;
}

three_code *
and_expr(function_info * const func)
{
    ENTER(AND_EXPR);
    three_code *tc = 0;
    if (pd->in_first(EQ_EXPR, current_token))
    {
        three_code *result = eq_expr(func);
        tc = and_expr_prime(result, func);
    }
    else
    {
        ERROR("and_expr()");
    }
    EXIT();
    return tc;
}

three_code *
and_expr_prime(three_code * const tc_in, function_info * const func)
{
    ENTER(AND_EXPR_PRIME);
    three_code * tc = 0;
    if (current_token == AND)
    {
        // if first part of AND is false (whatever the boolean
        // expression is yields 0), then we want to jump past the rest
        // of the AND expression. This is the label for doing that.
        label_info *and_short_circuit = new label_info(label_name("and_circuit"));
        table->insert(and_short_circuit);
        MATCH(AND);

        // if the result is 0 (OP_COND_BRANCH branches on 0 (oops)),
        // then goto this label
        code_list *actual_code = code->code();

        // if insert is after short_and
        //code_list::iterator short_and = actual_code->end();
        //--short_and;

        code->push_back(new three_code(OP_COND_BRANCH,
                                       tc_in->dest,
                                       and_short_circuit));
        // if insert is before short_and
        code_list::iterator short_and = actual_code->end();
        --short_and;

        // evaluate first part of AND expression
        three_code * result = eq_expr(func);
        semantics::check_bool_compatibility(tc_in->dest, result->dest);

        tc = *(tc_in->dest) && *(result->dest);

        table->insert(tc->dest);
        func->push_local(tc->dest);

        // I need to set tc->dest such that it will be the right value to go
        // into the loop.  Because I don't set the loop variable when I jump to
        // 'and_short_circuit'.  I'm actualy inserting code before the
        // conditional branch, above, but I don't know the destination
        // of the overall && until here.
        actual_code->insert(short_and,
                            new three_code(OP_ASSIGN,tc_in->dest, 0, tc->dest));

        code->push_back(tc);
        // put label after the three code element that is for the
        // second part of the AND.
        code->push_back(new three_code(OP_LABEL, and_short_circuit));
        tc = and_expr_prime(tc, func);
    }
    else
    {
        CHECK_FOLLOW();
        tc = tc_in;
    }
    // else return (epsilon)
    EXIT();
    return tc;
}

three_code *
eq_expr(function_info * const func)
{
    ENTER(EQ_EXPR);
    three_code *tc = 0;
    if (pd->in_first(CMP_EXPR, current_token))
    {
        three_code * result = cmp_expr(func);
        tc = eq_expr_prime(result, func);
    }
    else
    {
        ERROR("eq_expr()");
    }
    EXIT();
    return tc;
}

/*!
    Returns:

    (a) BOOL_TYPE variable
    (b) NULL pointer (for epsilon production)
*/

three_code *
eq_expr_prime(three_code * const tc_in, function_info * const func)
{
    ENTER(EQ_EXPR_PRIME);
    three_code *tc = 0;
    if ( (current_token == EQ) || (current_token == NE))
    {
        const int t = current_token;
        MATCH(current_token);
        three_code * result = cmp_expr(func);
        // check type compatibility
        semantics::check_int_compatibility((tc_in->dest), result->dest);
        switch (t)
        {
        case EQ: tc = *(tc_in->dest) == *(result->dest); break;
        case NE: tc = *(tc_in->dest) != *(result->dest); break;
        }
        table->insert(tc->dest);
        func->push_local(tc->dest);
        code->push_back(tc);
        tc = eq_expr_prime(tc, func);

    }
    else
    {
        CHECK_FOLLOW();
        tc = tc_in;
    }
    // else return (epsilon)
    EXIT();
    return tc;
}

/*!

*/

three_code *
cmp_expr(function_info * const func)
{
    ENTER(CMP_EXPR);
    three_code *tc = 0;
    if (pd->in_first(ADD_EXPR, current_token))
    {
        three_code * result = add_expr(func);
        tc = cmp_expr_prime(result, func);
    }
    else
    {
        ERROR("cmp_expr()");
    }
    EXIT();
    //cout << "Three code out of cmp is " << *tc << endl;
    return tc;
}

/*!
    Returns

    (a) a BOOL_TYPE value from the comparison of stuff
    (b) NULL for an epsilon selection
*/

three_code *
cmp_expr_prime(three_code * const tc_in, function_info * const func)
{
    ENTER(CMP_EXPR_PRIME);
    three_code *tc = 0;
    switch (current_token)
    {
        case LT:
        case LE:
        case GT:
        case GE:
        {
            const int t = current_token;
            MATCH(current_token);
            three_code *result = add_expr(func);
            // check type compatibility
            semantics::check_int_compatibility(tc_in->dest, result->dest);
            // inputs into comparison operators are INT_TYPE
            // compatible, result is BOOL_TYPE
            switch (t)
            {
            case LT: tc = *(tc_in->dest) <  *(result->dest); break;
            case LE: tc = *(tc_in->dest) <= *(result->dest); break;
            case GT: tc = *(tc_in->dest) >  *(result->dest); break;
            case GE: tc = *(tc_in->dest) >= *(result->dest); break;
            }
            semantics::check_bool_compatibility(tc->dest);
            table->insert(tc->dest);
            func->push_local(tc->dest);
            code->push_back(tc);
            tc = cmp_expr_prime(tc, func);
        }
        break;

        default:
            CHECK_FOLLOW();
            tc = tc_in;
    }
    // else return (epsilon)
    EXIT();
    //cout << "Three code out of cmp prime is " << *tc << endl;
    return tc;
}

three_code *
add_expr(function_info * const func)
{
    ENTER(ADD_EXPR);
    three_code *tc = 0;
    if (pd->in_first(MULT_EXPR, current_token))
    {
        three_code *result = mult_expr(func);
        tc = add_expr_prime(result, func);
    }
    else
    {
        ERROR("add_expr()");
    }
    EXIT();
    //cout << "Three code out of add is " << *tc << endl;
    return tc;
}

three_code *
add_expr_prime(three_code * const tc_in, function_info * const func)
{
    ENTER(ADD_EXPR_PRIME);
    three_code *tc = 0;
    switch (current_token)
    {
    case PLUS:
    case MINUS:
    {

        int t = current_token;
        MATCH(current_token);

        three_code * result = mult_expr(func);
        semantics::check_int_compatibility(tc_in->dest, result->dest);
        if (t == PLUS)
        {
            tc = *(tc_in->dest) + *(result->dest);
        } else
        {
            tc = *(tc_in->dest) - *(result->dest);
        }
        table->insert(tc->dest);
        func->push_local(tc->dest);
        code->push_back(tc);
        tc = add_expr_prime(tc, func);
    }
    break;

    default:
        CHECK_FOLLOW();
        tc = tc_in;
    }
    // else return (epsilon)
    EXIT();
    //cout << "Three code out of add prime is " << *tc << endl;
    return tc;
}

/*!
    f may be unchanged inside mult_expr_prime if it matches an epsilon
    production, in which case it will be returned untouched
*/

three_code *
mult_expr(function_info * const func)
{
    ENTER(MULT_EXPR);
    three_code *tc = 0;
    if (pd->in_first(UNARY_EXPR, current_token))
    {
        three_code *result = unary_expr(func);
        table->insert(result->dest);
        code->push_back(result);
        tc = mult_expr_prime(result, func);
    }
    else
    {
        ERROR("mult_expr()");
    }
    EXIT();
    //cout << "Three code out of mult is " << *tc << endl;
    return tc;
}


/*!
    Returns the result of passing one of:

    (a) f_in / f
    (b) f_in * f

    into mult_expr_prime, where further operations may be performed.
    Result will be INT_TYPE compatible.

    In event of epsilon match, then return f_in unchanged.
*/

three_code *
mult_expr_prime(three_code * const tc_in, function_info * const func)
{
    ENTER(MULT_EXPR_PRIME);
    three_code *tc = 0;
    switch (current_token)
    {
    case MULT:
    case DIV:
    {
        int t = current_token; // keep track of which operation
        MATCH(current_token);
        three_code * result = unary_expr(func);
        semantics::check_int_compatibility(tc_in->dest, result->dest);
        code->push_back(result);
        table->insert(result->dest);
        if (t == MULT)
        {
            tc = *(tc_in->dest) * *(result->dest);
        } else 
        {
            tc = *(tc_in->dest) / *(result->dest);
        }
        table->insert(tc->dest);
        func->push_local(tc->dest);
        code->push_back(tc);
        tc = mult_expr_prime(tc, func);
    }
    break;

    default:
        CHECK_FOLLOW();     // epsilon: f_out == tc_in
        tc = tc_in;
    }
    // else return (epsilon)
    EXIT();
    //cout << "Three code out of mult_prime is " << *tc << endl;
    return tc;
}

/*!
    Returns three_code *, which will point to variable holding:

    (a) the logical inverse of an expression        : !expr
        -- this is of BOOL_TYPE
    (b) the arithmetic inverse of an expression     : -expr
        -- this is of INT_TYPE
    (c) the value of one of:
        (i) a character constant                    : 'a'
            -- CHAR_TYPE
        (ii) a string constant                      : "bob"
            -- CHAR_TYPE *array*.
        (iii) an integer constant                   : 42
            -- INT_TYPE
    (d) the value of a variable                     : index
            -- INT_TYPE || CHAR_TYPE
    (e) the value of an expression                  : (index + 42)
            -- INT_TYPE || CHAR_TYPE

    Can't use variable_info because of STRINGCON.
*/


three_code *
unary_expr(function_info * const func)
{
    ENTER(UNARY_EXPR);
    data_info *d = 0;
    array_info * a = 0;
    variable_info * v = 0;
    three_code *tc = 0;
    switch (current_token)
    {
    case NEG:
    case MINUS: // fall-through
    {
        int t = current_token;
        MATCH(current_token);
        three_code * result = unary_expr(func);
        table->insert(result->dest);
        code->push_back(result);
        if (t == NEG)   // '!'
        {
            semantics::check_bool_compatibility(result->dest);
            // create variable to hold result of negation
            v = new variable_info(variable_name("negate"),
                                  result->dest->type());
            table->insert(v);
            func->push_local(v);
            tc = new three_code(OP_NOT, result->dest, 0, v);
            //code->push_back(tc);
        } else          // '-'
        {
            // result of -a is an INT_TYPE
            if ( !dynamic_cast<variable_info  *>(result->dest) )
            {
                SEMANTICS("Non int-compatible variable in unary '-' operation: '%s'", PNAME(result->dest));
            }
            semantics::check_int_compatibility(result->dest);
            v = new variable_info(variable_name("unary_MINUS_result"),INT_TYPE);
            func->push_local(v);
            table->insert(v);
            tc = new three_code(OP_NEGATIVE, result->dest, 0,  v);
            //code->push_back(tc);
        }
    }
    break;

    case CHARCON:
    {
        char value;
        if (yytext[1] == '\\')                           // escaped
        {
            // scanner catches illegal values, but it never hurts...
            switch(yytext[2])
            {
            case '0':  value = '\0'; break;
            case 'a':  value = '\a'; break; // Not legal C--, I don't think
            case 'b':  value = '\b'; break; // Not legal C--, I don't think
            case 't':  value = '\t'; break; // Not legal C--, I don't think
            case 'n':  value = '\n'; break;
            case 'v':  value = '\v'; break; // Not legal C--, I don't think
            case 'f':  value = '\f'; break; // Not legal C--, I don't think
            case 'r':  value = '\r'; break; // Not legal C--, I don't think
            case '\\': value = '\\'; break; // Not legal C--, for sure
            default:
                RUNTIME_ERROR("Invalid escape sequence in character constant "
                              "'%s'", yytext);
            }
/*
        NOT LEGAL C--: only printables plus '\n' and '\0'.
        }
        else if ((yytext[1] == '0') && yytext[2] != '\'')   // hex || octal
        {
            char *blah;
            value = strtol(yytext + 1, &blah, 0);
*/
        } else                                              // regular
        {
            // yytext[1] because yytext is 'X' where X is what we want.
            value = yytext[1];
        }

        v = new variable_info(variable_name("charcon"), CHAR_TYPE, value);
        v->is_const(true);
        tc = new three_code(OP_GLOBAL, 0, 0, v);
        code->push_data(tc);

        // just keeps us from deleting shit twice.
        tc = new three_code(OP_DUMMY, 0, 0, v);
        MATCH(CHARCON);
    }
    break;

    case INTCON:
        v = new variable_info(variable_name("intcon"), INT_TYPE, atoi(yytext));
        v->is_const(true);
        tc = new three_code(OP_GLOBAL, 0, 0, v);
        code->push_data(tc);


        // just keeps us from deleting shit twice.
        tc = new three_code(OP_DUMMY, 0, 0, v);
        MATCH(INTCON);
        break;

    case STRINGCON:
    {
        a = new array_info(array_name("stringcon"), CHAR_TYPE, strlen(yytext));
        a->is_const(true);
        a->data(yytext);
        tc = new three_code(OP_GLOBAL, 0, 0, a);
        code->push_data(tc);    // XXX: !!!


        // just keeps us from deleting shit twice.
        tc = new three_code(OP_DUMMY, 0, 0, a);
        MATCH(STRINGCON);
    }
    break;

    case ID:
        d = id_expr(func);
        // just keeps us from deleting shit twice.  Or not at all.
        tc = new three_code(OP_DUMMY, 0, 0, d);
        break;

    case LPAREN:
        MATCH(LPAREN);
        tc = expr(func);
        MATCH(RPAREN);
        break;

    default:
        ERROR("unary_expr");
    }

    EXIT();
    //cout << "Three code out of unary is " << *tc << endl;

    return tc;
}

/*!
    'f' that is returned is:

    (a) value of a simple variable like 'bob'
    (b) value of an array like 'bob[4]'
    (c) return value from function call like 'bob(42, monkey)'
*/

data_info *
id_expr(function_info * const func)
{
    ENTER(ID_EXPR);
    MATCH(ID);
    const std::string id(last_yytext);
    data_info *d = id_expr_prime(id, func);
    EXIT();
    return d;
}

/*!
    Return 0 (NULL pointer) if epsilon

    'func' parameter is function that we're doing the call *from*
    'f' is the function that is being called.
*/

data_info *
id_expr_prime(const std::string &id, function_info * const caller)
{
    ENTER(ID_EXPR_PRIME);
    
    data_info *d = 0;
    switch (current_token)
    {

    case LPAREN:            // function call
    {
        function_info *callee = function_lookup(id);
        if (!callee)
        {
            param_vector *p;
            WARNING("Undefined function %s", id.c_str());

            // insert function with return type of ERROR_TYPE
            callee = new function_info("__" + id, ERROR_TYPE);

            // now create a single parameter of ERROR_TYPE
            p = new param_vector();
            p->push_back(new variable_info("undefined_function_parameter",
                         ERROR_TYPE));
            bool exists = insert_function(callee, p, false);
            if (exists) RUNTIME_ERROR("Yarg! '%s'", PNAME(callee));
        }

        param_vector *different_p = new param_vector();
        MATCH(LPAREN);
        id_paren_expr(callee, different_p, caller);
        MATCH(RPAREN);

        // whoops.  Gotta create throw-away function.
        //
        // Or do I?  I have access to the calling function now.  I
        // could potentially use that.
        //
        // NO DAMN WAY can do that.  Holy hell, that's a lot of errors!
        function_info *temp = new function_info(function_name("__temp_function"), caller->type());
        temp->defn_params(different_p);

        d = new variable_info(variable_name("func_return"), callee->type());
        caller->push_local(d);
        code->push_back(new three_code(OP_CALL_FUNCTION, callee, temp, d));

        // this is a function call from an expression.  must have
        // non-void return type.
        if (callee->type() == VOID_TYPE)
        {
            SEMANTICS("Function %s called from within an expression in func "
                      "'%s' has return type void", PNAME(callee),PNAME(caller));
        }
    }
    break;

    // array reference -- value is INT or CHAR if valid
    case LBRACKET:
    {
        MATCH(LBRACKET);

        three_code *tc = expr(caller);
        d = dynamic_cast<variable_info *>(tc->dest);
        if (!d)
        {
            SEMANTICS("Trying to index an array with something other than a simple variable: identifier is '%s'", PNAME(tc->dest));
        }
        semantics::check_int_compatibility(tc->dest);

        // Now use index to lookup value in array identified by 'id'
        array_info *a = array_lookup(id);
        if (a)
        {
            // is there a local variable that's shadowing these global
            // array variable.  If 'a' is local array, then 'v' cannot
            // possibly be non-NULL, because we will have caught
            // multiple definitions.  Therefore if 'v' is non-NULL,
            // then 'a' must be a global array that should be shadowed
            // by this local variable, but isn't.
            d = table->variable_lookup(id);
            if (d)
            {
                SEMANTICS("Local non-array variable '%s' being used like global array of same name. You can't do that.", id.c_str());
            }
        } else
        {
            WARNING("Array %s used without declaration.", id.c_str());
            // variable used without declaration.  Announce error,
            // then insert variable.
            a = new array_info(id, ERROR_TYPE);
            table->insert(a);
        }


        if (a->global())
        {
            a = a->clone();
        }

        d = new variable_info(variable_name("array_entry"), a->type());
        caller->push_local(d);

        code->push_back(new three_code(OP_DUMMY, 0, 0, d));
        code->push_back(new three_code(OP_ASSIGN_FROM_ARRAY, a, tc->dest, d));

        MATCH(RBRACKET);
    }
    break;

    default:
        CHECK_FOLLOW(); // else return (epsilon)

        // okay, so want value of a variable.  We don't know if it's
        // an array or not, because it could be one of the parameters
        // in a function call, in which case we will not see the '['.
        d = variable_lookup(id);
        array_info * a = array_lookup(id);

        if (!d && !a)
        {
            if (function_lookup(id)) SEMANTICS("Trying to use function '%s' "
                                               "as a variable", id.c_str());

            // not an array or a variable that we know of
            WARNING("Variable %s not declared before use.",id.c_str());
            d = new variable_info(id, ERROR_TYPE);
            table->insert(d);   // insert this to prevent further errors
            //d = d->clone();     // copy, don't return original
        }  else if (a && d)
        {
            SEMANTICS("This is actually legal, but I suck.  Sorry.");
/*
            if (a->global())
                d = a->clone(); 
            else
                d = a;
*/
        }  else if (a)
        {
            if (a->global())
            {
                d = a->clone(); 
            } else
            {
                d = a;
/*
                // oh please oh please oh please
                d = a->clone();
                d->local(false);
*/
            }
        } else  
        {
            // okay we found defined variable: clone so don't lose
            // original record from symbol table (if global).
            if (d->global()) d = d->clone();
        }

        // The OP_DUMMY is created when id_expr() returns in
        // unary_expr.  So don't create one now.
    }

    EXIT();
    return d;
}

int
main(int argc, char *argv[])
{
    try
    {
        pd = new parser_data();
        tables = new table_vector(2);   // 1 global, 1 local: for C--
        tables->clear();
        table = new symbol_table();
        tables->push_back(table);       // table of global scope
        code = new codelist();

        current_token = yylex();
        if ((current_token == EOF) || pd->in_first(PROGRAM, current_token))
        {
            program();
        } else
        {
            ++tab_count;
            SYNTAX_RECOVERY("program start", PROGRAM, "Ouch\n");
            // died an early death!  Can't have that.
            program();
        }

        MATCH (EOF);

    } catch(std::exception &e)
    {
        // that sucked
        cerr << "Caught exception at top level: " << e.what()
             << "\nOh, forget it.  I give up!\n" << endl;
    } catch (...)
    {
        cerr << "Ow.  Something very bad happened!" << endl;
    }

    code->flush();
    code->display_asm();
    delete code;
/*
    Valgrind was kinda complaining about these, so I'm gonna go ahead
    and do the deletions myself.  I'm not sure that they're necessary,
    but it does make valgrind quieter.  I shouldn't have to delete
    static variables, though, should I?
*/
#if 1
    // delete static stuff.  Annoying!
    operation_to_assembly_map *asm_map = codelist::gimme_asm();
    operation_to_assembly_map::iterator asm_i = asm_map->begin();
    const operation_to_assembly_map::iterator asm_e = asm_map->end();
    for ( ; asm_i != asm_e; ++asm_i)
    {
        delete asm_i->second;
    }
    delete asm_map;
    delete  set_map::gimme();
    // This had better be only the 1 table!
    for (unsigned int i = 0; i < tables->size(); ++i)
    {
        delete (*tables)[i];
    }
    delete tables;
    delete pd;
#endif
    return 0;
}

