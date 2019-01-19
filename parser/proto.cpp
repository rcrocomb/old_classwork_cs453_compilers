#include <iostream>
using std::cout;
using std::endl;

#include <fstream>

#include <string>

using std::ifstream;

int
main
(
    int argc,
    char *argv[]
)
{
    ifstream in(argv[1] ? argv[1] : "first");
    if (!in)
    {
        cout << "Error opening file\n";
        return 0;
    }

    int lc = 0;
    while (true)
    {
        std::string blah;
        in >> blah;
        if (in.eof())
        {
            break;
        }

        cout << "Read in string '" << blah << "' on line " << lc << "\n";

    }

    return 0;
}
