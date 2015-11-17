@import Foundation;

int main(int argc, const char * argv[]){

	CGFloat width  = 100;
	CGFloat height = 100;

	NSValue *value0 = [NSValue valueWithPoint:CGPointMake(width/2, 0)];
	NSValue *value1 = [NSValue valueWithPoint:CGPointMake(0,       height)];
	NSValue *value2 = [NSValue valueWithPoint:CGPointMake(width,   height)];

	NSArray *array = [NSArray arrayWithObjects:value0,value1,value2,nil];
	NSLog(@"array=%@", array);

	for( int i=0; i<[array count]; i++){
		NSValue *value = [array objectAtIndex:i];
		NSLog(@"item=%@",value);

		CGPoint point = [value pointValue];
		NSLog(@"point=(%f,%f)",point.x,point.y);
	}

   	return (0);
}
