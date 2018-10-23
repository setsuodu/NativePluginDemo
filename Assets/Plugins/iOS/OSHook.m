//
//  OSHook.m
//  OSHook
//
//  Created by 薛宇涛 on 2017/1/15.
//  Copyright © 2017年 薛宇涛. All rights reserved.
//

#import "OSHook.h"
#import <Foundation/Foundation.h>
#import "UnityAppController.h"

@implementation OSHook : NSObject

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
+ (NSMutableDictionary*) instanceHolder {
    if(_instanceHolder == nil){
        _instanceHolder = [[NSMutableDictionary alloc] init];
    }
    return _instanceHolder;
}

+ (NSString*) createInstance {
    NSUUID *myUUID = [NSUUID UUID];
    OSHook *_osHook = [[OSHook alloc] init];
    [[OSHook instanceHolder] setObject:_osHook forKey:[myUUID UUIDString]];
    return [myUUID UUIDString];
}

+ (OSHook*) getInstanceForKey:(NSString*) key{
    return [[OSHook instanceHolder] valueForKey:key];
}

- (int) CallOB{
    NSLog(@"调用到了OB");
    return 0;
}

- (void)showAlert0
{
    ///*
    // 方法一 UIAlertController
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"信息提示窗" preferredStyle:UIAlertControllerStyleAlert];
    UIViewController * uiview = UnityGetGLViewController();
    [uiview presentViewController:alertVC animated:YES completion:nil];
    // 注意是self，否则 unrecognized selector sent to instance
    [self performSelector:@selector(dimissUIAlert:) withObject:alertVC afterDelay:2.0];
    //*/
    
    /*
     // 方法二 UIAlertView
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"2秒后将消失" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
         [alert show];
         // 2秒后执行
         [self performSelector:@selector(dimissAlert:) withObject:alert afterDelay:2.0];
     */
    
    /*
     // 方法三 UIAlertView+多线程
     dispatch_async(dispatch_get_main_queue(), ^{
             UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"信息提示窗" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
             [alerView show];
             [alerView performSelector:@selector(dismissWithClickedButtonIndex:animated:) withObject:@[@0, @1] afterDelay:0.9];
         });
     */
}

- (void)dimissUIAlert:(UIAlertController*)alertVC {
    if(alertVC){
        [alertVC dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)dimissAlert:(UIAlertView*)alert {
    if(alert){
        [alert dismissWithClickedButtonIndex:[alert cancelButtonIndex] animated:YES];
    }
}

- (void)showAlert1
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"请确定" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *comfirmAc = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 点击确定要执行的代码
    }];
    
    [alertVC addAction:comfirmAc];
    
    UIViewController * uiview = UnityGetGLViewController();
    [uiview presentViewController:alertVC animated:YES completion:nil];
}

- (void)showAlert2
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定要提交吗？" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * cancelAc = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        // 点击取消要执行的代码
    }];
    
    UIAlertAction *comfirmAc = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 点击确定要执行的代码
    }];
    
    UIAlertAction *lalaAc = [UIAlertAction actionWithTitle:@"拉拉" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 点击确定要执行的代码
    }];
    
    [alertVC addAction:cancelAc];
    [alertVC addAction:comfirmAc];
    [alertVC addAction:lalaAc];
    
    UIViewController * uiview = UnityGetGLViewController();
    [uiview presentViewController:alertVC animated:YES completion:nil];
}

@end

#ifdef __cplusplus
extern "C" {
#endif
    
    AlertView * controller = nil;
    
    void ShowAlert0()
    {
        if(controller == nil) {
            controller = [[AlertView alloc] init];
        }
        [controller showAlert0];
    }
    
    void ShowAlert1()
    {
        if(controller == nil) {
            controller = [[AlertView alloc] init];
        }
        [controller showAlert1];
    }
    
    void ShowAlert2()
    {
        if(controller == nil) {
            controller = [[AlertView alloc] init];
        }
        [controller showAlert2];
    }
    
#ifdef __cplusplus
}
#endif
