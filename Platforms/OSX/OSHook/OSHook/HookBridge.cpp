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

/*
int ReturnInt(){
    return 5;
}
*/
bool getGLProjectionMatrix(float *a)
{
    float _matrix[16] = {1.6, 0.53, 0.1, 0, 0.6, 0.5, 0.24, 0, 0.22, 0.51, 0, 0, 2.1, 0.44, 0.17, 0};
    
    for(int i = 0; i < sizeof(_matrix); i++)
    {
        a[i] = _matrix[i];
    }
    return true;
}

int myTest(){
    return 250;
}

