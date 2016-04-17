#include <test.h>

START_TEST(simple_test)
{
	ck_assert_int_eq(ft_labs(42), labs(42));
	ck_assert_int_eq(ft_labs(0), labs(0));
	ck_assert_int_eq(ft_labs(-42), labs(-42));
}
END_TEST

void	tc_labs(TCase *tc_part4)
{
	tcase_add_test(tc_part4, simple_test);
}

