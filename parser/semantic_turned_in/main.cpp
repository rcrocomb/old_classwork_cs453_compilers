// Author: Robert Crocombe
// Class: CS453 Fall 04
// Professor: Debray
// Other People's Code Used: No
//
// Recursive descent parser for the C-- spec.
//
// Fri Oct 22 01:07:36 MST 2004
//
// New and improved! Now with semantic-checking action!
////////////////////////////////////////////////////////////////////////////////

#include <iostream>
using std::cout;
using std::cerr;
using std::endl;

#include <string>
#include <vector>

#include "tokens.h"

#include "parser_utils.h"
using namespace parser_utils;

#include "parser_data.h"
#include "symbol_table.h"
#include "semantics_bouncer.h"

#include "set_map.h"
#include "stack.h"

#include "field_info.h"
#include "variable_info.h"
#include "array_info.h"
#include "function_info.h"

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

    // these are mostly for debugging and informational purposes
    int last_token;
    static stack<std::string> names;
    //unsigned int tab_count;
    int where_I_was;
    // I don't think you can just hold the ptr, you have to copy the data.
    std::string last_yytext;
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

void insert_variable(const std::string &name,
                     const type_enum &type,
                     const bool is_array = false,
                     const unsigned int dims = 1);

void insert_function(function_info * const func, const bool prototype = false);

void insert_param(//function_info * const func,
                  field_vector * const v,
                  const std::string &name,
                  const type_enum &type,
                  const bool is_array = false,
                  const int dims = 1);


// Grammar productions
void program(void);
void program_prime(void);
void program_element(void);
void func_or_var_thing(const std::string &id, const type_enum &type_info);
void func_decl_or_body(function_info * const f);
type_enum func_type(void);
function_info *func_name_and_args(const type_enum &return_type,
                                  const bool is_extern = false);
void func_decl_tail(const type_enum &return_type, const bool is_extern = false);
void func_body(function_info * const f);
void param_types(function_info * const f);
void type_stmt(field_vector * const v);
void param_types_tail(field_vector * const v);
void buncho_var_decls(void);
void buncho_var_decls_prime(void);
void var_decl(const type_enum &type);
bool array_decl_maybe(unsigned int * const array_dims);
void var_decl_tail(const type_enum &t);
bool array_maybe(void);
void stmt_sequence(function_info * const f);
void stmt(function_info * const f);
const field_info *expr_maybe(void);
void for_A(void);
void for_B(void);
void for_C(void);
void assg_or_id(void);
void assg_or_id_prime(const std::string &s);
void assg(const std::string &s);
void assg_prime(const std::string &s);
void id_paren_expr(const function_info * const f);
void expr_tail(field_vector * const v);

const field_info *expr(void);
const field_info *expr_prime(const field_info * const f);
const field_info *and_expr(void);
const field_info *and_expr_prime(const field_info * const f);
const field_info *eq_expr(void);
const field_info *eq_expr_prime(const field_info * const f);
const field_info *cmp_expr(void);
const field_info *cmp_expr_prime(const field_info * const f);
const field_info *add_expr(void);
const field_info *add_expr_prime(const field_info * const f);
const field_info *mult_expr(void);
const field_info *mult_expr_prime(const field_info * const f);
const field_info *unary_expr(void);
const field_info *id_expr(void);
const field_info *id_expr_prime(const std::string &id);

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
/*
    for (unsigned int i = 0; i < tab_count; ++ i) cout << "  ";
    // just did push, so can't be empty
    ++tab_count;

*/
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

    static const std::string uhoh("...huh, I forgot where I am!\n");

    //if (!tab_count) RUNTIME_ERROR("bookkeeping_out: tab_count negative\n");
    //--tab_count;
    //for(unsigned int i = 0; i < tab_count; ++ i) cout << "  ";

    if (names.empty()) names.push(uhoh);
    //cout << "Exiting " << names.pop() << endl;

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
    first reverse to a variable by the name 's', or NULL if no match.
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
    return f;
}

/*!
    Called when I want to insert a new variable.
*/

void
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

        //cerr << "Inserting variable " << v->name() << " with type " << v->stringify_type() << "\n";
        table->insert(v);
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
*/

void
insert_function(function_info * const f, const bool prototype)
{
    if (!f)
    {
        SEMANTICS("Non-function with identifier '%s' already exists",
                  f->name().c_str());
    }

    const char * const name = f->name().c_str();

    // 11 exists && function
    if ( table->exists(name) && table->is_a_function(name))
    {
        const function_info * const g = function_lookup(name);
        // 11 existing prototype && new prototype
        if (g->has_prototype() && prototype)
        {
            // 2 prototypes -- ERROR
            SEMANTICS("Trying to define 2nd prototype for %s",name);
        } else if  (prototype)
        {   // 01 Existing is a defn, this is a prototype -- ERROR
            SEMANTICS("Prototype after definition for func %s", name);
        } else if (!g->has_prototype() && !prototype)
        {   // 00 -- existing defn, and this is a defn
            SEMANTICS("Second definition for function %s", name);
        }

        // 10 -- existing prototype && this !prototype -- OKAY

        // see this definition to see if types and parameters match.
        f->test_proto_vs_defn(g);

    } else  if (table->exists(name)) // exists, but not a function -- ERROR
    {
        // 10 -- exists and  !func
        if (prototype)
        {
        SEMANTICS("Can't insert function prototype '%s': "
                   "already something with this name.", name);
        }
        else
        {
        SEMANTICS("Can't insert function definition '%s': "
                   "already something with this name.", name);
        }

    }

    // 0x -- doesn't exist.  We know it's 01 and not 00 because 'f' is
    // of type function_info.  00 is handled by insert_variable.
    //
    // Therefore we're inserting either:
    // (a) new defn  -- with or without existing prototype
    // (b) new prototype for which there is no prototype or defn
    //     -- external or non-external

    if (!prototype && f->parameters())
    {
        // enforce rule for defn that no two params have same name.
        f->test_param_name_uniqueness();
    } else if (!prototype)
    {
        semantics::check_void_compatibility(f);
    }


/*
    cerr << "Inserting function " << *f << " as a "
          << (prototype ? "prototype" : "definition") << "\n";
    cerr << "Parameters == " << f->stringify_parameters() << "\n";
*/
    f->has_prototype(prototype);
    table->insert(f);
}

void
insert_param
(
    //function_info * const func,
    field_vector * const f,
    const std::string &name,
    const type_enum &type,
    const bool is_array,
    const int dims
)
{
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
        f->push_back(a);
    } else
    {
        variable_info *v = 0;
        switch(type)
        {
        case INT_TYPE: v = new variable_info(name, type); break;
        case CHAR_TYPE: v = new variable_info(name, type); break;
        default: SEMANTICS("unknown variable type for '%s'", name.c_str());
        }
        f->push_back(v);
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
    if (pd->in_first(PROGRAM_ELEMENT, current_token))
    {
        program_element();
        program_prime();
    } else
    {
        CHECK_FOLLOW();
    }
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
            MATCH(EXTERN);
            return_type = func_type();
            // MUST be a prototype only!  Parser should catch syntax error
            // if it isn't, so should be safe to assume it is a prototype.
            f = func_name_and_args(return_type, true);
            insert_function(f, true);
            func_decl_tail(return_type, true);
            MATCH(SEMICOLON);
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
            MATCH(VOID);            // fall-through
            return_type = VOID_TYPE;
        case ID:
            // definitely a function, either returning (a) void (b) int
            // (implicitly).  Could be prototype or definition.
            f = func_name_and_args(return_type);
            func_decl_or_body(f);
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
        function_info *f = new function_info(id, type);


        MATCH(LPAREN);
        param_types(f);
        MATCH(RPAREN);
        func_decl_or_body(f);
    }
    break;

    case LBRACKET:
    {
        unsigned int dims = 0;
        bool is_array = array_decl_maybe(&dims);
        if (is_array)
        {
            insert_variable(id, type, is_array, dims);
        } else
        {
            SEMANTICS("Found '[' but yet not an array in func %s", id.c_str());
        }
        var_decl_tail(type);
        MATCH(SEMICOLON);
    }
    break;

    case COMMA:
        insert_variable(id, type);
        var_decl_tail(type);
        MATCH(SEMICOLON);
        break;

    case SEMICOLON:
        insert_variable(id, type);
        MATCH(SEMICOLON);
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
func_decl_or_body(function_info * const f)
{
    ENTER(FUNC_DECL_OR_BODY);
    switch (current_token)
    {
    case LBRACE:
        MATCH(LBRACE);              // know it's a function definition
        //insert_function(f, false);  // Attempt to insert
        func_body(f);
        insert_function(f, false);  // Attempt to insert
        MATCH(RBRACE);
        break;

    case COMMA:
        // know that 'f' is a prototype
        insert_function(f, true);
        func_decl_tail(f->type());  // other funcs will have same return type
        MATCH(SEMICOLON);
        break;

    default:
        // single prototype
        insert_function(f, true);
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
        f = new function_info(id, type, is_extern);
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
    param_types(f);
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
    switch (current_token)
    {
    case COMMA:
        MATCH(COMMA);
        f = func_name_and_args(return_type, is_extern);
        if (is_extern)
        {
            table->insert(f);
        }
        func_decl_tail(return_type, is_extern);
        break;
    default:
        CHECK_FOLLOW();
    }
    // else return (epsilon)
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

    /* Insert all the function's parameters as variables */
    field_vector *p = f->parameters();
    if (p)
    {
        for (unsigned int i = 0; i < p->size(); ++i)
        {
            // good god, could I have done a worse job with this?
            array_info *a = dynamic_cast<array_info *>((*p)[i]);
            variable_info *v = dynamic_cast<variable_info *>((*p)[i]);
            if ((a && v) || (!a && !v))
            {
                RUNTIME_ERROR("Inserting parameters in function symbol table: "
                              "Insanity has ensued");
            }
            if (a) table->insert(a);
            if (v) table->insert(v);
        }
    }   // else void function


    // real beginning of function
    switch (current_token)
    {
    case INT:       // func w/ 1 or more variable declarations
    case CHAR:
    {
        const type_enum t = (current_token == INT) ? INT_TYPE : CHAR_TYPE;
        MATCH(current_token);
        var_decl(t);
        var_decl_tail(t);
        MATCH(SEMICOLON);
        buncho_var_decls();
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
*/

void
param_types(function_info * const f)
{
    ENTER(PARAM_TYPES);
    try
    {
        switch(current_token)
        {
        case VOID:
            MATCH(VOID);
            if (f->parameters())
            {
                SEMANTICS("Parameters mismatch for function '%s'.  "
                           "Expecting 'void', saw '%s'",
                           f->name().c_str(), f->stringify_parameters().c_str());
            }
            // function takes no parameters
            // no need to reinforce this: f->parameters(0);
            break;
        case INT:
        case CHAR:
        {
            const type_enum t = (current_token == INT) ? INT_TYPE : CHAR_TYPE;
            MATCH(current_token);
            MATCH(ID);
            std::string id(last_yytext);
            int dims = 0;
            bool is_array = array_maybe();

            // XXX: doesn't this kinda bone up functions taking void?
            field_vector *v = new field_vector();
            insert_param(v, id, t, is_array, dims);
            param_types_tail(v);
            if (f)
            {
                if (f->parameters())
                {
                    compare_parameters(f->name(), *(f->parameters()), *v);
                }
                f->parameters(v);
                f->test_param_name_uniqueness();
            }
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
}

/*!
    Match a single type declaration of the form "type varname" with
    the possibility that it's an array.

    OKAY, I think all necessary information accounted for
*/

void
type_stmt(field_vector * const v)
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
            insert_param(v, id, t, is_array, dims);

        }
        break;

        default:
            ERROR("type_stmt");
        }
    } catch (syntax_error &e)
    {
        bool restart = SYNTAX_RECOVERY("type statement",TYPE_STMT,e.what());
        if (restart) type_stmt(v);
        // else return;
    }
    EXIT();
}

/*!
    Allow for bunches of comma separated parameters.
*/

void
param_types_tail(field_vector * const v)
{
    ENTER(PARAM_TYPES_TAIL);
    switch (current_token)
    {
    case COMMA:
        MATCH(COMMA);
        type_stmt(v);
        param_types_tail(v);
        break;
    default:
        CHECK_FOLLOW();
        // else return (epsilon)
    }
    EXIT();
}

/*!
    Allow for 0 or more variable declarations the top of a function.
*/

void
buncho_var_decls(void)
{
    ENTER(BUNCHO_VAR_DECLS);
    try
    {
        buncho_var_decls_prime();
    } catch (syntax_error &e)
    {
        bool restart = SYNTAX_RECOVERY("some variable declarations",BUNCHO_VAR_DECLS, e.what());
        if (restart) buncho_var_decls_prime();
        // else return
    }
    EXIT();
}

/*!
    This does the recursion for buncho_var_decls.
*/

void
buncho_var_decls_prime(void)
{
    ENTER(BUNCHO_VAR_DECLS_PRIME);
    switch (current_token)
    {
    case INT:
    case CHAR:
    {
        const type_enum t = (current_token == INT) ? INT_TYPE : CHAR_TYPE;
        MATCH(current_token);
        var_decl(t);            // 1 var decl
        var_decl_tail(t);
        MATCH(SEMICOLON);
        buncho_var_decls();     // 0 or more additional var decls
        buncho_var_decls_prime();
    }
    break;
    default:
        CHECK_FOLLOW();         // epsilon (we're done) or error
    }
    EXIT();
}

/*!
    Sometimes we already know the type and just wanna match a variable
    name plus possibility of being an array.  Probably could fold into
    type_stmt, above, if me != lazy.

*/

void
var_decl(const type_enum &type)
{
    ENTER(VAR_DECL);
    try
    {
        MATCH(ID);
        std::string id(last_yytext);
        unsigned int dims = 0;
        bool is_array = array_decl_maybe(&dims);
        insert_variable(id, type, is_array, dims);
    } catch (syntax_error &e)
    {
        bool restart = SYNTAX_RECOVERY("variable declaration", VAR_DECL, e.what());
        if (restart) var_decl(type);
        // else return
    }
    EXIT();
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
    Lots of variable declarations
*/

void
var_decl_tail(const type_enum &t)
{
    ENTER(VAR_DECL_TAIL);
    switch (current_token)
    {
    case COMMA:
        MATCH(COMMA);
        var_decl(t);
        var_decl_tail(t);
        break;
    default:
        CHECK_FOLLOW();
        // else return (epsilon)
    }
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
    const field_info * f = 0;
    try
    {
        switch (current_token)
        {
        case IF:
            try
            {
                MATCH(IF);
                MATCH(LPAREN);
                f = expr();
                MATCH(RPAREN);
                semantics::check_bool_compatibility(f);
            } catch (syntax_error &e)
            {
                SYNTAX_RECOVERY("if() statement", STMT, e.what());
                // call stmt() below regardless
            }

            // statement following the if().  Try to find that, at least
            stmt(func);

            // disambiguating rule: refuse to torture grammar any further
            if (current_token == ELSE)
            {
                MATCH(ELSE);
                stmt(func);
            }
            break;

        case WHILE:
            try
            {
                MATCH(WHILE);
                MATCH(LPAREN);
                f = expr();
                MATCH(RPAREN);
                semantics::check_bool_compatibility(f);
            } catch (syntax_error &e)
            {
                SYNTAX_RECOVERY("while() loop", STMT, e.what());
                // call stmt() regardless
            }
            stmt(func);
            break;

        case FOR:
            try
            {
                MATCH(FOR);
                MATCH(LPAREN);
                for_A();
                for_B();
                for_C();
                MATCH(RPAREN);
            } catch (syntax_error &e)
            {
                SYNTAX_RECOVERY("for loop", STMT, e.what());
                // call stmt() below regardless
            }
            // stmt after for()
            stmt(func);
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
                f = expr_maybe();
            } catch (semantic_error &e)
            {
                func->has_return(true); // prevents excessive errors
                throw;
            }

            if (!f)
            {
                // No return value: ERROR unless function returns VOID
                if (func->type() != VOID_TYPE)
                {
                    // cheat: prevents excessive errors: we got one,
                    // we don't need another
                    func->has_return(true);

                    SEMANTICS("Void return statement in function %s which expects %s",
                    func->name().c_str(), func->stringify_type().c_str());
                }
            } else
            {
                // tried to return something.  Might not work out, though.
                func->has_return(true);

                const array_info *a = dynamic_cast<const array_info *>(f);
                if (a)
                {
                    SEMANTICS("Trying to return an array with type '%s' "
                              "from function '%s' which expects to return "
                              "a variable of type '%s'",
                              f->stringify_type().c_str(),
                              func->name().c_str(),
                              func->stringify_type().c_str());
                }

                // trying to return a value: what is function's return type?
                switch (func->type())
                {
                case INT_TYPE:
                    semantics::check_int_compatibility(func,f);
                    break;
                case CHAR_TYPE:
                    semantics::check_int_compatibility(func,f);
                    break;
                case VOID_TYPE:
                    SEMANTICS("Trying to return a variable of type '%s' "
                           "for function '%s' which returns 'void'",
                           f->stringify_type().c_str(),
                           func->name().c_str());
                    break;
                default: SEMANTICS("Invalid return type '%s' for '%s'.",
                         func->stringify_type().c_str(), func->name().c_str());
                }
            }

            MATCH(SEMICOLON);
            break;

        case ID:
            try
            {
                assg_or_id();
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
    delete f;
    EXIT();
}

/*!

*/

const field_info *
expr_maybe(void)
{
    ENTER(EXPR_MAYBE);
    const field_info *f = 0;
    if (pd->in_first(EXPR, current_token))
    {
        f = expr();
    }
    else
    {
        CHECK_FOLLOW();
    }
    // else return (epsilon)
    EXIT();
    return f;
}

/*!
    Catch at for() loop level.
*/

void
for_A(void)
{
    ENTER(FOR_A);
    std::string id;
    switch (current_token)
    {
    case ID:
        id = yytext;
        assg(id);
    case SEMICOLON:             // fall-through
        MATCH(SEMICOLON);
        break;
    default:
        ERROR("for_A");
    }
    EXIT();
}

/*!
    Catch at for() loop level.
*/

void
for_B(void)
{
    ENTER(FOR_B);
    const field_info *f = expr_maybe();
    semantics::check_bool_compatibility(f);
    MATCH(SEMICOLON);
    delete f;
    EXIT();
}

/*!
    Catch at for() loop level.
*/

void
for_C(void)
{
    ENTER(FOR_C);
    std::string id;
    if (current_token == ID)
    {
        id = yytext;
        assg(id);
    }
    else
    {
        CHECK_FOLLOW();
    }
    // else return (epsilon)
    EXIT();
}

/*!
    Catch higher than this.

    function call or variable or array entry
*/

void
assg_or_id(void)
{
    ENTER(ASSG_OR_ID);
    std::string id;
    MATCH(ID);
    id = last_yytext;
    assg_or_id_prime(id);
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
assg_or_id_prime(const std::string &id)
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
        assg_prime(id);
        break;
    case LPAREN:
    {
        // definitely function call

        function_info *f = function_lookup(id);
        if (!f)
        {
            WARNING("Undefined function %s", id.c_str());

            // insert function with return type of ERROR_TYPE
            f = new function_info(id, ERROR_TYPE);

            // now create a single parameter of ERROR_TYPE
            f->parameters(new field_vector());
            f->parameters()->push_back(new variable_info("ouch", ERROR_TYPE));
            insert_function(f);
        }

        MATCH(LPAREN);
        id_paren_expr(f);
        MATCH(RPAREN);

        // this is a function call from a statement.  must have
        // void-ish return type.
        semantics::check_func_in_a_statement_compatibility(f);

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

void
assg(const std::string &id)
{
    ENTER(ASSG);
    MATCH(ID);
    assg_prime(id);
    EXIT();
}

/*!
    One of:

    (a) simple variable assignment: "x = BLAH" where BLAH is arbitrarily complex
    (b) array assignment: "x[INT] = BLAH" where INT is an INT_TYPE compatible
        expression

    Obviously the types on lhs and rhs have to be compatible, things
    have to exist, etc.
*/

void
assg_prime(const std::string &id)
{
    ENTER(ASSG_PRIME);
    const field_info *f = 0;
    if (current_token == ASSIGNMENT)
    {
        MATCH(ASSIGNMENT);

        // value to assign to variable with name 'id'
        f = expr();
        const variable_info *fv = dynamic_cast<const variable_info *>(f);
        if (!fv)
        {
            // array or func -- either one is bad
            SEMANTICS("Trying to assign array or func '%s' to variable '%s'",
                       f->name().c_str(), id.c_str());
        }

        variable_info *v = variable_lookup(id);
        if (!v)
        {
            if ( array_lookup(id) )
            {
                SEMANTICS("Trying to use array '%s' as a variable (without an index) in assignment", id.c_str());
            }

            // insert variable with error type, display message, then
            // continue
            WARNING("Variable %s is undeclared in assignment.", id.c_str());
            v = new variable_info(id, ERROR_TYPE);
            table->insert(v);
        }

        // see if lvalue is really an lvalue
        semantics::check_assignment_compatibility(v);

        // see if type of rvalue is compatible type of lvalue
        semantics::check_variable_compatibility(v, fv);

        // Okay.  Since not actually doing value exchange, job is done.
        delete fv;
    }
    else if (current_token == LBRACKET)
    {
        array_info *a = array_lookup(id);
        if (!a)
        {
            WARNING("No array with name %s in assignment", id.c_str());
            // so insert one
            a = new array_info(id, ERROR_TYPE);
            table->insert(a);
        }

        MATCH(LBRACKET);
        f = expr();                             // array index
        semantics::check_int_compatibility(f);
        MATCH(RBRACKET);

        // f was compatible.  Don't need it anymore.
        delete f; f = 0;

        MATCH(ASSIGNMENT);

        f = expr();

        const variable_info *v = dynamic_cast<const variable_info *>(f);
        if (!v)
        {
            SEMANTICS("Trying to assign something weird to array '%s'",
                      f->name().c_str());
        }

        // see if lvalue is really an lvalue
        semantics::check_assignment_compatibility(a);

        // see if type of rvalue is compatible type of lvalue
        variable_info bob("", a->type());
        semantics::check_variable_compatibility(&bob, v);

        // Okay.  Since not actually doing value exchange, job is done.
        delete f; f= 0;
    }
    else
    {
        ERROR("assg_prime");
    }
    EXIT();
}

// return 0 (NULL) on epsilon
//
// for function calls only, like "bob(x, y, z);}
//                                   ^^^^^^^^^ id_paren_expr part
//
// Gotta be a vector to support a bunch of expressions as function
// call arguments: e.g. "bob( 2 + 3, 4 / 1)".  Evaluating the
// expressions should mean that we only return one value per ",",
// which means we can easily figure out which part of vector goes with
// what argument: v[0] is the 1st argument, v[1] is the 2nd.  If the
// exprs aren't resolved, then could have like v[0] = 2, v[1] = "+",
// v[2] = "3", or whatever, and then we're kinda screwed, I think.

void
id_paren_expr(const function_info * const func)
{
    ENTER(ID_PAREN_EXPR);
    field_vector *v = 0;
    const field_info *f = 0;  // could be array or variable

    if (pd->in_first(EXPR, current_token))
    {
        v = new field_vector();
        f = expr();
        if (!f) SEMANTICS("Null expr in function call of %s\n", func->name().c_str());
        v->push_back(const_cast<field_info *>(f));
        expr_tail(v);

        // check to see if types of function call are compatible with func
        func->compare_params_with_call(v);
        // don't need vector anymore
        for(unsigned int i = 0; i < v->size(); ++i)
        {
            delete (*v)[i];
        }
        delete v; v = 0;
    }
    else if (!pd->in_follow(ID_PAREN_EXPR, current_token))
    {
        ERROR("id_paren_expr");
    }
    // else return (epsilon)
    EXIT();
}

void
expr_tail(field_vector * const v)
{
    ENTER(EXPR_TAIL);
    if (current_token == COMMA)
    {
        MATCH(COMMA);
        // just to keep evaluating expr() cleanly distinct, else
        // v->push_back(expr(identifier));
        const field_info *f = expr();
        if (!f) ERROR("Null expr in function call\n");
        v->push_back(const_cast<field_info *>(f));
        expr_tail(v);
    }
    else
    {
        CHECK_FOLLOW();
    }
    // else return (epsilon)
    EXIT();
}

/*!

*/

const field_info *
expr(void)
{
    ENTER(EXPR);
    const field_info *f = 0;
    try
    {
        if (pd->in_first(AND_EXPR, current_token))
        {
            const field_info *result = and_expr();
            f = expr_prime(result);
            delete result; result = 0;
        }
        else
        {
            ERROR("expr()");
        }
    } catch (syntax_error &e)
    {
        bool restart = SYNTAX_RECOVERY("an expression", EXPR, e.what());
        if (restart) f = expr();
        // else return
    }
    if (!f) ERROR("Null expr\n");
    EXIT();
    return f;
}

/*!
    Returns:

    (a) BOOL_TYPE result of "f_in || f"
    (b) NULL pointer (epsilon production)

*/

const field_info *
expr_prime(const field_info * const f_in)
{
    ENTER(EXPR_PRIME);
    const field_info *f = 0;
    if (current_token == OR)
    {
        MATCH(OR);
        const field_info *result =  and_expr();
        semantics::check_bool_compatibility(f_in, result);
        f = expr_prime(*f_in || *result);
        delete result; result = 0;
    }
    else
    {
        CHECK_FOLLOW();
        f = f_in->clone();
    }
    // else return (epsilon)
    EXIT();
    return f;
}

const field_info *
and_expr(void)
{
    ENTER(AND_EXPR);
    const field_info *f = 0;
    if (pd->in_first(EQ_EXPR, current_token))
    {
        const field_info *result = eq_expr();
        f = and_expr_prime(result);
        delete result; result = 0;
    }
    else
    {
        ERROR("and_expr()");
    }
    EXIT();
    return f;
}

const field_info *
and_expr_prime(const field_info * const f_in)
{
    ENTER(AND_EXPR_PRIME);
    const field_info * f = 0;
    if (current_token == AND)
    {
        MATCH(AND);
        const field_info * result = eq_expr();
        semantics::check_bool_compatibility(f_in, result);
        f = and_expr_prime(*f_in && *result);
        delete result; result = 0;
    }
    else
    {
        CHECK_FOLLOW();
        f = f_in->clone();
    }
    // else return (epsilon)
    EXIT();
    return f;
}

const field_info *
eq_expr(void)
{
    ENTER(EQ_EXPR);
    const field_info *f = 0;
    if (pd->in_first(CMP_EXPR, current_token))
    {
        const field_info * result = cmp_expr();
        f = eq_expr_prime(result);
        delete result; result = 0;
    }
    else
    {
        ERROR("eq_expr()");
    }
    EXIT();
    return f;
}

/*!
    Returns:

    (a) BOOL_TYPE variable
    (b) NULL pointer (for epsilon production)
*/

const field_info *
eq_expr_prime(const field_info * const f_in)
{
    ENTER(EQ_EXPR_PRIME);
    const field_info *f = 0;
    if ( (current_token == EQ) || (current_token == NE))
    {
        const int t = current_token;
        MATCH(current_token);
        const field_info * result = cmp_expr();
        // check type compatibility
        semantics::check_int_compatibility(f_in, result);
        switch (t)
        {
        case EQ: f = eq_expr_prime(*f_in == *result); break;
        case NE: f = eq_expr_prime(*f_in != *result); break;
        }
        delete result; result = 0;
    }
    else
    {
        CHECK_FOLLOW();
        f = f_in->clone();
    }
    // else return (epsilon)
    EXIT();
    return f;
}

/*!

*/

const field_info *
cmp_expr(void)
{
    ENTER(CMP_EXPR);
    const field_info *f = 0;
    if (pd->in_first(ADD_EXPR, current_token))
    {
        const field_info * result = add_expr();
        //semantics::check_int_compatibility(result);
        f = cmp_expr_prime(result);
        delete result; result = 0;
    }
    else
    {
        ERROR("cmp_expr()");
    }
    EXIT();
    return f;
}

/*!
    Returns

    (a) a BOOL_TYPE value from the comparison of stuff
    (b) NULL for an epsilon selection
*/

const field_info *
cmp_expr_prime(const field_info * const f_in)
{
    ENTER(CMP_EXPR_PRIME);
    const field_info *f = 0;
    switch (current_token)
    {
        case LT:
        case LE:
        case GT:
        case GE:
        {
            const int t = current_token;
            MATCH(current_token);
            const field_info *result = add_expr();
            // check type compatibility
            semantics::check_int_compatibility(f_in, result);
            // inputs into comparison operators are INT_TYPE
            // compatible, result is BOOL_TYPE
            switch (t)
            {
            case LT: f = cmp_expr_prime(*f_in < *result); break;
            case LE: f = cmp_expr_prime(*f_in <= *result); break;
            case GT: f = cmp_expr_prime(*f_in > *result); break;
            case GE: f = cmp_expr_prime(*f_in >= *result); break;
            }
            delete result; result = 0;
            semantics::check_bool_compatibility(f);
        }
        break;

        default:
            CHECK_FOLLOW();
            f = f_in->clone();      // epsilon : copy result
    }
    // else return (epsilon)
    EXIT();
    return f;
}

const field_info *
add_expr(void)
{
    ENTER(ADD_EXPR);
    const field_info *f = 0;
    if (pd->in_first(MULT_EXPR, current_token))
    {
        const field_info *result = mult_expr();
        // check type compatibility
        //semantics::check_int_compatibility(result);
        f = add_expr_prime(result);
        delete result; result = 0;
    }
    else
    {
        ERROR("add_expr()");
    }
    EXIT();
    return f;
}

const field_info *
add_expr_prime(const field_info * const f_in)
{
    ENTER(ADD_EXPR_PRIME);
    const field_info * f = 0;
    switch (current_token)
    {
    case PLUS:
    case MINUS:
    {

        int t = current_token;
        MATCH(current_token);

        const field_info * result = mult_expr();
        semantics::check_int_compatibility(f_in, result);
        if (t == PLUS)
        {
            f = add_expr_prime(*f_in + *result);
        } else
        {
            f = add_expr_prime(*f_in - *result);
        }
        delete result; result = 0;
    }
    break;

    default:
        CHECK_FOLLOW();
        f = f_in->clone();           // epsilon, f_out == f_in
    }
    // else return (epsilon)
    EXIT();
    return f;
}

/*!
    f may be unchanged inside mult_expr_prime if it matches an epsilon
    production, in which case it will be returned untouched
*/

const field_info *
mult_expr(void)
{
    ENTER(MULT_EXPR);
    const field_info *f = 0;
    if (pd->in_first(UNARY_EXPR, current_token))
    {
        const field_info * result = unary_expr();
        // check type compatibility
        //semantics::check_int_compatibility(result);
        f = mult_expr_prime(result);
        delete result; result = 0;
    }
    else
    {
        ERROR("mult_expr()");
    }
    EXIT();
    return f;
}


/*!
    Returns the result of passing one of:

    (a) f_in / f
    (b) f_in * f

    into mult_expr_prime, where further operations may be performed.
    Result will be INT_TYPE compatible.

    In event of epsilon match, then return f_in unchanged.
*/

const field_info *
mult_expr_prime(const field_info* const f_in)
{
    ENTER(MULT_EXPR_PRIME);
    const field_info *f = 0;
    switch (current_token)
    {
    case MULT:
    case DIV:
    {
        int t = current_token; // keep track of which operation
        MATCH(current_token);
        const field_info * result = unary_expr();
        semantics::check_int_compatibility(f_in, result);
        if (t == MULT)
        {
            f = mult_expr_prime(*f_in * *result);
        } else
        {
            f = mult_expr_prime(*f_in / *result);
        }
        delete result; result = 0;
    }
    break;

    default:
        CHECK_FOLLOW();     // epsilon: f_out == f_in
        f = f_in->clone();  // prevent aliasing and thus bad deletion problems
    }
    // else return (epsilon)
    EXIT();
    return f;
}

/*!
    Returns field_info *, which will point to variable holding:

    (a) the logical inverse of an expression        : !expr
        -- this is of BOOL_TYPE
    (b) the arithmetic inverse of an expression     : -expr
        -- this is of INT_TYPE
    (c) the value of one of:
        (i) a character constant                    : 'a'
            -- CHAR_TYPE
        (ii) a string constant                      : "bob"
            -- CHAR_TYPE fucking *array*.  FUCK!
        (iii) an integer constant                   : 42
            -- INT_TYPE
    (d) the value of a variable                     : index
            -- INT_TYPE || CHAR_TYPE
    (e) the value of an expression                  : (index + 42)
            -- INT_TYPE || CHAR_TYPE

    Can't use variable_info because of STRINGCON.

    Must ensure that these values never get inserted, because things
    will quickly break if that happens.
*/

const field_info *
unary_expr(void)
{
    ENTER(UNARY_EXPR);
    const field_info * f = 0;
    switch (current_token)
    {
    case NEG:
    case MINUS:
    {
        int t = current_token;
        MATCH(current_token);
        const field_info * result = unary_expr();
        if (t == NEG)   // '!'
        {
            semantics::check_bool_compatibility(result);
            f = new variable_info("temp", BOOL_TYPE);
        } else          // '-'
        {
            // result of -a is an INT_TYPE
            semantics::check_int_compatibility(result);
            f = new variable_info("temp", INT_TYPE);
        }
        delete result; result = 0;
    }
    break;

    // We do no lookup here, only create a field and fill it with
    // data: constants do not have names that need to be looked up.
    //
    // We could run into problems if any of these get inserted into
    // the symbol table, because we'll have name collisions in short
    // order.

    case CHARCON:
        f = new variable_info("temp", CHAR_TYPE);
        MATCH(CHARCON);
        break;

    case INTCON:
        f = new variable_info("temp", INT_TYPE);
        MATCH(INTCON);
        break;

    case STRINGCON:
        f = new array_info("temp", CHAR_TYPE);
       MATCH(STRINGCON);
       break;

    case ID:
        f = id_expr();
        break;

    case LPAREN:
        MATCH(LPAREN);
        f = expr();
        MATCH(RPAREN);
        // now holds value of expression
        break;
    default:
        ERROR("unary_expr");
    }
    EXIT();
    return f;
}

/*!
    'f' that is returned is:

    (a) value of a simple variable like 'bob'
    (b) value of an array like 'bob[4]'
    (c) return value from function call like 'bob(42, monkey)'
*/

const field_info *
id_expr(void)
{
    ENTER(ID_EXPR);
    MATCH(ID);
    const std::string id(last_yytext);
    const field_info *f = id_expr_prime(id);
    EXIT();
    return f;
}

// Return 0 (NULL pointer) if epsilon

const field_info *
id_expr_prime(const std::string &id)
{
    ENTER(ID_EXPR_PRIME);
    const field_info *f = 0;
    switch (current_token)
    {

    case LPAREN:
    {
        function_info *func = function_lookup(id);
        if (!func)
        {
            WARNING("Undefined function %s", id.c_str());

            // insert function with return type of ERROR_TYPE
            func = new function_info(id, ERROR_TYPE);

            // now create a single parameter of ERROR_TYPE
            func->parameters(new field_vector());
            func->parameters()->push_back(new variable_info("ouch", ERROR_TYPE));
        }

        MATCH(LPAREN);
        id_paren_expr(func);
        MATCH(RPAREN);

        // this is a function call from an expression.  must have
        // non-void return type.
        if (func->type() == VOID_TYPE)
        {
            SEMANTICS("Function %s called from within an expression "
                      "has return type void", func->name().c_str());
        }

        f = new variable_info("func call result", func->type());
    }
    break;

    // array reference -- value is INT or CHAR if valid
    case LBRACKET:
    {
        MATCH(LBRACKET);

        f = expr();
        semantics::check_int_compatibility(f);
        delete f; f = 0;   // don't need this anymore -- checked type

        // Now use index to lookup value in array identified by 'id'
        array_info *a = array_lookup(id);
        if (!a)
        {
            WARNING("Array %s used without declaration.", id.c_str());
            // variable used without declaration.  Announce error,
            // then insert variable.
            a = new array_info(id, ERROR_TYPE);
            table->insert(a);
        }

        f = new variable_info("array value", a->type());
        MATCH(RBRACKET);
    }
    break;

    default:
        CHECK_FOLLOW(); // else return (epsilon)

        // okay, so want value of simple variable: we know it's a simple
        // variable if f == 0: i.e., nothing was found above.
        variable_info * v = variable_lookup(id);
        array_info * a = array_lookup(id);

        if (!a && !v)
        {
            // not an array or a variable that we know of
            WARNING("Variable %s not declared before use.",id.c_str());
            v = new variable_info(id, ERROR_TYPE);
            table->insert(v);   // insert this to prevent further errors
            f = v->clone();     // copy, don't return original
        } else if (!v)
        {
            f = a->clone();
        } else {
        // okay we found defined variable
            f = v->clone();
        }

    }

    EXIT();
    return f;
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

        current_token = yylex();
        if ((current_token == EOF) || pd->in_first( PROGRAM, current_token))
        {
            program();
        } else
        {
            //++tab_count;
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
    delete pd;
    return 0;
}

