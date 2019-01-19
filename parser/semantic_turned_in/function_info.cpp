/*!
    Author: Robert Crocombe
    Class: CS453 Fall 04
    Professor: Dr. Debray
    Other People's Code: No
*/

#include "function_info.h"
#include "semantics_bouncer.h"
#include "parser_utils.h"
#include "array_info.h"
#include "variable_info.h"
#include "semantics_bouncer.h"

#include <ostream>

void
function_info::test_proto_vs_defn(const function_info * const f)
{
    const char * const n = name().c_str();

    if (is_extern_ || f->is_extern_)
    {
        SEMANTICS("Trying to define a function %s declared extern.", n);
    }

    // Return types match?
    if (type() != f->type())
    {
        SEMANTICS("Return type mismatch for '%s'", n);
    }

    if (!parameters_)
    {
        if (f->parameters()) {SEMANTICS("Definition has parameters whereas prototype does not\n");}
    } else if (!f->parameters())
    {
        if (parameters()) {SEMANTICS("Prototype has parameters whereas definition does not\n");}
    }

    compare_parameters(n, *parameters_, *(f->parameters()));
}

void
function_info::test_param_name_uniqueness(const std::string &id) const
{
    const int size = parameters_->size();
    for(int i = 0; i < size; ++i)
    {
        if (id == (*parameters_)[i]->name())
        {
            SEMANTICS("Two parameters with identifier '%s' in function '%s'",
                       id.c_str(), name().c_str());
        }
    }
}

/*!
    Compares every name to every other name in list of function params.
*/
void
function_info::test_param_name_uniqueness(void) const
{
    const int size = parameters_->size();
    for(int i = 0; i < (size - 1); ++i)
    {
        for(int j = i+1; j < size; ++j)
        {
            if ((*parameters_)[i]->name() == (*parameters_)[j]->name())
            {
                SEMANTICS("Two parameters with identifier '%s' in function %s",
                          (*parameters_)[i]->name().c_str(), name().c_str());
            }
        }
    }
}

std::string
function_info::stringify_parameters(void) const
{
    std::string s("");
    if (!parameters_)
    {
        return "void";
    }

    const unsigned int size = parameters_->size();
    for (unsigned int i = 0; i < size; ++i)
    {
        std::string t = (*parameters_)[i]->stringify_info();
        s += t;
        if ((size - i) > 1) s += ", ";
    }
    return s;
}

void
function_info::compare_params_with_call
(
    const field_vector * const call
) const
{
    if (!parameters_ && call)
    {
        SEMANTICS("Function that takes no arguments has been called with arguments");
    }

    if (parameters_ && !call)
    {
        SEMANTICS("Function that takes arguments has been called without arguments");
    }

    const char * const n = name().c_str();
    const unsigned int size = parameters_->size();



    // for function that was called without being defined in any way,
    // I've inserted a dummy function with a single parameter of
    // ERROR_TYPE.  Assume that all calls to this function have okay
    // parameters and return.
    if ( (size == 1) && ((*parameters_)[0]->type() == ERROR_TYPE) )
    {
        return;
    }

    if (size != call->size())
    {
        SEMANTICS("Number of arguments '%d' in call doesn't match number of parameters '%d' for function %s:\n%s\n%s", call->size(), size, n, function_info::oops(*call).c_str(), stringify_parameters().c_str());
    }

    for (unsigned int i = 0; i < size; ++i)
    {
        variable_info *v = dynamic_cast<variable_info *>((*parameters_)[i]);
        variable_info *v2 = dynamic_cast<variable_info *>((*call)[i]);
        if ( (!v && v2) || (v && !v2))
        {
            SEMANTICS("Mismatch between array and simple variable for argument %d (counting from 0) in call to function %s", i, n);
        }

        if (v && v2)
        {
            try
            {
                semantics::check_int_compatibility(v, v2);
            } catch (semantic_error &e)
            {
                SEMANTICS("Incompatible types for non-array argument %d in call to function %s", i, n);
            }

        } else
        {
            array_info *a = dynamic_cast<array_info *>((*parameters_)[i]);
            array_info *b = dynamic_cast<array_info *>((*call)[i]);
            if (!a || !b)
            {
                SEMANTICS("Bad parameter type at function parameter %d in call to function %s", i, n);
            }

            try
            {
                semantics::check_array_compatibility(a, b);
            } catch (semantic_error &e)
            {
                SEMANTICS("Incompatible types for array argument %d in call to function %s", i, n);
            }
        }

    }
}

std::string
function_info::oops(const field_vector &v)
{
    function_info a("blah", INT_TYPE);
    a.parameters(const_cast<field_vector *>(&v));
    std::string s = a.stringify_parameters();
    return s;
}

////////////////////////////////////////////////////////////////////////////////
// Not in Class
////////////////////////////////////////////////////////////////////////////////


std::ostream &
operator <<(std::ostream &o, const function_info &f)
{
    o << f.stringify_info() << " " << f.stringify_parameters();
    return o;
}


std::ostream &
operator <<(std::ostream &o, const field_vector &v)
{
    std::string s("");
    const unsigned int size = v.size();
    for (unsigned int i = 0; i < size; ++i)
    {
        std::string t = v[i]->stringify_info();
        s += t;
        if ((size - i) > 1) s += ", ";
    }
    o << s;
    return o;
}

void
compare_parameters(const std::string &n, const field_vector &a, const field_vector &b)
{
    // Parameters match?
    int a_size = a.size();
    int b_size = b.size();
    if (a_size != b_size)
    {
        SEMANTICS("Varying number of args for '%s': %d vs %d", n.c_str(), a_size, b_size);
    }

    for( int i = 0; i < a_size; ++i)
    {
        // one type doesn't match the other
        if ( a[i]->type() != b[i]->type())
        {
            SEMANTICS("Type mismatch for argument %d (counting from 0) for %s", i, n.c_str());
        }

        // crap
        const array_info *a_array = dynamic_cast<const array_info *>(a[i]);
        const variable_info *a_var = dynamic_cast<const variable_info *>(b[i]);
        const array_info *b_array = dynamic_cast<const array_info *>(b[i]);
        const variable_info *b_var = dynamic_cast<const variable_info *>(b[i]);

        if (a_var)
        {
            if (!b_var)
            {
                SEMANTICS("Non-array variable paired with something else at argument %d for %s", i, n.c_str());
            }
        } else if (a_array)
        {
            if (!b_array)
            {
                SEMANTICS("Array variable paired with something else at argument %d for %s", i, n.c_str());
            }
        } else
        {
            // ARGH!  Inserted a function as a parameter
            SEMANTICS("Massive ugliness in function %s at argument %d",n.c_str(), i);
        }

    }
    // all arguments match.  We're done.
}
