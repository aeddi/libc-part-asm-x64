# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aeddi <aeddi@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2013/11/22 12:06:57 by aeddi             #+#    #+#              #
#    Updated: 2015/02/02 11:58:17 by aeddi            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			=	libfts.a
AS				=	nasm
CFLAGS			=	-f macho64
AR				=	ar
ARFLAGS			=	rc
INCS_DIR		=	./includes
OBJS_DIR		=	./objects
SRCS_DIR		=	./sources
OBJS			=	$(patsubst %.as, $(OBJS_DIR)/%.o, $(SRCS))
SRCS			=	

all				:	$(NAME)

$(NAME)			:	$(OBJS_DIR) $(OBJS)
	@$(AR) $(ARFLAGS) $(NAME) $(OBJS)
	@echo "]   \033[1;32mDone\033[0;0m"

$(OBJS_DIR)/%.o	:	$(addprefix $(SRCS_DIR)/, %.c)
	@$(CC) $(CFLAGS) -o $@ -c $^
	@echo ".\c"

$(OBJS_DIR)		:
	@mkdir -p $(OBJS_DIR)
	@echo "\033[1;32mCompiling libft   \033[0;0m[\c"

fclean			:	clean
	@rm -f $(NAME)
	@echo "\033[1;31mCompiled libft deleted\033[0;0m"

clean			:
	@rm -rf $(OBJS_DIR)
	@echo "\033[1;31mObjects deleted\033[0;0m"

re				:	fclean all

.PHONY: clean all re fclean
