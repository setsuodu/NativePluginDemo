#include <jni.h>

extern "C" {
    JNIEXPORT void CallMethod();

    JNIEXPORT const char* ReturnString();

	JNIEXPORT int ReturnInt();
}
