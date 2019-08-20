/* system.h
 *
 * Machine generated for a CPU named "CPU" as defined in:
 * c:\EECS2002\Lab3\software\Lab3_software_syslib\..\..\Lab3_SOPC.ptf
 *
 * Generated: 2011-05-10 01:19:18.134
 *
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/*

DO NOT MODIFY THIS FILE

   Changing this file will have subtle consequences
   which will almost certainly lead to a nonfunctioning
   system. If you do modify this file, be aware that your
   changes will be overwritten and lost when this file
   is generated again.

DO NOT MODIFY THIS FILE

*/

/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2003 Altera Corporation, San Jose, California, USA.           *
* All rights reserved.                                                        *
*                                                                             *
* Permission is hereby granted, free of charge, to any person obtaining a     *
* copy of this software and associated documentation files (the "Software"),  *
* to deal in the Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
* and/or sell copies of the Software, and to permit persons to whom the       *
* Software is furnished to do so, subject to the following conditions:        *
*                                                                             *
* The above copyright notice and this permission notice shall be included in  *
* all copies or substantial portions of the Software.                         *
*                                                                             *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
* DEALINGS IN THE SOFTWARE.                                                   *
*                                                                             *
* This agreement shall be governed in all respects by the laws of the State   *
* of California and by the laws of the United States of America.              *
*                                                                             *
******************************************************************************/

/*
 * system configuration
 *
 */

#define ALT_SYSTEM_NAME "Lab3_SOPC"
#define ALT_CPU_NAME "CPU"
#define ALT_CPU_ARCHITECTURE "altera_nios2"
#define ALT_DEVICE_FAMILY "CYCLONEII"
#define ALT_STDIN "/dev/JTAG_controller"
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN_BASE 0x094110c0
#define ALT_STDIN_DEV JTAG_controller
#define ALT_STDIN_PRESENT
#define ALT_STDOUT "/dev/LCD_controller"
#define ALT_STDOUT_TYPE "altera_avalon_lcd_16207"
#define ALT_STDOUT_BASE 0x09411070
#define ALT_STDOUT_DEV LCD_controller
#define ALT_STDOUT_PRESENT
#define ALT_STDERR "/dev/JTAG_controller"
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDERR_BASE 0x094110c0
#define ALT_STDERR_DEV JTAG_controller
#define ALT_STDERR_PRESENT
#define ALT_CPU_FREQ 100000000
#define ALT_IRQ_BASE NULL
#define ALT_LEGACY_INTERRUPT_API_PRESENT

/*
 * processor configuration
 *
 */

#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_BIG_ENDIAN 0
#define NIOS2_INTERRUPT_CONTROLLER_ID 0

#define NIOS2_ICACHE_SIZE 4096
#define NIOS2_DCACHE_SIZE 2048
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_DCACHE_LINE_SIZE 32
#define NIOS2_DCACHE_LINE_SIZE_LOG2 5
#define NIOS2_FLUSHDA_SUPPORTED

#define NIOS2_EXCEPTION_ADDR 0x04000020
#define NIOS2_RESET_ADDR 0x04000000
#define NIOS2_BREAK_ADDR 0x09410820

#define NIOS2_HAS_DEBUG_STUB

#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0

/*
 * A define for each class of peripheral
 *
 */

#define __ALTPLL
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_CY7C1380_SSRAM
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER
#define __ALTERA_AVALON_CFI_FLASH
#define __ALTERA_AVALON_TRI_STATE_BRIDGE
#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_LCD_16207
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_TIMER
#define __ALTERA_AVALON_SYSID
#define __SEG7
#define __LTM

/*
 * PLL configuration
 *
 */

#define PLL_NAME "/dev/PLL"
#define PLL_TYPE "altpll"
#define PLL_BASE 0x09411060
#define PLL_SPAN 16
#define ALT_MODULE_CLASS_PLL altpll

/*
 * on_chip_memory configuration
 *
 */

#define ON_CHIP_MEMORY_NAME "/dev/on_chip_memory"
#define ON_CHIP_MEMORY_TYPE "altera_avalon_onchip_memory2"
#define ON_CHIP_MEMORY_BASE 0x09408000
#define ON_CHIP_MEMORY_SPAN 30000
#define ON_CHIP_MEMORY_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ON_CHIP_MEMORY_RAM_BLOCK_TYPE "M4K"
#define ON_CHIP_MEMORY_INIT_CONTENTS_FILE "on_chip_memory"
#define ON_CHIP_MEMORY_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ON_CHIP_MEMORY_GUI_RAM_BLOCK_TYPE "Automatic"
#define ON_CHIP_MEMORY_WRITEABLE 1
#define ON_CHIP_MEMORY_DUAL_PORT 0
#define ON_CHIP_MEMORY_SIZE_VALUE 30000
#define ON_CHIP_MEMORY_SIZE_MULTIPLE 1
#define ON_CHIP_MEMORY_USE_SHALLOW_MEM_BLOCKS 0
#define ON_CHIP_MEMORY_INIT_MEM_CONTENT 1
#define ON_CHIP_MEMORY_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ON_CHIP_MEMORY_INSTANCE_ID "NONE"
#define ON_CHIP_MEMORY_READ_DURING_WRITE_MODE "DONT_CARE"
#define ON_CHIP_MEMORY_IGNORE_AUTO_BLOCK_TYPE_ASSIGNMENT 1
#define ON_CHIP_MEMORY_CONTENTS_INFO "QUARTUS_PROJECT_DIR/on_chip_memory.hex 1304961075"
#define ALT_MODULE_CLASS_on_chip_memory altera_avalon_onchip_memory2

/*
 * SSRAM_controller configuration
 *
 */

#define SSRAM_CONTROLLER_NAME "/dev/SSRAM_controller"
#define SSRAM_CONTROLLER_TYPE "altera_avalon_cy7c1380_ssram"
#define SSRAM_CONTROLLER_BASE 0x09200000
#define SSRAM_CONTROLLER_SPAN 2097152
#define SSRAM_CONTROLLER_SRAM_MEMORY_SIZE 2
#define SSRAM_CONTROLLER_SRAM_MEMORY_UNITS 1048576
#define SSRAM_CONTROLLER_SSRAM_DATA_WIDTH 32
#define SSRAM_CONTROLLER_SSRAM_READ_LATENCY 2
#define SSRAM_CONTROLLER_SIMULATION_MODEL_NUM_LANES 4
#define ALT_MODULE_CLASS_SSRAM_controller altera_avalon_cy7c1380_ssram

/*
 * SDRAM_controller configuration
 *
 */

#define SDRAM_CONTROLLER_NAME "/dev/SDRAM_controller"
#define SDRAM_CONTROLLER_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_CONTROLLER_BASE 0x04000000
#define SDRAM_CONTROLLER_SPAN 67108864
#define SDRAM_CONTROLLER_REGISTER_DATA_IN 1
#define SDRAM_CONTROLLER_SIM_MODEL_BASE 0
#define SDRAM_CONTROLLER_SDRAM_DATA_WIDTH 32
#define SDRAM_CONTROLLER_SDRAM_ADDR_WIDTH 13
#define SDRAM_CONTROLLER_SDRAM_ROW_WIDTH 13
#define SDRAM_CONTROLLER_SDRAM_COL_WIDTH 9
#define SDRAM_CONTROLLER_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_CONTROLLER_SDRAM_NUM_BANKS 4
#define SDRAM_CONTROLLER_REFRESH_PERIOD 7.8125
#define SDRAM_CONTROLLER_POWERUP_DELAY 200.0
#define SDRAM_CONTROLLER_CAS_LATENCY 3
#define SDRAM_CONTROLLER_T_RFC 70.0
#define SDRAM_CONTROLLER_T_RP 20.0
#define SDRAM_CONTROLLER_T_MRD 3
#define SDRAM_CONTROLLER_T_RCD 20.0
#define SDRAM_CONTROLLER_T_AC 5.5
#define SDRAM_CONTROLLER_T_WR 14.0
#define SDRAM_CONTROLLER_INIT_REFRESH_COMMANDS 2
#define SDRAM_CONTROLLER_INIT_NOP_DELAY 0.0
#define SDRAM_CONTROLLER_SHARED_DATA 0
#define SDRAM_CONTROLLER_SDRAM_BANK_WIDTH 2
#define SDRAM_CONTROLLER_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_CONTROLLER_STARVATION_INDICATOR 0
#define SDRAM_CONTROLLER_IS_INITIALIZED 1
#define ALT_MODULE_CLASS_SDRAM_controller altera_avalon_new_sdram_controller

/*
 * Flash_controller configuration
 *
 */

#define FLASH_CONTROLLER_NAME "/dev/Flash_controller"
#define FLASH_CONTROLLER_TYPE "altera_avalon_cfi_flash"
#define FLASH_CONTROLLER_BASE 0x08800000
#define FLASH_CONTROLLER_SPAN 8388608
#define FLASH_CONTROLLER_SETUP_VALUE 0
#define FLASH_CONTROLLER_WAIT_VALUE 100
#define FLASH_CONTROLLER_HOLD_VALUE 0
#define FLASH_CONTROLLER_TIMING_UNITS "ns"
#define FLASH_CONTROLLER_UNIT_MULTIPLIER 1
#define FLASH_CONTROLLER_SIZE 8388608
#define ALT_MODULE_CLASS_Flash_controller altera_avalon_cfi_flash

/*
 * SSRAM_bridge configuration
 *
 */

#define SSRAM_BRIDGE_NAME "/dev/SSRAM_bridge"
#define SSRAM_BRIDGE_TYPE "altera_avalon_tri_state_bridge"
#define ALT_MODULE_CLASS_SSRAM_bridge altera_avalon_tri_state_bridge

/*
 * Flash_bridge configuration
 *
 */

#define FLASH_BRIDGE_NAME "/dev/Flash_bridge"
#define FLASH_BRIDGE_TYPE "altera_avalon_tri_state_bridge"
#define ALT_MODULE_CLASS_Flash_bridge altera_avalon_tri_state_bridge

/*
 * JTAG_controller configuration
 *
 */

#define JTAG_CONTROLLER_NAME "/dev/JTAG_controller"
#define JTAG_CONTROLLER_TYPE "altera_avalon_jtag_uart"
#define JTAG_CONTROLLER_BASE 0x094110c0
#define JTAG_CONTROLLER_SPAN 8
#define JTAG_CONTROLLER_IRQ 0
#define JTAG_CONTROLLER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_CONTROLLER_WRITE_DEPTH 64
#define JTAG_CONTROLLER_READ_DEPTH 64
#define JTAG_CONTROLLER_WRITE_THRESHOLD 8
#define JTAG_CONTROLLER_READ_THRESHOLD 8
#define JTAG_CONTROLLER_READ_CHAR_STREAM ""
#define JTAG_CONTROLLER_SHOWASCII 1
#define JTAG_CONTROLLER_RELATIVEPATH 1
#define JTAG_CONTROLLER_READ_LE 0
#define JTAG_CONTROLLER_WRITE_LE 0
#define JTAG_CONTROLLER_ALTERA_SHOW_UNRELEASED_JTAG_UART_FEATURES 0
#define ALT_MODULE_CLASS_JTAG_controller altera_avalon_jtag_uart

/*
 * LCD_controller configuration
 *
 */

#define LCD_CONTROLLER_NAME "/dev/LCD_controller"
#define LCD_CONTROLLER_TYPE "altera_avalon_lcd_16207"
#define LCD_CONTROLLER_BASE 0x09411070
#define LCD_CONTROLLER_SPAN 16
#define ALT_MODULE_CLASS_LCD_controller altera_avalon_lcd_16207

/*
 * toggle_switches_controller configuration
 *
 */

#define TOGGLE_SWITCHES_CONTROLLER_NAME "/dev/toggle_switches_controller"
#define TOGGLE_SWITCHES_CONTROLLER_TYPE "altera_avalon_pio"
#define TOGGLE_SWITCHES_CONTROLLER_BASE 0x09411080
#define TOGGLE_SWITCHES_CONTROLLER_SPAN 16
#define TOGGLE_SWITCHES_CONTROLLER_DO_TEST_BENCH_WIRING 0
#define TOGGLE_SWITCHES_CONTROLLER_DRIVEN_SIM_VALUE 0
#define TOGGLE_SWITCHES_CONTROLLER_HAS_TRI 0
#define TOGGLE_SWITCHES_CONTROLLER_HAS_OUT 0
#define TOGGLE_SWITCHES_CONTROLLER_HAS_IN 1
#define TOGGLE_SWITCHES_CONTROLLER_CAPTURE 0
#define TOGGLE_SWITCHES_CONTROLLER_DATA_WIDTH 18
#define TOGGLE_SWITCHES_CONTROLLER_RESET_VALUE 0
#define TOGGLE_SWITCHES_CONTROLLER_EDGE_TYPE "NONE"
#define TOGGLE_SWITCHES_CONTROLLER_IRQ_TYPE "NONE"
#define TOGGLE_SWITCHES_CONTROLLER_BIT_CLEARING_EDGE_REGISTER 0
#define TOGGLE_SWITCHES_CONTROLLER_BIT_MODIFYING_OUTPUT_REGISTER 0
#define TOGGLE_SWITCHES_CONTROLLER_FREQ 100000000
#define ALT_MODULE_CLASS_toggle_switches_controller altera_avalon_pio

/*
 * push_button_switches_controller configuration
 *
 */

#define PUSH_BUTTON_SWITCHES_CONTROLLER_NAME "/dev/push_button_switches_controller"
#define PUSH_BUTTON_SWITCHES_CONTROLLER_TYPE "altera_avalon_pio"
#define PUSH_BUTTON_SWITCHES_CONTROLLER_BASE 0x09411090
#define PUSH_BUTTON_SWITCHES_CONTROLLER_SPAN 16
#define PUSH_BUTTON_SWITCHES_CONTROLLER_DO_TEST_BENCH_WIRING 0
#define PUSH_BUTTON_SWITCHES_CONTROLLER_DRIVEN_SIM_VALUE 0
#define PUSH_BUTTON_SWITCHES_CONTROLLER_HAS_TRI 0
#define PUSH_BUTTON_SWITCHES_CONTROLLER_HAS_OUT 0
#define PUSH_BUTTON_SWITCHES_CONTROLLER_HAS_IN 1
#define PUSH_BUTTON_SWITCHES_CONTROLLER_CAPTURE 0
#define PUSH_BUTTON_SWITCHES_CONTROLLER_DATA_WIDTH 4
#define PUSH_BUTTON_SWITCHES_CONTROLLER_RESET_VALUE 0
#define PUSH_BUTTON_SWITCHES_CONTROLLER_EDGE_TYPE "NONE"
#define PUSH_BUTTON_SWITCHES_CONTROLLER_IRQ_TYPE "NONE"
#define PUSH_BUTTON_SWITCHES_CONTROLLER_BIT_CLEARING_EDGE_REGISTER 0
#define PUSH_BUTTON_SWITCHES_CONTROLLER_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PUSH_BUTTON_SWITCHES_CONTROLLER_FREQ 100000000
#define ALT_MODULE_CLASS_push_button_switches_controller altera_avalon_pio

/*
 * red_LEDs_controller configuration
 *
 */

#define RED_LEDS_CONTROLLER_NAME "/dev/red_LEDs_controller"
#define RED_LEDS_CONTROLLER_TYPE "altera_avalon_pio"
#define RED_LEDS_CONTROLLER_BASE 0x094110a0
#define RED_LEDS_CONTROLLER_SPAN 16
#define RED_LEDS_CONTROLLER_DO_TEST_BENCH_WIRING 0
#define RED_LEDS_CONTROLLER_DRIVEN_SIM_VALUE 0
#define RED_LEDS_CONTROLLER_HAS_TRI 0
#define RED_LEDS_CONTROLLER_HAS_OUT 1
#define RED_LEDS_CONTROLLER_HAS_IN 0
#define RED_LEDS_CONTROLLER_CAPTURE 0
#define RED_LEDS_CONTROLLER_DATA_WIDTH 18
#define RED_LEDS_CONTROLLER_RESET_VALUE 0
#define RED_LEDS_CONTROLLER_EDGE_TYPE "NONE"
#define RED_LEDS_CONTROLLER_IRQ_TYPE "NONE"
#define RED_LEDS_CONTROLLER_BIT_CLEARING_EDGE_REGISTER 0
#define RED_LEDS_CONTROLLER_BIT_MODIFYING_OUTPUT_REGISTER 0
#define RED_LEDS_CONTROLLER_FREQ 100000000
#define ALT_MODULE_CLASS_red_LEDs_controller altera_avalon_pio

/*
 * green_LEDs_controller configuration
 *
 */

#define GREEN_LEDS_CONTROLLER_NAME "/dev/green_LEDs_controller"
#define GREEN_LEDS_CONTROLLER_TYPE "altera_avalon_pio"
#define GREEN_LEDS_CONTROLLER_BASE 0x094110b0
#define GREEN_LEDS_CONTROLLER_SPAN 16
#define GREEN_LEDS_CONTROLLER_DO_TEST_BENCH_WIRING 0
#define GREEN_LEDS_CONTROLLER_DRIVEN_SIM_VALUE 0
#define GREEN_LEDS_CONTROLLER_HAS_TRI 0
#define GREEN_LEDS_CONTROLLER_HAS_OUT 1
#define GREEN_LEDS_CONTROLLER_HAS_IN 0
#define GREEN_LEDS_CONTROLLER_CAPTURE 0
#define GREEN_LEDS_CONTROLLER_DATA_WIDTH 8
#define GREEN_LEDS_CONTROLLER_RESET_VALUE 0
#define GREEN_LEDS_CONTROLLER_EDGE_TYPE "NONE"
#define GREEN_LEDS_CONTROLLER_IRQ_TYPE "NONE"
#define GREEN_LEDS_CONTROLLER_BIT_CLEARING_EDGE_REGISTER 0
#define GREEN_LEDS_CONTROLLER_BIT_MODIFYING_OUTPUT_REGISTER 0
#define GREEN_LEDS_CONTROLLER_FREQ 100000000
#define ALT_MODULE_CLASS_green_LEDs_controller altera_avalon_pio

/*
 * system_clock_timer configuration
 *
 */

#define SYSTEM_CLOCK_TIMER_NAME "/dev/system_clock_timer"
#define SYSTEM_CLOCK_TIMER_TYPE "altera_avalon_timer"
#define SYSTEM_CLOCK_TIMER_BASE 0x09411000
#define SYSTEM_CLOCK_TIMER_SPAN 32
#define SYSTEM_CLOCK_TIMER_IRQ 1
#define SYSTEM_CLOCK_TIMER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define SYSTEM_CLOCK_TIMER_ALWAYS_RUN 0
#define SYSTEM_CLOCK_TIMER_FIXED_PERIOD 0
#define SYSTEM_CLOCK_TIMER_SNAPSHOT 1
#define SYSTEM_CLOCK_TIMER_PERIOD 1
#define SYSTEM_CLOCK_TIMER_PERIOD_UNITS "ms"
#define SYSTEM_CLOCK_TIMER_RESET_OUTPUT 0
#define SYSTEM_CLOCK_TIMER_TIMEOUT_PULSE_OUTPUT 0
#define SYSTEM_CLOCK_TIMER_LOAD_VALUE 99999
#define SYSTEM_CLOCK_TIMER_COUNTER_SIZE 32
#define SYSTEM_CLOCK_TIMER_MULT 0.0010
#define SYSTEM_CLOCK_TIMER_TICKS_PER_SEC 1000
#define SYSTEM_CLOCK_TIMER_FREQ 100000000
#define ALT_MODULE_CLASS_system_clock_timer altera_avalon_timer

/*
 * timestamp_timer configuration
 *
 */

#define TIMESTAMP_TIMER_NAME "/dev/timestamp_timer"
#define TIMESTAMP_TIMER_TYPE "altera_avalon_timer"
#define TIMESTAMP_TIMER_BASE 0x09411020
#define TIMESTAMP_TIMER_SPAN 32
#define TIMESTAMP_TIMER_IRQ 2
#define TIMESTAMP_TIMER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMESTAMP_TIMER_ALWAYS_RUN 0
#define TIMESTAMP_TIMER_FIXED_PERIOD 0
#define TIMESTAMP_TIMER_SNAPSHOT 1
#define TIMESTAMP_TIMER_PERIOD 1
#define TIMESTAMP_TIMER_PERIOD_UNITS "ms"
#define TIMESTAMP_TIMER_RESET_OUTPUT 0
#define TIMESTAMP_TIMER_TIMEOUT_PULSE_OUTPUT 0
#define TIMESTAMP_TIMER_LOAD_VALUE 99999
#define TIMESTAMP_TIMER_COUNTER_SIZE 32
#define TIMESTAMP_TIMER_MULT 0.0010
#define TIMESTAMP_TIMER_TICKS_PER_SEC 1000
#define TIMESTAMP_TIMER_FREQ 100000000
#define ALT_MODULE_CLASS_timestamp_timer altera_avalon_timer

/*
 * sysid configuration
 *
 */

#define SYSID_NAME "/dev/sysid"
#define SYSID_TYPE "altera_avalon_sysid"
#define SYSID_BASE 0x094110c8
#define SYSID_SPAN 8
#define SYSID_ID 0u
#define SYSID_TIMESTAMP 1304960949u
#define SYSID_REGENERATE_VALUES 0
#define ALT_MODULE_CLASS_sysid altera_avalon_sysid

/*
 * seven_segment_displays_controller configuration
 *
 */

#define SEVEN_SEGMENT_DISPLAYS_CONTROLLER_NAME "/dev/seven_segment_displays_controller"
#define SEVEN_SEGMENT_DISPLAYS_CONTROLLER_TYPE "seg7"
#define SEVEN_SEGMENT_DISPLAYS_CONTROLLER_BASE 0x09411040
#define SEVEN_SEGMENT_DISPLAYS_CONTROLLER_SPAN 32
#define ALT_MODULE_CLASS_seven_segment_displays_controller seg7

/*
 * LTM_controller configuration
 *
 */

#define LTM_CONTROLLER_NAME "/dev/LTM_controller"
#define LTM_CONTROLLER_TYPE "ltm"
#define LTM_CONTROLLER_BASE 0x094110d0
#define LTM_CONTROLLER_SPAN 4
#define ALT_MODULE_CLASS_LTM_controller ltm

/*
 * MicroC/OS-II configuration
 *
 */

#define ALT_MAX_FD 32
#define OS_MAX_TASKS 10
#define OS_LOWEST_PRIO 20
#define OS_FLAG_EN 1
#define OS_THREAD_SAFE_NEWLIB 1
#define OS_MUTEX_EN 1
#define OS_SEM_EN 1
#define OS_MBOX_EN 1
#define OS_Q_EN 1
#define OS_MEM_EN 1
#define OS_FLAG_WAIT_CLR_EN 1
#define OS_FLAG_ACCEPT_EN 1
#define OS_FLAG_DEL_EN 1
#define OS_FLAG_QUERY_EN 1
#define OS_FLAG_NAME_SIZE 32
#define OS_MAX_FLAGS 20
#define OS_FLAGS_NBITS 16
#define OS_MUTEX_ACCEPT_EN 1
#define OS_MUTEX_DEL_EN 1
#define OS_MUTEX_QUERY_EN 1
#define OS_SEM_ACCEPT_EN 1
#define OS_SEM_SET_EN 1
#define OS_SEM_DEL_EN 1
#define OS_SEM_QUERY_EN 1
#define OS_MBOX_ACCEPT_EN 1
#define OS_MBOX_DEL_EN 1
#define OS_MBOX_POST_EN 1
#define OS_MBOX_POST_OPT_EN 1
#define OS_MBOX_QUERY_EN 1
#define OS_Q_ACCEPT_EN 1
#define OS_Q_DEL_EN 1
#define OS_Q_FLUSH_EN 1
#define OS_Q_POST_EN 1
#define OS_Q_POST_FRONT_EN 1
#define OS_Q_POST_OPT_EN 1
#define OS_Q_QUERY_EN 1
#define OS_MAX_QS 20
#define OS_MEM_QUERY_EN 1
#define OS_MEM_NAME_SIZE 32
#define OS_MAX_MEM_PART 60
#define OS_ARG_CHK_EN 1
#define OS_CPU_HOOKS_EN 1
#define OS_DEBUG_EN 1
#define OS_SCHED_LOCK_EN 1
#define OS_TASK_STAT_EN 1
#define OS_TASK_STAT_STK_CHK_EN 1
#define OS_TICK_STEP_EN 1
#define OS_EVENT_NAME_SIZE 32
#define OS_MAX_EVENTS 60
#define OS_TASK_IDLE_STK_SIZE 512
#define OS_TASK_STAT_STK_SIZE 512
#define OS_TASK_CHANGE_PRIO_EN 1
#define OS_TASK_CREATE_EN 1
#define OS_TASK_CREATE_EXT_EN 1
#define OS_TASK_DEL_EN 1
#define OS_TASK_NAME_SIZE 32
#define OS_TASK_PROFILE_EN 1
#define OS_TASK_QUERY_EN 1
#define OS_TASK_SUSPEND_EN 1
#define OS_TASK_SW_HOOK_EN 1
#define OS_TIME_TICK_HOOK_EN 1
#define OS_TIME_GET_SET_EN 1
#define OS_TIME_DLY_RESUME_EN 1
#define OS_TIME_DLY_HMSM_EN 1
#define OS_TMR_EN 0
#define OS_TMR_CFG_MAX 16
#define OS_TMR_CFG_NAME_SIZE 16
#define OS_TMR_CFG_TICKS_PER_SEC 10
#define OS_TMR_CFG_WHEEL_SIZE 2
#define OS_TASK_TMR_STK_SIZE 512
#define OS_TASK_TMR_PRIO 1
#define ALT_SYS_CLK SYSTEM_CLOCK_TIMER
#define ALT_TIMESTAMP_CLK TIMESTAMP_TIMER
#define OS_TICKS_PER_SEC 1000

/*
 * Altera Zip Read-Only File System configuration
 *
 */

#define ALTERA_RO_ZIPFS_NAME "/mnt/rozipfs"
#define ALTERA_RO_ZIPFS_OFFSET 0
#define ALTERA_RO_ZIPFS_BASE 142606336

/*
 * Devices associated with code sections.
 *
 */

#define ALT_TEXT_DEVICE       SDRAM_CONTROLLER
#define ALT_RODATA_DEVICE     SDRAM_CONTROLLER
#define ALT_RWDATA_DEVICE     SDRAM_CONTROLLER
#define ALT_EXCEPTIONS_DEVICE SDRAM_CONTROLLER
#define ALT_RESET_DEVICE      SDRAM_CONTROLLER

/*
 * The text section is initialised so no bootloader will be required.
 * Set a variable to tell crt0.S to provide code at the reset address and
 * to initialise rwdata if appropriate.
 */

#define ALT_NO_BOOTLOADER


#endif /* __SYSTEM_H_ */
