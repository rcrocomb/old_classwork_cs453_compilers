/*!
    Author: Robert Crocombe
    Class: CS453 Fall 04
    Professor: Dr. Debray
    Other People's Code: No
*/

#include "semantics_bouncer.h"

#include "field_info.h"
#include "variable_info.h"
#include "array_info.h"
#include "function_info.h"

#include "parser_utils.h"

void
semantics::check_variable_compatibility
(
    const variable_info * const a,
    const variable_info * const b
)
{
    if (!a || !b)
    {
        RUNTIME_ERROR("check_variable_compat: NULL pointer");
        return;
    }

    type_enum t1 = a->type();
    type_enum t2 = b->type();

    if ( (t1 == INT_TYPE)   && (t2 == INT_TYPE)     ) { return; }
    if ( (t1 == CHAR_TYPE)  && (t2 == INT_TYPE)     ) { return; }
    if ( (t1 == INT_TYPE)   && (t2 == CHAR_TYPE)    ) { return; }
    if ( (t1 == CHAR_TYPE)  && (t2 == CHAR_TYPE)    ) { return; }
    if ( (t1 == ERROR_TYPE) || (t2 == ERROR_TYPE)   ) { return; }
    // else error
    SEMANTICS("Type incompatibilities in assignment");
}

// Cannot mix INT arrays with CHAR arrays.

void
semantics::check_array_compatibility
(
    const array_info * const a,
    const array_info * const b
)
{
    if (!a || !b)
    {
        RUNTIME_ERROR("check_array_compat: NULL pointer");
        return;
    }

    type_enum t1 = a->type();
    type_enum t2 = b->type();

    if ( (t1 == INT_TYPE)   && (t2 == INT_TYPE)     ) { return; }
    if ( (t1 == CHAR_TYPE)  && (t2 == CHAR_TYPE)    ) { return; }
    if ( (t1 == ERROR_TYPE) || (t2 == ERROR_TYPE)   ) { return; }
    // else error
}

void
semantics::check_assignment_compatibility(const field_info * const a)
{
    if (!a)
    {
        RUNTIME_ERROR("check_assignment_compat: variable is NULL");
        return;
    }

    type_enum t = a->type();
    if ( (t != INT_TYPE) && (t != CHAR_TYPE) && (t != ERROR_TYPE))
    {
        SEMANTICS("Non-lvalue in assignment subexpression");
    }
}

void
semantics::check_int_compatibility
(
    const field_info * const a,
    const field_info * const b
)
{
    if (!a || !b)
    {
        RUNTIME_ERROR("check_int_compat: NULL pointer");
        return;
    }

    type_enum t1 = a->type();
    type_enum t2 = b->type();

    const variable_info *x = dynamic_cast<const variable_info *>(a);
    const variable_info *y = dynamic_cast<const variable_info *>(b);

    if ( (t1 == INT_TYPE)   && (t2 == INT_TYPE)     ) { return; }
    if ( (t1 == CHAR_TYPE)  && (t2 == INT_TYPE)     ) { return; }
    if ( (t1 == INT_TYPE)   && (t2 == CHAR_TYPE)    ) { return; }
    if ( (t1 == CHAR_TYPE)  && (t2 == CHAR_TYPE)    ) { return; }
    if ( (t1 == ERROR_TYPE) || (t2 == ERROR_TYPE)   ) { return; }
    // both dynamic casts succeeded: a && b are variables, not arrays
    // or functions.
    if (x && y) { return; }

    // else error
    SEMANTICS("Part of subexpression incompatible with int");
}

void
semantics::check_bool_compatibility
(
    const field_info * const a,
    const field_info * const b
)
{
    check_bool_compatibility(a);
    check_bool_compatibility(b);
}


void
semantics::check_int_compatibility
(
    const field_info * const a
)
{
    if (!a)
    {
        RUNTIME_ERROR("check_int_compat: variable is NULL");
        return;
    }

    type_enum t = a->type();
    if ( (t != INT_TYPE) && (t != CHAR_TYPE) && (t != ERROR_TYPE))
    {
        SEMANTICS("Type incompatibility in subexpression: "
                  "non int-compatible variable '%s' has type %s",
                  a->name().c_str(),
                  a->stringify_type().c_str());
    }
}

void
semantics::check_bool_compatibility
(
    const field_info * const a
)
{
    if (!a)
    {
        RUNTIME_ERROR("check_bool_compat: variable is NULL");
        return;
    }

    if ( (a->type() != BOOL_TYPE) && (a->type() != ERROR_TYPE))
    {
        SEMANTICS("Part of subexpression incompatible with bool");
    }
}

void
semantics::check_func_in_a_statement_compatibility
(
    const field_info * const a
)
{
    if (!a)
    {
        RUNTIME_ERROR("check_func_in_a_statement: variable is NULL");
        return;
    }

    if ( (a->type() != VOID_TYPE) && (a->type() != ERROR_TYPE))
    {
        SEMANTICS("Type incompatibility when calling a function as a statement: return type must be void");
    }
}

void
semantics::check_void_compatibility
(
    const function_info * const f
)
{
    if (   !f->has_return()
        && (f->type() != VOID_TYPE)
        && (f->type() != ERROR_TYPE))
    {
        SEMANTICS("Language rules require a function not returning void \n"
                  "to have at least one statement of the form 'return expr;'.\n"
                  "No such expression for function %s returning %s",
                  f->name().c_str(),
                  f->stringify_type().c_str());
    }
}
