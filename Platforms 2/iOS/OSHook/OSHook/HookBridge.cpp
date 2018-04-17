//
//  HookBridge.cpp
//  OSHook
//
//  Created by 薛宇涛 on 2017/1/15.
//  Copyright © 2017年 薛宇涛. All rights reserved.
//

#include "HookBridge.h"


void CallMethod(){
    // To do some things.
}


const char* ReturnString(){
    return "hello there";
}


int ReturnInt(){
    return 5;
}
    
bool getGLProjectionMatrix(float *a){
    float matrix[16] = {1.6,1,0,0, 1.2,1,0,0, 1.1,1,0,0, 1.3,1,0,0};
    for(int i = 0; i<sizeof(matrix); i++){
        a[i] = matrix[i];
    }
    return true;
}
    
