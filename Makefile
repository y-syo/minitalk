# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmoussou <mmoussou@student.42angouleme.fr  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/22 07:21:18 by mmoussou          #+#    #+#              #
#    Updated: 2024/01/23 15:44:13 by mmoussou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = gcc

LIBFT = ./libft/libft.a

LIBFT_INCLUDE = ./libft/include

CFLAGS = -Wall -Werror -Wextra

INCLUDE = ./include

all: server client

bonus: all

$(LIBFT):
	@make -C libft

server: $(LIBFT)
	@$(CC) $(CFLAGS) s_src/main.c $(LIBFT) -I$(INCLUDE) -I$(LIBFT_INCLUDE) -o server

client: $(LIBFT)
	@$(CC) $(CFLAGS) c_src/main.c $(LIBFT) -I$(INCLUDE) -I$(LIBFT_INCLUDE) -o client

clean:
	@make -C libft clean

fclean:
	@make -C libft fclean
	@rm -rf client
	@rm -rf server

re: fclean all

.PHONY: all bonus server client clean fclean re
