#include <test.h>

START_TEST(simple_test)
{
	ck_assert_int_eq(ft_llabs(42), llabs(42));
	ck_assert_int_eq(ft_llabs(0), llabs(0));
	ck_assert_int_eq(ft_llabs(-42), llabs(-42));
}
END_TEST

void	tc_llabs(TCase *tc_part4)
{
	tcase_add_test(tc_part4, simple_test);
}

