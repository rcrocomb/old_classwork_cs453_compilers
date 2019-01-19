#ifndef FUNCTION_INFO_H
#define FUNCTION_INFO_H

/*!
    Author: Robert Crocombe
    Class: CS453 Fall 04
    Professor: Dr. Debray
    Other People's Code: No

    Holds information about functions and their parameters.  Inherits
    some basic functionality from field_info, and then adds a few
    function specific pieces of information.

    is_extern_  : was this function declared to have external linkage?
    has_return_ : if this function is of non-void type, have we seen a
                  statement of the form "return expr;"? 
*/

#include <iosfwd>
#include <vector>

#include "field_info.h"

class data_info;
typedef std::vector<data_info *> param_vector;

class function_info : public field_info
{

private:

    bool is_extern_;
    bool has_return_;
    bool found_prototype_;
    bool found_definition_;

    const param_vector *proto_;
    const param_vector *defn_;
    param_vector *locals_;

private:

    std::string oops(const param_vector * const v) const;

public:

    // not everything can be set in the constructor
    function_info(const std::string &name,
                  const type_enum &return_type,
                  const bool is_extern = false);

    function_info(const function_info &f);

    ~function_info(void);

    function_info &operator =(const function_info &f);

    bool is_extern(void) const { return is_extern_; }
    void is_extern(const bool e) { is_extern_ = e; }

    // because proto_ == 0 could be a function that takes no arguments 
    bool has_prototype(void) const { return found_prototype_; }
    void has_prototype(const bool proto) { found_prototype_ = proto; }

    bool has_definition(void) const { return found_definition_; }
    void has_definition(const bool defn) { found_definition_ = defn; }

    bool has_return(void) const { return has_return_; }
    void has_return(const bool hr) { has_return_ = hr; }


    void proto_params(const param_vector * const params);
    void defn_params(const param_vector * const params);

    const param_vector *proto_params(void) const;
    const param_vector *defn_params(void) const;
    const param_vector *parameters(void) const;

    void push_local(data_info * const d);

    const data_info *pop_local(void)
    {
        if (locals_->empty()) return 0;
        const data_info *d = locals_->back();
        locals_->pop_back();
        return d;
    }
    const int size_locals(void) const { return locals_->size(); }
    param_vector *locals(void) { return locals_; }


    function_info *clone(void) const { return new function_info(*this); }

    std::string stringify_parameters(void) const;
    void compare_params_with_call(const param_vector * const call) const;
    void compare_parameters(const param_vector &b);
    void test_param_name_uniqueness(void) const;
    void test_proto_vs_defn(const function_info * const v);
};

std::ostream &operator <<(std::ostream &o, const function_info &f);
std::ostream &operator <<(std::ostream &o, const param_vector &v);

#endif  // FUNCTION_INFO_H

