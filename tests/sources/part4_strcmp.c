#include <test.h>

START_TEST(simple_test)
{
}
END_TEST

void	tc_strcmp(TCase *tc_part4)
{
	tcase_add_test(tc_part4, simple_test);
}

