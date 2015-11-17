@import Foundation;

int main(int argc, const char * argv[]){

	NSValue *value = [NSValue valueWithPoint:CGPointMake(100.0,100.0)];
	NSLog(@"value=%@",value);

	CGPoint point = [value pointValue];
	NSLog(@"point=(%f,%f)",point.x,point.y);

   	return (0);
}
