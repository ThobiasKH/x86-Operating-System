#include "stdint.h"
#include "stdio.h"

void _cdecl cstart_(uint16_t bootDrive) {
    puts("C says hello \n");
    printf("My favourite number is %d", 42);
    for (;;)
        ;
}
