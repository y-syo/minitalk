# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmoussou <mmoussou@student.42angouleme.fr  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/22 07:21:18 by mmoussou          #+#    #+#              #
#    Updated: 2024/01/22 12:59:34 by mmoussou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

LIBFT = ./libft/libft.a

LIBFT_INCLUDE = ./libft/include

all: server client

bonus: all

$(LIBFT):
	make -C libft

server: $(LIBFT)
	gcc -Wall -Wextra -Werror s_src/main.c $(LIBFT) -Iinclude -I$(LIBFT_INCLUDE) -o server -g

client: $(LIBFT)
	gcc -Wall -Wextra -Werror c_src/main.c $(LIBFT) -Iinclude -I$(LIBFT_INCLUDE) -o client -g

clean:
	make -C libft clean

fclean:
	make -C libft fclean
	rm -rf client
	rm -rf server

re: fclean all
