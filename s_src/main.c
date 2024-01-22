/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mmoussou <mmoussou@student.42angouleme.fr  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/22 07:25:00 by mmoussou          #+#    #+#             */
/*   Updated: 2024/01/22 11:26:44 by mmoussou         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

static t_char	g_c;

void	print(int signum)
{
	if (g_c.bits == 7)
	{
		if (!((g_c.c << 1) + (signum == SIGUSR2)))
			ft_printf("\n");
		else
			ft_printf("%c", (g_c.c << 1) + (signum == SIGUSR2));
		g_c.c = 0;
		g_c.bits = 0;
	}
	else if (signum == SIGUSR1)
	{
		g_c.c = g_c.c << 1;
		g_c.bits++;
	}
	else if (signum == SIGUSR2)
	{
		g_c.c = (g_c.c << 1) + 1;
		g_c.bits++;
	}
}

int	main(void)
{
	int																		pid;

	g_c.c = 0;
	g_c.bits = 0;
	pid = getpid();
	ft_printf("PID : %d\n", pid);
	signal(SIGUSR1, print);
	signal(SIGUSR2, print);
	while (!(char *) NULL)
		(void) NULL;
}
