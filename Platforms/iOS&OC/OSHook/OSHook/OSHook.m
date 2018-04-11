//
//  OSHook.m
//  OSHook
//
//  Created by 薛宇涛 on 2017/1/15.
//  Copyright © 2017年 薛宇涛. All rights reserved.
//

#import "OSHook.h"

@implementation OSHook

+ (int) returnInt{
    return 34;
}

+ (NSString*) returnString{
    return @"Static String";
}

- (int) returnInstanceInt{
    return 94632165;
}

- (NSString*) returnInstanceString{
    return @"Instance String";
}

NSMutableDictionary *_instanceHolder;
+ (NSMutableDictionary*) instanceHolder{
    if(_instanceHolder == nil){
        _instanceHolder = [[NSMutableDictionary alloc] init];
    }
    return _instanceHolder;
}

+ (NSString*) createInstance{

    NSUUID *myUUID = [NSUUID UUID];
    
    OSHook *_osHook = [[OSHook alloc] init];
    
    [[OSHook instanceHolder] setObject:_osHook forKey:[myUUID UUIDString]];
    
    return [myUUID UUIDString];
}

+ (OSHook*) getInstanceForKey:(NSString*) key{
    return [[OSHook instanceHolder] valueForKey:key];
}

- (int) CallOC{
    NSLog(@"调用到了OC");
    return 0;
}

@end
