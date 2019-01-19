#ifndef DATA_INFO_H
#define DATA_INFO_H

/*!
 *  Author: Robert Crocombe
 *  Class: CS453 Fall 04
 *  Professor: Debray
 *  Other People's Code Used: No
 */

#include "field_info.h"
#include <iosfwd>

class data_info : public field_info
{

private:

    bool local_;
    bool is_const_;

public:

    data_info(const std::string &name,
               const type_enum &type);
    data_info(const data_info &d);
    ~data_info(void);
    data_info &operator =(const data_info &d);

    bool is_const(void) const { return is_const_; }
    void is_const(const bool is_a_const) { is_const_ = is_a_const; }

    bool local(void) const { return local_; }
    void local(const bool l);

    data_info * clone(void) const { return new data_info(*this); }
};

std::ostream &operator <<(std::ostream &o, const data_info &d);

#endif  // DATA_INFO_H

