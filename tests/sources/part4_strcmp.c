#include <test.h>
#include <string.h>

START_TEST(simple_test)
{
	ck_assert_int_eq(ft_strcmp("normal", "normal"), strcmp("normal", "normal"));
	ck_assert_int_eq(ft_strcmp("moins", "mojns"), strcmp("moins", "mojns"));
	ck_assert_int_eq(ft_strcmp("plus", "plts"), strcmp("plus", "plts"));
	ck_assert_int_eq(ft_strcmp("", ""), strcmp("", ""));
}
END_TEST

void	tc_strcmp(TCase *tc_part4)
{
	tcase_add_test(tc_part4, simple_test);
}
