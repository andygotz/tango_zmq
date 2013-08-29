
CC = gcc

INCLUDE_DIRS =  -I . -I /usr/local/include 

OBJS_DIR    = obj

LIB_DIRS    = -L /usr/local/lib

CXXFLAGS =  -g $(INCLUDE_DIRS)

LFLAGS =  -g $(LIB_DIRS)  	\
				-l czmq -lzmq

%.o: %.c 
	$(CC) $(CXXFLAGS) -c $< -o $(OBJS_DIR)/$*.o


#-----------------------------------------
#	 Make Entry
#-----------------------------------------
all: clnt svr

svr:	svr.o
	$(CC) $(OBJS_DIR)/svr.o -o svr $(LFLAGS)

clnt:	clnt.o
	$(CC) $(OBJS_DIR)/clnt.o -o clnt $(LFLAGS)


clean:
	rm -f $(OBJS_DIR)/*.o  \
	core

make_obj_dir:
	@mkdir -p obj

	
