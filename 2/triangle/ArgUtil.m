#import "ArgUtil.h"

@implementation ArgUtil

- (id) init {
	self = [super init];
	if( self ){
	   	mProcessInfo = [NSProcessInfo processInfo];
	}
	return (self);
} 

- (NSString *) arg : (int) index {
	NSArray *arguments = [mProcessInfo arguments];
	if( index<[arguments count] ){
		NSString *arg = [[NSString alloc] initWithString:[arguments objectAtIndex:index]];
		return arg;
	}
	return nil;
}

- (NSString *) outputPngPath {
	NSString *arg = [self arg:1];
	if( arg==nil ){
		return @"result.png";
	}
	else {
		return arg;
	}
}

- (int) width {
	NSString *arg = [self arg:2];
	if( arg==nil ){
		return 500;
	}
	else {
		return [arg intValue];
	}
}

- (int) height {
	NSString *arg = [self arg:3];
	if( arg==nil ){
		return 500;
	}
	else {
		return [arg intValue];
	}
}

@end
