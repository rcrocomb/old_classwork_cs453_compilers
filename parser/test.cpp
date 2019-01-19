#include <iostream>
using std::cout;
using std::endl;

#include "set_map.h"

int
main
(
    int argc,
    char *argv[]
)
{
    set_map first_map("first_set");

    cout << "\n\n\n";
    cout << first_map;

    return 0;
}
