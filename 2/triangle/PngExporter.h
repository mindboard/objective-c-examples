@import Foundation;

@interface PngExporter : NSObject {
}
- (void) 
	save : (CGContextRef) ctx 
	to : (NSString *) fullPath ;
@end
