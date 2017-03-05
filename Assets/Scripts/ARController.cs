using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;

public class ARController : MonoBehaviour
{
	#if UNITY_STANDALONE_WIN

	int num = OSHookBridge.Addition(5, 7);

    void Start()
    {
		Debug.Log("Addition : " + num);

		Debug.Log("PassFloat : " + OSHookBridge.PassFloat());

        float[] matrix = new float[16];
		OSHookBridge.getGLProjectionMatrix(matrix);
        for (int i = 0; i < matrix.Length; i++)
        {
            Debug.Log("No." + i + " : " + matrix[i]);
        }
    }

	#endif
}