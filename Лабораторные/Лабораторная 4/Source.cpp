#include <iostream>
#include <math.h>
#include <windows.h>
using namespace std;
const int n = 11;

extern "C" float asfun(int x);
extern "C" float func(int x)
{
    float f;
    f = (1 / tan(x) + cos(x)) / exp(x);
    return f;
}

int main()
{

    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);

    float x;
    float y[n];
    int m;
    cout << "Введите количество желаемых итераций расчета, максимальное число 11" << endl; cin >> m;
    cout << "Возможный диапазон значений X от 0 до 1 с шагом 0,1" << endl;
    for (int i = 0; i < m; i++)
    {
        cout << "Введите Х" << i + 1 << " "; cin >> x;
        float f = asfun(x);
        y[i] = f;
        cout << "X(" << i + 1 << ") = " << x << endl;
        cout << "Y(" << i + 1 << ") = " << y[i] << endl;
    }

    return 0;

}