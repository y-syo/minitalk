# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmoussou <mmoussou@student.42angouleme.fr  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/22 07:21:18 by mmoussou          #+#    #+#              #
#    Updated: 2024/01/28 17:48:11 by mmoussou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SHELL = bash

CC = gcc

LIBFT_DIR = libft

LIBFT = $(LIBFT_DIR)/libft.a

LIBFT_INCLUDE = $(LIBFT_DIR)/include

CFLAGS = -Wall -Werror -Wextra

INCLUDE = include

C_NAME = client

C_SRC = c_src/main.c

S_NAME = server

S_SRC = s_src/main.c

define MINITALK_BANNER
\x1B[0;35m

███╗   ███╗██╗███╗   ██╗██╗████████╗ █████╗ ██╗     ██╗  ██╗
████╗ ████║██║████╗  ██║██║╚══██╔══╝██╔══██╗██║     ██║ ██╔╝
██╔████╔██║██║██╔██╗ ██║██║   ██║   ███████║██║     █████╔╝ 
██║╚██╔╝██║██║██║╚██╗██║██║   ██║   ██╔══██║██║     ██╔═██╗ 
██║ ╚═╝ ██║██║██║ ╚████║██║   ██║   ██║  ██║███████╗██║  ██╗
╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝

\x1B[0m
endef

export MINITALK_BANNER

all: banner $(S_NAME) $(C_NAME)

banner:
	@printf "\x1B[2J\x1B[H"
	@printf "$$MINITALK_BANNER"

$(LIBFT_DIR):
	@git clone https://github.com/y-syo/libft $(LIBFT_DIR)
	@printf " \x1B[1;34m[  ]\x1B[0m Cloned Libft.\n"

$(LIBFT): $(LIBFT_DIR)
	@make --silent -C $(LIBFT_DIR)

$(C_NAME): $(LIBFT)
	@printf " \x1B[1;36m[ 󱉟 ]\x1B[0m Compiling Client..."
	@$(CC) $(CFLAGS) $(C_SRC) $(LIBFT) -I$(INCLUDE) -I$(LIBFT_INCLUDE) -o $(C_NAME)
	@printf "\x1B[2K\r \x1B[1;36m[ 󱉟 ]\x1B[0m Client Compiled.\n"

$(S_NAME): $(LIBFT)
	@printf " \x1B[1;35m[ 󱉟 ]\x1B[0m Compiling Server..."
	@$(CC) $(CFLAGS) $(S_SRC) $(LIBFT) -I$(INCLUDE) -I$(LIBFT_INCLUDE) -o $(S_NAME)
	@printf "\x1B[2K\r \x1B[1;35m[ 󱉟 ]\x1B[0m Server Compiled.\n"

clean:
	@make --silent -C $(LIBFT_DIR) clean

fclean:
	@make --silent -C $(LIBFT_DIR) fclean
	@rm -f $(S_NAME)
	@printf " \x1B[1;31m[  ]\x1B[0m Deleted Server.\n"
	@rm -f $(C_NAME)
	@printf " \x1B[1;31m[  ]\x1B[0m Deleted Client.\n"

re: banner fclean $(S_NAME) $(C_NAME)

.PHONY: all banner server clean fclean re
