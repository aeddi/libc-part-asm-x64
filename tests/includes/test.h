/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.h                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aeddi <aeddi@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/04/16 13:30:07 by aeddi             #+#    #+#             */
/*   Updated: 2016/04/17 23:19:08 by plastic          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef TEST_H
# define TEST_H

# include <check.h>
# include <stdlib.h>
# include "../includes/libfts.h"

void	tc_bzero(TCase *tc_part1);
void	tc_strcat(TCase *tc_part1);
void	tc_isalpha(TCase *tc_part1);
void	tc_isdigit(TCase *tc_part1);
void	tc_isalnum(TCase *tc_part1);
void	tc_isascii(TCase *tc_part1);
void	tc_isprint(TCase *tc_part1);
void	tc_toupper(TCase *tc_part1);
void	tc_tolower(TCase *tc_part1);
void	tc_puts(TCase *tc_part1);

void	tc_strlen(TCase *tc_part2);
void	tc_memset(TCase *tc_part2);
void	tc_memcpy(TCase *tc_part2);
void	tc_strdup(TCase *tc_part2);

void	tc_cat(TCase *tc_part3);

void	tc_labs(TCase *tc_part4);
void	tc_llabs(TCase *tc_part4);
void	tc_isupper(TCase *tc_part4);
void	tc_islower(TCase *tc_part4);
void	tc_putchar_fd(TCase *tc_part4);
void	tc_putnbr_fd(TCase *tc_part4);
void	tc_strcmp(TCase *tc_part4);

#endif
