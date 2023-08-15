# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lannur-s <lannur-s@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/02 12:46:34 by lannur-s          #+#    #+#              #
#    Updated: 2023/08/15 12:39:41 by lannur-s         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Usage:
#   - Run 'make' to build the $(NAME) target (default)
#   - Run 'make clean' to remove object files
#   - Run 'make fclean' to remove object files and the $(NAME) archive
#   - Run 'make re' to perform a clean build by removing all generated files 
#     and rebuilding the project
#   - Run 'make so' to create a shared library using the object files
#   - Run 'make all' to build the $(NAME) target (same as the default 'make')
#
# Note: Adjust variables $(CC), $(CFLAGS), $(AR), $(ARFLAGS), $(SRCS), $(BONUS)
#       according to project requirements

# Name of the archive
NAME = libft.a

# Compiler options
CC = cc
CFLAGS = -Wall -Wextra -Werror

# Archive options
AR = ar
ARFLAGS = rcs

INCLUDES = -I./includes

# Mandatory source (.c) files
SRCS = sources/conversion/ft_atoi.c \
		sources/conversion/ft_itoa.c \
		sources/ctype/ft_isalnum.c \
		sources/ctype/ft_isalpha.c \
		sources/ctype/ft_isascii.c \
		sources/ctype/ft_isdigit.c \
		sources/ctype/ft_isprint.c \
        sources/ctype/ft_tolower.c \
        sources/ctype/ft_toupper.c \
		sources/io/ft_printf/ft_printf.c \
		sources/io/ft_printf/print_char.c \
		sources/io/ft_printf/print_nbr_base.c \
		sources/io/ft_printf/print_nbr_signed.c \
		sources/io/ft_printf/print_string.c \
		sources/io/get_next_line/get_next_line.c \
		sources/io/get_next_line/get_next_line_utils.c \
		sources/io/ft_putchar_fd.c \
		sources/io/ft_putendl_fd.c \
	   	sources/io/ft_putstr_fd.c \
	    sources/io/ft_putnbr_fd.c \
		sources/linkedlist/ft_lstadd_back.c \
	    sources/linkedlist/ft_lstadd_front.c \
		sources/linkedlist/ft_lstdelone.c \
 		sources/linkedlist/ft_lstiter.c \
		sources/linkedlist/ft_lstlast.c \
		sources/linkedlist/ft_lstmap.c \
	    sources/linkedlist/ft_lstnew.c \
		sources/linkedlist/ft_lstclear.c \
	    sources/linkedlist/ft_lstsize.c \
		sources/memory/ft_bzero.c \
		sources/memory/ft_calloc.c \
	    sources/memory/ft_memchr.c \
	    sources/memory/ft_memcmp.c \
		sources/memory/ft_memcpy.c \
		sources/memory/ft_memmove.c \
		sources/memory/ft_memset.c \
		sources/string/ft_split.c \
	    sources/string/ft_strchr.c \
		sources/string/ft_strdup.c \
		sources/string/ft_striteri.c \
		sources/string/ft_strjoin.c \
		sources/string/ft_strlcat.c \
		sources/string/ft_strlcpy.c \
	    sources/string/ft_strlen.c \
		sources/string/ft_strmapi.c \
	    sources/string/ft_strncmp.c \
	    sources/string/ft_strnstr.c \
	    sources/string/ft_strrchr.c \
		sources/string/ft_strtrim.c \
		sources/string/ft_substr.c \

# Variable assignment with pattern substitution:
# Generate a list of object files 
# by replacing the ".c" extension with ".o" for each source file
OBJS = $(SRCS:%.c=%.o)

# Target rule: $(NAME)
# Builds the final archive by linking object files 
# $(OBJS)
$(NAME): $(OBJS) 
	@echo "Linking $@"
	$(AR) $(ARFLAGS) $(NAME) $(OBJS)
	@echo "Done!"

# Pattern rule: %.o
# Generic rule to compile source files to object files.
# Uses the compiler $(CC) with flags $(CFLAGS) to compile 
# the source file ($<) and produce the object file ($@)
%.o: %.c
	$(CC) $(CFLAGS) -c $(INCLUDES) $< -o $@
	
# Target rule: all
# Builds the default target $(NAME) by invoking the target $(NAME)
all: $(NAME)

# Target rule: clean
# Removes object files $(OBJS) and $(BONUSOBJS) 
# from the current directory
clean:
	rm -f $(OBJS)

# Target rule: fclean
# Removes object files $(OBJS) and $(BONUSOBJS), 
# and the archive $(NAME) from the current directory
# Calls the target 'clean' to remove object files first	
fclean: clean
	rm -f $(NAME)

# Target rule: re
# Performs a clean build by removing all generated files 
# (object files and the archive) and rebuilding the project 
# from scratch by invoking the targets 'fclean' and 'all'
re: fclean all

# Target rule: .PHONY
# Specifies phony targets that do not represent actual files.
# 'all', 'clean', 'fclean', and 're' are marked as phony targets.
# This prevents conflicts if there are files with the same names.
.PHONY: all clean fclean re
