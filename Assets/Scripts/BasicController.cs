using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BasicController : MonoBehaviour
{
	void Start()
	{
		//Debug.Log ("Return Int: " + OSHookBridge.ReturnInt());

		//OC是对象，要用创建实例的方法调用
		//IntPtr handle = OSHookBridge.CreateInstance (); //获取实例
		//Debug.Log ("Return Instance Int: " + OSHookBridge.GetInstanceInt(handle)); //94632165
		//Debug.Log ("Return Instance OB: " + OSHookBridge.GetInstanceCallOB(handle)); //调用到了OB
	}

    void Test()
    {
        //Debug.Log ("Return Int: " + OSHookBridge.ReturnInt());

        //Unicode or ANSI
        //Debug.Log ("Return String: " + Marshal.PtrToStringAuto(OSHookBridge.ReturnString()));

        //ANSI
        //Debug.Log("Return String: " + Marshal.PtrToStringAnsi(OSHookBridge.ReturnString()));

        /*
        float[] matrix = new float[16];
        OSHookBridge.getGLProjectionMatrix(matrix);
        for (int i = 0; i < matrix.Length; i++)
        {
            Debug.LogFormat ("No.{0}: {1}", i, matrix [i]);
        }
        */
    }

    // 打开网页
    public void OpenWebView()
    {
		string url = "http://www.setsuodu.com";
		OSHookBridge.OpenWebView(url);
    }

    // 调用系统设置页
	public void OpenSettingView()
	{
		OSHookBridge.OpenSettingView();
	}
}
