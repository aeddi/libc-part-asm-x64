#include <test.h>

START_TEST(test_1)
{
	ck_assert_int_eq(strcmp(ft_strdup("aaaaa"), "aaaaa"), 0);
}
END_TEST

START_TEST(test_2)
{
	ck_assert_int_eq(strcmp(ft_strdup(""), ""), 0);
}
END_TEST

START_TEST(test_3)
{
	char *s1;
	char *s2;

	s1 = "aaa";
	s2 = ft_strdup(s1);
	ck_assert_int_eq((s1 != s2), 1);
}
END_TEST

void	tc_strdup(TCase *tc_part2)
{
	tcase_add_test(tc_part2, test_1);
	tcase_add_test(tc_part2, test_2);
	tcase_add_test(tc_part2, test_3);
}
