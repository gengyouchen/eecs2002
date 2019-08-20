#ifndef __LTM_H__
#define __LTM_H__

#include <io.h>

// ======================================================================
// Register Map
// ======================================================================

#define SYMBOL 0

// ======================================================================
// Hardware Abstraction
// ======================================================================

void turn_right_ltm(void *base)
{
    int value = IORD(base, SYMBOL);
    if (value == 0) IOWR(base, SYMBOL, 3);
    else if (value == 1) IOWR(base, SYMBOL, 2);
    else if (value == 2) IOWR(base, SYMBOL, 0);
    else IOWR(base, SYMBOL, 1);
}

void turn_back_ltm(void *base)
{
    int value = IORD(base, SYMBOL);
    if (value == 0) IOWR(base, SYMBOL, 1);
    else if (value == 1) IOWR(base, SYMBOL, 0);
    else if (value == 2) IOWR(base, SYMBOL, 3);
    else IOWR(base, SYMBOL, 2);
}

void turn_left_ltm(void *base)
{
    int value = IORD(base, SYMBOL);
    if (value == 0) IOWR(base, SYMBOL, 2);
    else if (value == 1) IOWR(base, SYMBOL, 3);
    else if (value == 2) IOWR(base, SYMBOL, 1);
    else IOWR(base, SYMBOL, 0);
}

#endif
