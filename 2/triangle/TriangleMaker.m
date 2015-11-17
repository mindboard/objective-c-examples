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
   	drawOneTriangle : (Triangle *) triangle
	andWidth : (int)w 
	andHeight: (int)h {

	NSValue *value0 = [NSValue valueWithPoint:CGPointMake( w/2, 0 )];
	NSValue *value1 = [NSValue valueWithPoint:CGPointMake( 0,   h )];
	NSValue *value2 = [NSValue valueWithPoint:CGPointMake( w,   h )];

	NSDictionary *map = [NSDictionary dictionaryWithObjectsAndKeys:
		value0, @"point0",
		value1, @"point1",
		value2, @"point2",nil];
	[triangle draw:map];
}


- (void) proc {
	ArgUtil *util = [[ArgUtil alloc] init];
	NSString *outputPngPath = [util outputPngPath];
	int w = [util width];
	int h = [util height];

	CGContextRef ctx = [TriangleMaker contextWidth:w andHeight:h];

	Triangle *triangle = [[Triangle alloc] initWithContext:ctx];

	[TriangleMaker drawOneTriangle : triangle andWidth:w andHeight:h ];

	PngExporter *exporter = [[PngExporter alloc] init];
	[exporter save:ctx to:outputPngPath];

	CFRelease(ctx);
}

@end
