#ifndef LABEL_INFO_H
#define LABEL_INFO_H

/*!
 *  Author: Robert Crocombe
 *  Class: CS453 Fall 04
 *  Professor: Debray
 *  Other People's Code Used: No
 */

#include "field_info.h"

class label_info : public field_info
{

public:
    label_info(const std::string &name, const int place = 0);
    label_info(const label_info &l);
    label_info &operator =(const label_info &l);
    ~label_info(void);

    label_info *clone(void) const;

};

#endif  //  LABEL_INFO_H

