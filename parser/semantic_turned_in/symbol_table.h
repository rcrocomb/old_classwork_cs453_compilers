#ifndef SYMBOL_TABLE_H
#define SYMBOL_TABLE_H

/*!
    Author: Robert Crocombe
    Class: CS453 Fall 04
    Professor: Dr. Debray
    Other People's Code: No
*/

#include <string>
#include <map>
#include <vector>

#include "parser_utils.h"

// one static map with size of each element type
//
// key is type
// unsigned int is size of that type in bytes
//std::map<type_enum, unsigned int>;

class symbol_table;
typedef std::vector<symbol_table *> table_vector;

class variable_info;
class array_info;
class function_info;

typedef std::map<std::string, variable_info *>variable_map;
typedef std::map<std::string, array_info *>array_map;
typedef std::map<std::string, function_info *>function_map;

class symbol_table
{

private:

    variable_map *variables_;
    array_map *arrays_;
    function_map *functions_;

private:    // internal use

private:    // not to be used

    symbol_table(const symbol_table &t);
    symbol_table &operator =(const symbol_table &t);

public:     // interface

    symbol_table(void);
    ~symbol_table(void);


    bool exists(const std::string &name) const;

    bool is_a_variable(const std::string &name) const;
    bool is_an_array(const std::string &name) const;
    bool is_a_function(const std::string &name) const;

/*
    template<typename T>void value(const std::string &name, const T data);
    // XXX: ack!
    void value(const std::string &name, int * const data);
    void value(const std::string &name, char * const data);
*/

    // avoids need for dynamic cast.  But kinda stoopid.
    variable_info *variable_lookup(const std::string &name);
    array_info *array_lookup(const std::string &name);
    function_info *function_lookup(const std::string &name);

    void insert(variable_info * const v);
    void insert(array_info * const a);
    void insert(function_info * const f);
};

#endif  // SYMBOL_TABLE_H

