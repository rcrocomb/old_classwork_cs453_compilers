#ifndef ARRAY_INFO_H
#define ARRAY_INFO_H

/*!
    Author: Robert Crocombe
    Class: CS453 Fall 04
    Professor: Dr. Debray
    Other People's Code: No

    Holds information about arrays.  Inherits some basic junk from field_info.
*/

#include "field_info.h"
#include <vector>

typedef std::vector<unsigned int> dimension_vector;

class array_info : public field_info
{

private:

    dimension_vector *dims_;
    std::vector<int> *data_;

public:

    array_info(const std::string &name,
               const type_enum &type,
               const int size = 0);

    array_info(const std::string &name,
               const type_enum &type,
               const dimension_vector &dims);

    array_info(const array_info &a);
    array_info & operator =(const array_info &a);

    ~array_info(void);


    const dimension_vector *dimensions(void) const { return dims_; }

    array_info *clone(void) const;

    int operator [](const int i) { return (*data_)[i]; }
    const std::vector<int> &data(void) const { return *data_; }
    void data(const std::vector<int> &d);
};

#endif  // ARRAY_INFO_H

