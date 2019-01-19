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

#include <iosfwd>
#include <string>

enum type_enum
{
    INT_TYPE,
    CHAR_TYPE,
    BOOL_TYPE,
    VOID_TYPE,
    ERROR_TYPE, // maximally compatible
    LABEL_TYPE  // maximally incompatible
};

class field_info
{

private:

    std::string name_;
    type_enum type_;
    int place_;
    bool global_;

public:

    field_info(const std::string &name,
               const type_enum &type,
               const int place = -100000,
               const bool global = false);
    field_info(const field_info &f);
    field_info &operator =(const field_info &f);

    virtual ~field_info(void);
    virtual field_info *clone(void) const = 0;

    const std::string &name(void) const { return name_; }
    void name(const std::string &n) { name_ = n; }

    type_enum type(void) const { return type_; }
    void type(const type_enum &t) { type_ = t; }

    int place(void) const { return place_; }
    void place(const int p) { place_ = p; }

    int global(void) const { return global_; }
    void global(const int g) { global_ = g; }

    std::string stringify_type(void) const;
    std::string stringify_info(void) const;

    virtual int size(void) const;
};


std::ostream &operator <<(std::ostream &o, const field_info &f);

#endif  // FIELD_INFO_H

