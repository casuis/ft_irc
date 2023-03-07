SRCDIR 		= ./srcs
SRCS     	= $(shell find $(SRCDIR) -name "*.cpp")
OBJS		= $(SRCS:.cpp=.o)
CXX			=  c++
CXXFLAGS	= -Wall -Wextra -Werror -std=c++98 -g3 #-fsanitize=address 
INCLUDES 	= $(shell find . -type f -name "*.hpp" | cut -c 3-)
NAME		= ircserv

###################################################

all			: $(NAME)

###################################################

%.o			: %.cpp $(INCLUDES)
	@$(CXX) $(CXXFLAGS) -c $< -o $@

###################################################

$(NAME)		: $(OBJS) $(INCLUDES)
	@$(CXX) $(CXXFLAGS) -o $(NAME) $(OBJS)
	@make  --no-print-director print

####################################################

clean		:
	@rm -rf $(OBJS)

####################################################

fclean		: clean
	@rm -rf $(NAME)

####################################################

re			: fclean all

####################################################

.PHONY: all clean fclean re print other

####################################################

print:
	@my_string="─────────────────────────────────────────────────────────────────────────────── \n \
─██████████████─██████████████────██████████─████████████████───██████████████─ \n \
─██░░░░░░░░░░██─██░░░░░░░░░░██────██░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░░░░░██─ \n \
─██░░██████████─██████░░██████────████░░████─██░░████████░░██───██░░██████████─ \n \
─██░░██─────────────██░░██──────────██░░██───██░░██────██░░██───██░░██───────── \n \
─██░░██████████─────██░░██──────────██░░██───██░░████████░░██───██░░██───────── \n \
─██░░░░░░░░░░██─────██░░██──────────██░░██───██░░░░░░░░░░░░██───██░░██───────── \n \
─██░░██████████─────██░░██──────────██░░██───██░░██████░░████───██░░██───────── \n \
─██░░██─────────────██░░██──────────██░░██───██░░██──██░░██─────██░░██───────── \n \
─██░░██─────────────██░░██────────████░░████─██░░██──██░░██████─██░░██████████─ \n \
─██░░██─────────────██░░██────────██░░░░░░██─██░░██──██░░░░░░██─██░░░░░░░░░░██─ \n \
─██████─────────────██████────────██████████─██████──██████████─██████████████─ \n \
─────────────────────────────────────────────────────────────────────────────── \n" ; \
 echo "$$my_string" | awk '{ print "\033[38;5;"NR"m"$$0"\033[0m" }'

####################################################

free_port:
	@netstat -an | grep LISTEN | awk '{print $$4}' | awk -F ":" '{print $$NF}' | sort -n | uniq


#  🚧 ==> progress 
#  💥 ==> crash
#  🏆 == > success
#  📌 ==> immportant part
#  💡 ==> propose an idea
#  📚 ==> brief

##########################################################