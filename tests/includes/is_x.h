/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   is_x.h                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: plastic <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/04/17 19:45:33 by plastic           #+#    #+#             */
/*   Updated: 2016/04/19 19:13:34 by plastic          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

// CREDITS: Tests from yyang42: https://github.com/yyang42/moulitest

#ifndef IS_X_H
# define IS_X_H

# include <test.h>
# include <ctype.h>

# define test_is_x_unit(fn_name, test_name, tested_char)					\
	START_TEST(test_## test_name)											\
	{																		\
		ck_assert_int_eq(ft_ ##fn_name(tested_char), fn_name(tested_char));	\
	}																		\
	END_TEST

# define test_is_x(fn_name)						\
	test_is_x_unit(fn_name, num1, 'a');			\
	test_is_x_unit(fn_name, num2, 'a' - 1);		\
	test_is_x_unit(fn_name, num3, 'm');			\
	test_is_x_unit(fn_name, num4, 'z');			\
	test_is_x_unit(fn_name, num5, 'z' + 1);		\
	test_is_x_unit(fn_name, num6, 'A');			\
	test_is_x_unit(fn_name, num7, 'A' - 1);		\
	test_is_x_unit(fn_name, num8, 'M');			\
	test_is_x_unit(fn_name, num9, 'Z');			\
	test_is_x_unit(fn_name, num10, 'Z' + 1);	\
	test_is_x_unit(fn_name, num11, ' ');		\
	test_is_x_unit(fn_name, num12, '%');		\
	test_is_x_unit(fn_name, num13, '\t');		\
	test_is_x_unit(fn_name, num14, '\n');		\
	test_is_x_unit(fn_name, num15, '\v');		\
	test_is_x_unit(fn_name, num16, '\b');		\
	test_is_x_unit(fn_name, num17, '0');		\
	test_is_x_unit(fn_name, num18, '0' - 1);	\
	test_is_x_unit(fn_name, num19, '5');		\
	test_is_x_unit(fn_name, num20, '9');		\
	test_is_x_unit(fn_name, num21, '9' + 1);	\
	test_is_x_unit(fn_name, num22, 0);			\
	test_is_x_unit(fn_name, num23, 1);			\
	test_is_x_unit(fn_name, num24, 127);		\
	test_is_x_unit(fn_name, num25, 128);		\
	test_is_x_unit(fn_name, num26, -128);		\
	test_is_x_unit(fn_name, num27, -129);		\
	test_is_x_unit(fn_name, num28, 9999);		\
	test_is_x_unit(fn_name, num29, -42);		\
	test_is_x_unit(fn_name, num30, 31);			\
	test_is_x_unit(fn_name, num31, 32);			\
	test_is_x_unit(fn_name, num32, 33);			\
	void	tc_ ##fn_name(TCase *tc_part1) 		\
	{											\
		tcase_add_test(tc_part1, test_num1);	\
		tcase_add_test(tc_part1, test_num2);	\
		tcase_add_test(tc_part1, test_num3);	\
		tcase_add_test(tc_part1, test_num4);	\
		tcase_add_test(tc_part1, test_num5);	\
		tcase_add_test(tc_part1, test_num6);	\
		tcase_add_test(tc_part1, test_num7);	\
		tcase_add_test(tc_part1, test_num8);	\
		tcase_add_test(tc_part1, test_num9);	\
		tcase_add_test(tc_part1, test_num10);	\
		tcase_add_test(tc_part1, test_num11);	\
		tcase_add_test(tc_part1, test_num12);	\
		tcase_add_test(tc_part1, test_num13);	\
		tcase_add_test(tc_part1, test_num14);	\
		tcase_add_test(tc_part1, test_num15);	\
		tcase_add_test(tc_part1, test_num16);	\
		tcase_add_test(tc_part1, test_num17);	\
		tcase_add_test(tc_part1, test_num18);	\
		tcase_add_test(tc_part1, test_num19);	\
		tcase_add_test(tc_part1, test_num20);	\
		tcase_add_test(tc_part1, test_num21);	\
		tcase_add_test(tc_part1, test_num22);	\
		tcase_add_test(tc_part1, test_num23);	\
		tcase_add_test(tc_part1, test_num24);	\
		tcase_add_test(tc_part1, test_num25);	\
		tcase_add_test(tc_part1, test_num26);	\
		tcase_add_test(tc_part1, test_num27);	\
		tcase_add_test(tc_part1, test_num28);	\
		tcase_add_test(tc_part1, test_num29);	\
		tcase_add_test(tc_part1, test_num30);	\
		tcase_add_test(tc_part1, test_num31);	\
		tcase_add_test(tc_part1, test_num32);	\
	}

#endif
