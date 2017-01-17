//
//  HookBridge.h
//  OSHook
//
//  Created by 薛宇涛 on 2017/1/15.
//  Copyright © 2017年 薛宇涛. All rights reserved.
//

extern "C"{
    
    void CallMethod();
    
    const char* ReturnString();
    
    int ReturnInt();
    
    
    const char* CreateInstance();
    
    const int GetInstanceInt(const char* instanceKey);
    
}
