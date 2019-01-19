/*!
    Author: Robert Crocombe
    Class: CS453 Fall 04
    Professor: Dr. Debray
    Other People's Code: No

    Values (returned by operators) can be whatever I want, as long as
    types are right.  Names help to track down problems.
*/

#include "variable_info.h"
#include <stdexcept>
#include <ostream>

#include "parser_utils.h"
using parser_utils::variable_name;

#include "three_code.h"

variable_info::variable_info
(
    const std::string &name,
    const type_enum &type,
    const int value,
    const bool is_global
):
    data_info(name, type),
    value_(value)
{
    if (is_global) global(true);
    // nada
}

variable_info::variable_info(const variable_info &v):
    data_info(v),
    value_(v.value_)
{
    // nada
}

variable_info::~variable_info(void)
{
    // nada
}

variable_info *
variable_info::clone(void) const
{
    return new variable_info(*this);
}

variable_info &
variable_info::operator =(const variable_info &v)
{
    if (this != &v)
    {
        data_info::operator =(v);
        value_ = v.value_;
    }
    return *this;
}

////////////////////////////////////////////////////////////////////////////////
// Not in Class Operators
////////////////////////////////////////////////////////////////////////////////

three_code *
operator +( data_info &a,  data_info &b)
{
    variable_info *va = dynamic_cast< variable_info *>(&a);
    variable_info *vb = dynamic_cast< variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '+'\n");
    }

    variable_info *d = new variable_info(variable_name("add_result"), INT_TYPE);
    return new three_code(OP_ADD, va, vb, d);
}

three_code *
operator -( data_info &a,  data_info &b)
{
     variable_info *va = dynamic_cast< variable_info *>(&a);
     variable_info *vb = dynamic_cast< variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '-'\n");
    }

    variable_info *d = new variable_info(variable_name("sub_result"), INT_TYPE);
    return new three_code(OP_SUB, va, vb, d);
}

three_code *
operator *( data_info &a,  data_info &b)
{
     variable_info *va = dynamic_cast< variable_info *>(&a);
     variable_info *vb = dynamic_cast< variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '*'\n");
    }

    variable_info *d = new variable_info(variable_name("mult_result"),INT_TYPE);
    return new three_code(OP_MULT, va, vb, d);
}

three_code *
operator /( data_info &a,  data_info &b)
{
     variable_info *va = dynamic_cast< variable_info *>(&a);
     variable_info *vb = dynamic_cast< variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '/'\n");
    }

    variable_info *d = new variable_info(variable_name("div_result"), INT_TYPE);
    return new three_code(OP_DIV, va, vb, d);
}

three_code *
operator <( data_info &a,  data_info &b)
{
     variable_info *va = dynamic_cast< variable_info *>(&a);
     variable_info *vb = dynamic_cast< variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '<'\n");
    }

    variable_info *d = new variable_info(variable_name("lt_result"), BOOL_TYPE);
    return new three_code(OP_LT, va, vb, d);
}

three_code *
operator <=( data_info &a,  data_info &b)
{
     variable_info *va = dynamic_cast< variable_info *>(&a);
     variable_info *vb = dynamic_cast< variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '<='\n");
    }

    variable_info *d = new variable_info(variable_name("lte_result"), BOOL_TYPE);
    return new three_code(OP_LTE, va, vb, d);
}

three_code *
operator >( data_info &a,  data_info &b)
{
     variable_info *va = dynamic_cast< variable_info *>(&a);
     variable_info *vb = dynamic_cast< variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '>'\n");
    }

    variable_info *d = new variable_info(variable_name("gt_result"), BOOL_TYPE);
    return new three_code(OP_GT, va, vb, d);
}

three_code *
operator >=( data_info &a,  data_info &b)
{
     variable_info *va = dynamic_cast< variable_info *>(&a);
     variable_info *vb = dynamic_cast< variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '>='\n");
    }

    variable_info *d = new variable_info(variable_name("gte_result"), BOOL_TYPE);
    return new three_code(OP_GTE, va, vb, d);
}


three_code *
operator ||( data_info &a,  data_info &b)
{
     variable_info *va = dynamic_cast< variable_info *>(&a);
     variable_info *vb = dynamic_cast< variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '||'\n");
    }

    variable_info *d = new variable_info(variable_name("or_result"), BOOL_TYPE);
    return new three_code(OP_OR, va, vb, d);
}

three_code *
operator &&( data_info &a,  data_info &b)
{
     variable_info *va = dynamic_cast< variable_info *>(&a);
     variable_info *vb = dynamic_cast< variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '&&'\n");
    }

    variable_info *d = new variable_info(variable_name("and_result"), BOOL_TYPE);
    return new three_code(OP_AND, va, vb, d);
}

three_code *
operator ==( data_info &a,  data_info &b)
{
     variable_info *va = dynamic_cast< variable_info *>(&a);
     variable_info *vb = dynamic_cast< variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '=='\n");
    }

    variable_info *d = new variable_info(variable_name("eq_result"), BOOL_TYPE);
    return new three_code(OP_EQ, va, vb, d);
}

three_code *
operator !=( data_info &a,  data_info &b)
{
     variable_info *va = dynamic_cast< variable_info *>(&a);
     variable_info *vb = dynamic_cast< variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '!='\n");
    }

    variable_info *d = new variable_info(variable_name("ne_result"), BOOL_TYPE);
    return new three_code(OP_NE, va, vb, d);
}


////////////////////////////////////////////////////////////////////////////////
// Not in Class
////////////////////////////////////////////////////////////////////////////////

std::ostream &
operator <<(std::ostream &o, const variable_info &v)
{
    o << "variable | name '" << v.name() << "' | "
      << (v.is_const() ? "const" : "not const") << " | "
      << (v.local() ? "yes, local" : v.global() ? "global" : "param") << " |"
      << " place == " << v.place() 
      << "\n";
    return o;
}
