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

class symbol_table;
typedef std::vector<symbol_table *> table_vector;

class field_info;
class variable_info;
class array_info;
class function_info;
class label_info;

typedef std::map<std::string, variable_info *>variable_map;
typedef std::map<std::string, array_info *>array_map;
typedef std::map<std::string, function_info *>function_map;
typedef std::map<std::string, label_info *>label_map;

class symbol_table
{

private:

    variable_map *variables_;
    array_map *arrays_;
    function_map *functions_;
    label_map *labels_;

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
    bool is_a_label(const std::string &name) const;

    // avoids need for dynamic cast.  But kinda stoopid.
    variable_info *variable_lookup(const std::string &name);
    array_info *array_lookup(const std::string &name);
    function_info *function_lookup(const std::string &name);
    label_info *label_lookup(const std::string &name);

    void insert(field_info * const v);
    void insert(variable_info * const v);
    void insert(array_info * const a);
    void insert(function_info * const f);
    void insert(label_info * const l);
};

#endif  // SYMBOL_TABLE_H

