#include <iostream>
using namespace std;

/*
 * a.适用于要求不高的计时任务
 * b.精度依赖于操作系统和编译器,难以做到跨平台
 * c.不适合大跨度时间段的测量
 */
#include <boost/timer.hpp>
using namespace boost;

int main()
{
	timer t;

	cout << "max timespan:"
		<< t.elapsed_max() / 3600 << "h" << endl;

	cout << "min timespan:"
		<< t.elapsed_min() << "s" << endl;

	cout << "now time elapsed:"
		<< t.elapsed() << "s" << endl;

	
}