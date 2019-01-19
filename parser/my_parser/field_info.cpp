/*!
    Author: Robert Crocombe
    Class: CS453 Fall 04
    Professor: Debray
    Other People's Code Used: No
*/

#include "field_info.h"
#include "parser_utils.h"

#include <ostream>

////////////////////////////////////////////////////////////////////////////////
// Constructors and destructor
////////////////////////////////////////////////////////////////////////////////

field_info::field_info
(
    const std::string &name,
    const type_enum &type,
    const int place,
    const bool global
):
    name_(name),
    type_(type),
    place_(place),
    global_(global)
{
    // nada
}

field_info::field_info(const field_info &f):
    name_(f.name_),
    type_(f.type_),
    place_(f.place_),
    global_(f.global_)
{
    // nada
}

field_info::~field_info(void)
{
    // nada
}

////////////////////////////////////////////////////////////////////////////////
// Operator
////////////////////////////////////////////////////////////////////////////////

field_info &
field_info::operator =(const field_info &f)
{
    if (this != &f)
    {
        name_ = f.name_;
        type_ = f.type_;
        place_ = f.place_;
        global_ = f.global_;
    }
    return *this;
}

////////////////////////////////////////////////////////////////////////////////
// Interface
////////////////////////////////////////////////////////////////////////////////

std::string
field_info::stringify_type(void) const
{
    std::string type;
    switch(type_)
    {
        case INT_TYPE:   type = "int"; break;
        case CHAR_TYPE:  type = "char"; break;
        case BOOL_TYPE:  type = "bool"; break;
        case VOID_TYPE:  type = "void"; break;
        case LABEL_TYPE:  type = "label"; break;
        case ERROR_TYPE: type = "ERROR TYPE"; break;
        default: type = "Unknown Type! "; type += type_; break;
    }
    return type;
}

std::string
field_info::stringify_info(void) const
{
    std::string s(stringify_type()  + " " + name());
    return s;
}

int
field_info::size(void) const
{
    switch(type())
    {
    case INT_TYPE:   return 4;
    case CHAR_TYPE:  return 1;
    case BOOL_TYPE:  return 1;
    default: RUNTIME_ERROR("Unknown type getting variable size");
    }
}

////////////////////////////////////////////////////////////////////////////////
// Not in class
////////////////////////////////////////////////////////////////////////////////

std::ostream &operator <<(std::ostream &o, const field_info &f)
{
    o << f.stringify_info();
    return o;
}

