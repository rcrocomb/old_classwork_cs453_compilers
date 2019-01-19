/*!
    Author: Robert Crocombe
    Class: CS453 Fall 04
    Professor: Dr. Debray
    Other People's Code: No
*/

#include "array_info.h"

array_info::array_info
(
    const std::string &name,
    const type_enum &type,
    const int size
):
    field_info(name, type),
    dims_(0),
    data_(0)
{
    dims_ = new dimension_vector(1);
    dims_->clear();
    dims_->push_back(size);
}


array_info::array_info
(
    const std::string &name,
    const type_enum &type,
    const dimension_vector &dims
):
    field_info(name, type),
    dims_(0),
    data_(0)
{
/*
    dims_ = new dimension_vector(dims);
    // not necessary yet, I guess

    if (dims.size() == 0)
    {
        // Can't have 0 dimensional array
    }

    unsigned int elements = 1;
    for (unsigned int i = 0; i < dims.size(); ++i)
    {
        elements *= dims[i];
    }

    data_ = new std::vector<int>(elements);
    data_->clear();
*/
}

array_info::array_info(const array_info &a):
    field_info(a),
    dims_(0),
    data_(0)
{
/*
    dimension_vector *d = new dimension_vector(*a.dims_);
    std::vector<int> *x = new std::vector<int>(*d.data_);

    delete dims_;
    dims_ = d;

    delete data_;
    data_ = x;
*/
}

array_info &
array_info::operator =(const array_info &a)
{
    if (this != &a)
    {
        field_info::operator =(a);
        /*
        other junk not necessary at this time.
        */
    }
    return *this;
};

array_info::~array_info(void)
{
    delete dims_;
    delete data_;
}

array_info *
array_info::clone(void) const
{
    return new array_info(*this);
}


void
array_info::data(const std::vector<int> &d)
{
    std::vector<int> *x = new std::vector<int>(d);
    delete data_;
    data_ = x;
}
