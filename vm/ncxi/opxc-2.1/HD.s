%define SS_RCD_2_MAX_P (1<<21)
%define SS_RCD_3_MAX_P (1<<19)
%define SS_RCD_4_MAX_P (1<<15)
%define KB 1024
%define MB KB*KB 
%define GB MB*MB
%define SIG_INT 2
%define SIG_SEGV 11
%define SS_MAX 4000
%define SS_LN_MAX 1<<21
%define SS_LN_REG r15
%define MCR_REG rbx
;%define SS_LN_N r12