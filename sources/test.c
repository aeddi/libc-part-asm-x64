/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aeddi <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/02/02 16:45:56 by aeddi             #+#    #+#             */
/*   Updated: 2015/02/16 13:59:40 by aeddi            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

int ft_strlen(char *str);

int main(void)
{
	size_t i = 1844674407370955161;
	char *test = malloc(sizeof(char) * i);

	strcat(test, start);

	while (i--)
		test = strcat(test, test);
	/* printf("%d / %lu\n", ft_strlen(test), strlen(test)); */
	printf("%lu\n", strlen(test));
	return 0;
}
