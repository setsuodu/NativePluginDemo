using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Runtime.InteropServices;

public class PluginController : MonoBehaviour 
{
	void Start () 
	{
		Debug.Log ("Return Int = " + OSHookBridge.ReturnInt ());
		Debug.Log ("Return String = " + Marshal.PtrToStringAuto(OSHookBridge.ReturnString()));
	}
}
