
clangoptions:=-fobjc-arc -fmodules
objs:=


%.o : %.m
	clang -c $< $(clangoptions)

all : main
	./main 

build : main
main : main.m $(objs)
	clang -o main $(clangoptions) -framework CoreGraphics -framework Foundation main.m $(objs)

clean :
	$(RM) main
	$(RM) *.o
