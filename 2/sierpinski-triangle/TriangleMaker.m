#import "ArgUtil.h"
#import "Triangle.h"
#import "PngExporter.h"
#import "TriangleMaker.h"

@implementation TriangleMaker

+ (CGContextRef)
   	contextWidth : (int)w
   	andHeight    : (int)h {

	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGContextRef ctx = CGBitmapContextCreate( nil, w, h, 8, 0, colorSpace, kCGImageAlphaPremultipliedFirst);
   	CGColorSpaceRelease(colorSpace);

	return ctx;
}

+ (void)
   	drawTriangle    : (Triangle *) triangle
   	andCounter      : (int) counter
   	andStartPoint   : (CGPoint) startPoint
   	andLengthOfSide : (int) lengthOfSide {

	CGPoint bottomLeftPoint  = CGPointMake( startPoint.x - lengthOfSide/2, startPoint.y + lengthOfSide ); 
	CGPoint bottomRightPoint = CGPointMake( startPoint.x + lengthOfSide/2, startPoint.y + lengthOfSide ); 

	NSDictionary *map = [NSDictionary dictionaryWithObjectsAndKeys:
		[NSValue valueWithPoint:startPoint],       @"point0",
		[NSValue valueWithPoint:bottomLeftPoint],  @"point1",
		[NSValue valueWithPoint:bottomRightPoint], @"point2", nil];
	[triangle draw:map];

	if( counter<0 ){
		return ;
	}

	//
	// recursion
	//
	[TriangleMaker drawTriangle: triangle andCounter:counter-1 andStartPoint:startPoint       andLengthOfSide:lengthOfSide/2 ];
	[TriangleMaker drawTriangle: triangle andCounter:counter-1 andStartPoint:bottomLeftPoint  andLengthOfSide:lengthOfSide/2 ];
	[TriangleMaker drawTriangle: triangle andCounter:counter-1 andStartPoint:bottomRightPoint andLengthOfSide:lengthOfSide/2 ];
}

- (void) proc {
	ArgUtil *util = [[ArgUtil alloc] init];
	NSString *outputPngPath = [util outputPngPath];
	int w = [util width];
	int h = [util height];

	CGContextRef ctx = [TriangleMaker contextWidth:w andHeight:h];

	Triangle *triangle = [[Triangle alloc] initWithContext:ctx];

	int counter = 8; // how many recursion triangle drawing
	[TriangleMaker drawTriangle:triangle andCounter:counter andStartPoint: CGPointMake( w/2, 0 ) andLengthOfSide: h/2];

	PngExporter *exporter = [[PngExporter alloc] init];
	[exporter save:ctx to:outputPngPath];

	CFRelease(ctx);
}

@end
