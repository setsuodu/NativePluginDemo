//
//  interface.m
//  OSHook
//
//  Created by 薛宇涛 on 2018/4/11.
//  Copyright © 2018年 薛宇涛. All rights reserved.
//

#import <Foundation/Foundation.h>

// 函数实现
#ifdef __cplusplus
extern "C"
#endif
{
    // 由于这里代码区实现的代码，即将被c++或者c#调用，所以必须加上。静态方法不需要(类方法)

    void CallOC()
    {
        NSLog(@"调用到了OC");
    }
    
#ifdef __cplusplus
}
#endif
