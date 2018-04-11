//
//  OSHook.h
//  OSHook
//
//  Created by 薛宇涛 on 2017/1/15.
//  Copyright © 2017年 薛宇涛. All rights reserved.
//

//列出OSHook.m中的方法

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
