@import Foundation;

@interface MyXmlParser : NSObject <NSXMLParserDelegate> {
}
@end

@implementation MyXmlParser

-(void) parserDidStartDocument:(NSXMLParser *) parser {
}
- (void)
   	parser:(NSXMLParser *)parser
	didStartElement : (NSString *)elementName
   	namespaceURI    : (NSString *)namespaceURI
   	qualifiedName   : (NSString *)qName
   	attributes      : (NSDictionary *)attributeDict {
}
- (void)
   	parser          : (NSXMLParser *)parser
   	foundCharacters : (NSString *)string {
	
	NSLog(@"text : %@",string);
}
- (void)
   	parser         : (NSXMLParser *)parser
   	didEndElement  : (NSString *)elementName
   	namespaceURI   : (NSString *)namespaceURI
   	qualifiedName  : (NSString *)qName{
}
-(void)
   	parserDidEndDocument : (NSXMLParser *) parser {
}

@end


int main(int argc, const char * argv[]){

	NSString *xml = @"<html><body>Hello World!</body></html>";
	NSData *dataXml = [xml dataUsingEncoding:NSUTF8StringEncoding];
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData:dataXml];

	MyXmlParser *xmlParser = [[MyXmlParser alloc] init];
	[parser setDelegate:xmlParser];

	[parser parse];

   	return (0);
}
