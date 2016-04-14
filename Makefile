# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aeddi <aeddi@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2013/11/22 12:06:57 by aeddi             #+#    #+#              #
#    Updated: 2016/04/15 01:02:24 by plastic          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			=	libfts.a

AS				=	nasm
ifeq ($(UNAME), Darwin)
	ASFLAGS		=	-f macho64 --prefix _
else
	ASFLAGS		=	-f elf64
endif

AR				=	ar
ARFLAGS			=	rcs

OBJS_DIR		=	./objects
SRCS_DIR		=	./sources
OBJS_AS			=	$(patsubst %.s, $(OBJS_DIR)/%.o, $(SRCS_AS))
SRCS_AS			=	ft_toupper.s	\
					ft_tolower.s	\
					ft_strlen.s

all				:	$(NAME)

$(NAME)			:	$(OBJS_DIR) $(OBJS_AS)
	@$(AR) $(ARFLAGS) $(NAME) $(OBJS_AS)
	@echo "]   \033[1;32mDone\033[0;0m"

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
