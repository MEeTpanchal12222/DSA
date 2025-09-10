void printTable(int n, [int i = 1])
{
    if (i == 11)
        return;
    print(n.toString() + " * " + i.toString() + " = " + (n * i).toString());
    i++;
    printTable(n, i);
}

void main()
{
    int n = 5;
    printTable(n);
}