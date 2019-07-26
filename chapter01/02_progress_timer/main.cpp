#include <iostream>
using namespace std;

#include <boost/progress.hpp>
using namespace boost;

void do_something();

int main()
{
	progress_timer t;

	{
		progress_timer t2;

		do_something();
	}

	do_something();
}

void do_something()
{
	unsigned long long cnt(0);
	for (unsigned long long i = 0; i < 1024 * 1024 * 1024; ++i)
	{
		cnt += i;
	}
}