/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aeddi <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/02/02 16:45:56 by aeddi             #+#    #+#             */
/*   Updated: 2015/02/17 14:05:09 by aeddi            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

size_t ft_strlen(char *str);

int main(void)
{
	size_t i = 2147;
	size_t i2 = 0;
	char *test = malloc(i + 1);

	while (i2  < i) {
		test[i2] = 'a';
		i2++;
	}
	test[i2] = 0;

	printf("%lu /  %lu\n", strlen(test), ft_strlen(test));
	return 0;
}
