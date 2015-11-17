#import "Triangle.h"

@implementation Triangle

- (id) initWithContext: (CGContextRef) ctx {
	self = [super init];
	if( self ){
	   	mCtx = ctx;
	}
	return (self);
} 

- (CGColorRef) blackColor {
	CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();

	CGFloat colorRGBA[] = { 0.0, 0.0, 0.0, 1.0 };
   	CGColorRef color = CGColorCreate(space,colorRGBA);

   	CGColorSpaceRelease(space);

	return color;
}

- (void) draw : (NSDictionary *) map {
	// color
	CGColorRef black = [self blackColor];
	CGContextSetStrokeColorWithColor(mCtx, black);
	CGColorRelease(black);

	// stroke width
	CGFloat strokeWidth = 1.0;
	CGContextSetLineWidth(mCtx, strokeWidth);

	// build path
	NSValue *pt0 = [map objectForKey : @"point0"];
	NSValue *pt1 = [map objectForKey : @"point1"];
	NSValue *pt2 = [map objectForKey : @"point2"];

	CGPoint point0 = [pt0 pointValue];
	CGPoint point1 = [pt1 pointValue];
	CGPoint point2 = [pt2 pointValue];

	CGMutablePathRef path = CGPathCreateMutable();

	CGPathMoveToPoint   (path, NULL, point0.x, point0.y);
	CGPathAddLineToPoint(path, NULL, point1.x, point1.y);
	CGPathAddLineToPoint(path, NULL, point2.x, point2.y);
	CGPathCloseSubpath(path);

	CGContextAddPath(mCtx, path);

	CGContextStrokePath(mCtx);

	CGPathRelease(path);
}

@end
