/*!
    Author: Robert Crocombe
    Class: CS453 Fall 04
    Professor: Dr. Debray
    Other People's Code: No
*/

#include "symbol_table.h"

#include "field_info.h"
#include "variable_info.h"
#include "array_info.h"
#include "function_info.h"
#include "label_info.h"

////////////////////////////////////////////////////////////////////////////////
// Constructors and destructor
////////////////////////////////////////////////////////////////////////////////

symbol_table::symbol_table(void):
    variables_(0),
    arrays_(0),
    functions_(0),
    labels_(0)
{
    variables_ = new variable_map();
    arrays_ = new array_map();
    functions_ = new function_map();
    labels_ = new label_map();
}

symbol_table::~symbol_table(void)
{
    variable_map::iterator v_i = variables_->begin();
    const variable_map::iterator v_e = variables_->end();
    for( ; v_i != v_e; ++v_i)
    {
        delete v_i->second;
    }

    array_map::iterator a_i = arrays_->begin();
    const array_map::iterator a_e = arrays_->end();
    for( ; a_i != a_e; ++a_i)
    {
        delete a_i->second;
    }

    function_map::iterator f_i = functions_->begin();
    const function_map::iterator f_e = functions_->end();
    for( ; f_i != f_e; ++f_i)
    {
        delete f_i->second;
    }

    label_map::iterator l_i = labels_->begin();
    const label_map::iterator l_e = labels_->end();
    for( ; l_i != l_e; ++l_i)
    {
        delete l_i->second;
    }

    delete variables_;
    delete arrays_;
    delete functions_;
    delete labels_;
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

bool
symbol_table::is_a_label(const std::string &name) const
{
    return labels_->count(name) != 0;
}


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

label_info *
symbol_table::label_lookup(const std::string &name)
{
    label_map::iterator l = labels_->find(name);
    if (l == labels_->end())
    {
        return 0;
    }

    return l->second;
}

void
symbol_table::insert(field_info * const f)
{
    if (!f)
    {
        PNAME(f);
        RUNTIME_ERROR("symbol_table::insert -- NULL pointer while inserting");
    }
    variable_info *v = dynamic_cast<variable_info *>(f);
    if (v)
    {
        variables_->insert(std::make_pair(v->name(), v));
        return;
    }


    array_info *a = dynamic_cast<array_info *>(f);
    if (a)
    {
        arrays_->insert(std::make_pair(a->name(), a));
        return;
    }

    function_info *x = dynamic_cast<function_info *>(f);
    if (x)
    {
        functions_->insert(std::make_pair(x->name(), x));
        return;
    }

    label_info *l = dynamic_cast<label_info *>(f);
    if (l)
    {
        labels_->insert(std::make_pair(l->name(), l));
        return;
    }
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

void
symbol_table::insert(label_info * const l)
{
    labels_->insert(std::make_pair(l->name(), l));
}

