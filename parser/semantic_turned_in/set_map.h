#ifndef SET_MAP_H
#define SET_MAP_H

////////////////////////////////////////////////////////////////////////////////
// Author: Robert Crocombe
// Class: CS453 Fall 04
// Professor: Debray
// Other People's Code: Ya gotta be kiddin'.
//
// Holds bunches of sets.  Sets are maps from integer production tokens to
// vectors of tokens representing a set of tokens applicable to that
// production.  I use them for FIRST/FOLLOW set storage.  This lets me
// query on whether a token is in the first/follow set of a production
// with delectable ease.  Lookup should be pretty quick: std::map's
// implementation is geared toward this, and our sets are small, so
// scanning the vector should be very quick.
//
// Also, I have a static map that translates ASCII production names
// like "program_element" or "stmt" to some integer token values.
// This kind of lookup should be fast.  I also provide for the
// reverse, but it'll be a bunch slower.  I didn't feel like making a
// map for both directions, so it's gonna stay slow.  However, the
// reverse lookup is mostly used for debugging to make output more
// readable, so it's not a big deal.
//
////////////////////////////////////////////////////////////////////////////////

#include <string>
#include <iosfwd>

#include "parser_utils.h"

class set_map
{

private:

    set_productions *map_;

    // map strings of tokens to correct integer token values
    static production_map *ASCII_to_tokens_;

private:    // internal use routines

    void fill_set_map(const std::string &filename);

    int add_production(const std::string &production);
    void add_to_vector(const int production, const std::string &token);

public:     // interface

    set_map(const std::string &filename);
    ~set_map(void);

    bool contains(const int production, const int token) const;

    std::string get_vector(const int production) const;
    std::string get_vector(const std::string &production) const;

    static void fill_production_table(void);
    static const std::string &reverse_lookup(const int token);
    static int lookup(const std::string &name);
    friend std::ostream &operator <<(std::ostream &o, const set_map &m);
};

#endif  // SET_MAP_H

