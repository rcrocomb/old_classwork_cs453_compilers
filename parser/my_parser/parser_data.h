#ifndef PARSER_DATA_H
#define PARSER_DATA_H

////////////////////////////////////////////////////////////////////////////////
// Author: Robert Crocombe
// Class: CS453 Fall 04
// Professor: Debray
// Other People's Code: No thanks
//
// Holds all the stuff I need now/for the future in one handy place.
////////////////////////////////////////////////////////////////////////////////

#include <iosfwd>
#include <vector>

// Forward declarations
class set_map;
class symbol_table;

class parser_data
{

private:        // data

    set_map *first_;
    set_map *follow_;

public:         // interface

    parser_data(void);
    ~parser_data(void);
    bool in_first(const int production, const int token) const;
    bool in_follow(const int production, const int token) const;

    const set_map *get_first(void) const { return first_; }
    const set_map *get_follow(void) const { return follow_; }

    friend std::ostream &operator <<(std::ostream &o, const parser_data &p);
};

#endif  // PARSER_DATA_H

