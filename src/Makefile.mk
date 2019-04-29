ZOOKEEPER_DIR = /home/lab/zookeeper/include
ZOOKEEPER_LIB = /home/lab/zookeeper/lib/
CC = g++
AR = ar
CCFLAGS = -I${ZOOKEEPER_DIR} -g -L${ZOOKEEPER_LIB}
LDFLAGS =

OBJS = ZooKeeper.o
LIB = libcppzk.a

all: ${LIB} test

%.o:%.cc %.h
	${CC} -o $@ -c $< ${CCFLAGS} 

${LIB}:${OBJS}
	${AR} rv $@ ${OBJS} 

test.o: test.cc
	${CC} -o $@ -c $< ${CCFLAGS} 
test: test.o 
	${CC} -o test test.o -lcppzk -lzookeeper_mt -pthread  ${CCFLAGS} -L.
clean:
	rm -f ${OBJS} ${LIB} *.o
