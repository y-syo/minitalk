/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mmoussou <mmoussou@student.42angouleme.fr  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/22 08:10:51 by mmoussou          #+#    #+#             */
/*   Updated: 2024/01/22 13:01:40 by mmoussou         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

static char	g_uwu_g;

int	check_pid(const char *str)
{
	int	i;

	i = 0;
	while (str[i])
	{
		if (str[i] < '0' || str[i] > '9')
			return (0);
		i++;
	}
	return (1);
}

void	send_char(char c, int pid)
{
	int	i;

	i = 0;
	while (i < 8)
	{
		if (128 & (c << i))
			kill(pid, SIGUSR2);
		else
			kill(pid, SIGUSR1);
		i++;
		usleep(727);
	}
}

void	ft_exit(int signum)
{
	if (signum == SIGUSR1)
	{
		ft_printf("uwu :3");
		g_uwu_g = 0;
	}
}

int	main(int argc, char **argv)
{
	int		pid;
	int		i;

	g_uwu_g = 17;
	signal(SIGUSR1, ft_exit);
	if (argc != 3)
		return (-1);
	if (check_pid(argv[1]))
		pid = ft_atoi(argv[1]);
	else
		return (-1);
	i = 0;
	while (argv[2][i])
	{
		send_char(argv[2][i], pid);
		i++;
	}
	send_char(0, pid);
	while (g_uwu_g)
		;
}
