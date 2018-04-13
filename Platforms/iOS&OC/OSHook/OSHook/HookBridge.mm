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

//使用实例调用.m中的方法
const char* CreateInstance(){
    return [[OSHook createInstance] cStringUsingEncoding:NSUTF8StringEncoding];
}

const int GetInstanceInt(const char* instanceKey){
    NSString *key = [NSString stringWithCString:instanceKey encoding:NSUTF8StringEncoding];
    OSHook *hook = [OSHook getInstanceForKey:key];
    return [hook returnInstanceInt];
}

const int GetInstanceCallOB(const char* instanceKey){
    NSString *key = [NSString stringWithCString:instanceKey encoding:NSUTF8StringEncoding];
    OSHook *hook = [OSHook getInstanceForKey:key];
    return [hook CallOB];
}

extern "C" void CallOC()
{
    NSLog(@"调用到了OC");
}

/* UIApplication需要"UnityAppController.h"，只能在UnityAppControll.mm中实现该方法
//打开原生页面
extern "C" void Unity_To_iOS()
{
    //NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURL *url = [NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
}
*/
