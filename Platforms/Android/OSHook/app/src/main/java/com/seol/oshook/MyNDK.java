package com.seol.oshook;

/**
 * Created by Administrator on 2017/1/16 0016.
 */

public class MyNDK {

    static {
        System.loadLibrary("OSHook");
    }
    public native String getMyString();
}
