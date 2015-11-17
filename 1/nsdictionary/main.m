@import Foundation;

int main(int argc, const char * argv[]){

	CGFloat width  = 100;
	CGFloat height = 100;

	NSValue *value0 = [NSValue valueWithPoint:CGPointMake(width/2, 0)];
	NSValue *value1 = [NSValue valueWithPoint:CGPointMake(0,       height)];
	NSValue *value2 = [NSValue valueWithPoint:CGPointMake(width,   height)];

	NSDictionary *map = [NSDictionary dictionaryWithObjectsAndKeys:
		value0, @"topPoint",
		value1, @"bottomLeftPoint",
		value2, @"bottomRightPoint",nil];
	NSLog(@"map=%@", map);

	for(id key in [map keyEnumerator]) {
		NSLog(@"Key:%@ Value:%@", key, [map valueForKey:key]);
	}

   	return (0);
}
