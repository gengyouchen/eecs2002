#ifndef __SEG7_H__
#define __SEG7_H__

#include <io.h>

// ======================================================================
// Register Map
// ======================================================================

#define SEG7_NUM0 0
#define SEG7_NUM1 1
#define SEG7_NUM2 2
#define SEG7_NUM3 3
#define SEG7_NUM4 4
#define SEG7_NUM5 5
#define SEG7_NUM6 6
#define SEG7_NUM7 7

// ======================================================================
// Hardware Abstraction
// ======================================================================

int get_seg7(void *base)
{
	int value = 0;
	value += IORD(base, SEG7_NUM0) * 1;
	value += IORD(base, SEG7_NUM1) * 10;
	value += IORD(base, SEG7_NUM2) * 100;
	value += IORD(base, SEG7_NUM3) * 1000;
	value += IORD(base, SEG7_NUM4) * 10000;
	value += IORD(base, SEG7_NUM5) * 100000;
	value += IORD(base, SEG7_NUM6) * 1000000;
	value += IORD(base, SEG7_NUM7) * 10000000;
	return value;
}

void set_seg7(void *base, int value)
{
	IOWR(base, SEG7_NUM0, value / 1 % 10);
	IOWR(base, SEG7_NUM1, value / 10 % 10);
	IOWR(base, SEG7_NUM2, value / 100 % 10);
	IOWR(base, SEG7_NUM3, value / 1000 % 10);
	IOWR(base, SEG7_NUM4, value / 10000 % 10);
	IOWR(base, SEG7_NUM5, value / 100000 % 10);
	IOWR(base, SEG7_NUM6, value / 1000000 % 10);
	IOWR(base, SEG7_NUM7, value / 10000000 % 10);
}

#endif
