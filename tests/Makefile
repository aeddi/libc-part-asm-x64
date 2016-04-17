# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aeddi <aeddi@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2013/11/22 12:06:57 by aeddi             #+#    #+#              #
#    Updated: 2016/04/17 23:23:15 by plastic          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			=	run_test

CC				=	gcc
CFLAGS			=	-I $(CURDIR)/check/include -I $(CURDIR)/../includes -I $(CURDIR)/includes
LFLAGS			=	-L $(CURDIR)/.. -lfts -L $(CURDIR)/check/lib -lcheck -Wl,-rpath,$(CURDIR)/check/lib

OBJS_DIR		=	./objects
SRCS_DIR		=	./sources
OBJS	 		=	$(patsubst %.c, $(OBJS_DIR)/%.o, $(SRCS))
SRCS			=	test.c				\
					part1_bzero.c		\
					part1_strcat.c		\
					part1_isalpha.c		\
					part1_isdigit.c		\
					part1_isalnum.c		\
					part1_isascii.c		\
					part1_isprint.c		\
					part1_toupper.c		\
					part1_tolower.c		\
					part1_puts.c		\
					part2_strlen.c		\
					part2_memset.c		\
					part2_memcpy.c		\
					part2_strdup.c		\
					part3_cat.c			\
					part4_labs.c		\
					part4_llabs.c		\
					part4_isupper.c		\
					part4_islower.c		\
					part4_putchar_fd.c	\
					part4_putnbr_fd.c	\
					part4_strcmp.c

LIBS			=	$(CURDIR)/check/lib/libcheck.so

all				:	$(NAME)
	./$(NAME)

$(NAME)			:	$(OBJS_DIR) $(LIBS) $(OBJS)
	@printf "Building: $(NAME)\n"
	@$(CC) -o $(NAME) $(OBJS) $(LFLAGS)

$(OBJS_DIR)/%.o	:	$(addprefix $(SRCS_DIR)/, %.c)
	@printf "Compiling: $@\n"
	@$(CC) $(CFLAGS) $(LFLAGS) -o $@ -c $^

$(OBJS_DIR)		:
	@mkdir -p $(OBJS_DIR)

$(LIBS)			:
	@printf "Building: CUnit lib\n"
	@(cd check && tar xvf check-0.10.0.tar.gz	\
		&& cd check-0.10.0 && ./configure --prefix=`pwd`/..	\
		&& make && make install)

fclean			:	clean
	@rm -f $(NAME)
	@printf "Deleting: $(NAME)\n"

clean			:
	@rm -rf $(OBJS_DIR)
	@printf "Deleting: $(OBJS_DIR)\n"

re				:	fclean all

.PHONY: clean all re fclean
