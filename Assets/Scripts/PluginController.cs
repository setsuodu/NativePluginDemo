using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;
using UnityEngine.UI;

public class PluginController : MonoBehaviour
{
	void Start()
	{
		//Debug.Log ("Return Int: " + OSHookBridge.ReturnInt());

		//OC是对象，要用创建实例的方法调用
		IntPtr handle = OSHookBridge.CreateInstance (); //获取实例
		Debug.Log ("Return Instance Int: " + OSHookBridge.GetInstanceInt(handle)); //94632165
		Debug.Log ("Return Instance Int: " + OSHookBridge.GetInstanceCallOB(handle)); //调用到了OB
	}

	public void OpenWebView()
	{
		//OSHookBridge.CallOC ();
		//OSHookBridge.Unity_To_iOS ();
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

	#region CoreLocation集成

	public void StartGPSUpdate()
	{
		Debug.Log("CoreLocation 开始定位");
		OSHookBridge.StartGPSUpdate();
	}

	public void StopGPSUpdate()
	{
		Debug.Log("CoreLocation 结束定位");
		OSHookBridge.StopGPSUpdate();
	}

	#endregion
}
