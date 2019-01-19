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

variable_info::variable_info
(
    const std::string &name,
    const type_enum &type,
    const int v
):
    field_info(name, type),
    value_(v)
{
    // nada
}

variable_info::variable_info(const variable_info &v):
    field_info(v),
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
        field_info::operator =(v);
        value_ = v.value_;
    }
    return *this;
}

////////////////////////////////////////////////////////////////////////////////
// Not in Class
////////////////////////////////////////////////////////////////////////////////


/*
// What is the deal with this damn thing?  I don't think operator <<
// can be polymorphic for a non-class variable, could it be some shit
// like that?
std::ostream &
operator <<(std::ostream &o, const variable_info &v)
{
    o << v.stringify_info() << " value == " << v.value() << "\n";
    return o;
}
*/


variable_info *
operator +(const field_info &a, const field_info &b)
{
    const variable_info *va = dynamic_cast<const variable_info *>(&a);
    const variable_info *vb = dynamic_cast<const variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '+'\n");
    }

    return new variable_info("addition result", INT_TYPE);
}

variable_info *
operator -(const field_info &a, const field_info &b)
{
    const variable_info *va = dynamic_cast<const variable_info *>(&a);
    const variable_info *vb = dynamic_cast<const variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '-'\n");
    }

    return new variable_info("subtraction result", INT_TYPE);
}

variable_info *
operator *(const field_info &a, const field_info &b)
{
    const variable_info *va = dynamic_cast<const variable_info *>(&a);
    const variable_info *vb = dynamic_cast<const variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '*'\n");
    }

    return new variable_info("multiplication result", INT_TYPE);
}

variable_info *
operator /(const field_info &a, const field_info &b)
{
    const variable_info *va = dynamic_cast<const variable_info *>(&a);
    const variable_info *vb = dynamic_cast<const variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '/'\n");
    }

    return new variable_info("division result", INT_TYPE);
}

variable_info *
operator <(const field_info &a, const field_info &b)
{
    const variable_info *va = dynamic_cast<const variable_info *>(&a);
    const variable_info *vb = dynamic_cast<const variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '<'\n");
    }

    return new variable_info("'<' result", BOOL_TYPE);
}

variable_info *
operator <=(const field_info &a, const field_info &b)
{
    const variable_info *va = dynamic_cast<const variable_info *>(&a);
    const variable_info *vb = dynamic_cast<const variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '<='\n");
    }

    return new variable_info("'<=' result", BOOL_TYPE);
}

variable_info *
operator >(const field_info &a, const field_info &b)
{
    const variable_info *va = dynamic_cast<const variable_info *>(&a);
    const variable_info *vb = dynamic_cast<const variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '>'\n");
    }

    return new variable_info("'>' result", BOOL_TYPE);
}

variable_info *
operator >=(const field_info &a, const field_info &b)
{
    const variable_info *va = dynamic_cast<const variable_info *>(&a);
    const variable_info *vb = dynamic_cast<const variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '>='\n");
    }

    return new variable_info("'>=' result", BOOL_TYPE);
}


variable_info *
operator ||(const field_info &a, const field_info &b)
{
    const variable_info *va = dynamic_cast<const variable_info *>(&a);
    const variable_info *vb = dynamic_cast<const variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '||'\n");
    }

    return new variable_info("'||' result", BOOL_TYPE);
}

variable_info *
operator &&(const field_info &a, const field_info &b)
{
    const variable_info *va = dynamic_cast<const variable_info *>(&a);
    const variable_info *vb = dynamic_cast<const variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '&&'\n");
    }

    return new variable_info("'&&' result", BOOL_TYPE);
}

variable_info *
operator ==(const field_info &a, const field_info &b)
{
    const variable_info *va = dynamic_cast<const variable_info *>(&a);
    const variable_info *vb = dynamic_cast<const variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '=='\n");
    }

    return new variable_info("'==' result", BOOL_TYPE);
}

variable_info *
operator !=(const field_info &a, const field_info &b)
{
    const variable_info *va = dynamic_cast<const variable_info *>(&a);
    const variable_info *vb = dynamic_cast<const variable_info *>(&b);
    if (!va || !vb)
    {
        throw std::runtime_error("Non variable in '!='\n");
    }

    return new variable_info("'!=' result", BOOL_TYPE);
}

