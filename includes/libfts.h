/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libfts.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aeddi <aeddi@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2014/12/05 18:58:31 by aeddi             #+#    #+#             */
/*   Updated: 2016/04/17 23:37:03 by plastic          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFTS_H
# define LIBFTS_H

# include <stdlib.h>

// Part 1
void		ft_bzero(void *s, int n);
char		*ft_strcat(char *s1, char *s2);
int			ft_isalpha(int i);
int			ft_isdigit(int i);
int			ft_isalnum(int i);
int			ft_isascii(int i);
int			ft_isprint(int i);
int			ft_toupper(int c);
int			ft_tolower(int c);
int			ft_puts(const char *s);;

// Part 2
size_t		ft_strlen(char *s);
void		*ft_memset(void *s, int c, int n);
void		*ft_memcpy(void *dst, void *src, size_t n);
char		*ft_strdup(char *s);

// Part 3
void		ft_cat(int fd);

// Part bonus
long int	ft_labs(long int i);
long long 	ft_llabs(long long i);
int			ft_isupper(int c);
int			ft_islower(int c);
void		ft_putchar_fd(char c, int fd);
void		ft_putnbr_fd(int n, int fd);
int			ft_strcmp(const char *s1, const char *s2);

#endif
