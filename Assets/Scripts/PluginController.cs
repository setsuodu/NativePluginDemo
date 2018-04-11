using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;

public class PluginController : MonoBehaviour
{
	void Start()
	{
		OSHookBridge.CallOC ();
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
}
