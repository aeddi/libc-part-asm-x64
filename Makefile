# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aeddi <aeddi@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2013/11/22 12:06:57 by aeddi             #+#    #+#              #
#    Updated: 2016/04/17 23:19:52 by plastic          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			=	libfts.a

AS				=	nasm
ifeq ($(UNAME), Darwin)
	ASFLAGS		=	-f macho64 -D DARWIN=1 --prefix _
else
	ASFLAGS		=	-f elf64 -D LINUX=1
endif

AR				=	ar
ARFLAGS			=	rcs

OBJS_DIR		=	./objects
SRCS_DIR		=	./sources
OBJS_AS			=	$(patsubst %.s, $(OBJS_DIR)/%.o, $(SRCS_AS))
SRCS_AS			=	ft_bzero.s		\
					ft_strcat.s		\
					ft_isalpha.s	\
					ft_isdigit.s	\
					ft_isalnum.s	\
					ft_isascii.s	\
					ft_isprint.s	\
					ft_toupper.s	\
					ft_tolower.s	\
					ft_puts.s		\
									\
					ft_strlen.s		\
					ft_memset.s		\
					ft_memcpy.s		\
					ft_strdup.s		\
									\
					ft_cat.s		\
									\
					ft_labs.s		\
					ft_llabs.s		\
					ft_islower.s	\
					ft_isupper.s	\
					ft_putchar_fd.s	\
					ft_putnbr_fd.s	\
					ft_strcmp.s

PROC_COL		=	\033[1;34m
DELT_COL		=	\033[1;31m
DONE_COL		=	\033[1;32m
BOLD_COL		=	\033[1;39m
BASE_COL		=	\033[0m

all				:	$(NAME)
	@printf "$(DONE_COL) Building done $(BASE_COL)\n"

test			: 	$(NAME)
	@$(MAKE) -C tests re

$(NAME)			:	$(OBJS_DIR) $(OBJS_AS)
	@printf "$(PROC_COL) Building: $(BOLD_COL) $(NAME) $(BASE_COL)\n"
	@$(AR) $(ARFLAGS) $(NAME) $(OBJS_AS)

$(OBJS_DIR)/%.o	:	$(addprefix $(SRCS_DIR)/, %.s)
	@printf "$(PROC_COL) Compiling: $(BOLD_COL) $@ $(BASE_COL)\n"
	@$(AS) $(ASFLAGS) -o $@ $^

$(OBJS_DIR)		:
	@mkdir -p $(OBJS_DIR)

fclean			:	clean
	@rm -f $(NAME)
	@printf "$(DELT_COL) Deleting: $(BOLD_COL) $(NAME) $(BASE_COL)\n"

clean			:
	@rm -rf $(OBJS_DIR)
	@printf "$(DELT_COL) Deleting: $(BOLD_COL) $(OBJS_DIR) $(BASE_COL)\n"

re				:	fclean all

.PHONY: clean all re fclean
