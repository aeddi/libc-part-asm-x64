#include <test.h>

START_TEST(simple_string)
{
	char	control[10];
	char	subject[] = "123456789";

	bzero(control, 10);
	ft_bzero(subject, 10);
	ck_assert_int_eq(memcmp(control, subject, 10), 0);
	subject[0] = 'a';
	ft_bzero(subject, 0);
	ck_assert_int_eq(subject[0], 'a');
}
END_TEST

START_TEST(test_only_bzero_first_x_chars)
{
	char	control[] = "123456789";
	char	subject[] = "123456789";

	bzero(control, 3);
	ft_bzero(subject, 3);
	ck_assert_int_eq(memcmp(subject, control, 10), 0);
}
END_TEST

START_TEST(test_zero_case)
{
	char	control[] = "123456789";
	char	subject[] = "123456789";

	bzero(control, 0);
	ft_bzero(subject, 0);
	ck_assert_int_eq(memcmp(subject, control, 10), 0);
}
END_TEST

void	tc_bzero(TCase *tc_part1)
{
	tcase_add_test(tc_part1, simple_string);
	tcase_add_test(tc_part1, test_only_bzero_first_x_chars);
	tcase_add_test(tc_part1, test_zero_case);
}
