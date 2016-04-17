#include <test.h>
#include <fcntl.h>

START_TEST(simple_test)
{
	int pids[2];
	char buf[10];
	int saved_stdout;

	saved_stdout = dup(1);
	pipe(pids);
	dup2(pids[1], 1);

	int fd;

	system("echo '12345678912345678' > catout");
	fd = open("catout", O_RDONLY);
	if (fd == -1)
		return ;
	ft_cat(fd);
	read(pids[0], buf, 17);
	dup2(saved_stdout, 1);

	close(fd);
	close(pids[0]);
	close(pids[1]);
	close(saved_stdout);
	system("rm catout");
	ck_assert_int_eq(memcmp(buf, "12345678912345678", 17), 0);
}
END_TEST

void	tc_cat(TCase *tc_part3)
{
	tcase_add_test(tc_part3, simple_test);
}
