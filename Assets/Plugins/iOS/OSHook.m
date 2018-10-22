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

- (void)showAlert
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定要提交吗？" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * cancelAc = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        // 点击取消要执行的代码
        UnitySendMessage("AlertView", "Cancel", "");
    }];
    
    UIAlertAction *comfirmAc = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 点击确定要执行的代码
        UnitySendMessage("AlertView", "Confirm", "");
    }];
    
    [alertVC addAction:cancelAc];
    [alertVC addAction:comfirmAc];
    
    UIViewController * uiview = UnityGetGLViewController();
    [uiview presentViewController:alertVC animated:YES completion:nil];
}

@end

#ifdef __cplusplus
extern "C" {
#endif
    
    OSHook * controller = nil;
    
    void ShowAlert()
    {
        if(controller == nil) {
            controller = [[OSHook alloc] init];
        }
        [controller showAlert];
    }
    
#ifdef __cplusplus
}
#endif
