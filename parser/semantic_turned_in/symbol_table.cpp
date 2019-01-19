/*!
    Author: Robert Crocombe
    Class: CS453 Fall 04
    Professor: Dr. Debray
    Other People's Code: No
*/

#include "symbol_table.h"

#include "variable_info.h"
#include "array_info.h"
#include "function_info.h"

////////////////////////////////////////////////////////////////////////////////
// Constructors and destructor
////////////////////////////////////////////////////////////////////////////////

symbol_table::symbol_table(void):
    variables_(0),
    arrays_(0),
    functions_(0)
{
    variables_ = new variable_map();
    arrays_ = new array_map();
    functions_ = new function_map();
}

symbol_table::~symbol_table(void)
{
    variable_map::iterator v_i = variables_->begin();
    const variable_map::iterator v_e = variables_->begin();
    for( ; v_i != v_e; ++v_i)
    {
        delete v_i->second;
    }

    array_map::iterator a_i = arrays_->begin();
    const array_map::iterator a_e = arrays_->begin();
    for( ; a_i != a_e; ++a_i)
    {
        delete a_i->second;
    }

    function_map::iterator f_i = functions_->begin();
    const function_map::iterator f_e = functions_->begin();
    for( ; f_i != f_e; ++f_i)
    {
        delete f_i->second;
    }

    delete variables_;
    delete arrays_;
    delete functions_;
}

////////////////////////////////////////////////////////////////////////////////
// Internal routines
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Interface
////////////////////////////////////////////////////////////////////////////////

bool
symbol_table::exists(const std::string &name) const
{
    return    (variables_->count(name) != 0)
           || (arrays_->count(name) != 0)
           || (functions_->count(name) != 0);
}

bool
symbol_table::is_a_variable(const std::string &name) const
{
    return variables_->count(name) != 0;
}

bool
symbol_table::is_an_array(const std::string &name) const
{
    return arrays_->count(name) != 0;
}

bool
symbol_table::is_a_function(const std::string &name) const
{
    return functions_->count(name) != 0;
}



/*!
    Should get a type conflict if I screw this up?
*/
/*
template
<typename T>
void
symbol_table::value(const std::string &name, const T data)
{
    if (!is_a_variable(name))
    {
        throw std::runtime_error(smoosh("Not a variable: '%s'\n",name.c_str()));
    }

    variables_->operator[](name) = data;
}

void
symbol_table::value(const std::string &name, int * const data)
{
    if (!is_a_variable(name))
    {
        throw std::runtime_error(smoosh("Not a variable: '%s'\n",name.c_str()));
    }

    *data = (*variables_)[name]->value();
}

void
symbol_table::value(const std::string &name, char * const data)
{
    if (!is_a_variable(name))
    {
        throw std::runtime_error(smoosh("Not a variable: '%s'\n",name.c_str()));
    }

    *data = (*variables_)[name]->value();
}
*/

variable_info *
symbol_table::variable_lookup(const std::string &name)
{
    variable_map::iterator f = variables_->find(name);
    if (f == variables_->end())
    {
        return 0;
    }

    return f->second;
}

array_info *
symbol_table::array_lookup(const std::string &name)
{
    array_map::iterator f = arrays_->find(name);
    if (f == arrays_->end())
    {
        return 0;
    }

    return f->second;
}

function_info *
symbol_table::function_lookup(const std::string &name)
{
    function_map::iterator f = functions_->find(name);
    if (f == functions_->end())
    {
        return 0;
    }

    return f->second;
}

void
symbol_table::insert(variable_info * const v)
{
    variables_->insert(std::make_pair(v->name(), v));
}

void
symbol_table::insert(array_info * const a)
{
    arrays_->insert(std::make_pair(a->name(), a));
}

void
symbol_table::insert(function_info * const f)
{
    functions_->insert(std::make_pair(f->name(), f));
}

