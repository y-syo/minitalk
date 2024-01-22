/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mmoussou <mmoussou@student.42angouleme.fr  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/22 07:25:00 by mmoussou          #+#    #+#             */
/*   Updated: 2024/01/22 13:03:05 by mmoussou         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

static t_char	g_c;

void	print(int signum, siginfo_t *info, void *context)
{
	(void) context;
	if (g_c.bits == 7)
	{
		if (!((g_c.c << 1) + (signum == SIGUSR2)))
		{
			ft_printf("\n");
			kill(info->si_pid, SIGUSR1);
		}
		else
			ft_printf("%c", (g_c.c << 1) + (signum == SIGUSR2));
		g_c.c = 0;
		g_c.bits = 0;
	}
	else
	{
		if (signum == SIGUSR1)
			g_c.c = g_c.c << 1;
		else if (signum == SIGUSR2)
			g_c.c = (g_c.c << 1) + 1;
		g_c.bits++;
	}
}

int	main(void)
{
	int																		pid;
	struct sigaction														sa;

	sigemptyset(&sa.sa_mask);
	sa.sa_flags = SA_SIGINFO;
	sa.sa_sigaction = print;
	sigaction(SIGUSR1, &sa, NULL);
	sigaction(SIGUSR2, &sa, NULL);
	g_c.c = 0;
	g_c.bits = 0;
	pid = getpid();
	ft_printf("PID : %d\n", pid);
	while (!(char *) NULL)
		(void) NULL;
}
