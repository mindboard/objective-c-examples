@import Foundation;

@interface ArgUtil : NSObject {
	NSProcessInfo *mProcessInfo;
}

- (NSString *) outputPngPath;
- (int) width;
- (int) height;


@end
