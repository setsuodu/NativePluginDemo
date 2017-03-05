using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Runtime.InteropServices;

public class PluginController : MonoBehaviour 
{
	void Start () 
	{
        //Debug.Log ("Return Int = " + OSHookBridge.ReturnInt());
        //Debug.Log ("Return String = " + Marshal.PtrToStringAuto(OSHookBridge.ReturnString()));
        Debug.Log("Return String = " + Marshal.PtrToStringAnsi(OSHookBridge.ReturnString()));

		float[] matrix = new float[16];
		OSHookBridge.getGLProjectionMatrix(matrix);
		for (int i = 0; i < matrix.Length; i++) 
		{
			Debug.Log ("No." + i + " : " + matrix[i]);
		}

		//Debug.Log ("myTest Int = " + OSHookBridge.myTest());
    }
}
