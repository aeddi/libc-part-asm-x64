#include <test.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/uio.h>

#define BUF_SZ 128

void	write_read_check(int param, char *check)
{
	int		out;
	int		p[2];
	int		ret;
	char	buf[BUF_SZ];

	out = dup(2);
	pipe(p);
	dup2(p[1], 2);

	ft_putnbr_fd(param, 2);
	dup2(out, 2);
	ret = read(p[0], buf, BUF_SZ);
	buf[ret] = 0;

	ck_assert_str_eq(buf, check);

	close(p[0]);
	close(p[1]);
	close(out);
}

START_TEST(simple_test)
{
	write_read_check(123, "123");
	write_read_check(1, "1");
	write_read_check(0, "0");
	write_read_check(-1, "-1");
	write_read_check(-123, "-123");
}
END_TEST

void	tc_putnbr_fd(TCase *tc_part4)
{
	tcase_add_test(tc_part4, simple_test);
}

