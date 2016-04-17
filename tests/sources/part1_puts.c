#include <test.h>

START_TEST(simple_test)
{
	int		ret;
	int		puts_ret1;
	int		puts_ret2;
	int		out;
	int		p[2];
	char	buf[10000];

	out = dup(1);
	pipe(p);
	dup2(p[1], 1);
	puts_ret1 = ft_puts("aaa");
	puts_ret2 = ft_puts(NULL);
	dup2(out, 1);
	ret = read(p[0], buf, 10000);
	buf[ret] = 0;
	close(p[0]);
	close(p[1]);
	close(out);
	ck_assert_int_eq((puts_ret1 > 0), 1);
	ck_assert_int_eq((puts_ret2 > 0), 1);
	ck_assert_int_eq(strcmp(buf, "aaa\n(null)\n"), 0);
}
END_TEST

void	tc_puts(TCase *tc_part1)
{
	tcase_add_test(tc_part1, simple_test);
}
