#define TESTDLLSORT_API __declspec(dllexport) 

extern "C" {
	TESTDLLSORT_API void CallMethod();

	TESTDLLSORT_API const char* ReturnString();

	TESTDLLSORT_API int ReturnInt();
}
