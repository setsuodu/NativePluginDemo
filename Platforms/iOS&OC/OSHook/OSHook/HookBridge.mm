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
#import "UnityAppController.h"

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

/* UIApplication需要头文件"UnityAppController.h"，只能在UnityAppControll.mm中实现该方法
//打开原生设置页
extern "C" void Unity_To_iOS()
{
    //NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURL *url = [NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
}
*/
extern "C" void Unity_To_iOS()
{
    //跳转方法
    /*
     //NSURL *url = [NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"]; //服务，不允许跳转
     //NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
     //NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"taobao://item.taobao.com/item.htm?id=566954217448"]]; //不允许跳转
     if ([[UIApplication sharedApplication] canOpenURL:url]) {
     [[UIApplication sharedApplication] openURL:url];
     }
     */
    
    //是否开启GPS
    //NSLog(@"GPS is: %i", [CLLocationManager locationServicesEnabled]);
    
    //获取音乐
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
