//
//  ViewController.m
//  AliSDKDemo
//
//  Created by antfin on 17-10-24.
//  Copyright (c) 2017年 AntFin. All rights reserved.
//

# import <Foundation/Foundation.h>

#import "APViewController.h"
#import <AlipaySDK/AlipaySDK.h>

#import "APAuthInfo.h"
#import "APOrderInfo.h"
#import "APRSASigner.h"

#import "UnityAppController.h"

@interface MyUnityAppController : UnityAppController //通过接口继承
@end

@implementation APViewController

- (BOOL)application:(UIApplication*)application handleOpenURL:(NSURL*)url
{
    NSLog(@"handleOpenURL");
    return YES;
}

// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication*)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    NSLog(@"9.0以后使用新API接口");
    return YES;
}

- (BOOL)application:(UIApplication*)application openURL:(NSURL*)url sourceApplication:(NSString*)sourceApplication annotation:(id)annotation
{
    // 针对唤醒APP的情况传递参数;
    NSLog(@"当用户通过其它应用启动本应用时，会回调这个方法，url参数是其它应用调用openURL:方法时传过来的。");
    return YES;
}

@end


#ifdef __cplusplus
extern "C" {
#endif
    
#pragma mark -
#pragma mark   ==============点击订单模拟支付行为==============
    
    void doAPPay(const char *info)
    {
        NSString *appScheme = @"mymirror";
        NSString * orderString = [NSString stringWithUTF8String:info];
        NSLog(@"unity传入: %@", orderString);
        
        // NOTE: 调用支付结果开始支付（唤起支付宝页面）
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
        }];
    }
    
#ifdef __cplusplus
}
#endif
