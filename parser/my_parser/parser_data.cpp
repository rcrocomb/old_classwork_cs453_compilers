////////////////////////////////////////////////////////////////////////////////
// Author: Robert Crocombe
// Class: CS453 Fall 04
// Professor: Debray
// Other People's Code: No thanks
//
// See header.
////////////////////////////////////////////////////////////////////////////////

#include "parser_data.h"
#include "set_map.h"

#include <ostream>

parser_data::parser_data(void):
    first_(0),
    follow_(0)
{
    set_map::fill_production_table();
    first_ = new set_map("first_set");
    follow_ = new set_map("follow_set");
}

parser_data::~parser_data(void)
{
    delete first_;
    delete follow_;
}

bool
parser_data::in_first(const int production, const int token) const
{
    return first_->contains(production, token);
}

bool
parser_data::in_follow(const int production, const int token) const
{
    return follow_->contains(production, token);
}


////////////////////////////////////////////////////////////////////////////////
// Not in class.
////////////////////////////////////////////////////////////////////////////////

/*!
    Handy for checking out how well grammar was read in.
*/

std::ostream &
operator <<(std::ostream &o, const parser_data &p)
{
    o << "FIRST\n";
    o << *p.first_;
    o << "\nFOLLOW\n";
    o << *p.follow_;
    return o;
}

