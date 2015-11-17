
clangoptions:=-fobjc-arc -fmodules
objs:=

all : main run

%.o : %.m
	clang -c $< $(clangoptions)

run : main
	./main 

build : main
main : main.m $(objs)
	clang -o main $(clangoptions) -framework CoreGraphics -framework Foundation main.m $(objs)

clean :
	$(RM) main
	$(RM) *.o
	$(RM) *.txt
