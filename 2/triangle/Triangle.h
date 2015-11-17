@import Foundation;

@interface Triangle : NSObject {
	CGContextRef mCtx;
}

- (id) initWithContext: (CGContextRef) ctx;
- (void) draw : (NSDictionary *) map ;
@end
