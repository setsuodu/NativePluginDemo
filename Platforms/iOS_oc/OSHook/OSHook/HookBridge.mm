//
//  HookBridge.cpp
//  OSHook
//
//  Created by 薛宇涛 on 2017/1/15.
//  Copyright © 2017年 薛宇涛. All rights reserved.
//

#import "HookBridge.h"
#import "OSHook.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
//#import "UnityAppController.h"
// UIApplication需要头文件"UnityAppController.h"，只能在UnityAppControll.mm中实现该方法

@implementation HookBridge

@end

#pragma 第一类

void CallMethod(){
    // To do some things.
}

const char* ReturnString(){
    return "hello there";
}

int ReturnInt(){
    return 5;
}

#pragma 第二类

// 使用实例调用.m中的c方法
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

#pragma 第三类，直接在.mm中暴露，不用在.h中再列出

extern "C" void CallOC()
{
    NSLog(@"调用到了OC");
}

// 搜索本地歌曲
extern "C" void Unity_To_iOS()
{
    // 获取音乐
    NSLog(@"是否有权访问音乐库：%ld@",(long)MPMediaLibrary.authorizationStatus);
    if(MPMediaLibrary.authorizationStatus == 0) {
        //MPMediaLibrary.requestAuthorization();
    }
    
    MPMediaQuery *everything =[[MPMediaQuery alloc] init];
    MPMediaPropertyPredicate *albumNamePredicate = [MPMediaPropertyPredicate predicateWithValue:[NSNumber numberWithInt:MPMediaTypeMusic] forProperty:MPMediaItemPropertyMediaType];
    [everything addFilterPredicate:albumNamePredicate];
    NSLog(@"Logging items from a generic query...");
    NSArray *itemsFromGenericQuery = [everything items];
    NSLog(@"Number of shows: %@", itemsFromGenericQuery);
    for(MPMediaItem *song in itemsFromGenericQuery) {
        NSString *songTitle = [song valueForProperty:MPMediaItemPropertyTitle];
        NSLog(@"歌曲名: %@",songTitle);
    }
}

extern "C" void OpenWebView(const char * value)
{
    //NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSString *nsstr = [[NSString alloc] initWithUTF8String:value];
    NSURL *url = [NSURL URLWithString:nsstr];
    
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
}

//https://www.jianshu.com/p/20ce7f846f75?utm_campaign=maleskine&utm_content=note&utm_medium=seo_notes&utm_source=recommendation
// 打开定位服务界面
extern "C" void OpenSettingView()
{
    //宏定义，判断是否是 iOS10.0以上
    #define iOS10 ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0)
    
    NSString * urlStr = @"App-Prefs:root=taobao://item.taobao.com/item.htm?id=566954217448";
    //NSString * urlStr = @"App-Prefs:root=LOCATION_SERVICES";
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlStr]]) {
        if (iOS10) {
            //iOS10.0以上  使用的操作
            //https://twitter.com/kharrison，会先打开Twitte应用，没有装则跳转safari
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr] options:@{} completionHandler:nil];
        } else {
            //iOS10.0以下  使用的操作
            //直接跳转safari
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
        }
    }
}
