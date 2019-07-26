#include <iostream>
#include <vector>
#include <string>
#include <fstream>
using namespace std;

#include <boost/progress.hpp>
using namespace boost;

void do_something();

int main()
{
	progress_timer t;

	vector<string> v(100, "test");
	v[1] = "";
	v[10] = "";
	v[50] = "";

	ofstream fs("./test.txt");
	progress_display dp(v.size());
	for (auto pos = v.begin(); pos != v.end(); ++pos)
	{
		fs << *pos << endl;

#if 0
		++dp;
#else
		dp.restart(v.size());
		dp += (pos - v.begin() + 1);
#endif

		if ((*pos).empty())
		{
			cout << "empty string: #" << pos - v.begin() << endl;
		}
	}
}