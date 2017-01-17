//
//  HookBridge.cpp
//  OSHook
//
//  Created by 薛宇涛 on 2017/1/15.
//  Copyright © 2017年 薛宇涛. All rights reserved.
//

#include "HookBridge.h"
#import "OSHook.h"

void CallMethod(){
    // To do some things.
}


const char* ReturnString(){
    return "hello there";
}

int ReturnInt(){
    return 5;
}

const char* CreateInstance(){
    return [[OSHook createInstance] cStringUsingEncoding:NSUTF8StringEncoding];
}

const int GetInstanceInt(const char* instanceKey){
    NSString *key = [NSString stringWithCString:instanceKey encoding:NSUTF8StringEncoding];
    OSHook *hook = [OSHook getInstanceForKey:key];
    
    return [hook returnInstanceInt];
}
