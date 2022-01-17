//@date: 2021/12/19
//@author: LPH
//@description: Built-in song generator

#include <iostream>
#include <cstring>
#include <string>
using namespace std;

int main()
{
	string str;
	int num;

	cin >> num;
	getchar();
	while (true)
	{
		getline(cin, str);
		for (int i = 0; i < str.length(); i++)
		{
			if (str[i] == 'V')
			{
				cout << num << ": freq <= 25;" << endl;
			}
			if (str[i] == ' ')
			{
				cout << num << ": freq <= 100;" << endl;
			}
			if (str[i] == 'q')
			{
				cout << num << ": freq <= 32;" << endl;
			}
			if (str[i] == '5')
			{
				cout << num << ": freq <= 39;" << endl;
			}
			if (str[i] == '6')
			{
				cout << num << ": freq <= 41;" << endl;
			}
			if (str[i] == 'Y')
			{
				cout << num << ": freq <= 42;" << endl;
			}
			if (str[i] == '7')
			{
				cout << num << ": freq <= 43;" << endl;
			}
			if (str[i] == '1')
			{
				cout << num << ": freq <= 44;" << endl;
			}
			if (str[i] == '2')
			{
				cout << num << ": freq <= 46;" << endl;
			}
			if (str[i] == '3')
			{
				cout << num << ": freq <= 48;" << endl;
			}
			if (str[i] == '4')
			{
				cout << num << ": freq <= 49;" << endl;
			}
			if (str[i] == '%')
			{
				cout << num << ": freq <= 51;" << endl;
			}
			if (str[i] == '^')
			{
				cout << num << ": freq <= 53;" << endl;
			}
			if (str[i] == '&')
			{
				cout << num << ": freq <= 55;" << endl;
			}
			if (str[i] == '!')
			{
				cout << num << ": freq <= 56;" << endl;
			}
			if (str[i] == '@')
			{
				cout << num << ": freq <= 58;" << endl;
			}
			if (str[i] == '#')
			{
				cout << num << ": freq <= 60;" << endl;
			}
			if (str[i] == '$')
			{
				cout << num << ": freq <= 61;" << endl;
			}
			if (str[i] == 'G')
			{
				cout << num << ": freq <= 63;" << endl;
			}
			if (str[i] == 'H')
			{
				cout << num << ": freq <= 65;" << endl;
			}
			if (str[i] == 'J')
			{
				cout << num << ": freq <= 67;" << endl;
			}
			num++;
		}
	}

	return 0;
}