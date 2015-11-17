@import Foundation;

@interface PathUtil : NSObject {
}
@end

@implementation PathUtil

+ (NSString *) fullPath : (NSString *) relativePath {
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSString *currentPath = [fileManager currentDirectoryPath];
	NSString *fullPath = [NSString stringWithFormat:@"%@/%@",currentPath,relativePath];
	return fullPath;
}

@end


int main(int argc, const char * argv[]){

	NSString *path = [PathUtil fullPath:@"result.txt"]; 

	NSString *str = @"Hello World!";
	NSError *error = nil;

   	[str writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error];

   	return (0);
}
