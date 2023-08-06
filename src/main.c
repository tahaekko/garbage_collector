/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: msamhaou <msamhaou@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/08/06 17:44:43 by msamhaou          #+#    #+#             */
/*   Updated: 2023/08/06 19:07:42 by msamhaou         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "col.h"

int	main()
{
	t_collector *col;

	col = NULL;
	char	*lol;

	lol = c_malloc(sizeof(char) * (ft_strlen("lol")+ 1), &col);
	printf("%p\n", col);
	int *k = c_malloc(sizeof(int) * 5, &col);

	for(int i = 0; col; col = col->next)
		printf("sure %p\n", col->addr);

	ft_free_addr(col);
}
