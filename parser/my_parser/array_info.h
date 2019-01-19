#ifndef ARRAY_INFO_H
#define ARRAY_INFO_H

/*!
    Author: Robert Crocombe
    Class: CS453 Fall 04
    Professor: Dr. Debray
    Other People's Code: No
    
    Holds information about arrays.  Inherits some basic junk from data_info.
*/

#include "data_info.h"
#include <vector>
#include <iosfwd>

typedef std::vector<unsigned int> dimension_vector;
typedef std::vector<int> data_vector;

class array_info : public data_info
{

private:

    int size_;
    data_vector *data_;

public:

    array_info(const std::string &name,
               const type_enum &type,
               const int size = 0);

    array_info(const array_info &a);
    array_info & operator =(const array_info &a);

    ~array_info(void);

    array_info *clone(void) const;

    int operator [](const int i) { return (*data_)[i]; }
    const std::vector<int> *data(void) const { return data_; }
    void data(const char * const c);
    void data(const int * const c);

    std::string stringify_data(void) const;

    int size(void) const { return size_; }

};

std::ostream &operator <<(std::ostream &o, const array_info &a);

#endif  // ARRAY_INFO_H

