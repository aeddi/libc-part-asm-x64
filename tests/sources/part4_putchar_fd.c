#include <test.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/uio.h>

START_TEST(simple_test)
{
	int		ret;
	int		out;
	int		p[2];
	char	c;

	out = dup(2);
	pipe(p);
	dup2(p[1], 2);

	ft_putchar_fd('T', 2);

	dup2(out, 2);
	ret = read(p[0], &c, 1);

	close(p[0]);
	close(p[1]);
	close(out);

	ck_assert_int_eq(c, 'T');
}
END_TEST

void	tc_putchar_fd(TCase *tc_part4)
{
	tcase_add_test(tc_part4, simple_test);
}
