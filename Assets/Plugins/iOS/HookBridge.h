//
//  HookBridge.h
//  OSHook
//
//  Created by 薛宇涛 on 2017/1/15.
//  Copyright © 2017年 薛宇涛. All rights reserved.
//

//暴露.mm中的方法
extern "C" {
    
    //第一类，c++方法
    
    void CallMethod();
    
    const char* ReturnString();
    
    int ReturnInt();
    
    //第二类，c方法，通过创建实例来调用
    
    const char* CreateInstance();
    
    const int GetInstanceInt(const char* instanceKey);
    
    const int GetInstanceCallOB(const char* instanceKey);
    
}
