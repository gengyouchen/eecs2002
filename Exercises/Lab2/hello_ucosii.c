#include <io.h>
#include <stdio.h>
#include "includes.h"
#include "system.h"
#include "seg7.h"
OS_STK s1[2048], s2[2048], s3[2048];
void f1(void *p) {
	while (1) {
		printf("EECS2002 Lab2\nName: 9760111\n");
		OSTimeDlyHMSM(0, 0, 3, 0);
		printf("call: get_seg7()\nreturn: %d\n", get_seg7((void*) SEVEN_SEGMENT_DISPLAYS_CONTROLLER_BASE));
		OSTimeDlyHMSM(0, 0, 3, 0);
	}
}
void f2(void *p) {
	int i = 0;
	while (1) {
		set_seg7((void*) SEVEN_SEGMENT_DISPLAYS_CONTROLLER_BASE, ++i);
		OSTimeDlyHMSM(0, 0, 0, 100);
	}
}
void f3(void *p) {
	while (1) {
		IOWR(RED_LEDS_CONTROLLER_BASE, 0, IORD(TOGGLE_SWITCHES_CONTROLLER_BASE, 0));
	}
}
int main() {
	OSTaskCreateExt(f1, 0, (void*) &s1[2047], 1, 1, s1, 2048, 0, 0);
	OSTaskCreateExt(f2, 0, (void*) &s2[2047], 2, 2, s2, 2048, 0, 0);
	OSTaskCreateExt(f3, 0, (void*) &s3[2047], 3, 3, s3, 2048, 0, 0);
	OSStart();
	return 0;
}
