//
//  OCNative.m
//  Unity-iPhone
//
//  Created by 薛宇涛 on 2018/5/16.
//

//#import <Foundation/Foundation.h>
#import "OCNative.h"

@implementation OCNative

//- 代表对象，需要实例化后调用
- (void) haha {
    NSLog(@"haha");
}

//+ 代表方法，可以在extern "C"中调用
+ (NSString *)generateTradeNO
{
    return @"tradeNo";
}

@end

#ifdef __cplusplus
extern "C" {
#endif
    
    void doAPPay() {
        NSLog(@"%@", [OCNative generateTradeNO]);
        NSLog(@"OC接收成功");
    }
    
#ifdef __cplusplus
}
#endif
