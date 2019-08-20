#include <io.h>
#include <stdio.h>
#include "includes.h"
#include "system.h"
OS_STK s1[2048], s2[2048];
void f1(void *p) {
    while (1) {
        printf("EECS2002 Lab1\nName: 9760111\n");
        OSTimeDlyHMSM(0, 0, 3, 0);
        printf("Hello uC/OS-II\nNice to see you\n");
        OSTimeDlyHMSM(0, 0, 3, 0);
    }
}
void f2(void *p) {
    unsigned int buffer;
    while (1) {
        buffer = IORD(TOGGLE_SWITCHES_CONTROLLER_BASE, 0);
        IOWR(RED_LEDS_CONTROLLER_BASE, 0, buffer);
    }
}
int main() {
    OSTaskCreateExt(f1, 0, (void*) &s1[2047], 1, 1, s1, 2048, 0, 0);
    OSTaskCreateExt(f2, 0, (void*) &s2[2047], 2, 2, s2, 2048, 0, 0);
    OSStart();
    return 0;
}
