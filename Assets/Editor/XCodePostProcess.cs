using System.IO;
using System.Xml;
using System.Collections;
using UnityEngine;
using UnityEditor;
using UnityEditor.iOS.Xcode;
using UnityEditor.Callbacks;

public class XCodePostProcess
{
	[PostProcessBuild]
	static void OnPostprocessBuild(BuildTarget target, string pathToBuildProject)
	{
		ModifyProj (pathToBuildProject);
		SetPlist (pathToBuildProject);
	}

	public static void ModifyProj(string pathToBuildProject)
	{
		string _projPath = PBXProject.GetPBXProjectPath (pathToBuildProject);
		PBXProject _pbxProj = new PBXProject ();

		//配置目标TARGETS
		_pbxProj.ReadFromString (File.ReadAllText (_projPath));
		string _targetGuid = _pbxProj.TargetGuidByName ("Unity-iPhone");

		//添加framework
		//_pbxProj.AddFrameworkToProject (_targetGuid, "Security.framework", false); //weak: true:optional, false:required
		_pbxProj.AddFrameworkToProject (_targetGuid, "CoreLocation.framework", false);
		_pbxProj.AddFrameworkToProject (_targetGuid, "Security.framework", false);
		_pbxProj.AddFrameworkToProject (_targetGuid, "CoreTelephony.framework", false);
		_pbxProj.AddFrameworksBuildPhase (_targetGuid);

		//添加tbd
		//_pbxProj.AddFileToBuild(_targetGuid, _pbxProj.AddFile("usr/lib/libz.tbd", "Frameworks/libz.tbd", PBXSourceTree.Sdk));
		_pbxProj.AddFileToBuild(_targetGuid, _pbxProj.AddFile("usr/lib/libz.tbd", "Frameworks/libz.tbd", PBXSourceTree.Sdk));
		_pbxProj.AddFileToBuild(_targetGuid, _pbxProj.AddFile("usr/lib/libc++.tbd", "Frameworks/libc++.tbd", PBXSourceTree.Sdk));

		//设置buildsetting
		//_pbxProj.SetBuildProperty (_targetGuid, "CODE_SIGN_IDENTITY", "iPhone Developer: 339131001@qq.com (898P536RZC)");
		_pbxProj.SetBuildProperty (_targetGuid, "DEVELOPMENT_TEAM", "AUF3355GWB"); //填的是组织单位，而不是用户ID
		//_pbxProj.SetBuildProperty (_targetGuid, "DEVELOPMENT_TEAM", "michael seol");
		//_pbxProj.SetBuildProperty (_targetGuid, "PROVISIONING_PROFILE_SPECIFIER", "com.seol.OSHook"); //Unknown?

		File.WriteAllText(_projPath, _pbxProj.WriteToString());
	}

	static void SetPlist(string pathToBuildProject)
	{
		string _plistPath = pathToBuildProject + "/Info.plist";
		PlistDocument _plist = new PlistDocument ();
		_plist.ReadFromString (File.ReadAllText (_plistPath));

		//Information Property List
		PlistElementDict iplist = _plist.root;

		//CoreLocation
		iplist.SetString ("NSLocationAlwaysUsageDescription", "I need Location");
		iplist.SetString ("NSLocationWhenInUseUsageDescription", "");
		//设置Array类型
		var array = iplist.CreateArray ("UIBackgroundModes");
		array.AddString ("fetch");
		array.AddString ("location");
		//var dic = iplist.CreateDict ("haha");
		//dic.SetString ("abc", "123");

		//AMap
		iplist.SetString ("NSLocationAlwaysAndWhenInUseUsageDescription", "");

		File.WriteAllText(_plistPath, _plist.WriteToString());
	}
}
