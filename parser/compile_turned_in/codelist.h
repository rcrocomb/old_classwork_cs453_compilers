#ifndef CODELIST_H
#define CODELIST_H

/*!
 *  Author: Robert Crocombe
 *  Class: CS453 Fall 04
 *  Professor: Debray
 *  Other People's Code Used: No
 */

#include <iosfwd>
#include <list>
#include <map>
#include <string>

#include "three_code.h"

enum
{
    MIPS_INT_SIZE = 4,
    MIPS_CHAR_SIZE = 1
};

class three_code;
class field_info;
class variable_info;
class array_info;

typedef std::list<three_code *> code_list;
typedef std::list<std::string *> asm_list;
typedef std::map<operation, std::string *> operation_to_assembly_map;

class codelist
{

private:


    static std::string DEBRAY_ASM;
    static operation_to_assembly_map *asm_map_;
    code_list *code_;
    code_list *data_;
    asm_list *asm_text_;

private:        // internal routines

    void load_asm(const std::string &filename, operation_map * const o);

    std::string generate_global_variable(const variable_info * const v,
                                         int * const variable_size);

    std::string generate_global_array(const array_info * const a,
                                      int * const array_size);

    void handle_opcode_specific_cases(const three_code * const tc,
                                      std::string * const assembly);

    void replace_loads(const field_info * const code,
                       std::string * const assembly,
                       const char * const label);

    void replace_stores(const field_info * const code,
                        std::string * const assembly,
                        const char * const label);

    void replace_source_label(const field_info * const f,
                              std::string * const assembly,
                              const char * const label);

    void replace_dest_label(const three_code * const f,
                            std::string * const assembly,
                            const char * const label);

    void fix_array_shifts(const field_info * const f,
                          std::string * const assembly);

    int  replace_function_params(const field_info * const dest_f,
                                 const field_info * const source_f,
                                 std::string * const assembly);

    void insert_local_variables(field_info * const func,
                                std::string * const assembly);

    void return_value_if_gotta(const three_code * const code,
                               std::string * const assembly);

public:         // interface
    
    codelist(void);
    codelist(const codelist &l);
    ~codelist(void);
    codelist &operator =(const codelist &);

    void generate_asm(void);
    void generate_data(void);


    // Yar, take that, encapsulation!
    code_list *code(void) const { return code_; }

    const code_list *data(void) const { return data_; }
    static operation_to_assembly_map *gimme_asm(void) { return asm_map_; }

    void push_back(three_code * const d);
    void pop_back(void);
    void push_data(three_code * const d);
    void pop_data(void);
    int size(void) const { return code_->size(); }

    std::string translate( three_code * const code, int * const stack_offset);
    std::string translate_data( three_code * const code, int * const stack_offset);

    void display_asm(void) const;

    three_code *last(void) { return code_->back(); }

    void flush(void);
};

std::ostream &operator <<(std::ostream &o, const codelist &l);
std::ostream &operator <<(std::ostream &o, const operation_to_assembly_map &m);

const std::string &
reverse_lookup(const int op, const operation_map & op_map);

#endif  // CODELIST_H

