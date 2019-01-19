/*!
 *  Author: Robert Crocombe
 *  Class: CS453 Fall 04
 *  Professor: Debray
 *  Other People's Code Used: No
 */

#include "data_info.h"
#include <ostream>

data_info::data_info
(
    const std::string &name,
    const type_enum &type
):
    field_info(name, type),
    local_(false),
    is_const_(false)
{
    // nada
}

data_info::data_info(const data_info &d):
    field_info(d),
    local_(d.local_),
    is_const_(d.is_const_)
{
    // nada
}

data_info::~data_info(void)
{
    // nada
}

data_info &
data_info::operator =(const data_info &d)
{
    if (this != &d)
    {
        field_info::operator =(d);
        local_ = d.local_;
        is_const_ = d.is_const_;
    }
    return *this;
}

void
data_info::local(const bool l)
{
    local_ = l;
}

////////////////////////////////////////////////////////////////////////////////
// Not in class
////////////////////////////////////////////////////////////////////////////////

std::ostream &
operator <<(std::ostream &o, const data_info &d)
{
    o << "data | name '" << d.name() << "' | "
      << (d.is_const() ? "const" : "not const") << " | "
      << (d.local() ? "local" : d.global() ? "global" : "param") << " |"
      << " place == " << d.place()
      << "\n";

    return o;
}

