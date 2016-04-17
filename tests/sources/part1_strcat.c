#include <test.h>

START_TEST(simple_test)
{
	char	buf[9];

	bzero(buf, 9);
	ft_strcat(buf, "");
	ft_strcat(buf, "Bon");
	ft_strcat(buf, "j");
	ft_strcat(buf, "our.");
	ft_strcat(buf, "");
	ck_assert_int_eq(strcmp(buf, "Bonjour."), 0);
	ck_assert_str_eq(buf, ft_strcat(buf, ""));
}
END_TEST

void	tc_strcat(TCase *tc_part1)
{
	tcase_add_test(tc_part1, simple_test);
}
