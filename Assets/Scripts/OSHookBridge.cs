using System;
using System.Text;
using System.Runtime.InteropServices;

public class OSHookBridge
{
#if UNITY_STANDALONE_OSX

	[DllImport("OSHook")]
	public static extern void CallMethod();

	[DllImport("OSHook")]
	public static extern IntPtr ReturnString();

	[DllImport("OSHook")]
	public static extern int ReturnInt();

#elif UNITY_IOS

	[DllImport("__Internal")]
	public static extern void CallMethod();

	[DllImport("__Internal")]
	public static extern IntPtr ReturnString();

	[DllImport("__Internal")]
	public static extern int ReturnInt();

	[DllImport("__Internal")]
	public static extern IntPtr CreateInstance();

	[DllImport("__Internal")]
	public static extern int GetInstanceInt(IntPtr instanceKey);

#elif UNITY_ANDROID

    [DllImport("OSHook", CallingConvention=CallingConvention.Cdecl)]
    public static extern void CallMethod();

    [DllImport("OSHook", CallingConvention=CallingConvention.Cdecl)]
    public static extern IntPtr ReturnString();

    [DllImport("OSHook", CallingConvention=CallingConvention.Cdecl)]
    public static extern int ReturnInt();


#elif UNITY_STANDALONE_WIN

    [DllImport("OSHook")]
    public static extern void CallMethod();

    [DllImport("OSHook")]
    public static extern IntPtr ReturnString();
    //public static extern void ReturnString([MarshalAs(UnmanagedType.LPStr)]StringBuilder str);

    [DllImport("OSHook")]
    public static extern int ReturnInt();

#endif
}
