using System.IO;
using System.Collections;
using UnityEngine;
using UnityEditor;
using UnityEditor.iOS.Xcode;
using UnityEditor.Callbacks;

public class XCodePostProcess
{
	[PostProcessBuild]
	static void OnPostprocessBuild(BuildTarget target, string path)
	{
		if (target == BuildTarget.iOS)
		{
			ModifyProj(path);
			SetPlist(path);
		}
	}

	public static void ModifyProj(string path)
	{
		string projPath = PBXProject.GetPBXProjectPath (path);
		PBXProject pbxProj = new PBXProject ();

		// 配置目标
		pbxProj.ReadFromString (File.ReadAllText (projPath));
		string targetGuid = pbxProj.TargetGuidByName ("Unity-iPhone");

		// 添加系统内置框架
		//pbxProj.AddFrameworkToProject (targetGuid, "Security.framework", false); //weak: true:optional, false:required
		pbxProj.AddFrameworkToProject (targetGuid, "CoreLocation.framework", false);
		pbxProj.AddFrameworkToProject (targetGuid, "Security.framework", false);
		pbxProj.AddFrameworkToProject (targetGuid, "CoreTelephony.framework", false);
		pbxProj.AddFrameworksBuildPhase (targetGuid);

		// 添加.tbd
		pbxProj.AddFileToBuild(targetGuid, pbxProj.AddFile("usr/lib/libz.tbd", "Frameworks/libz.tbd", PBXSourceTree.Sdk));
		pbxProj.AddFileToBuild(targetGuid, pbxProj.AddFile("usr/lib/libc++.tbd", "Frameworks/libc++.tbd", PBXSourceTree.Sdk));

		// 设置teamID
        //...

		File.WriteAllText(projPath, pbxProj.WriteToString());
	}

	static void SetPlist(string path)
	{
		string plistPath = path + "/Info.plist";
		PlistDocument _plist = new PlistDocument ();
		_plist.ReadFromString (File.ReadAllText (plistPath));

		// Information Property List
		PlistElementDict plistDict = _plist.root;

		// 设置string类型
		//plistDict.SetString ("abc", "123");

		// 设置Array类型
		//var dic = plistDict.CreateDict ("haha");
		//dic.SetString ("abc", "123");
      
		File.WriteAllText(plistPath, _plist.WriteToString());
	}
}
