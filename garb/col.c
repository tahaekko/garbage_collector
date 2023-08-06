/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   col.c                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: msamhaou <msamhaou@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/08/06 17:44:43 by msamhaou          #+#    #+#             */
/*   Updated: 2023/08/06 19:08:15 by msamhaou         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "col.h"

void	ft_free_node(t_collector *node)
{
	free(node);
}
void	ft_free_collector(t_collector **node)
{
	t_collector	*tmp;

	while (*node)
	{
		tmp = (*node)->next;
		free(*node);
		*node = tmp;
	}
}

void	ft_free_addr(t_collector *list)
{
	while (list)
	{
		printf("freed %p\n", list->addr);
		free(list->addr);
	}
}

t_collector	*ft_lastlst_collector(t_collector *lst)
{
	if (!lst)
		return (NULL);
	while (lst->next != NULL)
		lst = lst->next;
	return (lst);
}

void	ft_collector_add_back(t_collector **list, t_collector *new_node)
{
	t_collector	*last;

	if (!*list)
	{
		*list = new_node;
		return ;
	}
	last = ft_lastlst_collector(*list);
	last->next = new_node;
}

void	*c_malloc(size_t size, t_collector **list)
{
	void	*ret;

	ret = malloc(sizeof(size));
	printf("add %p\n", ret);
	// if (!ret)
	// 	ft_free_list(list);
	ft_collector_add_back(list, ft_new_collector(ret, list));
	return (ret);
}

t_collector	*ft_new_collector(void	*addr, t_collector **list)
{
	t_collector	*node;

	node = malloc(sizeof(t_collector));
	node->addr = addr;
	node->next = NULL;
	return (node);
}
