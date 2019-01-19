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

////////////////////////////////////////////////////////////////////////////////
// Constructors and destructor
////////////////////////////////////////////////////////////////////////////////

function_info::function_info
(
    const std::string &name,
    const type_enum &return_type,
    const bool is_extern
):
    field_info(name, return_type),
    is_extern_(is_extern),
    has_return_(false),
    found_prototype_(false),
    found_definition_(false),
    proto_(0),
    defn_(0),
    locals_(new param_vector())
{
    // nada
}


function_info::function_info(const function_info &f):
    field_info(f),
    is_extern_(f.is_extern_),
    has_return_(f.has_return_),
    found_prototype_(false),
    found_definition_(false),
    proto_(0),
    defn_(0),
    locals_(new param_vector(*f.locals_))
{
    if (proto_)
    {
            proto_ = new param_vector(*f.proto_);
    }

    if (defn_)
    {
        defn_ = new param_vector(*f.defn_);
    }
}

function_info::~function_info(void)
{

    // If I have a prototype and a definition, I point them to the
    // same variables.  Therefore, only one of them should delete the
    // entries.  Therefore, have the prototype delete the entries only
    // if no definition exists.
    if (proto_)//&& !defn_)
    {
        param_vector::const_iterator p_i = proto_->begin();
        const param_vector::const_iterator p_e = proto_->end();
        for ( ; p_i != p_e ; ++p_i)
        {
            delete *p_i;
        }
        delete proto_;
    }
    //if (proto_) delete proto_;

    if (defn_)
    {
        param_vector::const_iterator d_i = defn_->begin();
        const param_vector::const_iterator d_e = defn_->end();
        for ( ; d_i != d_e ; ++d_i)
        {
            delete *d_i;
        }
        delete defn_;
    }

    if (locals_)
    {
        param_vector::const_iterator l_i = locals_->begin();
        const param_vector::const_iterator l_e = locals_->end();
        // locals is a vector of *aliases* to entries in the local
        // symbol table.  It was easier to do it this way than to try
        // and sort which variables were local from which were
        // parameters.  I supposed I could have not inserted function
        // parameters in the symbol table and done it that way, but I
        // only just now thought of it.  Drat.
/*
        for ( ; l_i != l_e ; ++l_i)
        {
            delete *l_i;
        }
*/
        delete locals_;
    }
}

////////////////////////////////////////////////////////////////////////////////
// Operators
////////////////////////////////////////////////////////////////////////////////

function_info &
function_info::operator =(const function_info &f)
{
    if (this != &f)
    {
        field_info::operator =(f);

        param_vector *new_proto = new param_vector(*f.proto_);
        param_vector *new_defn = new param_vector(*f.defn_);
        param_vector *new_locals = new param_vector(*f.locals_);

        delete proto_;
        proto_ = new_proto;

        delete defn_;
        defn_ = new_defn;

        delete locals_;
        locals_ = new_locals;

        is_extern_ = f.is_extern_;
        has_return_ = f.has_return_;
        found_prototype_ = f.found_prototype_;
        found_definition_ = f.found_definition_;
    }
    return *this;
}

////////////////////////////////////////////////////////////////////////////////
// Internal
////////////////////////////////////////////////////////////////////////////////

std::string
function_info::oops(const param_vector * const v) const
{
    function_info a("blah", INT_TYPE);
    a.proto_params(v);
    std::string s = a.stringify_parameters();
    return s;
}

////////////////////////////////////////////////////////////////////////////////
// Interface
////////////////////////////////////////////////////////////////////////////////

void
function_info::proto_params(const param_vector * const params)
{
    if (params)             // 1x
    {
        //param_vector *p = new param_vector(*params);
        if (proto_) WARNING("Deleted prototype's parameters for '%s'",
                            name().c_str());
        delete proto_;
        //proto_ = p;
        proto_ = params;
    } else if (proto_)      // 01
    {
        WARNING("Deleted prototype's parameters for '%s'", name().c_str());
        delete proto_;
        proto_  = 0;
    }
}

void
function_info::defn_params(const param_vector * const params)
{
    if (params)
    {
        //param_vector *p = new param_vector(*params);
        if (defn_) WARNING("Deleted definition's parameters for '%s'",
                           name().c_str());
        delete defn_;
        //defn_ = p;
        defn_ = params;
    } else if (defn_)
    {
        WARNING("Deleted definition's parameters for '%s'", name().c_str());
        delete defn_;
        defn_ = 0;
    }
}

/*!
    Can return NULL
*/

const param_vector *
function_info::proto_params(void) const
{
    return proto_;
}

/*!
    Can return NULL
*/

const param_vector *
function_info::defn_params(void) const
{
    return defn_;
}

/*!
    Can return NULL
*/

const param_vector *
function_info::parameters(void) const
{
    return (defn_ ? defn_ : proto_);
}


void
function_info::push_local(data_info * const d)
{
    d->local(true);
    locals_->push_back(d);
}

std::string
function_info::stringify_parameters(void) const
{
    std::string s("(");
    if (!defn_ && !proto_)
    {
        return "(void)";
    }

    // prefer using parameteres from defn to parameters from
    // prototype.  Should be of same type, etc., but may have
    // different names in definition: e.g.
    //
    // void bob(int a);
    //
    // void bob(int x)
    // {
    // }
    const param_vector *p = parameters();

    const unsigned int size = p->size();
    for (unsigned int i = 0; i < size; ++i)
    {
        std::string t = (*p)[i]->stringify_info();
        s += t;
        array_info *a = dynamic_cast<array_info *>((*p)[i]);
        if (a) s += "[]";
        if ((size - i) > 1) s += ", ";
    }
    s += ")";
    return s;
}

void
function_info::compare_params_with_call
(
    const param_vector * const call
) const
{
    const param_vector *p = parameters();

    if (!p && call)
    {
        SEMANTICS("Function '%s' takes no arguments, but has been called "
                  "with arguments", name().c_str());
    }

    if (p && !call)
    {
        SEMANTICS("Function '%s' takes arguments,  but has been called "
                  "without arguments", name().c_str());
    }

    const char * const n = name().c_str();
    const unsigned int size = p->size();

    // for function that was called without being defined in any way,
    // I've inserted a dummy function with a single parameter of
    // ERROR_TYPE.  Assume that all calls to this function have okay
    // parameters and return.
    if ( (size == 1) && ((*p)[0]->type() == ERROR_TYPE) )
    {
        return;
    }

    if (size != call->size())
    {
        SEMANTICS("Number of arguments '%d' in call doesn't match number "
                  "of parameters '%d' for function %s:\n%s\n%s",
                 call->size(),
                 size,
                 n,
                 oops(call).c_str(),
                 stringify_parameters().c_str());
    }

    for (unsigned int i = 0; i < size; ++i)
    {
        variable_info *v = dynamic_cast<variable_info *>((*p)[i]);
        variable_info *v2 = dynamic_cast<variable_info *>((*call)[i]);

        if ( (!v && v2) || (v && !v2))
        {
            // one variable, one non-variable -- ERROR
            SEMANTICS("Mismatch between array and simple variable for argument %d (counting from 0) in call to function %s", i, n);
        }

        if (v && v2)
        {
            // two variables -- check compatibility
            try
            {
                semantics::check_int_compatibility(v, v2);
            } catch (semantic_error &e)
            {
                SEMANTICS("Incompatible types for non-array argument %d in call to function %s", i, n);
            }

        } else
        {
            // know that neither is a simple variable
            array_info *a = dynamic_cast<array_info *>((*p)[i]);
            array_info *b = dynamic_cast<array_info *>((*call)[i]);

            // one array, one non-array -- ERROR
            if (!a || !b)
            {
                SEMANTICS("Bad parameter type at function parameter %d in call to function %s", i, n);
            }

            // two arrays -- check compatibility
            try
            {
                semantics::check_array_compatibility(a, b);
            } catch (semantic_error &e)
            {
                SEMANTICS("Incompatible types for array argument %d in call to function %s: %s vs %s", i, n, a->stringify_type().c_str(), b->stringify_type().c_str());
            }
        }

    }
}

void
function_info::compare_parameters(const param_vector &b)
{
    // Parameters match?
    const param_vector * const a = parameters();
    if (!a)
    {
        RUNTIME_ERROR("Compare parameters: no parameters in defn or proto for '%s'", name().c_str());
    }

    int a_size = a->size();
    int b_size = b.size();
    if (a_size != b_size)
    {
        SEMANTICS("Varying number of args for '%s': %d vs %d",
                  name().c_str(), a_size, b_size);
    }

    for( int i = 0; i < a_size; ++i)
    {
        // one type doesn't match the other
        if ( (*a)[i]->type() != b[i]->type())
        {
            SEMANTICS("Type mismatch for argument %d (counting from 0) for %s",
                      i, name().c_str());
        }

        // crap
        const array_info *a_array = dynamic_cast<const array_info *>((*a)[i]);
        const variable_info *a_var = dynamic_cast<const variable_info *>((*a)[i]);

        const array_info *b_array = dynamic_cast<const array_info *>(b[i]);
        const variable_info *b_var = dynamic_cast<const variable_info *>(b[i]);

        if ((a_var && b_var) || (a_array && b_array))
        {
            continue;
        }

        // everything else is errors.  Try and narrow them down by
        // testing various things.

        if (a_var && !b_var)
        {
                SEMANTICS("Non-array variable paired with something else at argument %d for %s", i, name().c_str());
        }

        if (a_array && !b_array)
        {
                SEMANTICS("Array variable paired with something else at argument %d for %s", i, name().c_str());
        }

        // ARGH!
        SEMANTICS("Massive ugliness in function %s at argument %d",
                  name().c_str(), i);

    }
    // all arguments match.  We're done.
}

/*!
    Compares every name to every other name in list of function params.
*/
void
function_info::test_param_name_uniqueness(void) const
{
    // if it's a void func, just bail
    if (has_prototype() && has_definition() && !proto_ && !defn_)
    {
        return;
    }

    if (has_definition() && !proto_ && !defn_)
    {
        return;
    }

    const param_vector *p = defn_;
    if (!p)
    {
        RUNTIME_ERROR("No parameters for '%s' in test_param_name_uniqueness",
                      name().c_str());
    }

    const int size = p->size();
    for(int i = 0; i < (size - 1); ++i)
    {
        for(int j = i+1; j < size; ++j)
        {
            if ((*p)[i]->name() == (*p)[j]->name())
            {
                SEMANTICS("Two parameters with identifier '%s' in function %s",
                          PNAME((*p)[i]), name().c_str());
            }
        }
    }
}

/*!
    'g' is the list of parameters found within an existing prototype of the
    function.  Compare these against the parameters found with the definition
    (if any).
*/

void
function_info::test_proto_vs_defn(const function_info * const g)
{
    const char * const n = name().c_str();

    if (!g)
    {
        RUNTIME_ERROR("test_proto_vs_defn: no prototype provided for '%s'", n);
    }

    if (is_extern_ || g->is_extern_)
    {
        SEMANTICS("Trying to define a function '%s' declared extern.", n);
    }

    // are both void?
    if ( (has_definition() && !defn_) && (g->has_prototype() && !g->proto_params()))
    {
        return;
    }

    if (!has_definition())
    {
        if (g->has_prototype())
        {
            SEMANTICS("Prototype has parameters whereas definition does "
                      "not for '%s'\n", n);
        }
    }
    
    if (!g->has_prototype())
    {
            SEMANTICS("Definition has parameters whereas prototype does "
                      "not for '%s'\n", n);
    }

    // both have parameters.  Compare 'em.
    compare_parameters(*(g->proto_params()));
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
operator <<(std::ostream &o, const param_vector &v)
{
    std::string s("(");
    const unsigned int size = v.size();
    for (unsigned int i = 0; i < size; ++i)
    {
        std::string t = v[i]->stringify_info();
        s += t;
        array_info *a = dynamic_cast<array_info *>(v[i]);
        if (a) s += "[]";
        if ((size - i) > 1) s += ", ";
    }
    s += ")";
    o << s;
    return o;
}


