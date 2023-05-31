#*****************************************************************************
# xamoinc_d.S
#-----------------------------------------------------------------------------
#
# Test xamoinc.d instruction.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  TEST_CASE(2, a4, 123, \
    li a0, 123; \
    la a3, xamo_operand; \
    sd a0, 0(a3); \
    .word 0x0806b70b; /* xamodec.d	a4, 0(a3) */ \
  )

  TEST_CASE(3, a5, 122, ld a5, 0(a3))

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END

  .bss
  .align 3
xamo_operand:
  .dword 0
