#ifndef THREE_CODE_H
#define THREE_CODE_H

/*!
 *  Author: Robert Crocombe
 *  Class: CS453 Fall 04
 *  Professor: Debray
 *  Other People's Code Used: No
 */

#include <map>
#include <string>
#include <iosfwd>

enum operation
{
    OP_OR,                      // z = x || y
    OP_AND,                     // z = x && y
    OP_ADD,                     // z = x + y
    OP_SUB,                     // z = x - y        z = -x : z = 0 - x
    OP_MULT,                    // z = x * y
    OP_DIV,                     // z = x / y
    OP_GT,                      // z = x > y
    OP_GTE,                     // z = x >= y
    OP_LT,                      // z = x < y
    OP_LTE,                     // z = x <= y
    OP_EQ,                      // z = x == y
    OP_NE,                      // z = x != y
    OP_NEGATIVE,                // z = -x
    OP_NOT,                     // z = !x
    OP_ASSIGN,                  // z = x
    OP_GOTO,                    // goto x -- drat!
    OP_COND_BRANCH,             // if x == 0 goto z
    OP_FALSE_COND_BRANCH,       // if x != 0 goto z
    OP_LABEL,                   // x:
    OP_ASSIGN_FROM_ARRAY,       // z = x[y]
    OP_ASSIGN_TO_ARRAY,         // z[y] = x
    OP_AMP,                     // z = &x
    OP_DEREFERENCE_FROM,        // z = *x
    OP_DEREFERENCE_TO,          // *z = x
    OP_DUMMY,                   // nothing.  Used in unary_expr for those expressions for which there is no code needed, but the return type is three_code *.  Can simply delete these nodes when generating assembly (in fact, they are only inserted so that they *do* get deleted, otherwise they'd never be cleaned up).

    OP_GLOBAL,                  // global is in 'z'
    OP_CALL_FUNCTION,           // pushes parameters, whatever
    OP_ENTER_FUNCTION,          // sets up fp, ra stuff
    OP_LEAVE_FUNCTION           // restores fp, ra, sp (returns value, if any)
};

class field_info;
class data_info;
typedef std::map< std::string, operation> operation_map;

struct three_code
{

public:

    field_info *src_1;
    field_info *src_2;
    data_info *dest;
    operation op;

public:

    three_code(operation op_x,
               field_info * const src_1_x, 
               field_info * const src_2_y = 0,
               data_info * const dest_z = 0);
    three_code(const three_code &t);
    ~three_code(void);
    three_code &operator =(const three_code &r);

    static operation_map *build_operation_map(void);

    std::string stringify(void) const;
};

std::ostream &operator <<(std::ostream &, const three_code &c);

#endif  // THREE_CODE_H

