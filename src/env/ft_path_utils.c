/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_path_utils.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lannur-s <lannur-s@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/08/15 13:39:00 by lannur-s          #+#    #+#             */
/*   Updated: 2023/08/15 20:30:34 by lannur-s         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	**extract_paths_from_env(char **envp)
{
	int		i;
	char	**paths;

	i = 0;
	while (envp[i] != NULL)
	{
		if (ft_strncmp(envp[i], "PATH=", 5) == 0)
			paths = ft_split(envp[i] + 5, ':');
		i++;
	}
	return (paths);
}

void	get_shell_command_path(char *path, char *cmd)
{
	char	*file_name;

	file_name = ft_strjoin(path, cmd);
	if (access(file_name, F_OK) == 0) 
	{
		printf("File %s exists\n", file_name);
	}
	else
	{
		printf("File does not exist or access error. %s", file_name);
	}

}
