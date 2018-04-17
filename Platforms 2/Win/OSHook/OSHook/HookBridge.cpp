#include "HookBridge.h"
#include "string.h"
#include <stdio.h>

void CallMethod() {
	//To do some things
}

const char* ReturnString() {
	return "hello there";
}

int ReturnInt() {
	return 5;
}

void getTrackResultId(char* str) {
	strcpy(str,"abc");
}

void foo(char *str, int len)
{
	char* a = "abccba";
	str = a;
	len = sizeof(str);
	// write no more than len characters into str
}