/*!
    Author: Robert Crocombe
    Class: CS453 Fall 04
    Professor: Dr. Debray
    Other People's Code: No
*/

#include "array_info.h"
#include "parser_utils.h"

#include <ostream>

////////////////////////////////////////////////////////////////////////////////
// Constructors and destructor
////////////////////////////////////////////////////////////////////////////////

array_info::array_info
(
    const std::string &name,
    const type_enum &type,
    const int size
):
    data_info(name, type),
    size_(size),
    data_(0)
{
    // leave array pointer NULL for now.
}

array_info::array_info(const array_info &a):
    data_info(a),
    size_(a.size_),
    data_(0)
{
    if (a.data_)
    {
        data_ = new data_vector(*a.data_);
    }
}

array_info::~array_info(void)
{
    delete data_;
}

////////////////////////////////////////////////////////////////////////////////
// Operators
////////////////////////////////////////////////////////////////////////////////

array_info &
array_info::operator =(const array_info &a)
{
    if (this != &a)
    {
        data_info::operator =(a);

        if (a.data_)
        {
            data_vector *x = new data_vector(*a.data_);
            delete data_;
            data_ = x;
        }

        size_ = a.size_;
    }
    return *this;
};

////////////////////////////////////////////////////////////////////////////////
// Interface
////////////////////////////////////////////////////////////////////////////////

array_info *
array_info::clone(void) const
{
    return new array_info(*this);
}

/*!
    'd' *must* be of size 'size_'
*/

void
array_info::data(const char * const d)
{
    int i = 0;

    if (!data_)
    {
        data_ = new data_vector(size_);
        data_->clear();
    }

    for ( ; i < size_; ++i)
    {
        data_->push_back(d[i]);
    }

    if (d[i])
    {
        RUNTIME_ERROR("String not of specified size '%d' in array '%s'",
                      size_, name().c_str());
    }
}

std::string
array_info::stringify_data(void) const
{
    if (type() != CHAR_TYPE)
    {
        RUNTIME_ERROR("trying to stringify non-char data in array '%s'\n",
                      name().c_str());
    }

    std::string c;
    for (unsigned int i = 0; i < data_->size(); ++i)
    {
        c += static_cast<char>((*data_)[i]);
    }
    return c;
}

void
array_info::data(const int * const d)
{
    if (!data_)
    {
        data_ = new data_vector(size_);
        data_->clear();
    }

    for (int i = 0; i < size_; ++i)
    {
        data_->push_back(d[i]);
    }
}

std::ostream &
operator <<(std::ostream &o, const array_info &a)
{
    o << "array | name '" << a.name() << "' | "
      << (a.is_const() ? "const" : "not const") << " | "
      << (a.local() ? "yes, local" : a.global() ? "global" : "param") << " |"
      << " place == " << a.place() << "\n";
    if ( (a.type() == CHAR_TYPE) && a.data())
    {
        o << "Array string : " << a.stringify_data();
    }
    return o;
}

