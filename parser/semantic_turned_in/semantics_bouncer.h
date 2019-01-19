#ifndef SEMANTICS_BOUNCER_H
#define SEMANTICS_BOUNCER_H

/*!
    Author: Robert Crocombe
    Class: CS453 Fall 04
    Professor: Dr. Debray
    Other People's Code: No

    Only type-checking stuff.
*/

#include <stdexcept>

// behave or the semantics bouncer will toss your stupid ass out!

class variable_info;
class array_info;
class function_info;
class field_info;

namespace semantics
{
    // ERROR_TYPE is maximally compatible.


    // this is okay for arthmetic stuff: it will fail for BOOL_TYPE
    // and BOOL_TYPE inside if-statements and so on.
    void check_variable_compatibility(const variable_info * const a,
                                      const variable_info * const b);

    void check_array_compatibility(const array_info * const a,
                                   const array_info * const b);

    void check_assignment_compatibility(const field_info * const a);

    void check_int_compatibility(const field_info * const a,
                                 const field_info * const b);

    void check_bool_compatibility(const field_info * const a,
                                  const field_info * const b);


    void check_int_compatibility(const field_info * const a);
    void check_bool_compatibility(const field_info * const a);

    void check_func_in_a_statement_compatibility(const field_info * const a);

    void check_void_compatibility(const function_info * const a);
}

#endif  // SEMANTICS_BOUNCER_H

