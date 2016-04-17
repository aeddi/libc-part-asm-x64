/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aeddi <aeddi@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/04/16 13:30:07 by aeddi             #+#    #+#             */
/*   Updated: 2016/04/18 00:37:13 by plastic          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <test.h>

Suite * test_suite(void)
{
	Suite *s;
	TCase *tc_part1;
	TCase *tc_part2;
	TCase *tc_part3;
	TCase *tc_part4;

	s = suite_create("Test suite");

	tc_part1 = tcase_create("Part 1");
	tc_part2 = tcase_create("Part 2");
	tc_part3 = tcase_create("Part 3");
	tc_part4 = tcase_create("Part bonus");

	tc_bzero(tc_part1);
	tc_strcat(tc_part1);
	tc_isalpha(tc_part1);
	tc_isdigit(tc_part1);
	tc_isalnum(tc_part1);
	tc_isascii(tc_part1);
	tc_isprint(tc_part1);
	tc_toupper(tc_part1);
	tc_tolower(tc_part1);
	tc_puts(tc_part1);

	tc_strlen(tc_part2);
	tc_memset(tc_part2);
	tc_memcpy(tc_part2);
	tc_strdup(tc_part2);

	tc_cat(tc_part3);

	tc_labs(tc_part4);
	tc_llabs(tc_part4);
	tc_isupper(tc_part4);
	tc_islower(tc_part4);
	tc_putchar_fd(tc_part4);
	tc_putnbr_fd(tc_part4);
	tc_strcmp(tc_part4);

	suite_add_tcase(s, tc_part1);
	suite_add_tcase(s, tc_part2);
	suite_add_tcase(s, tc_part3);
	suite_add_tcase(s, tc_part4);

	return s;
}

int main(void)
{
	int number_failed;
	Suite *s;
	SRunner *sr;

	s = test_suite();
	sr = srunner_create(s);

	srunner_run_all(sr, CK_VERBOSE);
	number_failed = srunner_ntests_failed(sr);
	srunner_free(sr);
	return (number_failed == 0) ? EXIT_SUCCESS : EXIT_FAILURE;
}
