#include <test.h>

START_TEST(simple_test)
{
	char	b1[100], b2[100];

	memset(b1, 33, 100);
	memset(b2, 63, 100);

	ft_memcpy(b1, b2, 100);
	ck_assert_int_eq((long long)memcmp(b1, b2, 100), 0);
	ck_assert_int_eq((long long)ft_memcpy(b1, b2, 0), (long long)b1);
}
END_TEST

void	tc_memcpy(TCase *tc_part2)
{
	tcase_add_test(tc_part2, simple_test);
}
