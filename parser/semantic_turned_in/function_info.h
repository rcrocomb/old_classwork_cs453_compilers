#ifndef FUNCTION_INFO_H
#define FUNCTION_INFO_H

/*!
    Author: Robert Crocombe
    Class: CS453 Fall 04
    Professor: Dr. Debray
    Other People's Code: No

    Holds information about functions and their parameters.  Inherits some basic functionality from field_info, and then adds a few function specific pieces of information.

    is_extern_  : was this function declared to have external linkage?
    prototype_  : does this function have a prototype yet?
    has_return_ : if this function is of non-void type, have we seen a
                  statement of the form "return expr;"?
*/

#include <iosfwd>
#include <vector>

#include "field_info.h"

typedef std::vector<field_info *> field_vector;

class function_info : public field_info
{

private:

    bool is_extern_;
    bool prototype_;
    bool has_return_;

    field_vector *parameters_;

public:

    // not everything can be set in the constructor
    function_info(const std::string &name,
                  const type_enum &return_type,
                  const bool is_extern = false,
                  const bool is_prototype = false):
        field_info(name, return_type),
        is_extern_(is_extern),
        prototype_(is_prototype),
        has_return_(false),
        parameters_(0)
    {
    }

    ~function_info(void)
    {
        delete parameters_;
    }

    bool is_extern(void) const { return is_extern_; }
    void is_extern(const bool e) { is_extern_ = e; }

    bool has_prototype(void) const { return prototype_; }
    void has_prototype(const bool hp) { prototype_ = hp; }

    bool has_return(void) const { return has_return_; }
    void has_return(const bool hr) { has_return_ = hr; }


    field_vector *parameters(void) const { return parameters_; }
    void parameters(field_vector * const params)
    {
        field_vector *t = new field_vector(*params);
        delete parameters_;
        parameters_ = t;
    }

    void test_proto_vs_defn(const function_info * const v);
    void test_param_name_uniqueness(const std::string &s) const;
    void test_param_name_uniqueness(void) const;
    function_info *clone(void) const { return new function_info(*this); }
    std::string stringify_parameters(void) const;

    void compare_params_with_call(const field_vector * const call) const;

    static std::string oops(const field_vector &v);
};

std::ostream &operator <<(std::ostream &o, const function_info &f);
std::ostream &operator <<(std::ostream &o, const field_vector &v);

// XXX: Uh, make this a member?
void compare_parameters(const std::string &name,
                        const field_vector &a,
                        const field_vector &b);

#endif  // FUNCTION_INFO_H

