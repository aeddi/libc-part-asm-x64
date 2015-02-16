# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aeddi <aeddi@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2013/11/22 12:06:57 by aeddi             #+#    #+#              #
#    Updated: 2015/02/16 13:48:39 by aeddi            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			=	test
AS				=	nasm
ASFLAGS			=	-f macho64
CC				=	gcc
CFLAGS			=	-Werror -Wextra -Wall -g3
LD				=	ld
LDFLAGS			=	-no_pie -arch x86_64 -macosx_version_min 10.8
LDCFLAGS		=	-lc
OBJS_DIR		=	./objects
SRCS_DIR		=	./sources
OBJS_C			=	$(patsubst %.c, $(OBJS_DIR)/%.o, $(SRCS_C))
SRCS_C			=	test.c
OBJS_AS			=	$(patsubst %.s, $(OBJS_DIR)/%.o, $(SRCS_AS))
SRCS_AS			=	ft_strlen.s

all				:	$(NAME)

$(NAME)			:	$(OBJS_DIR) $(OBJS_C) $(OBJS_AS)
	@$(LD) -o $(NAME) $(LDFLAGS) $(OBJS_C) $(OBJS_AS) $(LDCFLAGS)
	@echo "]   \033[1;32mDone\033[0;0m"

$(OBJS_DIR)/%.o	:	$(addprefix $(SRCS_DIR)/, %.c)
	@$(CC) $(CFLAGS) -o $@ -c $^
	@echo ".\c"

$(OBJS_DIR)/%.o	:	$(addprefix $(SRCS_DIR)/, %.s)
	@$(AS) $(ASFLAGS) -o $@ $^
	@echo ".\c"

$(OBJS_DIR)		:
	@mkdir -p $(OBJS_DIR)
	@echo "\033[1;32mCompiling sources  \033[0;0m[\c"

fclean			:	clean
	@rm -f $(NAME)
	@echo "\033[1;31mCompiled binary deleted\033[0;0m"

clean			:
	@rm -rf $(OBJS_DIR)
	@echo "\033[1;31mObjects deleted\033[0;0m"

re				:	fclean all

.PHONY: clean all re fclean
