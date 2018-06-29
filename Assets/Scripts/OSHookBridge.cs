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

	[DllImport("OSHook")]
	public static extern bool getGLProjectionMatrix (float[] matrix);

	//[DllImport("OSHook")]
	//public static extern void getTrackResultId(ref byte uid);

#elif UNITY_IOS

	[DllImport("__Internal")]
	public static extern void CallMethod();

	[DllImport("__Internal")]
	public static extern IntPtr ReturnString();

	[DllImport("__Internal")]
	public static extern int ReturnInt();

	//[DllImport("__Internal")]
	//public static extern bool getGLProjectionMatrix (float[] matrix);

	[DllImport("__Internal")]
	public static extern IntPtr CreateInstance();

	[DllImport("__Internal")]
	public static extern int GetInstanceInt(IntPtr instanceKey);

	[DllImport("__Internal")]
	public static extern int GetInstanceCallOB(IntPtr instanceKey);

	[DllImport("__Internal")]
	public static extern void CallOC(); //该方法为oc 中mm文件方法名称
    
	# region 在UnityAppControll.mm中实现

    //@implementation UnityAppController
    //..code
    //@end

    [DllImport("__Internal")]
	public static extern void Unity_To_iOS();

    //打开网页
    [DllImport("__Internal")]
    public static extern int OpenWebView (string url);

    #endregion
   
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

	[DllImport("PassFloat")]
	public static extern int Addition(int x, int y);

	[DllImport("PassFloat")]
	public static extern float PassFloat();

	[DllImport("PassFloat")]
	public static extern bool getGLProjectionMatrix(float[] matrix);

    [DllImport("OSHook")]
    public static extern void getTrackResultId(ref byte uid);

#endif
}
