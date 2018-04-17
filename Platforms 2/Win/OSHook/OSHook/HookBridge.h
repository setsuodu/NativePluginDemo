#ifdef TESTFUNCDLL_EXPORT
#define TESTDLLSORT_API __declspec(dllexport)
#else
#define TESTDLLSORT_API __declspec(dllimport)
#endif


extern "C" {
	TESTDLLSORT_API void CallMethod();

	TESTDLLSORT_API const char* ReturnString();

	TESTDLLSORT_API int ReturnInt();

	TESTDLLSORT_API void getTrackResultId(char* str);

	TESTDLLSORT_API void foo(char *str, int len);
}
