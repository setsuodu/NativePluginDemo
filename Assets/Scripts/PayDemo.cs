using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PayDemo : MonoBehaviour
{
	public delegate void AliPayDelegate(string status); //监听
	public static AliPayDelegate AliPayEvent; //回调
	public static void OnAliPayEvent(string status) //调用函数
	{
		if(AliPayEvent != null)
		{
			AliPayEvent(status);
		}
	}

	public Button m_PayButton;

	void Awake()
	{
		m_PayButton.onClick.AddListener(Pay);
	}

	void OnDestroy()
	{
		m_PayButton.onClick.RemoveListener(Pay);
	}

	void Start()
	{

	}

	void Pay()
	{
		AliPayEvent += AliPayLog;

		PayInfo payInfo = new PayInfo();
		payInfo.body = "AR会员";
		payInfo.subject = "蜜迩科技";
		payInfo.out_trade_no = System.DateTime.Now.ToString("yyyyMMddhhmmss") + "test";
		payInfo.total_amount = "0.01";

		StartCoroutine(OnServerSign(payInfo));
	}

	IEnumerator OnServerSign(PayInfo payInfo)
	{      
		//+= Delegate;
		WWWForm form = new WWWForm();
		form.AddField("body", payInfo.body);
		form.AddField("subject", payInfo.subject);
		form.AddField("out_trade_no", payInfo.out_trade_no);
		form.AddField("timeout_express", "30m");
		form.AddField("total_amount", payInfo.total_amount);
		string url = "http://122.112.233.193:9090";
		WWW www = new WWW(url, form);
		yield return www;
		if (!string.IsNullOrEmpty(www.error))
		{
			Debug.Log(www.error);
		}
		Debug.Log("服务器加签: " + www.text); //加签后的订单

		string orderInfo = www.text;
		OSHookBridge.doAPPay(orderInfo);
	}
    
	void AliPayLog(string log)
	{
		Debug.Log("SDK回调: " + log);
		switch(log)
		{
			case "9000":
				m_PayButton.image.color = Color.green;
				break;
			default:
				m_PayButton.image.color = Color.red;
				break;
		}
		AliPayEvent -= AliPayLog; //释放委托
	}

	//sdk支付结果回调 UnitySendMessage("Object", "StatusCallback", "param");
	public void StatusCallback(string log)
	{
		Debug.Log("[StatusCallback]" + log);
		OnAliPayEvent(log);
	}
}

[System.Serializable]
public class PayInfo
{
	public string body;
    public string subject;
	public string out_trade_no;
	public string timeout_express = "30m";
    public string total_amount;
}
