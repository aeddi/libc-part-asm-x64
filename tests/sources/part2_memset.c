// CREDITS: Tests from yyang42: https://github.com/yyang42/moulitest

#include <test.h>

START_TEST(test_1)
{
	char	b1[100], b2[100];

	ft_memset(b1, 42, 100);
	memset(b2, 42, 100);
	ck_assert_int_eq((long long)memset(b1, 99, 0), (long long)ft_memset(b1, 99, 0));
	ck_assert_int_eq(memcmp(b1, b2, 100), 0);
	b1[0] = 1;
	ft_memset(b1, 0, 0);
	ck_assert_int_eq(b1[0], 1);
}
END_TEST

START_TEST(test_2)
{
	ck_assert_int_eq(memcmp(memset(strdup("abcd"), 'A', 5), ft_memset(strdup("abcd"), 'A', 5), 5), 0);
}
END_TEST

START_TEST(test_3)
{
	ck_assert_int_eq(memcmp(memset(strdup("abcd"), 0, 0), ft_memset(strdup("abcd"), 0, 0), 5), 0);
}
END_TEST

void	tc_memset(TCase *tc_part2)
{
	tcase_add_test(tc_part2, test_1);
	tcase_add_test(tc_part2, test_2);
	tcase_add_test(tc_part2, test_3);
}
