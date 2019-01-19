/*!
 *  Author: Robert Crocombe
 *  Class: CS453 Fall 04
 *  Professor: Debray
 *  Other People's Code Used: No
 */

#include "three_code.h"
#include "field_info.h"
#include "data_info.h"

#include "codelist.h"

#include <ostream>
#include<sstream>

#include <iomanip>
using std::dec;
using std::hex;
using std::setw;
using std::setfill;

three_code::three_code
(
    operation op_x,
    field_info * const src_1_x, 
    field_info * const src_2_x,
    data_info * const dest_x
):
    // aliasing is what I want
    src_1(src_1_x),
    src_2(src_2_x),
    dest(dest_x),
    op(op_x)
{
    // nada
}

three_code::three_code(const three_code &t):
    // aliasing is what I want
    src_1(t.src_1),
    src_2(t.src_2),
    dest(t.dest),
    op(t.op)
{
    // nothing
}

three_code::~three_code(void)
{
    // nothing -- everything is aliased!
}
three_code &
three_code::operator =(const three_code &r)
{
    if (this != &r)
    {
        op = r.op;
        // aliasing is what I want
        src_1 = r.src_1;
        src_2 = r.src_2;
        dest = r.dest;
    }
    return *this;
}

operation_map *
three_code::build_operation_map(void)
{
    operation_map *op_map = new operation_map();
    operation_map &o = *op_map;

    o["OP_OR"]                  = OP_OR;
    o["OP_AND"]                 = OP_AND;

    o["OP_ADD"]                 = OP_ADD;
    o["OP_SUB"]                 = OP_SUB;
    o["OP_MULT"]                = OP_MULT;
    o["OP_DIV"]                 = OP_DIV;

    o["OP_GT"]                  = OP_GT;
    o["OP_GTE"]                 = OP_GTE;
    o["OP_LT"]                  = OP_LT;
    o["OP_LTE"]                 = OP_LTE;
    o["OP_EQ"]                  = OP_EQ;
    o["OP_NE"]                  = OP_NE;

    o["OP_NEGATIVE"]            = OP_NEGATIVE;
    o["OP_NOT"]                 = OP_NOT;
    o["OP_ASSIGN"]              = OP_ASSIGN;
    o["OP_GOTO"]                = OP_GOTO;
    o["OP_COND_BRANCH"]         = OP_COND_BRANCH;
    o["OP_FALSE_COND_BRANCH"]   = OP_FALSE_COND_BRANCH;
    o["OP_LABEL"]               = OP_LABEL;
    o["OP_ASSIGN_FROM_ARRAY"]   = OP_ASSIGN_FROM_ARRAY;
    o["OP_ASSIGN_TO_ARRAY"]     = OP_ASSIGN_TO_ARRAY;
    o["OP_AMP"]                 = OP_AMP;
    o["OP_DEREFERENCE_FROM"]    = OP_DEREFERENCE_FROM;
    o["OP_DEREFERENCE_TO"]      = OP_DEREFERENCE_TO;
    o["OP_DUMMY"]               = OP_DUMMY;
    o["OP_GLOBAL"]              = OP_GLOBAL;
    o["OP_CALL_FUNCTION"]       = OP_CALL_FUNCTION;
    o["OP_ENTER_FUNCTION"]      = OP_ENTER_FUNCTION;
    o["OP_LEAVE_FUNCTION"]      = OP_LEAVE_FUNCTION;

    return op_map;
}

std::string
three_code::stringify(void) const
{
    std::ostringstream o;
    operation_map *m = three_code::build_operation_map();

    o << reverse_lookup(op, *m );
    o << " | ";
    if (src_1) o << src_1->name(); else o << "No src1";
    o << " | ";
    if (src_2) o << src_2->name(); else o << "No src2";
    o << " | ";
    if (dest) o << dest->name(); else o << "No dest";
    o << "\n";

    delete m;
    return o.str();
}

////////////////////////////////////////////////////////////////////////////////
// Not in class
////////////////////////////////////////////////////////////////////////////////

std::ostream &
operator <<(std::ostream &o, const three_code &c)
{
    operation_map *m = three_code::build_operation_map();

    o << "\nOperation is " << reverse_lookup(c.op, *m) << "\n";

    o << "src1 == "
      << hex << setw(8) << setfill('0') << c.src_1 << dec << "\t";
      if (c.src_1) o << *c.src_1;
      else o << "Nada";
      o << "\n";

    o << "src2 == "
      << hex << setw(8) << setfill('0') << c.src_2 << dec << "\t";
      if (c.src_2) o << *c.src_2;
      else o << "Nada";
      o << "\n";

    o << "dest  == "
      << hex << setw(8) << setfill('0') << c.dest << dec << "\t";
      if (c.dest) o << *c.dest;
      else o << "Nada";
      
    o << "\n";

    delete m;
    return o;
}

