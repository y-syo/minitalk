# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmoussou <mmoussou@student.42angouleme.fr  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/22 07:21:18 by mmoussou          #+#    #+#              #
#    Updated: 2024/01/22 11:42:30 by mmoussou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

LIBFT = ./libft/libft.a

LIBFT_INCLUDE = ./libft/include

all: server client

bonus: all

$(LIBFT):
	make -C libft

server: $(LIBFT)
	gcc s_src/main.c $(LIBFT) -Iinclude -I$(LIBFT_INCLUDE) -o server -g

client: $(LIBFT)
	gcc c_src/main.c $(LIBFT) -Iinclude -I$(LIBFT_INCLUDE) -o client -g

clean:
	make -C libft clean

fclean:
	make -C libft fclean
	rm -rf client
	rm -rf server

re: clean all
