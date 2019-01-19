void setter_func(char x[], int i, int value);
void main(void);

void
setter_func(char x[], int i, int value)
{
    int index;

    for (index = 0; index < i; index = index + 1)
    {
        x[index] = value + index;
    }
}



void
func(char x[], int i)
{
    setter_func(x, i, 40);
}

void
main(void)
{
    char array[10];
    int i;

    for (i = 0; i < 10; i = i + 1)
    {
        array[i] = 0;
    }

    func(array, 10);
}

