# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nchow-yu <nchow-yu@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/25 18:56:16 by nchow-yu          #+#    #+#              #
#    Updated: 2021/12/15 18:33:23 by nchow-yu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ifneq (,$(findstring xterm,${TERM}))
	RED          := $(shell tput -Txterm setaf 1)
	WHITE        := $(shell tput -Txterm setaf 7)
	RESET := $(shell tput -Txterm sgr0)
else
	RED          := ""
	WHITE        := ""
	RESET        := ""
endif


SRCS	=	ft_strlen.c ft_strnstr.c ft_bzero.c ft_calloc.c ft_isascii.c \
				ft_memmove.c ft_strlcpy.c ft_substr.c ft_isdigit.c ft_memset.c ft_strlen.c \
				ft_tolower.c ft_bzero.c ft_isprint.c ft_strchr.c ft_strncmp.c ft_toupper.c \
				ft_calloc.c ft_memchr.c ft_strdup.c ft_strnstr.c ft_atoi.c ft_isalnum.c \
				ft_memcmp.c ft_strjoin.c ft_strrchr.c ft_isalpha.c ft_memcpy.c ft_strlcat.c \
				ft_strtrim.c ft_putchar_fd.c ft_putnbr_fd.c ft_split.c ft_itoa.c ft_strmapi.c \
				ft_striteri.c ft_putstr_fd.c ft_putendl_fd.c
BONUS	=	ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c ft_lstadd_back.c ft_lstdelone.c \
				ft_lstclear.c ft_lstiter.c ft_lstmap.c
OBJS	= 	${SRCS:.c=.o}
OBJSBONUS	=	${BONUS:.c=.o}
CC		=	gcc
CFLAGS	= 	-Wall -Wextra -Werror
NAME	=	libft.a

all:	${OBJS} ${OBJSBONUS} ${NAME}

%.o:	%.c
	${CC} -o $@ -c $< ${CFLAGS}

${NAME}:	title ${OBJS} ${OBJSBONUS}
	ar rcs ${NAME} ${OBJS} ${OBJSBONUS}

bonus:	${OBJS} ${OBJSBONUS}
	ar rcs ${NAME} ${OBJS} ${OBJSBONUS}

clean:
	rm -f ${OBJS} ${OBJSBONUS}

fclean:    clean
	rm -f ${NAME}

re:	fclean ${NAME}

title:
	@echo "${RED}nchow-yu - Nicole CHOW-YUEN-MIN"
	@echo "${WHITE}Libft"
	@echo "${RESET}"

.PHONY:	all clean fclean re
