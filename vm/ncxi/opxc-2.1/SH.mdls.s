%include "HD.s" 
bits 64 
%define SS_LN_N QWORD [SS_LN_N_PT]
; macros 
%macro RT_ERR 1 
	mov rdi,rt_err0 
	call emt_stg 
	mov QWORD [err_n],%1 
	jmp err 
%endmacro

%macro C_PUSH_REGS 0 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
%endmacro

%macro C_POP_REGS 0 
	pop r11 
	pop r10 
	pop r9 
	pop r8 
	pop rcx 
	pop rdx 
%endmacro

%macro CALL_SF 1 
	C_PUSH_REGS 
	call %1 
	C_POP_REGS
%endmacro

%macro C_CALL_SF 1 
	C_PUSH_REGS
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call %1 
	mov rsp,QWORD [rsp_tmp]
	C_POP_REGS
%endmacro 

%macro C_CALL 1 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call %1 
	mov rsp,QWORD [rsp_tmp]
%endmacro 

%macro JZ_SPC 2
	movzx MCR_REG,%1
	cmp MCR_REG,9 
	jz %2
	cmp MCR_REG,10 
	jz %2
	cmp MCR_REG,32 
	jz %2
%endmacro
 
%macro JZ_LINE_SPC 2
	movzx MCR_REG,%1 
	cmp MCR_REG,9 
	jz %2
	cmp MCR_REG,32 
	jz %2
%endmacro
 
%macro ALC_RCD 2 ; n,reg-name!=rbx 
	add QWORD [SS_RCD_C+8*%1],1
	add QWORD [SS_RCD_N+8*%1],1 
	mov %2,[SS_RCD_%1_TOP]
	mov MCR_REG,[%2]
	mov QWORD [SS_RCD_%1_TOP],MCR_REG
%endmacro 

%macro FREE_RCD 2 ; n,reg-name!=rbx 
	sub QWORD [SS_RCD_N+8*%1],1
	mov rbx,QWORD [SS_RCD_%1_TOP] 
	mov QWORD [%2],rbx
	mov QWORD [SS_RCD_%1_TOP],%2
%endmacro

%macro FREE_PT 1 
	mov rbx,[SS_PT_TOP]
	mov QWORD [%1],rbx
	mov [SS_PT_TOP],%1
%endmacro

%macro ALC_PT 1 
	mov %1,[SS_PT_TOP] 
	mov rbx,[%1]
	mov QWORD [SS_PT_TOP],rbx 
%endmacro
				
%macro FREE_LN 1 
	sub SS_LN_N,1 
	mov QWORD [%1],SS_LN_REG
	mov SS_LN_REG,%1
%endmacro

%macro ALC_LN 1 
	add QWORD [SS_LN_C],1 
	add SS_LN_N,1 
	mov %1,SS_LN_REG 
	mov SS_LN_REG,QWORD [SS_LN_REG]
%endmacro

%macro FREE_S8 1 
 mov rbx,0x0000_ffff_ffff_ffff 
	and rbx,QWORD [%1]
	sub QWORD [S8_N],rbx
	mov rdi,%1
	call free_s8
%endmacro 

%macro PUSH_GRM_DT 0
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
%endmacro

%macro POP_GRM_DT 0 
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
%endmacro

%macro RET_GRM_DT 0 
	mov r13,QWORD [GRM_DT] 
	mov r9,QWORD [GRM_DT+8] 
	mov r14,QWORD [GRM_DT+24]
%endmacro
			
%macro EMT_R64 1 
	cmp r10,3940 
	jg 
	mov rdx,%1
	mov rdi,QWORD [GD_BUF_IT] 
	mov BYTE [rdi+128],0
	mov rsi,fmt_r64 
 xor rax,rax
	C_CALL_SF sprintf 
	add QWORD [GD_BUF_IT],rax
%endmacro


%macro EMT_CST 2 ; %1=label,%2=len
	mov rdi,%1 
	mov rax,%2 
	call emt_cst 
%endmacro

%macro EMT_FLSH 0 
 xor rax,rax
	mov rdi,QWORD [GD_BUF_PT] 
	mov rbx,rdi
	C_CALL_SF printf 
	mov QWORD [GD_BUF_N],0
	mov QWORD [rbx],0
%endmacro

%macro GET_LEN 2 
	mov %1,0x0000_ffff_ffff_ffff
	and %1,QWORD [%2]
%endmacro

%macro MOV_RAX 2 
	mov rax,%2 
	mov %1,rax
	%endmacro

%macro MOV_RDI 2 
	mov rdi,%2 
	mov %1,rdi
%endmacro

%macro MOV_RBX 2 
	mov rbx,%2
	mov %1,rbx
%endmacro

%macro scf_F 1 
	push rdi
	movzx rdi,BYTE [rdi]
	xor rax,rax 
	C_CALL isspace
	cmp rax,0
	jnz scf_F_err0_%1 
	jmp scf_F_scf_%1 
scf_F_err0_%1: 
	add rsp,8
	mov rax,0
	ret
	scf_F_scf_%1:
	mov rdi,QWORD [rsp]
	sub rsp,8
	mov rsi,rsp
	mov rdx,%1
	mov rax,0
	C_CALL strtoul
	pop rsi
	pop rdi
	sub rsi,rdi
	jz scf_F_err1_%1
	mov rdi,rax
	mov rax,1 
	ret
scf_F_err1_%1:
	mov rax,0 
	ret
%endmacro

%macro BSS_SS_RCD 2 
	SS_RCD_%1_TOP: resq 1 
	SS_RCD_%1_VCT: resq (%1+1)*(%2+4)
	SS_RCD_%1_BTM: resq 1
%endmacro 

%define RCD_N 32
%define SS_NULL 0xffff_ffff_ffff_0000
%define EMT_BUF_MAX (KB<<1)

%define RX0 r13
%define RX1 r14
%define RX2 r8
%define RX3 r9 
%define RX4 r10 
%define RX5 r11 
%define RX6 rcx 
%define RX7 rdx
%define SEED 0x_f7f7_65d7_9dab_bace
 
extern MurmurHash64A
extern exit 
extern printf 
extern sprintf
extern malloc 
extern calloc
extern free 
extern isspace 
extern strtoul
extern strlen
extern getchar
extern system
extern set_handler
extern emt_s8_to
extern alc_gd_buf
extern set_usr_hdl
 
section .bss
	SS_LN_N_PT: resq 1 
	PAGE_SIZE: resq 1
	tmp: resq 64
	ret_vct: resq 64
 rsp_tmp: resq 1
	RB: resq 1 

; emt buffer 
	GD_BUF_PT: resq 1 
	GD_BUF_IT: resq 1
	EMT_BUF_OFS: resq 1 
 EMT_BUF: resb EMT_BUF_MAX 
	EMT_BUF_END: resb 1
 
; garbage vector 
	GBG_VCT: resq 252

; exp_s8 
	EXP_S8_VCT: resb 2048

;rep_movsb 
	REP_MOVSB_VCT: resq 4

	SS_LN_TOP: resq 1
	SS_LN_VCT: resq 2*SS_LN_MAX
	SS_LN_BTM: resq 1  

	SS_PT_TOP: resq 1
	SS_PT_VCT: resq 3*SS_MAX
	SS_PT_BTM: resq 1 

	SS_RCD_N: resq (RCD_N+1) 
	SS_RCD_C: resq (RCD_N+1)

	CNC_TOP: resq 64 

stat: resb 144
struc STAT
	.st_dev         resq 1
	.st_ino         resq 1
	.st_mode        resd 1
	.st_nlink       resd 1
	.st_uid         resd 1
	.st_gid         resd 1
	.st_rdev        resq 1
	.pad1           resq 1
	.st_size        resq 1
	.st_blksize     resd 1
	.pad2 resd 1
	.st_blocks      resq 1
	.st_atime       resq 1
	.st_atime_nsec  resq 1
	.st_mtime       resq 1
	.st_mtime_nsec  resq 1
	.st_ctime       resq 1
	.st_ctime_nsec  resq 1
	.__unused4  resd 1
	.__unused5  resd 1
endstruc

%define SS_RCD_1_MAX (1<<13)
	BSS_SS_RCD 1,SS_RCD_1_MAX
%define SS_RCD_2_MAX SS_RCD_2_MAX_P 
	BSS_SS_RCD 2,SS_RCD_2_MAX
%define SS_RCD_3_MAX SS_RCD_3_MAX_P 
	BSS_SS_RCD 3,SS_RCD_3_MAX
%define SS_RCD_4_MAX SS_RCD_4_MAX_P  
	BSS_SS_RCD 4,SS_RCD_4_MAX
%define SS_RCD_5_MAX (1<<13)
	BSS_SS_RCD 5,SS_RCD_5_MAX
%define SS_RCD_6_MAX (1<<13)
	BSS_SS_RCD 6,SS_RCD_6_MAX
%define SS_RCD_7_MAX (1<<13)
	BSS_SS_RCD 7,SS_RCD_7_MAX
%define SS_RCD_8_MAX (1<<13)
	BSS_SS_RCD 8,SS_RCD_8_MAX
%define SS_RCD_9_MAX (1<<13)
	BSS_SS_RCD 9,SS_RCD_9_MAX
%define SS_RCD_10_MAX (1<<13)
	BSS_SS_RCD 10,SS_RCD_10_MAX
%define SS_RCD_11_MAX (1<<13)
	BSS_SS_RCD 11,SS_RCD_11_MAX
%define SS_RCD_12_MAX (1<<13)
	BSS_SS_RCD 12,SS_RCD_12_MAX
%define SS_RCD_13_MAX (1<<13)
	BSS_SS_RCD 13,SS_RCD_13_MAX
%define SS_RCD_14_MAX (1<<13)
	BSS_SS_RCD 14,SS_RCD_14_MAX
%define SS_RCD_15_MAX (1<<13)
	BSS_SS_RCD 15,SS_RCD_15_MAX
%define SS_RCD_16_MAX (1<<13)
	BSS_SS_RCD 16,SS_RCD_16_MAX
%define SS_RCD_17_MAX (1<<13)
	BSS_SS_RCD 17,SS_RCD_17_MAX
%define SS_RCD_18_MAX (1<<13)
	BSS_SS_RCD 18,SS_RCD_18_MAX
%define SS_RCD_19_MAX (1<<13)
	BSS_SS_RCD 19,SS_RCD_19_MAX
%define SS_RCD_20_MAX (1<<13)
	BSS_SS_RCD 20,SS_RCD_20_MAX
%define SS_RCD_21_MAX (1<<13)
	BSS_SS_RCD 21,SS_RCD_21_MAX
%define SS_RCD_22_MAX (1<<13)
	BSS_SS_RCD 22,SS_RCD_22_MAX
%define SS_RCD_23_MAX (1<<13)
	BSS_SS_RCD 23,SS_RCD_23_MAX
%define SS_RCD_24_MAX (1<<13)
	BSS_SS_RCD 24,SS_RCD_24_MAX
%define SS_RCD_25_MAX (1<<13)
	BSS_SS_RCD 25,SS_RCD_25_MAX
%define SS_RCD_26_MAX (1<<13)
	BSS_SS_RCD 26,SS_RCD_26_MAX
%define SS_RCD_27_MAX (1<<13)
	BSS_SS_RCD 27,SS_RCD_27_MAX
%define SS_RCD_28_MAX (1<<13)
	BSS_SS_RCD 28,SS_RCD_28_MAX
%define SS_RCD_29_MAX (1<<13)
	BSS_SS_RCD 29,SS_RCD_29_MAX
%define SS_RCD_30_MAX (1<<13)
	BSS_SS_RCD 30,SS_RCD_30_MAX
%define SS_RCD_31_MAX (1<<13)
	BSS_SS_RCD 31,SS_RCD_31_MAX
section .data
	SIG_FLG: dq 0 
	SIG_ETR: dq 0 
	SIG_RIP: dq 0
	GD_BUF_N: dq 0 
	EMT_FLG: dq 0 
	GRM_DT: 
		dq 0 
		dq 0 
		dq 0 
		dq 0 
		dq 0 
	err_n: dq 0
 SS_LN_C: dq 0
	S8_N: dq 0 
	
	fmt_err_line: db "err:%llx",10,0
	fmt_r64: db "%dr",0
	fmt_s8: db 34,"%s",34,0
	fmt_d: db "%d",0
	fmt_d_nl: db "%d",10,0
	fmt_x: db "%x",0
	fmt_arr_l: db "{| ",0
	fmt_arr_r: db "|}",0
	fmt_rcd_l: db "{ ",0
	fmt_rcd_r: db "} ",0
	fmt_rcd_box_l: db "*{ "
	fmt_nl: db 10,0
	fmt_spc: db " ",0
	fmt_emt: db "_emt:",0
	fmt_getchar: db "_getchar:",0
	fmt_test0: db "sig segv handled!!:",0
	rt_err0: db "rt_err 0:",10,0 
	emt_bof_msg: db "EMT_BOF:",10,0 
 s8_e: dq 0,0

	fmt_info:
		db "info:",10
		db "S8_N=%d",10
		db "SS_LN_C=%d",10
		db "SS_LN_N=%d",10
		db 0
	fmt_info_rcd:
		db "rcd %d",10
		db "SS_RCD_C=%d",10
		db "SS_RCD_N=%d",10
		db 0

fmt_sig_hdl:
	db "sig_hdl:",10
	db "signal number=%d",10
	db 0

LB_0: db 100,65,66,67,105,101,105,0
LB_8: db 39,48,226,151,130,0
LB_9: db 39,49,226,151,130,0
LB_10: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,95,114,54,52,226,151,130,125,10,0
LB_16: db 100,65,66,67,105,101,105,0
LB_24: db 39,48,226,151,130,0
LB_25: db 39,49,226,151,130,0
LB_26: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,125,125,10,0
LB_49: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,125,125,10,0
LB_50: db 56,55,51,56,51,0
LB_53: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,95,114,54,52,226,151,130,125,10,0
LB_54: db 32,32,32,9,10,107,107,0
LB_58: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,125,125,10,0
LB_59: db 32,32,32,9,10,107,107,0
LB_63: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,125,125,10,0
LB_88: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,125,125,10,0
LB_146: db 39,48,226,151,130,0
LB_147: db 39,49,226,151,130,0
LB_148: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,95,114,54,52,226,151,130,32,95,114,54,52,226,151,130,125,125,10,0
LB_171: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,125,125,10,0
LB_203: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,111,112,110,226,151,130,123,32,95,114,54,52,226,151,130,32,95,114,54,52,226,151,130,125,125,10,0
section .text
	unt: dq 0x0

	unt_0: dq 0x0 
	unt_1: dq (1<<48)
	unt_2: dq (2<<48)
	unt_3: dq (3<<48)
	unt_4: dq (4<<48)
	unt_5: dq (5<<48)
	unt_6: dq (6<<48)
	unt_7: dq (7<<48)
	unt_8: dq (8<<48)
	unt_9: dq (9<<48)
	unt_10: dq (10<<48)
	unt_11: dq (11<<48)
	unt_12: dq (12<<48)

global _start

info:
	C_PUSH_REGS
	mov rdi,fmt_info 
	mov rsi,QWORD [S8_N]
	mov rdx,QWORD [SS_LN_C]
	mov rcx,SS_LN_N 
	xor rax,rax 
	C_CALL printf
	mov rax,0
info_rcd:
	push rax 
	mov rdi,fmt_info_rcd
	mov rsi,rax 
	mov rdx,QWORD [SS_RCD_C+8*rax]
	mov rcx,QWORD [SS_RCD_N+8*rax]
	xor rax,rax
	C_CALL printf 
	pop rax 
	cmp rax,RCD_N 
	jz info_rcd_end 
	add rax,1 
	jmp info_rcd 
info_rcd_end:
	C_POP_REGS 
	ret
;getchar:
;	xor rax,rax 
;	C_CALL_SF getchar 
;	ret

sig_hdl: ; rdi=sig_n rsi=siginfo_t* rdx=void* context
	cmp QWORD [SIG_FLG],0
	jnz sig_hdl_usr
	push rdi 
	push rsi 
	push rdx 
	xor rax,rax 
	mov rsi,rdi 
	mov rdi,fmt_sig_hdl
	C_CALL printf 
	call info 
	call exit 
	mov QWORD [err_n],0xfff
	jmp err
sig_hdl_usr:
	mov rdi,QWORD [SIG_ETR]
	mov rsi,rdx 
	C_CALL set_usr_hdl 
	mov QWORD [SIG_RIP],rax
	ret 

eq_s8: ;rdi,rsi
	push rdx
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,QWORD [rdi]
	mov rdx,0x0000_ffff_ffff_ffff
	and rdx,QWORD [rsi]
	cmp rax,rdx
	jnz eq_s8_f 
eq_s8_lp:
	cmp rax,0
	jz eq_s8_t
	movzx rdx,BYTE [rdi+7+rax]
	cmp BYTE [rsi+7+rax],dl 
	jnz eq_s8_f 
	sub rax,1 
	jmp eq_s8_lp 
eq_s8_f:
	pop rdx 
	mov rax,0 
	stz
	ret 
eq_s8_t:
	pop rdx 
	mov rax,1 
	ret

rpc_s8: ; rdi ⊢ rax
	push rdi 
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,QWORD [rdi]  
	push rsi
	mov rdi,rsi 
	call mlc_s8
	pop rcx 
	pop rsi 
	add rsi,8
	lea rdi,[rax+8]
	cld 
	rep movsb
	ret
     
esc_s8: ; rdi ⊢ rax 
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,QWORD [rdi] 
	mov rax,rsi 
	shl rax,1 
	sub rsp,rax 
esc_s8_lp0: 

arr_of_lst: 
	mov rsi,0 
arr_of_lst_r:
	cmp BYTE [rdi+6],1
	jz arr_of_lst_end 
	push QWORD [rdi+8]
	mov rax,rdi
	FREE_RCD 2,rax 
	mov rdi,QWORD [rdi+16]
	add rsi,1 
	call arr_of_lst_r
	sub rsi,1 
	pop QWORD [rax+8+8*rsi]
	ret 
arr_of_lst_end: 
	push rsi 
	xor rax,rax
	mov rdi,8
	add rsi,1 
	C_CALL calloc
	pop rsi 
	mov QWORD [rax],rsi
	ret 

scf_d: ; rdi=src ⊢ rax=flg rdi=dst rsi=n
	scf_F 10
scf_x: ; rdi=src ⊢ rax=flg rdi=dst rsi=n
	scf_F 16

mlc_s8: ; rdi=len  
	push rdi 
	and rdi,~111b
	lea rdi,[rdi+16] 
	mov rsi,1 
	xor rax,rax 
	C_CALL_SF calloc
	pop QWORD [rax] 
	ret

s8_of_c_stg: 
	push rdi
	xor rax,rax
	C_CALL strlen
	push rax
	mov rdi,rax
	call mlc_s8
	pop rcx
	pop rsi
	mov rdi,rax
	add rdi,8
	cld
	rep movsb
	ret

free_s8: ;rdi=ptr
	C_CALL_SF free
	ret 

in_fn: 
	mov rax,2
	mov rsi,2
	syscall
	push rax ; [rsp]=fd
	mov rdi,rax
	mov rax,5
	mov rsi,stat
	syscall
	mov rdi,[stat + STAT.st_size]
	call mlc_s8
	mov rdi,QWORD [rsp]
	push rax ; [rsp]=buf
	mov rsi,rax
	add rsi,8
	mov rax,0
	mov rdx,[stat+STAT.st_size]
	syscall
	mov rax,3
	mov rdi,QWORD [rsp+8]
	syscall
	mov rax,QWORD [rsp]	
	add rsp,16
	ret 

emt_stg: ; rdi=stg 
	xor rax,rax 
	C_CALL_SF printf
	ret

emt_cst: ; rdi=stg,rax=len 
	C_PUSH_REGS 
	mov rdx,rdi 
	jmp emt_s8_stg 
emt_s8: ; rdi=s8
	C_PUSH_REGS 
	mov rax,0x0000_ffff_ffff_ffff
	and rax,QWORD [rdi] 
	lea rdx,[rdi+8]
emt_s8_stg: ; rax=len,rdx=stg-ptr
	mov r9,QWORD [GD_BUF_PT] 
	mov r10,QWORD [GD_BUF_N]
 cmp rax,2048 
	jge emt_s8_flsh 
	lea rsi,[r10+rax+16] 
	cmp rsi,4096 
	jl emt_s8_add
	EMT_FLSH
	mov r10,0
emt_s8_add:
	xor rax,rax
	mov rsi,fmt_s8
	lea rdi,[r9+r10] 
	C_CALL_SF sprintf 
	add QWORD [GD_BUF_N],rax
	C_POP_REGS 
	ret
emt_s8_flsh:
	EMT_FLSH 
	xor rax,rax 
	mov rsi,rdx
	mov rdi,fmt_s8 
	C_CALL_SF printf 
	C_POP_REGS
	ret 

emt_bof_hdl: 
	EMT_FLSH
	mov rdi,QWORD [GD_BUF_PT]
	jmp QWORD [SIG_RIP] 

emt_r64: ;rdi=r64
	C_PUSH_REGS 
	mov rdx,rdi
	mov r9,QWORD [GD_BUF_PT] 
	mov r10,QWORD [GD_BUF_N]
	cmp r10,3940
	jl emt_r64_add
	EMT_FLSH 
	mov r10,0 
emt_r64_add:
	xor rax,rax 
	mov rsi,fmt_r64
	lea rdi,[r9+r10]
	C_CALL_SF sprintf
	add QWORD [GD_BUF_N],rax 
	C_POP_REGS
	ret
	 
_start:
; set signal handler 
	mov rdi,SIG_SEGV 
	mov rsi,sig_hdl 
	C_CALL set_handler 

; init emt buffer 
	mov rdi,PAGE_SIZE
	C_CALL alc_gd_buf
	mov QWORD [GD_BUF_PT],rax
	mov QWORD [GD_BUF_IT],rax
	mov rax,0 
	mov rdi,fmt_d 
	mov rsi,QWORD [PAGE_SIZE]
	C_CALL printf
SS_LN_init:
	mov SS_LN_N,0
	mov QWORD [SS_LN_TOP],SS_LN_VCT
	mov r15,SS_LN_VCT 
	mov rdi,0 
	mov rax,SS_LN_VCT 
SS_LN_lp: 
	cmp rdi,SS_LN_MAX 
	jz SS_LN_end 
	add rdi,1 
	lea rsi,[rax+8*2] 
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp SS_LN_lp 
SS_LN_end:
	mov rsi,0xffff_ffff_ffff_0100 
	mov [rax],rsi

SS_PT_init:
	mov QWORD [SS_PT_TOP],SS_PT_VCT
	mov rdi,0 
	mov rax,SS_PT_VCT 
SS_PT_lp: 
	cmp rdi,SS_MAX 
	jz SS_PT_end 
	add rdi,1 
	lea rsi,[rax+8*3] 
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp SS_PT_lp 
SS_PT_end:
	mov rsi,0xffff_ffff_ffff_0200 
	mov [rax],rsi

	mov rdi,0
	mov QWORD [EMT_BUF],0
	mov QWORD [EMT_BUF_OFS],0

; _args 
	mov rdi,QWORD [rsp]
 lea rdi,[rdi+1]
	mov rsi,8 
	xor rax,rax 
	C_CALL calloc
	pop r13
	mov QWORD [rax],r13
	xor r14,r14
	mov rbx,rax
args_lp:
	cmp r14,r13
	jz args_lp_end
	pop rdi
	call s8_of_c_stg 
	mov QWORD [rbx+8+8*r14],rax
	add r14,1 
	jmp args_lp 
args_lp_end:
	mov r13,rbx
 ; exn_root 
	push exn_dft 
	push exn_dft	

init_ss_rcd_1:
	mov QWORD [SS_RCD_N+8*1],0
	mov QWORD [SS_RCD_C+8*1],0
	mov QWORD [SS_RCD_1_TOP],SS_RCD_1_VCT
	mov rdi,0 
	mov rax,SS_RCD_1_VCT
ss_lp_rcd_1:
	cmp rdi,SS_RCD_1_MAX
	jz ss_end_rcd_1
	add rdi,1 
	lea rsi,[rax+8*2]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_1
ss_end_rcd_1:
	mov rsi,-65535
	mov [rax],rsi 

init_ss_rcd_2:
	mov QWORD [SS_RCD_N+8*2],0
	mov QWORD [SS_RCD_C+8*2],0
	mov QWORD [SS_RCD_2_TOP],SS_RCD_2_VCT
	mov rdi,0 
	mov rax,SS_RCD_2_VCT
ss_lp_rcd_2:
	cmp rdi,SS_RCD_2_MAX
	jz ss_end_rcd_2
	add rdi,1 
	lea rsi,[rax+8*3]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_2
ss_end_rcd_2:
	mov rsi,-65534
	mov [rax],rsi 

init_ss_rcd_3:
	mov QWORD [SS_RCD_N+8*3],0
	mov QWORD [SS_RCD_C+8*3],0
	mov QWORD [SS_RCD_3_TOP],SS_RCD_3_VCT
	mov rdi,0 
	mov rax,SS_RCD_3_VCT
ss_lp_rcd_3:
	cmp rdi,SS_RCD_3_MAX
	jz ss_end_rcd_3
	add rdi,1 
	lea rsi,[rax+8*4]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_3
ss_end_rcd_3:
	mov rsi,-65533
	mov [rax],rsi 

init_ss_rcd_4:
	mov QWORD [SS_RCD_N+8*4],0
	mov QWORD [SS_RCD_C+8*4],0
	mov QWORD [SS_RCD_4_TOP],SS_RCD_4_VCT
	mov rdi,0 
	mov rax,SS_RCD_4_VCT
ss_lp_rcd_4:
	cmp rdi,SS_RCD_4_MAX
	jz ss_end_rcd_4
	add rdi,1 
	lea rsi,[rax+8*5]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_4
ss_end_rcd_4:
	mov rsi,-65532
	mov [rax],rsi 

init_ss_rcd_5:
	mov QWORD [SS_RCD_N+8*5],0
	mov QWORD [SS_RCD_C+8*5],0
	mov QWORD [SS_RCD_5_TOP],SS_RCD_5_VCT
	mov rdi,0 
	mov rax,SS_RCD_5_VCT
ss_lp_rcd_5:
	cmp rdi,SS_RCD_5_MAX
	jz ss_end_rcd_5
	add rdi,1 
	lea rsi,[rax+8*6]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_5
ss_end_rcd_5:
	mov rsi,-65531
	mov [rax],rsi 

init_ss_rcd_6:
	mov QWORD [SS_RCD_N+8*6],0
	mov QWORD [SS_RCD_C+8*6],0
	mov QWORD [SS_RCD_6_TOP],SS_RCD_6_VCT
	mov rdi,0 
	mov rax,SS_RCD_6_VCT
ss_lp_rcd_6:
	cmp rdi,SS_RCD_6_MAX
	jz ss_end_rcd_6
	add rdi,1 
	lea rsi,[rax+8*7]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_6
ss_end_rcd_6:
	mov rsi,-65530
	mov [rax],rsi 

init_ss_rcd_7:
	mov QWORD [SS_RCD_N+8*7],0
	mov QWORD [SS_RCD_C+8*7],0
	mov QWORD [SS_RCD_7_TOP],SS_RCD_7_VCT
	mov rdi,0 
	mov rax,SS_RCD_7_VCT
ss_lp_rcd_7:
	cmp rdi,SS_RCD_7_MAX
	jz ss_end_rcd_7
	add rdi,1 
	lea rsi,[rax+8*8]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_7
ss_end_rcd_7:
	mov rsi,-65529
	mov [rax],rsi 

init_ss_rcd_8:
	mov QWORD [SS_RCD_N+8*8],0
	mov QWORD [SS_RCD_C+8*8],0
	mov QWORD [SS_RCD_8_TOP],SS_RCD_8_VCT
	mov rdi,0 
	mov rax,SS_RCD_8_VCT
ss_lp_rcd_8:
	cmp rdi,SS_RCD_8_MAX
	jz ss_end_rcd_8
	add rdi,1 
	lea rsi,[rax+8*9]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_8
ss_end_rcd_8:
	mov rsi,-65528
	mov [rax],rsi 

init_ss_rcd_9:
	mov QWORD [SS_RCD_N+8*9],0
	mov QWORD [SS_RCD_C+8*9],0
	mov QWORD [SS_RCD_9_TOP],SS_RCD_9_VCT
	mov rdi,0 
	mov rax,SS_RCD_9_VCT
ss_lp_rcd_9:
	cmp rdi,SS_RCD_9_MAX
	jz ss_end_rcd_9
	add rdi,1 
	lea rsi,[rax+8*10]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_9
ss_end_rcd_9:
	mov rsi,-65527
	mov [rax],rsi 

init_ss_rcd_10:
	mov QWORD [SS_RCD_N+8*10],0
	mov QWORD [SS_RCD_C+8*10],0
	mov QWORD [SS_RCD_10_TOP],SS_RCD_10_VCT
	mov rdi,0 
	mov rax,SS_RCD_10_VCT
ss_lp_rcd_10:
	cmp rdi,SS_RCD_10_MAX
	jz ss_end_rcd_10
	add rdi,1 
	lea rsi,[rax+8*11]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_10
ss_end_rcd_10:
	mov rsi,-65526
	mov [rax],rsi 

init_ss_rcd_11:
	mov QWORD [SS_RCD_N+8*11],0
	mov QWORD [SS_RCD_C+8*11],0
	mov QWORD [SS_RCD_11_TOP],SS_RCD_11_VCT
	mov rdi,0 
	mov rax,SS_RCD_11_VCT
ss_lp_rcd_11:
	cmp rdi,SS_RCD_11_MAX
	jz ss_end_rcd_11
	add rdi,1 
	lea rsi,[rax+8*12]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_11
ss_end_rcd_11:
	mov rsi,-65525
	mov [rax],rsi 

init_ss_rcd_12:
	mov QWORD [SS_RCD_N+8*12],0
	mov QWORD [SS_RCD_C+8*12],0
	mov QWORD [SS_RCD_12_TOP],SS_RCD_12_VCT
	mov rdi,0 
	mov rax,SS_RCD_12_VCT
ss_lp_rcd_12:
	cmp rdi,SS_RCD_12_MAX
	jz ss_end_rcd_12
	add rdi,1 
	lea rsi,[rax+8*13]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_12
ss_end_rcd_12:
	mov rsi,-65524
	mov [rax],rsi 

init_ss_rcd_13:
	mov QWORD [SS_RCD_N+8*13],0
	mov QWORD [SS_RCD_C+8*13],0
	mov QWORD [SS_RCD_13_TOP],SS_RCD_13_VCT
	mov rdi,0 
	mov rax,SS_RCD_13_VCT
ss_lp_rcd_13:
	cmp rdi,SS_RCD_13_MAX
	jz ss_end_rcd_13
	add rdi,1 
	lea rsi,[rax+8*14]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_13
ss_end_rcd_13:
	mov rsi,-65523
	mov [rax],rsi 

init_ss_rcd_14:
	mov QWORD [SS_RCD_N+8*14],0
	mov QWORD [SS_RCD_C+8*14],0
	mov QWORD [SS_RCD_14_TOP],SS_RCD_14_VCT
	mov rdi,0 
	mov rax,SS_RCD_14_VCT
ss_lp_rcd_14:
	cmp rdi,SS_RCD_14_MAX
	jz ss_end_rcd_14
	add rdi,1 
	lea rsi,[rax+8*15]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_14
ss_end_rcd_14:
	mov rsi,-65522
	mov [rax],rsi 

init_ss_rcd_15:
	mov QWORD [SS_RCD_N+8*15],0
	mov QWORD [SS_RCD_C+8*15],0
	mov QWORD [SS_RCD_15_TOP],SS_RCD_15_VCT
	mov rdi,0 
	mov rax,SS_RCD_15_VCT
ss_lp_rcd_15:
	cmp rdi,SS_RCD_15_MAX
	jz ss_end_rcd_15
	add rdi,1 
	lea rsi,[rax+8*16]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_15
ss_end_rcd_15:
	mov rsi,-65521
	mov [rax],rsi 

init_ss_rcd_16:
	mov QWORD [SS_RCD_N+8*16],0
	mov QWORD [SS_RCD_C+8*16],0
	mov QWORD [SS_RCD_16_TOP],SS_RCD_16_VCT
	mov rdi,0 
	mov rax,SS_RCD_16_VCT
ss_lp_rcd_16:
	cmp rdi,SS_RCD_16_MAX
	jz ss_end_rcd_16
	add rdi,1 
	lea rsi,[rax+8*17]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_16
ss_end_rcd_16:
	mov rsi,-65520
	mov [rax],rsi 

init_ss_rcd_17:
	mov QWORD [SS_RCD_N+8*17],0
	mov QWORD [SS_RCD_C+8*17],0
	mov QWORD [SS_RCD_17_TOP],SS_RCD_17_VCT
	mov rdi,0 
	mov rax,SS_RCD_17_VCT
ss_lp_rcd_17:
	cmp rdi,SS_RCD_17_MAX
	jz ss_end_rcd_17
	add rdi,1 
	lea rsi,[rax+8*18]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_17
ss_end_rcd_17:
	mov rsi,-65519
	mov [rax],rsi 

init_ss_rcd_18:
	mov QWORD [SS_RCD_N+8*18],0
	mov QWORD [SS_RCD_C+8*18],0
	mov QWORD [SS_RCD_18_TOP],SS_RCD_18_VCT
	mov rdi,0 
	mov rax,SS_RCD_18_VCT
ss_lp_rcd_18:
	cmp rdi,SS_RCD_18_MAX
	jz ss_end_rcd_18
	add rdi,1 
	lea rsi,[rax+8*19]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_18
ss_end_rcd_18:
	mov rsi,-65518
	mov [rax],rsi 

init_ss_rcd_19:
	mov QWORD [SS_RCD_N+8*19],0
	mov QWORD [SS_RCD_C+8*19],0
	mov QWORD [SS_RCD_19_TOP],SS_RCD_19_VCT
	mov rdi,0 
	mov rax,SS_RCD_19_VCT
ss_lp_rcd_19:
	cmp rdi,SS_RCD_19_MAX
	jz ss_end_rcd_19
	add rdi,1 
	lea rsi,[rax+8*20]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_19
ss_end_rcd_19:
	mov rsi,-65517
	mov [rax],rsi 

init_ss_rcd_20:
	mov QWORD [SS_RCD_N+8*20],0
	mov QWORD [SS_RCD_C+8*20],0
	mov QWORD [SS_RCD_20_TOP],SS_RCD_20_VCT
	mov rdi,0 
	mov rax,SS_RCD_20_VCT
ss_lp_rcd_20:
	cmp rdi,SS_RCD_20_MAX
	jz ss_end_rcd_20
	add rdi,1 
	lea rsi,[rax+8*21]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_20
ss_end_rcd_20:
	mov rsi,-65516
	mov [rax],rsi 

init_ss_rcd_21:
	mov QWORD [SS_RCD_N+8*21],0
	mov QWORD [SS_RCD_C+8*21],0
	mov QWORD [SS_RCD_21_TOP],SS_RCD_21_VCT
	mov rdi,0 
	mov rax,SS_RCD_21_VCT
ss_lp_rcd_21:
	cmp rdi,SS_RCD_21_MAX
	jz ss_end_rcd_21
	add rdi,1 
	lea rsi,[rax+8*22]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_21
ss_end_rcd_21:
	mov rsi,-65515
	mov [rax],rsi 

init_ss_rcd_22:
	mov QWORD [SS_RCD_N+8*22],0
	mov QWORD [SS_RCD_C+8*22],0
	mov QWORD [SS_RCD_22_TOP],SS_RCD_22_VCT
	mov rdi,0 
	mov rax,SS_RCD_22_VCT
ss_lp_rcd_22:
	cmp rdi,SS_RCD_22_MAX
	jz ss_end_rcd_22
	add rdi,1 
	lea rsi,[rax+8*23]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_22
ss_end_rcd_22:
	mov rsi,-65514
	mov [rax],rsi 

init_ss_rcd_23:
	mov QWORD [SS_RCD_N+8*23],0
	mov QWORD [SS_RCD_C+8*23],0
	mov QWORD [SS_RCD_23_TOP],SS_RCD_23_VCT
	mov rdi,0 
	mov rax,SS_RCD_23_VCT
ss_lp_rcd_23:
	cmp rdi,SS_RCD_23_MAX
	jz ss_end_rcd_23
	add rdi,1 
	lea rsi,[rax+8*24]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_23
ss_end_rcd_23:
	mov rsi,-65513
	mov [rax],rsi 

init_ss_rcd_24:
	mov QWORD [SS_RCD_N+8*24],0
	mov QWORD [SS_RCD_C+8*24],0
	mov QWORD [SS_RCD_24_TOP],SS_RCD_24_VCT
	mov rdi,0 
	mov rax,SS_RCD_24_VCT
ss_lp_rcd_24:
	cmp rdi,SS_RCD_24_MAX
	jz ss_end_rcd_24
	add rdi,1 
	lea rsi,[rax+8*25]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_24
ss_end_rcd_24:
	mov rsi,-65512
	mov [rax],rsi 

init_ss_rcd_25:
	mov QWORD [SS_RCD_N+8*25],0
	mov QWORD [SS_RCD_C+8*25],0
	mov QWORD [SS_RCD_25_TOP],SS_RCD_25_VCT
	mov rdi,0 
	mov rax,SS_RCD_25_VCT
ss_lp_rcd_25:
	cmp rdi,SS_RCD_25_MAX
	jz ss_end_rcd_25
	add rdi,1 
	lea rsi,[rax+8*26]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_25
ss_end_rcd_25:
	mov rsi,-65511
	mov [rax],rsi 

init_ss_rcd_26:
	mov QWORD [SS_RCD_N+8*26],0
	mov QWORD [SS_RCD_C+8*26],0
	mov QWORD [SS_RCD_26_TOP],SS_RCD_26_VCT
	mov rdi,0 
	mov rax,SS_RCD_26_VCT
ss_lp_rcd_26:
	cmp rdi,SS_RCD_26_MAX
	jz ss_end_rcd_26
	add rdi,1 
	lea rsi,[rax+8*27]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_26
ss_end_rcd_26:
	mov rsi,-65510
	mov [rax],rsi 

init_ss_rcd_27:
	mov QWORD [SS_RCD_N+8*27],0
	mov QWORD [SS_RCD_C+8*27],0
	mov QWORD [SS_RCD_27_TOP],SS_RCD_27_VCT
	mov rdi,0 
	mov rax,SS_RCD_27_VCT
ss_lp_rcd_27:
	cmp rdi,SS_RCD_27_MAX
	jz ss_end_rcd_27
	add rdi,1 
	lea rsi,[rax+8*28]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_27
ss_end_rcd_27:
	mov rsi,-65509
	mov [rax],rsi 

init_ss_rcd_28:
	mov QWORD [SS_RCD_N+8*28],0
	mov QWORD [SS_RCD_C+8*28],0
	mov QWORD [SS_RCD_28_TOP],SS_RCD_28_VCT
	mov rdi,0 
	mov rax,SS_RCD_28_VCT
ss_lp_rcd_28:
	cmp rdi,SS_RCD_28_MAX
	jz ss_end_rcd_28
	add rdi,1 
	lea rsi,[rax+8*29]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_28
ss_end_rcd_28:
	mov rsi,-65508
	mov [rax],rsi 

init_ss_rcd_29:
	mov QWORD [SS_RCD_N+8*29],0
	mov QWORD [SS_RCD_C+8*29],0
	mov QWORD [SS_RCD_29_TOP],SS_RCD_29_VCT
	mov rdi,0 
	mov rax,SS_RCD_29_VCT
ss_lp_rcd_29:
	cmp rdi,SS_RCD_29_MAX
	jz ss_end_rcd_29
	add rdi,1 
	lea rsi,[rax+8*30]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_29
ss_end_rcd_29:
	mov rsi,-65507
	mov [rax],rsi 

init_ss_rcd_30:
	mov QWORD [SS_RCD_N+8*30],0
	mov QWORD [SS_RCD_C+8*30],0
	mov QWORD [SS_RCD_30_TOP],SS_RCD_30_VCT
	mov rdi,0 
	mov rax,SS_RCD_30_VCT
ss_lp_rcd_30:
	cmp rdi,SS_RCD_30_MAX
	jz ss_end_rcd_30
	add rdi,1 
	lea rsi,[rax+8*31]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_30
ss_end_rcd_30:
	mov rsi,-65506
	mov [rax],rsi 

init_ss_rcd_31:
	mov QWORD [SS_RCD_N+8*31],0
	mov QWORD [SS_RCD_C+8*31],0
	mov QWORD [SS_RCD_31_TOP],SS_RCD_31_VCT
	mov rdi,0 
	mov rax,SS_RCD_31_VCT
ss_lp_rcd_31:
	cmp rdi,SS_RCD_31_MAX
	jz ss_end_rcd_31
	add rdi,1 
	lea rsi,[rax+8*32]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_31
ss_end_rcd_31:
	mov rsi,-65505
	mov [rax],rsi 
	jmp RTM_0
LB_3: ;; _r64◂
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_6+8*rax]
 ; _r64◂ { }
LB_6: dq LB_4,LB_5
LB_4:
	EMT_CST LB_8,5
	mov r8,QWORD [r8+8]
	mov rdi,r8
	call emt_r64
	jmp LB_7
LB_5:
	EMT_CST LB_9,5
	EMT_CST fmt_rcd_box_l,4
	EMT_CST fmt_rcd_r,4
	jmp LB_7
LB_7:
	ret
LB_11: ;; _r64◂
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_14+8*rax]
 ; _r64◂ { }
LB_14: dq LB_12,LB_13
LB_12:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_15
LB_13:
	jmp LB_15
LB_15:
	ret
LB_19: ;; { }
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_22+8*rax]
 ; { } { }
LB_22: dq LB_20,LB_21
LB_20:
	EMT_CST LB_24,5
	EMT_CST fmt_rcd_box_l,4
	EMT_CST fmt_rcd_r,4
	jmp LB_23
LB_21:
	EMT_CST LB_25,5
	EMT_CST fmt_rcd_box_l,4
	EMT_CST fmt_rcd_r,4
	jmp LB_23
LB_23:
	ret
LB_27: ;; { }
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_30+8*rax]
 ; { } { }
LB_30: dq LB_28,LB_29
LB_28:
	jmp LB_31
LB_29:
	jmp LB_31
LB_31:
	ret
LB_38: ;; #61◂◂(_none◂{}) { { { } } { 8'(= r ) 9'(= r ) } } ⊢ 0'(= a3◂ [..] ) : ({ { { }} { _r64◂ _r64◂}}→_opn◂{ })
	add rsp,8
JMP_38:
;; rsp=2 , %1~9'(= r )%0~8'(= r )
; ∎ 0(<2)◂{ }
; .dlt.ptn 9'(= r )
; .dlt.ptn 8'(= r )
; .mov_ptn2 0(<2)◂{ } ⊢ 0'(= a3◂ [..] )
; {| 10.. |}
	mov RX0,unt_0
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_44: ;; #60◂◂(_none◂{}) { 8'(= {| l |} ) 9'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ }})
	add rsp,8
JMP_44:
;; rsp=2 , %1~9'(= r )%0~8'(= {| l |} )
; ∎ { 8'(= {| l |} ) 9'(= r ) 1(<2)◂{ } }
; .mov_ptn2 { 8'(= {| l |} ) 9'(= r ) 1(<2)◂{ } } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 11100000110.. |}
	mov RX2,unt_1
	mov RX1,QWORD [rsp-8+8*1]
	mov RX0,QWORD [rsp-8+8*2]
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_32: ;; #62◂◂(_none◂{}) { 8'(= {| l |} ) 9'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ }})
	add rsp,8
JMP_32:
;; rsp=2 , %1~9'(= r )%0~8'(= {| l |} )
; ##37 9'(= r ) ⊢ { 9'(= r ) 0'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX0,rax
;; rsp=2 , %3~0'(= r )%2~9'(= r )%0~8'(= {| l |} )
; # ?  { 8'(= {| l |} ) 0'(= r ) } ⊢ { 8'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
	mov rdi,QWORD [rsp-8+8*2]
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,RX0
	lea rdi,[rdi-2]
	cmp rax,rdi
	jg LB_33
	lea rdi,[rsi+rax]
	cmp BYTE [rdi+0],65
	jnz LB_33
	cmp BYTE [rdi+1],98
	jnz LB_33
	add rax,2
	mov rsi,unt_0
	jmp LB_34
LB_33:
	mov rsi,unt_1
LB_34:
	mov RX1,rax
	mov RX2,rsi
;; rsp=2 , %6~2'(= a3◂ [..] )%5~1'(= r )%4~8'(= {| l |} )%2~9'(= r )
;; ?; 2'(= a3◂ [..] ) ⊢ 0(<2)◂2'(= *{ } )
	mov rdi,RX2
	cmp BYTE [rdi+6],0
	jnz LB_36
	jmp LB_37
LB_36:
	jmp LB_35
LB_37:
;; rsp=2 , %7~2'(= *{ } )%5~1'(= r )%4~8'(= {| l |} )%2~9'(= r )
; ##37 9'(= r ) ⊢ { 9'(= r ) 0'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX0,rax
;; rsp=2 , %9~0'(= r )%8~9'(= r )%7~2'(= *{ } )%5~1'(= r )%4~8'(= {| l |} )
; ##37 1'(= r ) ⊢ { 1'(= r ) 3'(= r ) }
	mov rdi,RX1
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX3,rax
;; rsp=2 , %11~3'(= r )%10~1'(= r )%9~0'(= r )%8~9'(= r )%7~2'(= *{ } )%4~8'(= {| l |} )
; ##61 { { 2'(= *{ } ) } { 0'(= r ) 3'(= r ) } } ⊢ 0'(= a3◂ [..] )
	sub rsp,8
	mov QWORD [rsp+0],RX1
	push EXH_39
	push LB_40
	sub rsp,16
; .mov_ptn2 { { 2'(= *{ } ) } { 0'(= r ) 3'(= r ) } } ⊢ { { { } } { 13'(= r ) 14'(= r ) } }
; {| 1011000011111110.. |}
	mov QWORD [rsp-8+8*1],RX3
	mov QWORD [rsp-8+8*2],RX0
; mov_ptn2.
	call LB_38
LB_40:
	pop rax
	mov RX1,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=2 , %12~0'(= a3◂ [..] )%10~1'(= r )%8~9'(= r )%4~8'(= {| l |} )
;; ?; 0'(= a3◂ [..] ) ⊢ 0(<2)◂0'(= *{ } )
	mov rdi,RX0
	cmp BYTE [rdi+6],0
	jnz LB_42
	jmp LB_43
LB_42:
	jmp LB_41
LB_43:
;; rsp=2 , %13~0'(= *{ } )%10~1'(= r )%8~9'(= r )%4~8'(= {| l |} )
; ∎ { 8'(= {| l |} ) 1'(= r ) 0(<2)◂0'(= *{ } ) }
; .dlt.ptn 9'(= r )
; .mov_ptn2 { 8'(= {| l |} ) 1'(= r ) 0(<2)◂0'(= *{ } ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 1110000010.. |}
	mov RX2,unt_0
	mov RX0,QWORD [rsp-8+8*2]
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_41:
;; ?; 0'(= a3◂ [..] ) ⊢ 1(<2)◂{ }
;; rsp=2 , %10~1'(= r )%8~9'(= r )%4~8'(= {| l |} )
; ∎ { 8'(= {| l |} ) 9'(= r ) 1(<2)◂{ } }
; .dlt.ptn 1'(= r )
; .mov_ptn2 { 8'(= {| l |} ) 9'(= r ) 1(<2)◂{ } } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 11100000110.. |}
	mov RX2,unt_1
	mov RX1,QWORD [rsp-8+8*1]
	mov RX0,QWORD [rsp-8+8*2]
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_35:
;; ?; 2'(= a3◂ [..] ) ⊢ 1(<2)◂{ }
;; rsp=2 , %5~1'(= r )%4~8'(= {| l |} )%2~9'(= r )
; ##51 1'(= r ) ⊢ { }
;; rsp=2 , %4~8'(= {| l |} )%2~9'(= r )
; ##37 9'(= r ) ⊢ { 9'(= r ) 0'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX0,rax
;; rsp=2 , %15~0'(= r )%14~9'(= r )%4~8'(= {| l |} )
; ##60 { 8'(= {| l |} ) 9'(= r ) } ⊢|
; .dlt.ptn 0'(= r )
	push EXH_45
	push LB_46
	sub rsp,16
; .mov_ptn2 { 8'(= {| l |} ) 9'(= r ) } ⊢ { 12'(= {| l |} ) 13'(= r ) }
; {| 000000001111110.. |}
	MOV_RBX QWORD [rsp-8+8*1],QWORD [rsp-8+8*5]
	MOV_RBX QWORD [rsp-8+8*2],QWORD [rsp-8+8*6]
; mov_ptn2.
	call LB_44
LB_46:
	pop rax
; .add_rsp 2
	add rsp,16
; .mov_ptn2 { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 1110.. |}
; mov_ptn2.
	ret
EXH_39:
	add rsp,32
	pop rax
	jmp rax
EXH_45:
	add rsp,24
	pop rax
	jmp rax
LB_75: ;; #72◂◂(_none◂{}) { { { } { } } { 8'(= r ) 9'(= r ) } } ⊢ 0'(= a3◂ [..] ) : ({ { { } { }} { _r64◂ _r64◂}}→_opn◂{ })
	add rsp,8
JMP_75:
;; rsp=2 , %1~9'(= r )%0~8'(= r )
; ∎ 0(<2)◂{ }
; .dlt.ptn 9'(= r )
; .dlt.ptn 8'(= r )
; .mov_ptn2 0(<2)◂{ } ⊢ 0'(= a3◂ [..] )
; {| 10.. |}
	mov RX0,unt_0
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_81: ;; #71◂◂(_none◂{}) { 8'(= {| l |} ) 9'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ }})
	add rsp,8
JMP_81:
;; rsp=2 , %1~9'(= r )%0~8'(= {| l |} )
; ∎ { 8'(= {| l |} ) 9'(= r ) 1(<2)◂{ } }
; .mov_ptn2 { 8'(= {| l |} ) 9'(= r ) 1(<2)◂{ } } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 11100000110.. |}
	mov RX2,unt_1
	mov RX1,QWORD [rsp-8+8*1]
	mov RX0,QWORD [rsp-8+8*2]
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_64: ;; #73◂◂(_none◂{}) { 8'(= {| l |} ) 9'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ }})
	add rsp,8
JMP_64:
;; rsp=2 , %1~9'(= r )%0~8'(= {| l |} )
; ##37 9'(= r ) ⊢ { 9'(= r ) 0'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX0,rax
;; rsp=2 , %3~0'(= r )%2~9'(= r )%0~8'(= {| l |} )
; # ?  { 8'(= {| l |} ) 0'(= r ) } ⊢ { 8'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
	mov rdi,QWORD [rsp-8+8*2]
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,RX0
	lea rdi,[rdi-2]
	cmp rax,rdi
	jg LB_65
	lea rdi,[rsi+rax]
	cmp BYTE [rdi+0],102
	jnz LB_65
	cmp BYTE [rdi+1],102
	jnz LB_65
	add rax,2
	mov rsi,unt_0
	jmp LB_66
LB_65:
	mov rsi,unt_1
LB_66:
	mov RX1,rax
	mov RX2,rsi
;; rsp=2 , %6~2'(= a3◂ [..] )%5~1'(= r )%4~8'(= {| l |} )%2~9'(= r )
;; ?; 2'(= a3◂ [..] ) ⊢ 0(<2)◂2'(= *{ } )
	mov rdi,RX2
	cmp BYTE [rdi+6],0
	jnz LB_68
	jmp LB_69
LB_68:
	jmp LB_67
LB_69:
;; rsp=2 , %7~2'(= *{ } )%5~1'(= r )%4~8'(= {| l |} )%2~9'(= r )
; # ?  { 8'(= {| l |} ) 1'(= r ) } ⊢ { 8'(= {| l |} ) 0'(= r ) 3'(= a3◂ [..] ) }
	mov rdi,QWORD [rsp-8+8*2]
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,RX1
	lea rdi,[rdi-2]
	cmp rax,rdi
	jg LB_70
	lea rdi,[rsi+rax]
	cmp BYTE [rdi+0],118
	jnz LB_70
	cmp BYTE [rdi+1],118
	jnz LB_70
	add rax,2
	mov rsi,unt_0
	jmp LB_71
LB_70:
	mov rsi,unt_1
LB_71:
	mov RX0,rax
	mov RX3,rsi
;; rsp=2 , %10~3'(= a3◂ [..] )%9~0'(= r )%8~8'(= {| l |} )%7~2'(= *{ } )%2~9'(= r )
;; ?; 3'(= a3◂ [..] ) ⊢ 0(<2)◂3'(= *{ } )
	mov rdi,RX3
	cmp BYTE [rdi+6],0
	jnz LB_73
	jmp LB_74
LB_73:
	jmp LB_72
LB_74:
;; rsp=2 , %11~3'(= *{ } )%9~0'(= r )%8~8'(= {| l |} )%7~2'(= *{ } )%2~9'(= r )
; ##37 9'(= r ) ⊢ { 9'(= r ) 1'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX1,rax
;; rsp=2 , %13~1'(= r )%12~9'(= r )%11~3'(= *{ } )%9~0'(= r )%8~8'(= {| l |} )%7~2'(= *{ } )
; ##37 0'(= r ) ⊢ { 0'(= r ) 4'(= r ) }
	mov rdi,RX0
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX4,rax
;; rsp=2 , %15~4'(= r )%14~0'(= r )%13~1'(= r )%12~9'(= r )%11~3'(= *{ } )%8~8'(= {| l |} )%7~2'(= *{ } )
; ##72 { { 2'(= *{ } ) 3'(= *{ } ) } { 1'(= r ) 4'(= r ) } } ⊢ 1'(= a3◂ [..] )
	sub rsp,8
	mov QWORD [rsp+0],RX0
	push EXH_76
	push LB_77
	sub rsp,16
; .mov_ptn2 { { 2'(= *{ } ) 3'(= *{ } ) } { 1'(= r ) 4'(= r ) } } ⊢ { { { } { } } { 13'(= r ) 14'(= r ) } }
; {| 0111100011111110.. |}
	mov QWORD [rsp-8+8*1],RX4
	mov QWORD [rsp-8+8*2],RX1
; mov_ptn2.
	call LB_75
LB_77:
	pop rax
	mov RX1,RX0
	mov RX0,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=2 , %16~1'(= a3◂ [..] )%14~0'(= r )%12~9'(= r )%8~8'(= {| l |} )
;; ?; 1'(= a3◂ [..] ) ⊢ 0(<2)◂1'(= *{ } )
	mov rdi,RX1
	cmp BYTE [rdi+6],0
	jnz LB_79
	jmp LB_80
LB_79:
	jmp LB_78
LB_80:
;; rsp=2 , %17~1'(= *{ } )%14~0'(= r )%12~9'(= r )%8~8'(= {| l |} )
; ∎ { 8'(= {| l |} ) 0'(= r ) 0(<2)◂1'(= *{ } ) }
; .dlt.ptn 9'(= r )
; .mov_ptn2 { 8'(= {| l |} ) 0'(= r ) 0(<2)◂1'(= *{ } ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 1110000010.. |}
	mov RX2,unt_0
	mov RX1,RX0
	mov RX0,QWORD [rsp-8+8*2]
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_78:
;; ?; 1'(= a3◂ [..] ) ⊢ 1(<2)◂{ }
;; rsp=2 , %14~0'(= r )%12~9'(= r )%8~8'(= {| l |} )
; ∎ { 8'(= {| l |} ) 9'(= r ) 1(<2)◂{ } }
; .dlt.ptn 0'(= r )
; .mov_ptn2 { 8'(= {| l |} ) 9'(= r ) 1(<2)◂{ } } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 11100000110.. |}
	mov RX2,unt_1
	mov RX1,QWORD [rsp-8+8*1]
	mov RX0,QWORD [rsp-8+8*2]
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_72:
;; ?; 3'(= a3◂ [..] ) ⊢ 1(<2)◂{ }
;; rsp=2 , %9~0'(= r )%8~8'(= {| l |} )%7~2'(= *{ } )%2~9'(= r )
; ##51 0'(= r ) ⊢ { }
;; rsp=2 , %8~8'(= {| l |} )%7~2'(= *{ } )%2~9'(= r )
; ##37 9'(= r ) ⊢ { 9'(= r ) 0'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX0,rax
;; rsp=2 , %19~0'(= r )%18~9'(= r )%8~8'(= {| l |} )%7~2'(= *{ } )
; ##71 { 8'(= {| l |} ) 9'(= r ) } ⊢|
; .dlt.ptn 0'(= r )
; .dlt.ptn 2'(= *{ } )
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	push EXH_82
	push LB_83
	sub rsp,16
; .mov_ptn2 { 8'(= {| l |} ) 9'(= r ) } ⊢ { 12'(= {| l |} ) 13'(= r ) }
; {| 000000001111110.. |}
	MOV_RBX QWORD [rsp-8+8*1],QWORD [rsp-8+8*5]
	MOV_RBX QWORD [rsp-8+8*2],QWORD [rsp-8+8*6]
; mov_ptn2.
	call LB_81
LB_83:
	pop rax
; .add_rsp 2
	add rsp,16
; .mov_ptn2 { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 1110.. |}
; mov_ptn2.
	ret
LB_67:
;; ?; 2'(= a3◂ [..] ) ⊢ 1(<2)◂{ }
;; rsp=2 , %5~1'(= r )%4~8'(= {| l |} )%2~9'(= r )
; ##51 1'(= r ) ⊢ { }
;; rsp=2 , %4~8'(= {| l |} )%2~9'(= r )
; ##37 9'(= r ) ⊢ { 9'(= r ) 0'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX0,rax
;; rsp=2 , %21~0'(= r )%20~9'(= r )%4~8'(= {| l |} )
; ##71 { 8'(= {| l |} ) 9'(= r ) } ⊢|
; .dlt.ptn 0'(= r )
	push EXH_84
	push LB_85
	sub rsp,16
; .mov_ptn2 { 8'(= {| l |} ) 9'(= r ) } ⊢ { 12'(= {| l |} ) 13'(= r ) }
; {| 000000001111110.. |}
	MOV_RBX QWORD [rsp-8+8*1],QWORD [rsp-8+8*5]
	MOV_RBX QWORD [rsp-8+8*2],QWORD [rsp-8+8*6]
; mov_ptn2.
	call LB_81
LB_85:
	pop rax
; .add_rsp 2
	add rsp,16
; .mov_ptn2 { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 1110.. |}
; mov_ptn2.
	ret
EXH_76:
	add rsp,32
	pop rax
	jmp rax
EXH_82:
	add rsp,24
	pop rax
	jmp rax
EXH_84:
	add rsp,24
	pop rax
	jmp rax
LB_100: ;; #78◂◂(_none◂{}) { { { } { 8'(= r ) 9'(= r ) } } { 10'(= r ) 11'(= r ) } } ⊢ 0'(= a3◂ [..] ) : ({ { { } { _r64◂ _r64◂}} { _r64◂ _r64◂}}→_opn◂{ _r64◂ _r64◂})
	add rsp,8
JMP_100:
;; rsp=4 , %2~11'(= r )%1~10'(= r )%0~{ 8'(= r ) 9'(= r ) }
; ∎ 0(<2)◂{ 8'(= r ) 9'(= r ) }
; .dlt.ptn 11'(= r )
; .dlt.ptn 10'(= r )
; .mov_ptn2 0(<2)◂{ 8'(= r ) 9'(= r ) } ⊢ 0'(= a3◂ [..] )
; {| 10000000110.. |}
	ALC_RCD 2, rax
	mov RX0,rax
	mov RX1,QWORD [rsp-8+8*4]
	mov QWORD [RX0+8],RX1 
	mov RX1,QWORD [rsp-8+8*3]
	mov QWORD [RX0+16],RX1 
	mov BYTE [RX0+6],0
; mov_ptn2.
; .add_rsp 4
	add rsp,32
	ret
LB_122: ;; #76◂◂(_none◂{}) { { 8'(= r ) { } 9'(= r ) } { 10'(= r ) 11'(= r ) } } ⊢ 0'(= a3◂ [..] ) : ({ { _r64◂ { }_r64◂} { _r64◂ _r64◂}}→_opn◂{ _r64◂ _r64◂})
	add rsp,8
JMP_122:
;; rsp=4 , %3~11'(= r )%2~10'(= r )%1~9'(= r )%0~8'(= r )
; ∎ 0(<2)◂{ 8'(= r ) 9'(= r ) }
; .dlt.ptn 11'(= r )
; .dlt.ptn 10'(= r )
; .mov_ptn2 0(<2)◂{ 8'(= r ) 9'(= r ) } ⊢ 0'(= a3◂ [..] )
; {| 10000000110.. |}
	ALC_RCD 2, rax
	mov RX0,rax
	mov RX1,QWORD [rsp-8+8*4]
	mov QWORD [RX0+8],RX1 
	mov RX1,QWORD [rsp-8+8*3]
	mov QWORD [RX0+16],RX1 
	mov BYTE [RX0+6],0
; mov_ptn2.
; .add_rsp 4
	add rsp,32
	ret
LB_128: ;; #75◂◂(_none◂{}) { 8'(= {| l |} ) 9'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ _r64◂ _r64◂}})
	add rsp,8
JMP_128:
;; rsp=2 , %1~9'(= r )%0~8'(= {| l |} )
; ∎ { 8'(= {| l |} ) 9'(= r ) 1(<2)◂{ } }
; .mov_ptn2 { 8'(= {| l |} ) 9'(= r ) 1(<2)◂{ } } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 11100000110.. |}
	mov RX2,unt_1
	mov RX1,QWORD [rsp-8+8*1]
	mov RX0,QWORD [rsp-8+8*2]
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_106: ;; #77◂◂(_none◂{}) { 8'(= {| l |} ) 9'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ _r64◂ _r64◂}})
	add rsp,8
JMP_106:
;; rsp=2 , %1~9'(= r )%0~8'(= {| l |} )
; ##37 9'(= r ) ⊢ { 9'(= r ) 0'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX0,rax
;; rsp=2 , %3~0'(= r )%2~9'(= r )%0~8'(= {| l |} )
; # ?  { 8'(= {| l |} ) 0'(= r ) } ⊢ { 8'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
	mov rdi,QWORD [rsp-8+8*2]
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,RX0
	cmp rax,rdi
	jge LB_107
 lea rdi,[rsi+rax] 
	push rax 
	CALL_SF scf_d
	pop rbx 
	cmp rax,0 
	jz LB_107
	lea rax,[rbx+rsi]
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rdi
	jmp LB_108
LB_107:
	mov rsi,unt_1 
LB_108:
	mov RX1,rax
	mov RX2,rsi
;; rsp=2 , %6~2'(= a3◂ [..] )%5~1'(= r )%4~8'(= {| l |} )%2~9'(= r )
;; ?; 2'(= a3◂ [..] ) ⊢ 0(<2)◂0'(= r )
	mov rdi,RX2
	cmp BYTE [rdi+6],0
	jnz LB_110
	jmp LB_111
LB_110:
	jmp LB_109
LB_111:
	mov QWORD [GBG_VCT+8*0],rdi
	mov RX0,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %7~0'(= r )%5~1'(= r )%4~8'(= {| l |} )%2~9'(= r )
; # ?  { 8'(= {| l |} ) 1'(= r ) } ⊢ { 8'(= {| l |} ) 2'(= r ) 3'(= a3◂ [..] ) }
	mov rdi,QWORD [rsp-8+8*2]
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,RX1
	lea rdi,[rdi-1]
	cmp rax,rdi
	jg LB_112
	lea rdi,[rsi+rax]
	cmp BYTE [rdi+0],113
	jnz LB_112
	add rax,1
	mov rsi,unt_0
	jmp LB_113
LB_112:
	mov rsi,unt_1
LB_113:
	mov RX2,rax
	mov RX3,rsi
;; rsp=2 , %10~3'(= a3◂ [..] )%9~2'(= r )%8~8'(= {| l |} )%7~0'(= r )%2~9'(= r )
;; ?; 3'(= a3◂ [..] ) ⊢ 0(<2)◂3'(= *{ } )
	mov rdi,RX3
	cmp BYTE [rdi+6],0
	jnz LB_115
	jmp LB_116
LB_115:
	jmp LB_114
LB_116:
;; rsp=2 , %11~3'(= *{ } )%9~2'(= r )%8~8'(= {| l |} )%7~0'(= r )%2~9'(= r )
; # ?  { 8'(= {| l |} ) 2'(= r ) } ⊢ { 8'(= {| l |} ) 1'(= r ) 4'(= a3◂ [..] ) }
	mov rdi,QWORD [rsp-8+8*2]
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,RX2
	cmp rax,rdi
	jge LB_117
 lea rdi,[rsi+rax] 
	push rax 
	CALL_SF scf_d
	pop rbx 
	cmp rax,0 
	jz LB_117
	lea rax,[rbx+rsi]
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rdi
	jmp LB_118
LB_117:
	mov rsi,unt_1 
LB_118:
	mov RX1,rax
	mov RX4,rsi
;; rsp=2 , %14~4'(= a3◂ [..] )%13~1'(= r )%12~8'(= {| l |} )%11~3'(= *{ } )%7~0'(= r )%2~9'(= r )
;; ?; 4'(= a3◂ [..] ) ⊢ 0(<2)◂2'(= r )
	mov rdi,RX4
	cmp BYTE [rdi+6],0
	jnz LB_120
	jmp LB_121
LB_120:
	jmp LB_119
LB_121:
	mov QWORD [GBG_VCT+8*0],rdi
	mov RX2,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %15~2'(= r )%13~1'(= r )%12~8'(= {| l |} )%11~3'(= *{ } )%7~0'(= r )%2~9'(= r )
; ##37 9'(= r ) ⊢ { 9'(= r ) 4'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX4,rax
;; rsp=2 , %17~4'(= r )%16~9'(= r )%15~2'(= r )%13~1'(= r )%12~8'(= {| l |} )%11~3'(= *{ } )%7~0'(= r )
; ##37 1'(= r ) ⊢ { 1'(= r ) 5'(= r ) }
	mov rdi,RX1
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX5,rax
;; rsp=2 , %19~5'(= r )%18~1'(= r )%17~4'(= r )%16~9'(= r )%15~2'(= r )%12~8'(= {| l |} )%11~3'(= *{ } )%7~0'(= r )
; ##76 { { 0'(= r ) 3'(= *{ } ) 2'(= r ) } { 4'(= r ) 5'(= r ) } } ⊢ 0'(= a3◂ [..] )
	sub rsp,8
	mov QWORD [rsp+0],RX1
	push EXH_123
	push LB_124
	sub rsp,32
; .mov_ptn2 { { 0'(= r ) 3'(= *{ } ) 2'(= r ) } { 4'(= r ) 5'(= r ) } } ⊢ { { 13'(= r ) { } 14'(= r ) } { 15'(= r ) 16'(= r ) } }
; {| 101111001111111110.. |}
	mov QWORD [rsp-8+8*1],RX5
	mov QWORD [rsp-8+8*2],RX4
	mov QWORD [rsp-8+8*3],RX2
	mov QWORD [rsp-8+8*4],RX0
; mov_ptn2.
	call LB_122
LB_124:
	pop rax
	mov RX1,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=2 , %20~0'(= a3◂ [..] )%18~1'(= r )%16~9'(= r )%12~8'(= {| l |} )
;; ?; 0'(= a3◂ [..] ) ⊢ 0(<2)◂0'(= *{ rr} )
	mov rdi,RX0
	cmp BYTE [rdi+6],0
	jnz LB_126
	jmp LB_127
LB_126:
	jmp LB_125
LB_127:
;; rsp=2 , %21~0'(= *{ rr} )%18~1'(= r )%16~9'(= r )%12~8'(= {| l |} )
; ∎ { 8'(= {| l |} ) 1'(= r ) 0(<2)◂0'(= *{ rr} ) }
; .dlt.ptn 9'(= r )
; .mov_ptn2 { 8'(= {| l |} ) 1'(= r ) 0(<2)◂0'(= *{ rr} ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 1110000010.. |}
	mov RX2,RX0
	mov BYTE [RX2+6],0
	mov RX0,QWORD [rsp-8+8*2]
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_125:
;; ?; 0'(= a3◂ [..] ) ⊢ 1(<2)◂{ }
;; rsp=2 , %18~1'(= r )%16~9'(= r )%12~8'(= {| l |} )
; ∎ { 8'(= {| l |} ) 9'(= r ) 1(<2)◂{ } }
; .dlt.ptn 1'(= r )
; .mov_ptn2 { 8'(= {| l |} ) 9'(= r ) 1(<2)◂{ } } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 11100000110.. |}
	mov RX2,unt_1
	mov RX1,QWORD [rsp-8+8*1]
	mov RX0,QWORD [rsp-8+8*2]
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_119:
;; ?; 4'(= a3◂ [..] ) ⊢ 1(<2)◂{ }
;; rsp=2 , %13~1'(= r )%12~8'(= {| l |} )%11~3'(= *{ } )%7~0'(= r )%2~9'(= r )
; ##51 1'(= r ) ⊢ { }
;; rsp=2 , %12~8'(= {| l |} )%11~3'(= *{ } )%7~0'(= r )%2~9'(= r )
; ##37 9'(= r ) ⊢ { 9'(= r ) 1'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX1,rax
;; rsp=2 , %23~1'(= r )%22~9'(= r )%12~8'(= {| l |} )%11~3'(= *{ } )%7~0'(= r )
; ##75 { 8'(= {| l |} ) 9'(= r ) } ⊢|
; .dlt.ptn 1'(= r )
; .dlt.ptn 3'(= *{ } )
	mov rdi,RX3
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	push EXH_129
	push LB_130
	sub rsp,16
; .mov_ptn2 { 8'(= {| l |} ) 9'(= r ) } ⊢ { 12'(= {| l |} ) 13'(= r ) }
; {| 000000001111110.. |}
	MOV_RBX QWORD [rsp-8+8*1],QWORD [rsp-8+8*5]
	MOV_RBX QWORD [rsp-8+8*2],QWORD [rsp-8+8*6]
; mov_ptn2.
	call LB_128
LB_130:
	pop rax
; .add_rsp 2
	add rsp,16
; .mov_ptn2 { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 1110.. |}
; mov_ptn2.
	ret
LB_114:
;; ?; 3'(= a3◂ [..] ) ⊢ 1(<2)◂{ }
;; rsp=2 , %9~2'(= r )%8~8'(= {| l |} )%7~0'(= r )%2~9'(= r )
; ##51 2'(= r ) ⊢ { }
;; rsp=2 , %8~8'(= {| l |} )%7~0'(= r )%2~9'(= r )
; ##37 9'(= r ) ⊢ { 9'(= r ) 1'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX1,rax
;; rsp=2 , %25~1'(= r )%24~9'(= r )%8~8'(= {| l |} )%7~0'(= r )
; ##75 { 8'(= {| l |} ) 9'(= r ) } ⊢|
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
	push EXH_131
	push LB_132
	sub rsp,16
; .mov_ptn2 { 8'(= {| l |} ) 9'(= r ) } ⊢ { 12'(= {| l |} ) 13'(= r ) }
; {| 000000001111110.. |}
	MOV_RBX QWORD [rsp-8+8*1],QWORD [rsp-8+8*5]
	MOV_RBX QWORD [rsp-8+8*2],QWORD [rsp-8+8*6]
; mov_ptn2.
	call LB_128
LB_132:
	pop rax
; .add_rsp 2
	add rsp,16
; .mov_ptn2 { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 1110.. |}
; mov_ptn2.
	ret
LB_109:
;; ?; 2'(= a3◂ [..] ) ⊢ 1(<2)◂{ }
;; rsp=2 , %5~1'(= r )%4~8'(= {| l |} )%2~9'(= r )
; ##51 1'(= r ) ⊢ { }
;; rsp=2 , %4~8'(= {| l |} )%2~9'(= r )
; ##37 9'(= r ) ⊢ { 9'(= r ) 0'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX0,rax
;; rsp=2 , %27~0'(= r )%26~9'(= r )%4~8'(= {| l |} )
; ##75 { 8'(= {| l |} ) 9'(= r ) } ⊢|
; .dlt.ptn 0'(= r )
	push EXH_133
	push LB_134
	sub rsp,16
; .mov_ptn2 { 8'(= {| l |} ) 9'(= r ) } ⊢ { 12'(= {| l |} ) 13'(= r ) }
; {| 000000001111110.. |}
	MOV_RBX QWORD [rsp-8+8*1],QWORD [rsp-8+8*5]
	MOV_RBX QWORD [rsp-8+8*2],QWORD [rsp-8+8*6]
; mov_ptn2.
	call LB_128
LB_134:
	pop rax
; .add_rsp 2
	add rsp,16
; .mov_ptn2 { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 1110.. |}
; mov_ptn2.
	ret
EXH_123:
	add rsp,32
	pop rax
	jmp rax
EXH_129:
	add rsp,24
	pop rax
	jmp rax
EXH_131:
	add rsp,24
	pop rax
	jmp rax
EXH_133:
	add rsp,24
	pop rax
	jmp rax
LB_89: ;; #79◂◂(_none◂{}) { 8'(= {| l |} ) 9'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ _r64◂ _r64◂}})
	add rsp,8
JMP_89:
;; rsp=2 , %1~9'(= r )%0~8'(= {| l |} )
; ##37 9'(= r ) ⊢ { 9'(= r ) 0'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX0,rax
;; rsp=2 , %3~0'(= r )%2~9'(= r )%0~8'(= {| l |} )
; # ?  { 8'(= {| l |} ) 0'(= r ) } ⊢ { 8'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
	mov rdi,QWORD [rsp-8+8*2]
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,RX0
	lea rdi,[rdi-1]
	cmp rax,rdi
	jg LB_90
	lea rdi,[rsi+rax]
	cmp BYTE [rdi+0],119
	jnz LB_90
	add rax,1
	mov rsi,unt_0
	jmp LB_91
LB_90:
	mov rsi,unt_1
LB_91:
	mov RX1,rax
	mov RX2,rsi
;; rsp=2 , %6~2'(= a3◂ [..] )%5~1'(= r )%4~8'(= {| l |} )%2~9'(= r )
;; ?; 2'(= a3◂ [..] ) ⊢ 0(<2)◂2'(= *{ } )
	mov rdi,RX2
	cmp BYTE [rdi+6],0
	jnz LB_93
	jmp LB_94
LB_93:
	jmp LB_92
LB_94:
;; rsp=2 , %7~2'(= *{ } )%5~1'(= r )%4~8'(= {| l |} )%2~9'(= r )
; # ?  { 8'(= {| l |} ) 1'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 3'(= a3◂ [..] ) }
	sub rsp,8
	mov QWORD [rsp+0],RX2
	push EXH_95
	push LB_96
	sub rsp,16
; .mov_ptn2 { 8'(= {| l |} ) 1'(= r ) } ⊢ { 13'(= {| l |} ) 14'(= r ) }
; {| 0100000011111110.. |}
	mov QWORD [rsp-8+8*1],RX1
	MOV_RBX QWORD [rsp-8+8*2],QWORD [rsp-8+8*7]
; mov_ptn2.
	call LB_89
LB_96:
	pop rax
	mov RX3,RX2
	mov RX2,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=2 , %10~3'(= a3◂ [..] )%9~1'(= r )%8~0'(= {| l |} )%7~2'(= *{ } )%2~9'(= r )
;; ?; 3'(= a3◂ [..] ) ⊢ 0(<2)◂3'(= *{ rr} )
	mov rdi,RX3
	cmp BYTE [rdi+6],0
	jnz LB_98
	jmp LB_99
LB_98:
	jmp LB_97
LB_99:
;; rsp=2 , %11~3'(= *{ rr} )%9~1'(= r )%8~0'(= {| l |} )%7~2'(= *{ } )%2~9'(= r )
; ##37 9'(= r ) ⊢ { 9'(= r ) 4'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX4,rax
;; rsp=2 , %13~4'(= r )%12~9'(= r )%11~3'(= *{ rr} )%9~1'(= r )%8~0'(= {| l |} )%7~2'(= *{ } )
; ##37 1'(= r ) ⊢ { 1'(= r ) 5'(= r ) }
	mov rdi,RX1
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX5,rax
;; rsp=2 , %15~5'(= r )%14~1'(= r )%13~4'(= r )%12~9'(= r )%11~3'(= *{ rr} )%8~0'(= {| l |} )%7~2'(= *{ } )
; ##78 { { 2'(= *{ } ) 3'(= *{ rr} ) } { 4'(= r ) 5'(= r ) } } ⊢ 2'(= a3◂ [..] )
	sub rsp,16
	mov QWORD [rsp+0],RX0
	mov QWORD [rsp+8],RX1
	push EXH_101
	push LB_102
	sub rsp,32
; .mov_ptn2 { { 2'(= *{ } ) 3'(= *{ rr} ) } { 4'(= r ) 5'(= r ) } } ⊢ { { { } { 14'(= r ) 15'(= r ) } } { 16'(= r ) 17'(= r ) } }
; {| 0011110001111111110.. |}
	mov QWORD [rsp-8+8*1],RX5
	mov QWORD [rsp-8+8*2],RX4
	mov RX0, QWORD [RX3+8]
	mov QWORD [rsp-8+8*4],RX0
	mov RX0, QWORD [RX3+16]
	mov QWORD [rsp-8+8*3],RX0
	mov rdi,RX3
	FREE_RCD 2,rdi
; mov_ptn2.
	call LB_100
LB_102:
	pop rax
	mov RX1,QWORD [rsp-8+8*2]
	mov RX2,RX0
	mov RX0,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=2 , %16~2'(= a3◂ [..] )%14~1'(= r )%12~9'(= r )%8~0'(= {| l |} )
;; ?; 2'(= a3◂ [..] ) ⊢ 0(<2)◂2'(= *{ rr} )
	mov rdi,RX2
	cmp BYTE [rdi+6],0
	jnz LB_104
	jmp LB_105
LB_104:
	jmp LB_103
LB_105:
;; rsp=2 , %17~2'(= *{ rr} )%14~1'(= r )%12~9'(= r )%8~0'(= {| l |} )
; ∎ { 0'(= {| l |} ) 1'(= r ) 0(<2)◂2'(= *{ rr} ) }
; .dlt.ptn 9'(= r )
; .mov_ptn2 { 0'(= {| l |} ) 1'(= r ) 0(<2)◂2'(= *{ rr} ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 1110.. |}
	mov RX3,RX2
	mov RX2,RX3
	mov BYTE [RX2+6],0
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_103:
;; ?; 2'(= a3◂ [..] ) ⊢ 1(<2)◂{ }
;; rsp=2 , %14~1'(= r )%12~9'(= r )%8~0'(= {| l |} )
; ∎ { 0'(= {| l |} ) 9'(= r ) 1(<2)◂{ } }
; .dlt.ptn 1'(= r )
; .mov_ptn2 { 0'(= {| l |} ) 9'(= r ) 1(<2)◂{ } } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 11100000010.. |}
	mov RX2,unt_1
	mov RX1,QWORD [rsp-8+8*1]
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_97:
;; ?; 3'(= a3◂ [..] ) ⊢ 1(<2)◂{ }
;; rsp=2 , %9~1'(= r )%8~0'(= {| l |} )%7~2'(= *{ } )%2~9'(= r )
; ##51 1'(= r ) ⊢ { }
;; rsp=2 , %8~0'(= {| l |} )%7~2'(= *{ } )%2~9'(= r )
; ##37 9'(= r ) ⊢ { 9'(= r ) 1'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX1,rax
;; rsp=2 , %19~1'(= r )%18~9'(= r )%8~0'(= {| l |} )%7~2'(= *{ } )
; ##77 { 0'(= {| l |} ) 9'(= r ) } ⊢|
; .dlt.ptn 1'(= r )
; .dlt.ptn 2'(= *{ } )
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	push EXH_135
	push LB_136
	sub rsp,16
; .mov_ptn2 { 0'(= {| l |} ) 9'(= r ) } ⊢ { 12'(= {| l |} ) 13'(= r ) }
; {| 100000000111110.. |}
	MOV_RBX QWORD [rsp-8+8*1],QWORD [rsp-8+8*5]
	mov QWORD [rsp-8+8*2],RX0
; mov_ptn2.
	call LB_106
LB_136:
	pop rax
; .add_rsp 2
	add rsp,16
; .mov_ptn2 { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 1110.. |}
; mov_ptn2.
	ret
LB_92:
;; ?; 2'(= a3◂ [..] ) ⊢ 1(<2)◂{ }
;; rsp=2 , %5~1'(= r )%4~8'(= {| l |} )%2~9'(= r )
; ##51 1'(= r ) ⊢ { }
;; rsp=2 , %4~8'(= {| l |} )%2~9'(= r )
; ##37 9'(= r ) ⊢ { 9'(= r ) 0'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX0,rax
;; rsp=2 , %21~0'(= r )%20~9'(= r )%4~8'(= {| l |} )
; ##77 { 8'(= {| l |} ) 9'(= r ) } ⊢|
; .dlt.ptn 0'(= r )
	push EXH_137
	push LB_138
	sub rsp,16
; .mov_ptn2 { 8'(= {| l |} ) 9'(= r ) } ⊢ { 12'(= {| l |} ) 13'(= r ) }
; {| 000000001111110.. |}
	MOV_RBX QWORD [rsp-8+8*1],QWORD [rsp-8+8*5]
	MOV_RBX QWORD [rsp-8+8*2],QWORD [rsp-8+8*6]
; mov_ptn2.
	call LB_106
LB_138:
	pop rax
; .add_rsp 2
	add rsp,16
; .mov_ptn2 { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 1110.. |}
; mov_ptn2.
	ret
EXH_95:
	add rsp,32
	pop rax
	jmp rax
EXH_101:
	add rsp,40
	pop rax
	jmp rax
EXH_135:
	add rsp,24
	pop rax
	jmp rax
EXH_137:
	add rsp,24
	pop rax
	jmp rax
LB_141: ;; { _r64◂ _r64◂}
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_144+8*rax]
 ; { _r64◂ _r64◂} { }
LB_144: dq LB_142,LB_143
LB_142:
	EMT_CST LB_146,5
	EMT_CST fmt_rcd_box_l,4
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call emt_r64
	pop r8 
	EMT_CST fmt_spc,4 
	push r8
	mov r8,QWORD [r8+8+8*1]
	mov rdi,r8
	call emt_r64
	pop r8 
	EMT_CST fmt_spc,4 
	EMT_CST fmt_rcd_r,4
	jmp LB_145
LB_143:
	EMT_CST LB_147,5
	EMT_CST fmt_rcd_box_l,4
	EMT_CST fmt_rcd_r,4
	jmp LB_145
LB_145:
	ret
LB_149: ;; { _r64◂ _r64◂}
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_152+8*rax]
 ; { _r64◂ _r64◂} { }
LB_152: dq LB_150,LB_151
LB_150:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8
	FREE_RCD 2, r8
	jmp LB_153
LB_151:
	jmp LB_153
LB_153:
	ret
LB_160: ;; #83◂◂(_some◂.#56) { { { } } { 8'(= r ) 9'(= r ) } } ⊢ 0'(= a3◂ [..] ) : ({ { { }} { _r64◂ _r64◂}}→_opn◂{ })
	add rsp,8
JMP_160:
;; rsp=2 , %1~9'(= r )%0~8'(= r )
; ∎ 0(<2)◂{ }
; .dlt.ptn 9'(= r )
; .dlt.ptn 8'(= r )
; .mov_ptn2 0(<2)◂{ } ⊢ 0'(= a3◂ [..] )
; {| 10.. |}
	mov RX0,unt_0
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_166: ;; #82◂◂(_some◂.#56) { 8'(= {| l |} ) 9'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ }})
	add rsp,8
JMP_166:
;; rsp=2 , %1~9'(= r )%0~8'(= {| l |} )
; ∎ { 8'(= {| l |} ) 9'(= r ) 1(<2)◂{ } }
; .mov_ptn2 { 8'(= {| l |} ) 9'(= r ) 1(<2)◂{ } } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 11100000110.. |}
	mov RX2,unt_1
	mov RX1,QWORD [rsp-8+8*1]
	mov RX0,QWORD [rsp-8+8*2]
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_154: ;; #84◂◂(_some◂.#56) { 8'(= {| l |} ) 9'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ }})
	add rsp,8
JMP_154:
;; rsp=2 , %1~9'(= r )%0~8'(= {| l |} )
; ##37 9'(= r ) ⊢ { 9'(= r ) 0'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX0,rax
;; rsp=2 , %3~0'(= r )%2~9'(= r )%0~8'(= {| l |} )
; # ?  { 8'(= {| l |} ) 0'(= r ) } ⊢ { 8'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
	mov rdi,QWORD [rsp-8+8*2]
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,RX0
	lea rdi,[rdi-2]
	cmp rax,rdi
	jg LB_155
	lea rdi,[rsi+rax]
	cmp BYTE [rdi+0],114
	jnz LB_155
	cmp BYTE [rdi+1],114
	jnz LB_155
	add rax,2
	mov rsi,unt_0
	jmp LB_156
LB_155:
	mov rsi,unt_1
LB_156:
	mov RX1,rax
	mov RX2,rsi
;; rsp=2 , %6~2'(= a3◂ [..] )%5~1'(= r )%4~8'(= {| l |} )%2~9'(= r )
;; ?; 2'(= a3◂ [..] ) ⊢ 0(<2)◂2'(= *{ } )
	mov rdi,RX2
	cmp BYTE [rdi+6],0
	jnz LB_158
	jmp LB_159
LB_158:
	jmp LB_157
LB_159:
;; rsp=2 , %7~2'(= *{ } )%5~1'(= r )%4~8'(= {| l |} )%2~9'(= r )
; ##37 9'(= r ) ⊢ { 9'(= r ) 0'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX0,rax
;; rsp=2 , %9~0'(= r )%8~9'(= r )%7~2'(= *{ } )%5~1'(= r )%4~8'(= {| l |} )
; ##37 1'(= r ) ⊢ { 1'(= r ) 3'(= r ) }
	mov rdi,RX1
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX3,rax
;; rsp=2 , %11~3'(= r )%10~1'(= r )%9~0'(= r )%8~9'(= r )%7~2'(= *{ } )%4~8'(= {| l |} )
; # ?  { { 2'(= *{ } ) } { 0'(= r ) 3'(= r ) } } ⊢ 0'(= a3◂ [..] )
	sub rsp,8
	mov QWORD [rsp+0],RX1
	push EXH_161
	push LB_162
	sub rsp,16
; .mov_ptn2 { { 2'(= *{ } ) } { 0'(= r ) 3'(= r ) } } ⊢ { { { } } { 13'(= r ) 14'(= r ) } }
; {| 1011000011111110.. |}
	mov QWORD [rsp-8+8*1],RX3
	mov QWORD [rsp-8+8*2],RX0
; mov_ptn2.
	call LB_160
LB_162:
	pop rax
	mov RX1,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=2 , %12~0'(= a3◂ [..] )%10~1'(= r )%8~9'(= r )%4~8'(= {| l |} )
;; ?; 0'(= a3◂ [..] ) ⊢ 0(<2)◂0'(= *{ } )
	mov rdi,RX0
	cmp BYTE [rdi+6],0
	jnz LB_164
	jmp LB_165
LB_164:
	jmp LB_163
LB_165:
;; rsp=2 , %13~0'(= *{ } )%10~1'(= r )%8~9'(= r )%4~8'(= {| l |} )
; ∎ { 8'(= {| l |} ) 1'(= r ) 0(<2)◂0'(= *{ } ) }
; .dlt.ptn 9'(= r )
; .mov_ptn2 { 8'(= {| l |} ) 1'(= r ) 0(<2)◂0'(= *{ } ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 1110000010.. |}
	mov RX2,unt_0
	mov RX0,QWORD [rsp-8+8*2]
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_163:
;; ?; 0'(= a3◂ [..] ) ⊢ 1(<2)◂{ }
;; rsp=2 , %10~1'(= r )%8~9'(= r )%4~8'(= {| l |} )
; ∎ { 8'(= {| l |} ) 9'(= r ) 1(<2)◂{ } }
; .dlt.ptn 1'(= r )
; .mov_ptn2 { 8'(= {| l |} ) 9'(= r ) 1(<2)◂{ } } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 11100000110.. |}
	mov RX2,unt_1
	mov RX1,QWORD [rsp-8+8*1]
	mov RX0,QWORD [rsp-8+8*2]
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_157:
;; ?; 2'(= a3◂ [..] ) ⊢ 1(<2)◂{ }
;; rsp=2 , %5~1'(= r )%4~8'(= {| l |} )%2~9'(= r )
; ##51 1'(= r ) ⊢ { }
;; rsp=2 , %4~8'(= {| l |} )%2~9'(= r )
; ##37 9'(= r ) ⊢ { 9'(= r ) 0'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX0,rax
;; rsp=2 , %15~0'(= r )%14~9'(= r )%4~8'(= {| l |} )
; # ?  { 8'(= {| l |} ) 9'(= r ) } ⊢|
; .dlt.ptn 0'(= r )
	push EXH_167
	push LB_168
	sub rsp,16
; .mov_ptn2 { 8'(= {| l |} ) 9'(= r ) } ⊢ { 12'(= {| l |} ) 13'(= r ) }
; {| 000000001111110.. |}
	MOV_RBX QWORD [rsp-8+8*1],QWORD [rsp-8+8*5]
	MOV_RBX QWORD [rsp-8+8*2],QWORD [rsp-8+8*6]
; mov_ptn2.
	call LB_166
LB_168:
	pop rax
; .add_rsp 2
	add rsp,16
; .mov_ptn2 { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 1110.. |}
; mov_ptn2.
	ret
EXH_161:
	add rsp,32
	pop rax
	jmp rax
EXH_167:
	add rsp,24
	pop rax
	jmp rax
LB_188: ;; #94◂◂(_some◂.#33) { { 8'(= r ) { } 9'(= r ) } { 10'(= r ) 11'(= r ) } } ⊢ 0'(= a3◂ [..] ) : ({ { _r64◂ { }_r64◂} { _r64◂ _r64◂}}→_opn◂{ _r64◂ _r64◂})
	add rsp,8
JMP_188:
;; rsp=4 , %3~11'(= r )%2~10'(= r )%1~9'(= r )%0~8'(= r )
; ∎ 0(<2)◂{ 8'(= r ) 9'(= r ) }
; .dlt.ptn 11'(= r )
; .dlt.ptn 10'(= r )
; .mov_ptn2 0(<2)◂{ 8'(= r ) 9'(= r ) } ⊢ 0'(= a3◂ [..] )
; {| 10000000110.. |}
	ALC_RCD 2, rax
	mov RX0,rax
	mov RX1,QWORD [rsp-8+8*4]
	mov QWORD [RX0+8],RX1 
	mov RX1,QWORD [rsp-8+8*3]
	mov QWORD [RX0+16],RX1 
	mov BYTE [RX0+6],0
; mov_ptn2.
; .add_rsp 4
	add rsp,32
	ret
LB_194: ;; #93◂◂(_some◂.#33) { 8'(= {| l |} ) 9'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ _r64◂ _r64◂}})
	add rsp,8
JMP_194:
;; rsp=2 , %1~9'(= r )%0~8'(= {| l |} )
; ∎ { 8'(= {| l |} ) 9'(= r ) 1(<2)◂{ } }
; .mov_ptn2 { 8'(= {| l |} ) 9'(= r ) 1(<2)◂{ } } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 11100000110.. |}
	mov RX2,unt_1
	mov RX1,QWORD [rsp-8+8*1]
	mov RX0,QWORD [rsp-8+8*2]
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_172: ;; #95◂◂(_some◂.#33) { 8'(= {| l |} ) 9'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } : ({ _s8◂ _r64◂}→{ _s8◂ _r64◂_opn◂{ _r64◂ _r64◂}})
	add rsp,8
JMP_172:
;; rsp=2 , %1~9'(= r )%0~8'(= {| l |} )
; ##37 9'(= r ) ⊢ { 9'(= r ) 0'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX0,rax
;; rsp=2 , %3~0'(= r )%2~9'(= r )%0~8'(= {| l |} )
; # ?  { 8'(= {| l |} ) 0'(= r ) } ⊢ { 8'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
	mov rdi,QWORD [rsp-8+8*2]
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,RX0
	cmp rax,rdi
	jge LB_173
 lea rdi,[rsi+rax] 
	push rax 
	CALL_SF scf_d
	pop rbx 
	cmp rax,0 
	jz LB_173
	lea rax,[rbx+rsi]
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rdi
	jmp LB_174
LB_173:
	mov rsi,unt_1 
LB_174:
	mov RX1,rax
	mov RX2,rsi
;; rsp=2 , %6~2'(= a3◂ [..] )%5~1'(= r )%4~8'(= {| l |} )%2~9'(= r )
;; ?; 2'(= a3◂ [..] ) ⊢ 0(<2)◂0'(= r )
	mov rdi,RX2
	cmp BYTE [rdi+6],0
	jnz LB_176
	jmp LB_177
LB_176:
	jmp LB_175
LB_177:
	mov QWORD [GBG_VCT+8*0],rdi
	mov RX0,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %7~0'(= r )%5~1'(= r )%4~8'(= {| l |} )%2~9'(= r )
; # ?  { 8'(= {| l |} ) 1'(= r ) } ⊢ { 8'(= {| l |} ) 2'(= r ) 3'(= a3◂ [..] ) }
	mov rdi,QWORD [rsp-8+8*2]
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,RX1
	lea rdi,[rdi-1]
	cmp rax,rdi
	jg LB_178
	lea rdi,[rsi+rax]
	cmp BYTE [rdi+0],116
	jnz LB_178
	add rax,1
	mov rsi,unt_0
	jmp LB_179
LB_178:
	mov rsi,unt_1
LB_179:
	mov RX2,rax
	mov RX3,rsi
;; rsp=2 , %10~3'(= a3◂ [..] )%9~2'(= r )%8~8'(= {| l |} )%7~0'(= r )%2~9'(= r )
;; ?; 3'(= a3◂ [..] ) ⊢ 0(<2)◂3'(= *{ } )
	mov rdi,RX3
	cmp BYTE [rdi+6],0
	jnz LB_181
	jmp LB_182
LB_181:
	jmp LB_180
LB_182:
;; rsp=2 , %11~3'(= *{ } )%9~2'(= r )%8~8'(= {| l |} )%7~0'(= r )%2~9'(= r )
; # ?  { 8'(= {| l |} ) 2'(= r ) } ⊢ { 8'(= {| l |} ) 1'(= r ) 4'(= a3◂ [..] ) }
	mov rdi,QWORD [rsp-8+8*2]
	lea rsi,[rdi+8]
	mov rdi,QWORD [rdi]
	mov rax,RX2
	cmp rax,rdi
	jge LB_183
 lea rdi,[rsi+rax] 
	push rax 
	CALL_SF scf_d
	pop rbx 
	cmp rax,0 
	jz LB_183
	lea rax,[rbx+rsi]
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rdi
	jmp LB_184
LB_183:
	mov rsi,unt_1 
LB_184:
	mov RX1,rax
	mov RX4,rsi
;; rsp=2 , %14~4'(= a3◂ [..] )%13~1'(= r )%12~8'(= {| l |} )%11~3'(= *{ } )%7~0'(= r )%2~9'(= r )
;; ?; 4'(= a3◂ [..] ) ⊢ 0(<2)◂2'(= r )
	mov rdi,RX4
	cmp BYTE [rdi+6],0
	jnz LB_186
	jmp LB_187
LB_186:
	jmp LB_185
LB_187:
	mov QWORD [GBG_VCT+8*0],rdi
	mov RX2,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %15~2'(= r )%13~1'(= r )%12~8'(= {| l |} )%11~3'(= *{ } )%7~0'(= r )%2~9'(= r )
; ##37 9'(= r ) ⊢ { 9'(= r ) 4'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX4,rax
;; rsp=2 , %17~4'(= r )%16~9'(= r )%15~2'(= r )%13~1'(= r )%12~8'(= {| l |} )%11~3'(= *{ } )%7~0'(= r )
; ##37 1'(= r ) ⊢ { 1'(= r ) 5'(= r ) }
	mov rdi,RX1
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX5,rax
;; rsp=2 , %19~5'(= r )%18~1'(= r )%17~4'(= r )%16~9'(= r )%15~2'(= r )%12~8'(= {| l |} )%11~3'(= *{ } )%7~0'(= r )
; # ?  { { 0'(= r ) 3'(= *{ } ) 2'(= r ) } { 4'(= r ) 5'(= r ) } } ⊢ 0'(= a3◂ [..] )
	sub rsp,8
	mov QWORD [rsp+0],RX1
	push EXH_189
	push LB_190
	sub rsp,32
; .mov_ptn2 { { 0'(= r ) 3'(= *{ } ) 2'(= r ) } { 4'(= r ) 5'(= r ) } } ⊢ { { 13'(= r ) { } 14'(= r ) } { 15'(= r ) 16'(= r ) } }
; {| 101111001111111110.. |}
	mov QWORD [rsp-8+8*1],RX5
	mov QWORD [rsp-8+8*2],RX4
	mov QWORD [rsp-8+8*3],RX2
	mov QWORD [rsp-8+8*4],RX0
; mov_ptn2.
	call LB_188
LB_190:
	pop rax
	mov RX1,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=2 , %20~0'(= a3◂ [..] )%18~1'(= r )%16~9'(= r )%12~8'(= {| l |} )
;; ?; 0'(= a3◂ [..] ) ⊢ 0(<2)◂0'(= *{ rr} )
	mov rdi,RX0
	cmp BYTE [rdi+6],0
	jnz LB_192
	jmp LB_193
LB_192:
	jmp LB_191
LB_193:
;; rsp=2 , %21~0'(= *{ rr} )%18~1'(= r )%16~9'(= r )%12~8'(= {| l |} )
; ∎ { 8'(= {| l |} ) 1'(= r ) 0(<2)◂0'(= *{ rr} ) }
; .dlt.ptn 9'(= r )
; .mov_ptn2 { 8'(= {| l |} ) 1'(= r ) 0(<2)◂0'(= *{ rr} ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 1110000010.. |}
	mov RX2,RX0
	mov BYTE [RX2+6],0
	mov RX0,QWORD [rsp-8+8*2]
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_191:
;; ?; 0'(= a3◂ [..] ) ⊢ 1(<2)◂{ }
;; rsp=2 , %18~1'(= r )%16~9'(= r )%12~8'(= {| l |} )
; ∎ { 8'(= {| l |} ) 9'(= r ) 1(<2)◂{ } }
; .dlt.ptn 1'(= r )
; .mov_ptn2 { 8'(= {| l |} ) 9'(= r ) 1(<2)◂{ } } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 11100000110.. |}
	mov RX2,unt_1
	mov RX1,QWORD [rsp-8+8*1]
	mov RX0,QWORD [rsp-8+8*2]
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	ret
LB_185:
;; ?; 4'(= a3◂ [..] ) ⊢ 1(<2)◂{ }
;; rsp=2 , %13~1'(= r )%12~8'(= {| l |} )%11~3'(= *{ } )%7~0'(= r )%2~9'(= r )
; ##51 1'(= r ) ⊢ { }
;; rsp=2 , %12~8'(= {| l |} )%11~3'(= *{ } )%7~0'(= r )%2~9'(= r )
; ##37 9'(= r ) ⊢ { 9'(= r ) 1'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX1,rax
;; rsp=2 , %23~1'(= r )%22~9'(= r )%12~8'(= {| l |} )%11~3'(= *{ } )%7~0'(= r )
; # ?  { 8'(= {| l |} ) 9'(= r ) } ⊢|
; .dlt.ptn 1'(= r )
; .dlt.ptn 3'(= *{ } )
	mov rdi,RX3
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	push EXH_195
	push LB_196
	sub rsp,16
; .mov_ptn2 { 8'(= {| l |} ) 9'(= r ) } ⊢ { 12'(= {| l |} ) 13'(= r ) }
; {| 000000001111110.. |}
	MOV_RBX QWORD [rsp-8+8*1],QWORD [rsp-8+8*5]
	MOV_RBX QWORD [rsp-8+8*2],QWORD [rsp-8+8*6]
; mov_ptn2.
	call LB_194
LB_196:
	pop rax
; .add_rsp 2
	add rsp,16
; .mov_ptn2 { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 1110.. |}
; mov_ptn2.
	ret
LB_180:
;; ?; 3'(= a3◂ [..] ) ⊢ 1(<2)◂{ }
;; rsp=2 , %9~2'(= r )%8~8'(= {| l |} )%7~0'(= r )%2~9'(= r )
; ##51 2'(= r ) ⊢ { }
;; rsp=2 , %8~8'(= {| l |} )%7~0'(= r )%2~9'(= r )
; ##37 9'(= r ) ⊢ { 9'(= r ) 1'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX1,rax
;; rsp=2 , %25~1'(= r )%24~9'(= r )%8~8'(= {| l |} )%7~0'(= r )
; # ?  { 8'(= {| l |} ) 9'(= r ) } ⊢|
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
	push EXH_197
	push LB_198
	sub rsp,16
; .mov_ptn2 { 8'(= {| l |} ) 9'(= r ) } ⊢ { 12'(= {| l |} ) 13'(= r ) }
; {| 000000001111110.. |}
	MOV_RBX QWORD [rsp-8+8*1],QWORD [rsp-8+8*5]
	MOV_RBX QWORD [rsp-8+8*2],QWORD [rsp-8+8*6]
; mov_ptn2.
	call LB_194
LB_198:
	pop rax
; .add_rsp 2
	add rsp,16
; .mov_ptn2 { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 1110.. |}
; mov_ptn2.
	ret
LB_175:
;; ?; 2'(= a3◂ [..] ) ⊢ 1(<2)◂{ }
;; rsp=2 , %5~1'(= r )%4~8'(= {| l |} )%2~9'(= r )
; ##51 1'(= r ) ⊢ { }
;; rsp=2 , %4~8'(= {| l |} )%2~9'(= r )
; ##37 9'(= r ) ⊢ { 9'(= r ) 0'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rax,r8
	C_POP_REGS
	mov RX0,rax
;; rsp=2 , %27~0'(= r )%26~9'(= r )%4~8'(= {| l |} )
; # ?  { 8'(= {| l |} ) 9'(= r ) } ⊢|
; .dlt.ptn 0'(= r )
	push EXH_199
	push LB_200
	sub rsp,16
; .mov_ptn2 { 8'(= {| l |} ) 9'(= r ) } ⊢ { 12'(= {| l |} ) 13'(= r ) }
; {| 000000001111110.. |}
	MOV_RBX QWORD [rsp-8+8*1],QWORD [rsp-8+8*5]
	MOV_RBX QWORD [rsp-8+8*2],QWORD [rsp-8+8*6]
; mov_ptn2.
	call LB_194
LB_200:
	pop rax
; .add_rsp 2
	add rsp,16
; .mov_ptn2 { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
; {| 1110.. |}
; mov_ptn2.
	ret
EXH_189:
	add rsp,32
	pop rax
	jmp rax
EXH_195:
	add rsp,24
	pop rax
	jmp rax
EXH_197:
	add rsp,24
	pop rax
	jmp rax
EXH_199:
	add rsp,24
	pop rax
	jmp rax
RTM_0:
;; rsp=0 , %0~0'(= {| ? |} )
; # ?  { %[ "dABCiei" ] %[ 17r ] } ⊢ { %[ "dABCiei" ] 1'(= r ) 2'(= a3◂ [..] ) }
	mov rdi,7
	lea rsi,[LB_0]
	mov rax,17
	cmp rax,rdi
	jge LB_1
	movzx rdi,BYTE [rsi+rax]
	add rax,1 
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rdi
	jmp LB_2
LB_1:
	mov rsi,unt_1
LB_2:
	mov RX1,rax
	mov RX2,rsi
; .dlt.ptn %[ "dABCiei" ]
;; rsp=0 , %3~2'(= a3◂ [..] )%2~1'(= r )%0~0'(= {| ? |} )
; ##8 { 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 1'(= r ) 2'(= a3◂ [..] ) }
	EMT_CST LB_10,29
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,RX1
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi 
; .adt_call t3 : _r64◂
	call LB_3
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 1'(= r ) 2'(= a3◂ [..] ) }
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi
; .adt_call t3 : _r64◂
	call LB_11
	C_POP_REGS
;; rsp=0 , %0~0'(= {| ? |} )
; # ?  { %[ "dABCiei" ] %[ 1r ] } ⊢ { %[ "dABCiei" ] 1'(= r ) 2'(= a3◂ [..] ) }
	mov rdi,7
	lea rsi,[LB_16]
	mov rax,1
	lea rdi,[rdi-3]
	cmp rax,rdi
	jg LB_17
	lea rdi,[rsi+rax]
	cmp BYTE [rdi+0],65
	jnz LB_17
	cmp BYTE [rdi+1],66
	jnz LB_17
	cmp BYTE [rdi+2],67
	jnz LB_17
	add rax,3
	mov rsi,unt_0
	jmp LB_18
LB_17:
	mov rsi,unt_1
LB_18:
	mov RX1,rax
	mov RX2,rsi
; .dlt.ptn %[ "dABCiei" ]
;; rsp=0 , %7~2'(= a3◂ [..] )%6~1'(= r )%0~0'(= {| ? |} )
; ##8 { 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 1'(= r ) 2'(= a3◂ [..] ) }
	EMT_CST LB_26,25
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,RX1
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi 
; .adt_call t3 : { }
	call LB_19
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 1'(= r ) 2'(= a3◂ [..] ) }
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi
; .adt_call t3 : { }
	call LB_27
	C_POP_REGS
;; rsp=0 , %0~0'(= {| ? |} )
; # ?  { %[ "Abd" ] %[ 0r ] } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
	sub rsp,8
	mov QWORD [rsp+0],RX0
	push EXH_47
	push LB_48
	sub rsp,16
; .mov_ptn2 { %[ "Abd" ] %[ 0r ] } ⊢ { 11'(= {| l |} ) 12'(= r ) }
; {| 00000000111110.. |}
	mov QWORD [rsp-8+8*1],0
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	add QWORD [S8_N],3
	C_CALL_SF calloc
	mov QWORD [rax],3
	mov BYTE [rax+8+0],65
	mov BYTE [rax+8+1],98
	mov BYTE [rax+8+2],100
	mov QWORD [rsp-8+8*2],rax
; mov_ptn2.
	call LB_32
LB_48:
	pop rax
	mov RX3,RX0
	mov RX0,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
; .dlt.ptn 3'(= {| l |} )
	mov rdi,RX3
	C_PUSH_REGS
	mov r8,rdi
	FREE_S8 r8
	C_POP_REGS
;; rsp=0 , %11~2'(= a3◂ [..] )%10~1'(= r )%0~0'(= {| ? |} )
; ##8 { 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 1'(= r ) 2'(= a3◂ [..] ) }
	EMT_CST LB_49,25
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,RX1
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi 
; .adt_call t3 : { }
	call LB_19
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 1'(= r ) 2'(= a3◂ [..] ) }
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi
; .adt_call t3 : { }
	call LB_27
	C_POP_REGS
;; rsp=0 , %0~0'(= {| ? |} )
; # ?  { %[ "87383" ] %[ 0r ] } ⊢ { %[ "87383" ] 1'(= r ) 2'(= a3◂ [..] ) }
	mov rdi,5
	lea rsi,[LB_50]
	mov rax,0
	cmp rax,rdi
	jge LB_51
 lea rdi,[rsi+rax] 
	push rax 
	CALL_SF scf_d
	pop rbx 
	cmp rax,0 
	jz LB_51
	lea rax,[rbx+rsi]
	ALC_LN rsi 
	mov BYTE [rsi+6],0
	mov QWORD [rsi+8],rdi
	jmp LB_52
LB_51:
	mov rsi,unt_1 
LB_52:
	mov RX1,rax
	mov RX2,rsi
; .dlt.ptn %[ "87383" ]
;; rsp=0 , %15~2'(= a3◂ [..] )%14~1'(= r )%0~0'(= {| ? |} )
; ##8 { 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 1'(= r ) 2'(= a3◂ [..] ) }
	EMT_CST LB_53,29
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,RX1
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi 
; .adt_call t3 : _r64◂
	call LB_3
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 1'(= r ) 2'(= a3◂ [..] ) }
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi
; .adt_call t3 : _r64◂
	call LB_11
	C_POP_REGS
;; rsp=0 , %0~0'(= {| ? |} )
; # ?  { %[ "   \t\nkk" ] %[ 0r ] } ⊢ { %[ "   \t\nkk" ] 1'(= r ) 2'(= a3◂ [..] ) }
	mov rdi,7
	lea rsi,[LB_54]
	mov rax,0
	jmp LB_56
LB_55:
	add rax,1 
LB_56:
	cmp rax,rdi
	jge LB_57
	JZ_LINE_SPC BYTE [rsi+rax], LB_55
LB_57:
	mov rsi,unt_0
	mov RX1,rax
	mov RX2,rsi
; .dlt.ptn %[ "   \t\nkk" ]
;; rsp=0 , %19~2'(= a3◂ [..] )%18~1'(= r )%0~0'(= {| ? |} )
; ##8 { 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 1'(= r ) 2'(= a3◂ [..] ) }
	EMT_CST LB_58,25
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,RX1
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi 
; .adt_call t3 : { }
	call LB_19
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 1'(= r ) 2'(= a3◂ [..] ) }
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi
; .adt_call t3 : { }
	call LB_27
	C_POP_REGS
;; rsp=0 , %0~0'(= {| ? |} )
; # ?  { %[ "   \t\nkk" ] %[ 0r ] } ⊢ { %[ "   \t\nkk" ] 1'(= r ) 2'(= a3◂ [..] ) }
	mov rdi,7
	lea rsi,[LB_59]
	mov rax,0
	jmp LB_61
LB_60:
	add rax,1 
LB_61:
	cmp rax,rdi
	jge LB_62
	JZ_SPC BYTE [rsi+rax], LB_60
LB_62:
	mov rsi,unt_0
	mov RX1,rax
	mov RX2,rsi
; .dlt.ptn %[ "   \t\nkk" ]
;; rsp=0 , %23~2'(= a3◂ [..] )%22~1'(= r )%0~0'(= {| ? |} )
; ##8 { 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 1'(= r ) 2'(= a3◂ [..] ) }
	EMT_CST LB_63,25
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,RX1
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi 
; .adt_call t3 : { }
	call LB_19
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 1'(= r ) 2'(= a3◂ [..] ) }
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi
; .adt_call t3 : { }
	call LB_27
	C_POP_REGS
;; rsp=0 , %0~0'(= {| ? |} )
; # ?  { %[ "ffvv" ] %[ 0r ] } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
	sub rsp,8
	mov QWORD [rsp+0],RX0
	push EXH_86
	push LB_87
	sub rsp,16
; .mov_ptn2 { %[ "ffvv" ] %[ 0r ] } ⊢ { 11'(= {| l |} ) 12'(= r ) }
; {| 00000000111110.. |}
	mov QWORD [rsp-8+8*1],0
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	add QWORD [S8_N],4
	C_CALL_SF calloc
	mov QWORD [rax],4
	mov BYTE [rax+8+0],102
	mov BYTE [rax+8+1],102
	mov BYTE [rax+8+2],118
	mov BYTE [rax+8+3],118
	mov QWORD [rsp-8+8*2],rax
; mov_ptn2.
	call LB_64
LB_87:
	pop rax
	mov RX3,RX0
	mov RX0,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
; .dlt.ptn 3'(= {| l |} )
	mov rdi,RX3
	C_PUSH_REGS
	mov r8,rdi
	FREE_S8 r8
	C_POP_REGS
;; rsp=0 , %27~2'(= a3◂ [..] )%26~1'(= r )%0~0'(= {| ? |} )
; ##8 { 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 1'(= r ) 2'(= a3◂ [..] ) }
	EMT_CST LB_88,25
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,RX1
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi 
; .adt_call t3 : { }
	call LB_19
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 1'(= r ) 2'(= a3◂ [..] ) }
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi
; .adt_call t3 : { }
	call LB_27
	C_POP_REGS
;; rsp=0 , %0~0'(= {| ? |} )
; # ?  { %[ "97898723q928ffe" ] %[ 0r ] } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
	sub rsp,8
	mov QWORD [rsp+0],RX0
	push EXH_139
	push LB_140
	sub rsp,16
; .mov_ptn2 { %[ "97898723q928ffe" ] %[ 0r ] } ⊢ { 11'(= {| l |} ) 12'(= r ) }
; {| 00000000111110.. |}
	mov QWORD [rsp-8+8*1],0
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	add QWORD [S8_N],15
	C_CALL_SF calloc
	mov QWORD [rax],15
	mov BYTE [rax+8+0],57
	mov BYTE [rax+8+1],55
	mov BYTE [rax+8+2],56
	mov BYTE [rax+8+3],57
	mov BYTE [rax+8+4],56
	mov BYTE [rax+8+5],55
	mov BYTE [rax+8+6],50
	mov BYTE [rax+8+7],51
	mov BYTE [rax+8+8],113
	mov BYTE [rax+8+9],57
	mov BYTE [rax+8+10],50
	mov BYTE [rax+8+11],56
	mov BYTE [rax+8+12],102
	mov BYTE [rax+8+13],102
	mov BYTE [rax+8+14],101
	mov QWORD [rsp-8+8*2],rax
; mov_ptn2.
	call LB_89
LB_140:
	pop rax
	mov RX3,RX0
	mov RX0,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
; .dlt.ptn 3'(= {| l |} )
	mov rdi,RX3
	C_PUSH_REGS
	mov r8,rdi
	FREE_S8 r8
	C_POP_REGS
;; rsp=0 , %31~2'(= a3◂ [..] )%30~1'(= r )%0~0'(= {| ? |} )
; ##8 { 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 1'(= r ) 2'(= a3◂ [..] ) }
	EMT_CST LB_148,40
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,RX1
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi 
; .adt_call t3 : { _r64◂ _r64◂}
	call LB_141
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 1'(= r ) 2'(= a3◂ [..] ) }
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi
; .adt_call t3 : { _r64◂ _r64◂}
	call LB_149
	C_POP_REGS
;; rsp=0 , %0~0'(= {| ? |} )
; # ?  { %[ "rr97898723q928ffe" ] %[ 0r ] } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
	sub rsp,8
	mov QWORD [rsp+0],RX0
	push EXH_169
	push LB_170
	sub rsp,16
; .mov_ptn2 { %[ "rr97898723q928ffe" ] %[ 0r ] } ⊢ { 11'(= {| l |} ) 12'(= r ) }
; {| 00000000111110.. |}
	mov QWORD [rsp-8+8*1],0
	mov rsi,1  
	mov rdi,32
	xor rax,rax 
	add QWORD [S8_N],17
	C_CALL_SF calloc
	mov QWORD [rax],17
	mov BYTE [rax+8+0],114
	mov BYTE [rax+8+1],114
	mov BYTE [rax+8+2],57
	mov BYTE [rax+8+3],55
	mov BYTE [rax+8+4],56
	mov BYTE [rax+8+5],57
	mov BYTE [rax+8+6],56
	mov BYTE [rax+8+7],55
	mov BYTE [rax+8+8],50
	mov BYTE [rax+8+9],51
	mov BYTE [rax+8+10],113
	mov BYTE [rax+8+11],57
	mov BYTE [rax+8+12],50
	mov BYTE [rax+8+13],56
	mov BYTE [rax+8+14],102
	mov BYTE [rax+8+15],102
	mov BYTE [rax+8+16],101
	mov QWORD [rsp-8+8*2],rax
; mov_ptn2.
	call LB_154
LB_170:
	pop rax
	mov RX3,RX0
	mov RX0,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
; .dlt.ptn 3'(= {| l |} )
	mov rdi,RX3
	C_PUSH_REGS
	mov r8,rdi
	FREE_S8 r8
	C_POP_REGS
;; rsp=0 , %35~2'(= a3◂ [..] )%34~1'(= r )%0~0'(= {| ? |} )
; ##8 { 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 1'(= r ) 2'(= a3◂ [..] ) }
	EMT_CST LB_171,25
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,RX1
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi 
; .adt_call t3 : { }
	call LB_19
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 1'(= r ) 2'(= a3◂ [..] ) }
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi
; .adt_call t3 : { }
	call LB_27
	C_POP_REGS
;; rsp=0 , %0~0'(= {| ? |} )
; # ?  { %[ "97898723t928ffe" ] %[ 0r ] } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [..] ) }
	sub rsp,8
	mov QWORD [rsp+0],RX0
	push EXH_201
	push LB_202
	sub rsp,16
; .mov_ptn2 { %[ "97898723t928ffe" ] %[ 0r ] } ⊢ { 11'(= {| l |} ) 12'(= r ) }
; {| 00000000111110.. |}
	mov QWORD [rsp-8+8*1],0
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	add QWORD [S8_N],15
	C_CALL_SF calloc
	mov QWORD [rax],15
	mov BYTE [rax+8+0],57
	mov BYTE [rax+8+1],55
	mov BYTE [rax+8+2],56
	mov BYTE [rax+8+3],57
	mov BYTE [rax+8+4],56
	mov BYTE [rax+8+5],55
	mov BYTE [rax+8+6],50
	mov BYTE [rax+8+7],51
	mov BYTE [rax+8+8],116
	mov BYTE [rax+8+9],57
	mov BYTE [rax+8+10],50
	mov BYTE [rax+8+11],56
	mov BYTE [rax+8+12],102
	mov BYTE [rax+8+13],102
	mov BYTE [rax+8+14],101
	mov QWORD [rsp-8+8*2],rax
; mov_ptn2.
	call LB_172
LB_202:
	pop rax
	mov RX3,RX0
	mov RX0,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
; .dlt.ptn 3'(= {| l |} )
	mov rdi,RX3
	C_PUSH_REGS
	mov r8,rdi
	FREE_S8 r8
	C_POP_REGS
;; rsp=0 , %39~2'(= a3◂ [..] )%38~1'(= r )%0~0'(= {| ? |} )
; ##8 { 1'(= r ) 2'(= a3◂ [..] ) } ⊢ { 1'(= r ) 2'(= a3◂ [..] ) }
	EMT_CST LB_203,40
	mov QWORD [SIG_FLG],1
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,RX1
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi 
; .adt_call t3 : { _r64◂ _r64◂}
	call LB_141
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_FLSH
	mov QWORD [SIG_FLG],0
; .dlt.ptn { 1'(= r ) 2'(= a3◂ [..] ) }
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi
; .adt_call t3 : { _r64◂ _r64◂}
	call LB_149
	C_POP_REGS
;; rsp=0 , %0~0'(= {| ? |} )
; ∎
	jmp RTM_1
EXH_47:
	add rsp,16
	pop rax
	jmp rax
EXH_86:
	add rsp,16
	pop rax
	jmp rax
EXH_139:
	add rsp,16
	pop rax
	jmp rax
EXH_169:
	add rsp,16
	pop rax
	jmp rax
EXH_201:
	add rsp,16
	pop rax
	jmp rax
RTM_1:
	C_CALL exit

exn_grm: 
	mov rax,0xff01_0000_0000_0000
	mov QWORD [err_n],rax
	jmp err 
exn_dft: 
	mov rax,0xff00_0000_0000_0000
	mov QWORD [err_n],rax				
	jmp err 
err_exc_q: 
	mov rbx,0xffff_0000_0000_0000
	or rax,rbx 
	mov QWORD [err_n],rax
	jmp err 
err_bc: 
	mov QWORD [err_n],0xff
err: 
	mov rdi,fmt_err_line
	mov rsi,QWORD [err_n]
	xor rax,rax
	C_CALL printf
	mov rax,1
	mov rbx,0
	int 0x80
