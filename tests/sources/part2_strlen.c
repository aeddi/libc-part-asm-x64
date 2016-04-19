// CREDITS: Tests from yyang42: https://github.com/yyang42/moulitest

#include <test.h>

START_TEST(test_1)
{
	ck_assert_int_eq(ft_strlen("chat"), strlen("chat"));
}
END_TEST

START_TEST(test_2)
{
	ck_assert_int_eq(ft_strlen(""), strlen(""));
}
END_TEST

START_TEST(test_3)
{
	ck_assert_int_eq(ft_strlen("aaa\0aaa"), strlen("aaa\0aaa"));
}
END_TEST

START_TEST(test_10_million_chars)
{
	int test_len = 10 * 1000 * 1000;
	char *str = malloc(test_len);

	memset(str, 'a', test_len);
	str[test_len - 1] = '\0';
	ck_assert_int_eq(ft_strlen(str), strlen(str));
	free(str);
}
END_TEST

void	tc_strlen(TCase *tc_part2)
{
	tcase_add_test(tc_part2, test_1);
	tcase_add_test(tc_part2, test_2);
	tcase_add_test(tc_part2, test_3);
	tcase_add_test(tc_part2, test_10_million_chars);
}
