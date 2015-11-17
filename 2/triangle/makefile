
clangoptions:=-fobjc-arc -fmodules
objs:=ArgUtil.o PngExporter.o Triangle.o TriangleMaker.o

outputPngFile:=result.png


%.o : %.m
	clang -c $< $(clangoptions)

all : main 
	./main $(outputPngFile) 500 500

build : main
main : main.m $(objs)
	clang -o main $(clangoptions) -framework CoreGraphics -framework Foundation main.m $(objs)

clean :
	$(RM) main
	$(RM) *.o
	$(RM) *.png
