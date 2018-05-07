
#import <Foundation/Foundation.h>

@interface OSHook : NSObject

//C++
+ (int) returnInt;
+ (NSString*) returnString;
- (int) returnInstanceInt;
- (NSString*) returnInstanceString;
- (int) CallOB;


//OC
+ (NSString*) createInstance;
+ (OSHook*) getInstanceForKey:(NSString*) key;

@end
