CXX      = g++
DEBUG    = -g
CXXFLAGS = -Werror -Wall -I.
LDFLAGS  = -shared
LINK     = $(CXX)

TARGET = libgoban.so
OBJS = goban.o
SRCS = goban.c

.SUFFIXES: .o .c

all: $(OBJS)
	$(LINK) $(LDFLAGS) $(OBJS) -o $(TARGET)

%.o: %.c
	$(CXX) $(CXXFLAGS) $(DEBUG) -c $< -o $@

install: ${TARGET}
	sudo cp ${TARGET} /usr/local/lib	
	sudo cp goban.h /usr/local/include	

clean:
	rm -f ${OBJS} 2> /dev/null
	rm -f $(TARGET) 2> /dev/null
