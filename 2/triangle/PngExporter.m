#import "PngExporter.h"

@implementation PngExporter

+ (CFDictionaryRef)
   	createOptions : (CFTypeRef) type {

	CFTypeRef keys[2];
	keys[0] = kCGImagePropertyDPIWidth;
   	keys[1] = kCGImagePropertyDPIHeight;

	CFTypeRef values[2];
   	values[0] = type;
   	values[1] = type;
	
	return CFDictionaryCreate(NULL,keys,values,2,&kCFTypeDictionaryKeyCallBacks,&kCFTypeDictionaryValueCallBacks);
}

+ (CGImageDestinationRef)
	imageDestination : (NSString *) fullPath {

	CGImageDestinationRef retVal;
	CFURLRef savePngFileUrl = CFURLCreateWithFileSystemPath (NULL, (CFStringRef)fullPath, kCFURLPOSIXPathStyle, 0);
	retVal = CGImageDestinationCreateWithURL( savePngFileUrl, kUTTypePNG, 1, nil );
	CFRelease(savePngFileUrl);
	return retVal;
}

+ (void)
   	export       : (CGContextRef) ctx
	withFilePath : (NSString *) outputPngPath {

	CGImageRef cgImage = CGBitmapContextCreateImage(ctx);

	float resolution = 72.0 *1;
	CFTypeRef type = CFNumberCreate(NULL,kCFNumberFloatType,&resolution);
	CFDictionaryRef options = [PngExporter createOptions:type];

	CGImageDestinationRef destination = [PngExporter imageDestination:outputPngPath];
	CGImageDestinationAddImage(destination, cgImage, options);
	CGImageDestinationFinalize(destination);

	// Memory management
	CFRelease( type ); 
	CFRelease( cgImage ); 
	CFRelease( destination ); 
	CFRelease( options );
}


- (void) 
	save : (CGContextRef) ctx 
	to : (NSString *) fullPath {

	[PngExporter export:ctx withFilePath:fullPath];
}

@end
