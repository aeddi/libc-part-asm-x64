#include <test.h>
#include <string.h>

START_TEST(simple_test)
{
	ck_assert_int_eq(ft_strcmp("equal", "equal"), strcmp("equal", "equal"));
	ck_assert_int_eq(ft_strcmp("minus1-", "minus0-"), strcmp("minus1-", "minus0-"));
	ck_assert_int_eq(ft_strcmp("plus0+", "plus1+"), strcmp("plus0+", "plus1+"));
	ck_assert_int_eq(ft_strcmp("", ""), strcmp("", ""));
}
END_TEST

void	tc_strcmp(TCase *tc_part4)
{
	tcase_add_test(tc_part4, simple_test);
}
