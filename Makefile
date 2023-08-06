# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: msamhaou <msamhaou@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/21 17:25:24 by msamhaou          #+#    #+#              #
#    Updated: 2023/08/06 19:41:34 by msamhaou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =t
CC = cc
CFLAGS =

ifeq ($(shell uname), Linux)
	MLX_FLAGS =
	MLX_DIR = minilibx-linux/
	MLX_LINK = -L/usr/lib/
	MLX_INC = -I/usr/include
else
	MLX_FLAGS =
	MLX_DIR =
	MLX_LINK =
	MLX_INC = -I /usr/local/include
endif


OBJ_DIR = obj/

#*****************GNL*****************

GARB_SRC = col.c
GARB_DIR = garb/
GARB_OBJ_FILE = $(GARB_SRC:.c=.o)
GARB_OBJ = $(addprefix $(OBJ_DIR), $(GARB_OBJ_FILE))

#****************LIBFT****************
LIBFT_SRC =	ft_strlen.c ft_putendl_fd.c ft_putstr_fd.c ft_putchar_fd.c ft_strjoin.c ft_strdup.c ft_memcpy.c ft_strlcpy.c\
			ft_itoa.c ft_strncmp.c ft_substr.c ft_atoi.c ft_split.c ft_strchr.c
LIBFT_DIR =	libft/
LIBFT_OBJ_FILE = $(LIBFT_SRC:.c=.o)
LIBFT_OBJ = $(addprefix $(OBJ_DIR), $(LIBFT_OBJ_FILE))


#*****************SRC*****************
SRC_DIR = src/
SRC = main.c
FSRC = $(addprefix $(SRC_DIR), $(SRC))

OBJ = $(SRC:.c=.o)
FOBJ = $(addprefix $(OBJ_DIR), $(OBJ))

all : $(NAME)

$(NAME): $(OBJ_DIR) $(LIBFT_OBJ) $(GARB_OBJ) $(FOBJ)
	${CC} $(CFLAGS) -o $(NAME) $(LIBFT_OBJ) $(GARB_OBJ) $(FOBJ)

$(OBJ_DIR) :
	mkdir -p $(OBJ_DIR)

$(OBJ_DIR)%.o : $(LIBFT_DIR)%.c
	$(CC) $(CFLAGS) -c $< -o $@ $(MLX_INC) -Iinclude/

$(OBJ_DIR)%.o : $(SRC_DIR)%.c
	$(CC) $(CFLAGS) -c $< -o $@ $(MLX_INC) -Iinclude/

$(OBJ_DIR)%.o : $(GARB_DIR)%.c
	$(CC) $(CFLAGS) -c $< -o $@ $(MLX_INC) -Iinclude/

prog : all
	./$(NAME)
clean :
	rm -rf $(OBJ_DIR)
fclean : clean
	rm -rf $(NAME)
re : fclean all
