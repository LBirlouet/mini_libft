# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lbirloue <lbirloue@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/21 15:54:36 by lbirloue          #+#    #+#              #
#    Updated: 2024/03/21 17:48:53 by lbirloue         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC				=	gcc
CFLAGS			=	-Wall -Wextra -Werror
INCLUDES_LIBFT	=	-I libft.h
INCLUDES_PRINTF	=	-I ft_printf.h
INCLUDES_GNL	=	-I get_next_line.h

SRCS_LIBFT		=	srcs_libft/ft_atoi.c \
					srcs_libft/ft_isascii.c \
					srcs_libft/ft_isalpha.c \
					srcs_libft/ft_isdigit.c \
					srcs_libft/ft_isprint.c \
					srcs_libft/ft_memchr.c \
					srcs_libft/ft_memcmp.c \
					srcs_libft/ft_memcpy.c \
					srcs_libft/ft_memmove.c \
					srcs_libft/ft_memset.c \
					srcs_libft/ft_strchr.c \
					srcs_libft/ft_strdup.c \
					srcs_libft/ft_strlcat.c \
					srcs_libft/ft_strlcpy.c \
					srcs_libft/ft_strlen.c \
					srcs_libft/ft_strncmp.c \
					srcs_libft/ft_strnstr.c \
					srcs_libft/ft_strrchr.c \
					srcs_libft/ft_tolower.c \
					srcs_libft/ft_toupper.c \
					srcs_libft/ft_substr.c \
					srcs_libft/ft_strjoin.c \
					srcs_libft/ft_split.c \
					srcs_libft/ft_itoa.c \
					srcs_libft/ft_striteri.c \
					srcs_libft/ft_putchar_fd.c \
					srcs_libft/ft_putstr_fd.c \
					srcs_libft/ft_putendl_fd.c \
					srcs_libft/ft_putnbr_fd.c \

SRCS_PRINTF		=	srcs_ft_printf/flags.c \
					srcs_ft_printf/utils_ft_printf.c \
					srcs_ft_printf/flag_X.c \
					srcs_ft_printf/flag_xx.c \
					srcs_ft_printf/flag_di.c \
					srcs_ft_printf/flag_u.c \
					srcs_ft_printf/flag_p.c \
					srcs_ft_printf/counters.c \
					srcs_ft_printf/ft_printf.c \

SRCS_GNL		=	srcs_gnl/get_next_line_utils.c \
					srcs_gnl/get_next_line.c \


OBJ_DIR			=	objects

OBJS_LIBFT		=	$(addprefix $(OBJ_DIR)/, $(SRCS_LIBFT:.c=.o))
OBJS_PRINTF		=	$(addprefix $(OBJ_DIR)/, $(SRCS_PRINTF:.c=.o))
OBJS_GNL		=	$(addprefix $(OBJ_DIR)/, $(SRCS_GNL:.c=.o))


LIBFT			=	libft.a
PRINTF			=	ft_printf.a
GNL				=	gnl.a

all : $(OBJ_DIR) $(LIBFT) $(PRINTF) $(GNL)

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

$(LIBFT): $(OBJS_LIBFT)
	ar -rcs $(LIBFT) $(OBJS_LIBFT)

$(PRINTF): $(OBJS_PRINTF)
	ar -rcs $(PRINTF) $(OBJS_PRINTF)

$(GNL): $(OBJS_GNL)
	ar -rcs $(GNL) $(OBJS_GNL)

${OBJ_DIR}/%.o : %.c 
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) $(INCLUDES_LIBFT) $(INCLUDES_PRINTF) $(INCLUDES_GNL) -c $< -o $@

libft: $(LIBFT)

gnl: $(GNL)

printf: $(PRINTF)

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(LIBFT) $(PRINTF) $(GNL)

re: fclean all

.PHONY: all clean fclean re libft printf gnl