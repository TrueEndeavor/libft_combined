/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line_utils.c                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lannur-s <lannur-s@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/23 11:52:46 by lannur-s          #+#    #+#             */
/*   Updated: 2023/07/27 13:09:45 by lannur-s         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"

size_t	ft_strlen(const char *s)
{
	const char	*p;

	if (!s)
		return (0);
	p = s;
	while (*p != '\0')
		p++;
	return (p - s);
}

void	*ft_calloc(size_t nmemb, size_t size)
{
	void	*new;
	char	*xnew;
	size_t	total;

	total = nmemb * size;
	if (nmemb == 0 || size == 0)
		return (malloc(0));
	if (size != 0 && total / size != nmemb)
		return (NULL);
	new = (void *) malloc(total);
	if (new == NULL)
		return (NULL);
	xnew = (char *)new;
	while (total--)
		*xnew++ = (char)0;
	return (new);
}

char	*ft_strchr(const char *s, int c)
{
	while (*s && *s != (char)c)
		s++;
	if (*s == (char)c)
	{
		return ((char *) s);
	}
	return (NULL);
}

char	*ft_strjoin(char const *s1, char const *s2)
{
	char	*dst;
	int		i;
	int		j;
	size_t	total;

	i = 0;
	total = ft_strlen(s1) + ft_strlen(s2);
	dst = malloc(total + 1 * sizeof(char));
	if (dst == NULL || !s1 || !s2)
		return (NULL);
	while (s1[i] != 0)
	{
		dst[i] = s1[i];
		i++;
	}
	j = 0;
	while (s2[j] != 0)
	{
		dst[i] = s2[j];
		i++;
		j++;
	}
	dst[total] = 0;
	return (dst);
}
