#ifndef FIELD_INFO_H
#define FIELD_INFO_H

/*!
    Author: Robert Crocombe
    Class: CS453 Fall 04
    Professor: Dr. Debray
    Other People's Code: No

    Holds basic information (type and name) about a variable or
    "field" of data.  I call it a "field" because it includes
    functions, too: not just arrays and other variables.  Anyway, I
    really screwed it up, so there're dynamic casts *everywhere*.
*/

#include <ostream>
#include <string>

enum type_enum
{
    INT_TYPE,
    CHAR_TYPE,
    BOOL_TYPE,
    VOID_TYPE,
    ERROR_TYPE
};

class field_info
{

private:

    std::string name_;
    type_enum type_;

public:

    field_info(const std::string &name, const type_enum &type):
        name_(name),
        type_(type)
    {

    }

    virtual ~field_info(void) {}
    virtual field_info *clone(void) const = 0;

    const std::string &name(void) const { return name_; }
    void name(const std::string &n) { name_ = n; }

    type_enum type(void) const { return type_; }
    void type(const type_enum &t) { type_ = t; }

    std::string stringify_type(void) const
    {
        std::string type;
        switch(type_)
        {
        case INT_TYPE:   type = "int"; break;
        case CHAR_TYPE:  type = "char"; break;
        case BOOL_TYPE:  type = "bool"; break;
        case VOID_TYPE:  type = "void"; break;
        case ERROR_TYPE: type = "ERROR TYPE"; break;
        default: type = "Unknown Type! "; type += type_; break;
        }
        return type;
    }

    std::string stringify_info(void) const
    {
        std::string s(stringify_type()  + " " + name());
        return s;
    }
};

/*
    // Why does this cause *so* many errors in the linker?
std::ostream &operator <<(std::ostream &o, const field_info &f)
{
    o << f.stringify_info();
    return o;
}
*/


#endif  // FIELD_INFO_H

