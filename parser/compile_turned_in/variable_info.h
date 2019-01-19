#ifndef VARIABLE_INFO_H
#define VARIABLE_INFO_H

/*!
    Author: Robert Crocombe
    Class: CS453 Fall 04
    Professor: Dr. Debray
    Other People's Code: No
*/

#include "data_info.h"
#include <iosfwd>

class three_code;

class variable_info : public data_info
{

private:

    int value_;

public:

    variable_info(const std::string &name,
                  const type_enum &type,
                  const int value = 0,
                  const bool is_global = false);
    variable_info(const variable_info &v);
    ~variable_info(void);

    int value(void) const { return value_; }
    void value(const int &v) { value_ = v; }

    variable_info *clone(void) const;

    variable_info &operator =(const variable_info &v);
};

std::ostream &operator <<(std::ostream &o, const variable_info &v);

three_code *operator +( data_info &a,  data_info &b);
three_code *operator -( data_info &a,  data_info &b);
three_code *operator *( data_info &a,  data_info &b);
three_code *operator /( data_info &a,  data_info &b);
three_code *operator <( data_info &a,  data_info &b);
three_code *operator <=( data_info &a,  data_info &b);
three_code *operator >( data_info &a,  data_info &b);
three_code *operator >=( data_info &a,  data_info &b);
three_code *operator ||( data_info &a,  data_info &b);
three_code *operator &&( data_info &a,  data_info &b);
three_code *operator ==( data_info &a,  data_info &b);
three_code *operator !=( data_info &a,  data_info &b);

#endif  // VARIABLE_INFO_H

