//2021/10/9

#include <iostream>
#include <vector>
#include <string>
using namespace std;

#pragma region STACK

const int SIZE = 1000;

template <typename T>
struct Stack
{
	T elems[SIZE]{};
	int head = 0;	//指向下一元素
	int customSize = 0;
	void push(T elem);
	void pop();
	T top();
	bool empty() const;
	bool full() const;
	size_t size() const;
	void print();
	void clear();
};

/// <summary>
/// 入栈，不判断是否满栈
/// </summary>
/// <typeparam name="T"></typeparam>
/// <param name="elem">入栈元素</param>
template<typename T>
void Stack<T>::push(T elem)
{
	/* ⼊栈操作 */
	elems[head++] = elem;
}

/// <summary>
/// 出栈，栈顶在小于0时，仍旧为0，不会报错
/// </summary>
/// <typeparam name="T"></typeparam>
template<typename T>
void Stack<T>::pop()
{
	/* 出栈操作 */
	head--;
	if (head <= 0)
	{
		head = 0;
	}
}

/// <summary>
/// 返回栈顶元素
/// </summary>
/// <typeparam name="T"></typeparam>
/// <returns>栈顶元素</returns>
template<typename T>
T Stack<T>::top()
{
	return elems[head - 1];
}

/// <summary>
/// 判断是否为空
/// </summary>
/// <typeparam name="T"></typeparam>
/// <returns></returns>
template<typename T>
bool Stack<T>::empty() const
{
	return !head;
}

/// <summary>
/// 判断是否为满
/// </summary>
/// <typeparam name="T"></typeparam>
/// <returns></returns>
template<typename T>
bool Stack<T>::full() const
{
	if (head >= SIZE || head >= customSize)
	{
		return true;
	}
	return false;
}

/// <summary>
/// 返回目前栈内使用的容量
/// </summary>
/// <typeparam name="T"></typeparam>
/// <returns>容量</returns>
template<typename T>
size_t Stack<T>::size() const
{
	return size_t(head);
}

/// <summary>
/// 输出栈内元素
/// </summary>
/// <typeparam name="T"></typeparam>
template<typename T>
void Stack<T>::print()
{
	for (int i = head - 1; i >= 0; i--)
	{
		cout << elems[i] << ' ';
	}
}

template<typename T>
void Stack<T>::clear()
{
	head = 0;
}

#pragma endregion

bool calculate(bool b1, char op)
{
	if (op == '!')
	{
		return !b1;
	}
	exit(-1);
	return false;
}
bool calculate(bool b1, bool b2, char op)
{
	switch (op)
	{
		case '|':
			return b1 || b2;
		case '&':
			return b1 && b2;
		default:
			break;
	}
	exit(-1);
	return false;
}

int main()
{
	int count = 0;
	char c;
	bool nextline = false;
	Stack<bool> boolean;	//V=T,F=F
	Stack<char> op;
	while (cin.get(c)&&!cin.eof())
	{
		nextline = false;
		if (c == ' ')
		{
			continue;
		}

		switch (c)
		{
			case '(':
				op.push(c);
				break;
			case ')':
				/* 依次将下方的运算求值，直到遇到（为止 */
				while (op.top() != '(')
				{
					char ope = op.top();
					op.pop();
					if (ope == '!')
					{
						bool b1 = boolean.top();
						boolean.pop();
						boolean.push(calculate(b1, ope));
					}
					else
					{
						bool b1 = boolean.top();
						boolean.pop();
						bool b2 = boolean.top();
						boolean.pop();
						boolean.push(calculate(b1, b2, ope));
					}
				}
				op.pop();	//弹出（
				break;
			case '|':
				/* 优先级最低，直接算 */
				while (op.size() != 0 && op.top() != '(')
				{
					char ope = op.top();
					op.pop();
					if (ope == '!')
					{
						bool b1 = boolean.top();
						boolean.pop();
						boolean.push(calculate(b1, ope));
					}
					else
					{
						bool b1 = boolean.top();
						boolean.pop();
						bool b2 = boolean.top();
						boolean.pop();
						boolean.push(calculate(b1, b2, ope));
					}
				}
				/* 算完后将|入栈 */
				op.push(c);
				break;
			case '&':
				/* 遇到！ & ，先算再入栈 */
				while (op.size() != 0 && op.top() != '(' && (op.top() == '!' || op.top() == '&'))
				{
					char ope = op.top();
					op.pop();
					if (ope == '!')
					{
						bool b1 = boolean.top();
						boolean.pop();
						boolean.push(calculate(b1, ope));
					}
					else
					{
						bool b1 = boolean.top();
						boolean.pop();
						bool b2 = boolean.top();
						boolean.pop();
						boolean.push(calculate(b1, b2, ope));
					}
				}
				op.push(c);
				break;
			case '!':
				/* 右结合，先入栈，别的遇到了再算 */
				op.push(c);
				break;
			case 'V':
				boolean.push(true);
				break;
			case 'F':
				boolean.push(false);
				break;
			default:
				nextline = true;
				count++;
				break;
		}
		/* 计算剩余 */
		while (op.size() != 0 && nextline)
		{
			char ope = op.top();
			op.pop();
			if (ope == '!')
			{
				bool b1 = boolean.top();
				boolean.pop();
				boolean.push(calculate(b1, ope));
			}
			else
			{
				bool b1 = boolean.top();
				boolean.pop();
				bool b2 = boolean.top();
				boolean.pop();
				boolean.push(calculate(b1, b2, ope));
			}
		}
		if (nextline)
		{
			cout << "Expression " << count << ": " << (boolean.top() == false ? "F" : "V") << endl;
			boolean.clear();
			op.clear();
		}
	}
}