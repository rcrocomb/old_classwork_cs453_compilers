#ifndef VARIABLE_INFO_H
#define VARIABLE_INFO_H

/*!
    Author: Robert Crocombe
    Class: CS453 Fall 04
    Professor: Dr. Debray
    Other People's Code: No
*/

#include "field_info.h"
#include <iosfwd>

class variable_info : public field_info
{

private:

    int value_;

public:

    variable_info(const std::string &name,
                  const type_enum &type,
                  const int v = 0);
    variable_info(const variable_info &v);
    ~variable_info(void);

    int value(void) const { return value_; }
    void value(const int &v) { value_ = v; }

    variable_info *clone(void) const;

    variable_info &operator =(const variable_info &v);
};

//std::ostream &operator <<(std::ostream &o, const variable_info &v);
variable_info *operator +(const field_info &a, const field_info &b);
variable_info *operator -(const field_info &a, const field_info &b);
variable_info *operator *(const field_info &a, const field_info &b);
variable_info *operator /(const field_info &a, const field_info &b);
variable_info *operator <(const field_info &a, const field_info &b);
variable_info *operator <=(const field_info &a, const field_info &b);
variable_info *operator >(const field_info &a, const field_info &b);
variable_info *operator >=(const field_info &a, const field_info &b);
variable_info *operator ||(const field_info &a, const field_info &b);
variable_info *operator &&(const field_info &a, const field_info &b);
variable_info *operator ==(const field_info &a, const field_info &b);
variable_info *operator !=(const field_info &a, const field_info &b);


#endif  // VARIABLE_INFO_H

