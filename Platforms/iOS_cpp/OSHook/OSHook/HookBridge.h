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
    
    bool getGLProjectionMatrix(float *a);
}
