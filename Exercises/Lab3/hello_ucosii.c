#include <io.h>
#include <stdio.h>
#include <string.h>
#include "includes.h"
#include "system.h"
#include "seg7.h"
#include "ltm.h"
char professor_name[100];
OS_EVENT *professor_key;
OS_STK s1[2048], s2[2048], s3[2048], s4[2048], s5[2048];
void f1(void *p) {
    while (1) {
        unsigned char e;
        OSSemPend(professor_key, 0, &e);
        printf("%s", professor_name);
        if (professor_name[0] == 'H') {
            turn_right_ltm((void*) LTM_CONTROLLER_BASE);
        } else if (professor_name[0] == 'C') {
            turn_left_ltm((void*) LTM_CONTROLLER_BASE);
        } else if (professor_name[0] == 'L') {
            turn_back_ltm((void*) LTM_CONTROLLER_BASE);
        }
        OSSemPost(professor_key);
        OSTimeDlyHMSM(0, 0, 1, 0);
    }
}
void f2(void *p) {
    while (1) {
        unsigned char e;
        OSSemPend(professor_key, 0, &e);
        set_seg7((void*) SEVEN_SEGMENT_DISPLAYS_CONTROLLER_BASE, strlen(professor_name));
        OSSemPost(professor_key);
        OSTimeDlyHMSM(0, 0, 0, 100);
    }
}
void f3(void *p) {
    while (1) {
        unsigned char e;
        OSSemPend(professor_key, 0, &e);
        IOWR(RED_LEDS_CONTROLLER_BASE, 0, 1 << (strlen(professor_name) - 1));
        OSSemPost(professor_key);
        OSTimeDlyHMSM(0, 0, 0, 10);
    }
}
void f4(void *p) {
    printf("EECS2002 Lab3\nName: 9760111\n");
    OSTimeDlyHMSM(0, 0, 3, 0);
    FILE *f = fopen("/mnt/rozipfs/professor.txt", "r");
    if (f == NULL) {
        printf("No professor.txt\nin /mnt/rozipfs/\n");
    } else {
        OSSemPost(professor_key);
        while (1) {
            unsigned char e;
            OSSemPend(professor_key, 0, &e);
            if (fgets(professor_name, 100, f) == NULL) {
                fseek(f, 0, SEEK_SET);
            }
            OSSemPost(professor_key);
        }
    }
}
int main() {
    professor_key = OSSemCreate(0);
    OSTaskCreateExt(f1, 0, (void*) &s1[2047], 1, 1, s1, 2048, 0, 0);
    OSTaskCreateExt(f2, 0, (void*) &s2[2047], 2, 2, s2, 2048, 0, 0);
    OSTaskCreateExt(f3, 0, (void*) &s3[2047], 3, 3, s3, 2048, 0, 0);
    OSTaskCreateExt(f4, 0, (void*) &s4[2047], 4, 4, s4, 2048, 0, 0);
    OSStart();
    return 0;
}
