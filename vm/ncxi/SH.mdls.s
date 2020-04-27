bits 64 
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

%define KB 1024
%define MB KB*KB 
%define GB MB*MB
%define SIG_INT 2
%define SIG_SEGV 11
%define SS_MAX 4000
%define SS_LN_MAX 1<<20
%define RCD_N 32
%define SS_NULL 0xffff_ffff_ffff_0000
%define EMT_BUF_MAX (KB<<1)
%define SS_LN_REG r15
%define MCR_REG rbx
%define SS_LN_N r12

%define RX0 r13
%define RX1 r14
%define RX2 r8
%define RX3 r9 
%define RX4 r10 
%define RX5 r11 
%define RX6 rcx 
%define RX7 rdx
 
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
section .bss
	tmp: resq 64
	ret_vct: resq 64
 rsp_tmp: resq 1
	RB: resq 1 

; emt buffer 
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
%define SS_RCD_2_MAX (1<<20)
	BSS_SS_RCD 2,SS_RCD_2_MAX
%define SS_RCD_3_MAX (1<<19)
	BSS_SS_RCD 3,SS_RCD_3_MAX
%define SS_RCD_4_MAX (1<<13)
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
	GRM_DT: 
		dq 0 
		dq 0 
		dq 0 
		dq 0 
		dq 0 
	err_n: dq 0
 SS_LN_C: dq 0
	S8_N: dq 0 
	fmt_err_line: db "err:%x",10,0
	fmt_r64: db "%dr",0
	fmt_s8: db 34,"%s",34,0
	fmt_d: db "%d",0
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
	rt_err0: db "rt_err 0:",10,0 
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

LB_107: db 39,48,226,151,130,0
LB_108: db 39,49,226,151,130,0
LB_119: db 39,48,226,151,130,0
LB_121: db 39,49,226,151,130,0
LB_126: db 39,48,226,151,130,0
LB_127: db 39,49,226,151,130,0
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

sig_hdl: ; rdi=sig_n rsi=siginfo_t* rdx=void*
	push rdi 
	push rsi 
	push rdx 
	xor rax,rax 
	mov rsi,rdi 
	mov rdi,fmt_sig_hdl
	C_CALL printf 
	call info 
	call exit 
	jmp err

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

emt_r64: ;rdi=r64
	xor rax,rax 
	mov rsi,rdi
	mov rdi,fmt_r64
	C_CALL_SF printf
	ret

emt_s8: ;rdi=s8
	xor rax,rax 
	lea rsi,[rdi+8]
	mov rdi,fmt_s8
	C_CALL_SF printf
	ret

emt_add: ; rdi=len rsi=stg
	cld 
	push rcx 
	mov rcx,rdi 
	mov rax,QWORD [EMT_BUF_OFS]
	add rdi,rax
	cmp rdi,EMT_BUF_MAX 
	jge emt_add_buf 
	mov BYTE [EMT_BUF+rdi],0
	mov QWORD [EMT_BUF_OFS],rdi
	lea rdi,[EMT_BUF+rax]
	jmp emt_add_end 
emt_add_buf:
	push rsi 
	call emt_buf 
	pop rsi 
	cmp rcx,EMT_BUF_MAX
	jge emt_add_stg 
	mov BYTE [EMT_BUF+rcx],0
	mov QWORD [EMT_BUF_OFS],rcx 
	mov rdi,EMT_BUF
emt_add_end:
	rep movsb 
	pop rcx 
	ret 
emt_add_stg 
	mov QWORD [EMT_BUF],0
	mov QWORD [EMT_BUF_OFS],0
	mov rdi,rsi 
	call emt_stg 
	pop rcx 
	ret 

emt_buf:
	xor rax,rax 
	mov rdi,EMT_BUF 
	C_CALL printf 
	mov QWORD [EMT_BUF_OFS],0
	mov BYTE [EMT_BUF],0
	ret 
	 
_start:
; set signal handler 
	mov rdi,SIG_SEGV 
	mov rsi,sig_hdl 
	C_CALL set_handler 

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
ETR_45:
	PUSH_GRM_DT
	call GRM_45
	POP_GRM_DT
	ret
GRM_45:
	push r14
	jmp LB_3
LB_2:
	add r14,1 
LB_3:
	cmp r14,r9
	jge LB_4
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2
LB_4:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_6
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],101
	jnz LB_6
	add r14,1
	jmp LB_5
LB_6:
	jmp LB_1
LB_5:
	jmp LB_8
LB_7:
; .dlt.ptn { }
	jmp LB_1
LB_8:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %23~1'(= r )%22~0'(= r )
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov RX2,0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],RX2
	mov RX2,rax
; mov_ptn2.
	jmp LB_9
LB_9:
	RET_GRM_DT 
	cmp BYTE [r8+6],0
	jz LB_0
LB_1:
	mov r14,QWORD [rsp]
	jmp LB_13
LB_12:
	add r14,1 
LB_13:
	cmp r14,r9
	jge LB_14
	JZ_LINE_SPC BYTE [r13+8+r14], LB_12
LB_14:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_16
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],89
	jnz LB_16
	cmp BYTE [rdi+1],105
	jnz LB_16
	cmp BYTE [rdi+2],73
	jnz LB_16
	add r14,3
	jmp LB_15
LB_16:
	jmp LB_11
LB_15:
	jmp LB_18
LB_17:
; .dlt.ptn { }
	jmp LB_11
LB_18:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %25~1'(= r )%24~0'(= r )
; ∎ 0(<2)◂%[ 1r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov RX2,1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],RX2
	mov RX2,rax
; mov_ptn2.
	jmp LB_19
LB_19:
	RET_GRM_DT 
	cmp BYTE [r8+6],0
	jz LB_0
LB_11:
	mov r14,QWORD [rsp]
	jmp LB_23
LB_22:
	add r14,1 
LB_23:
	cmp r14,r9
	jge LB_24
	JZ_LINE_SPC BYTE [r13+8+r14], LB_22
LB_24:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_26
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],72
	jnz LB_26
	cmp BYTE [rdi+1],111
	jnz LB_26
	cmp BYTE [rdi+2],111
	jnz LB_26
	add r14,3
	jmp LB_25
LB_26:
	jmp LB_21
LB_25:
	jmp LB_28
LB_27:
	add r14,1 
LB_28:
	cmp r14,r9
	jge LB_29
	JZ_LINE_SPC BYTE [r13+8+r14], LB_27
LB_29:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_31
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],98
	jnz LB_31
	cmp BYTE [rdi+1],97
	jnz LB_31
	cmp BYTE [rdi+2],97
	jnz LB_31
	add r14,3
	jmp LB_30
LB_31:
; .dlt.ptn { }
	jmp LB_21
LB_30:
	jmp LB_33
LB_32:
; .dlt.ptn { }
; .dlt.ptn { }
	jmp LB_21
LB_33:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %27~1'(= r )%26~0'(= r )
; ∎ 0(<2)◂%[ 2r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 2r ] ⊢ 2'(= a3◂ [ r] )
; {| 0010.. |}
	mov RX2,2
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],RX2
	mov RX2,rax
; mov_ptn2.
	jmp LB_34
LB_34:
	RET_GRM_DT 
	cmp BYTE [r8+6],0
	jz LB_0
LB_21:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_0:
; discard r14
	add rsp,8
	ret
ETR_36:
	PUSH_GRM_DT
	call GRM_36
	POP_GRM_DT
	ret
GRM_36:
	push r14
	jmp LB_40
LB_39:
	add r14,1 
LB_40:
	cmp r14,r9
	jge LB_41
	JZ_LINE_SPC BYTE [r13+8+r14], LB_39
LB_41:
	call GRM_45
	cmp BYTE [r8+6],0
	jnz LB_43
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],RX2
; mov_ptn2.
	jmp LB_42
LB_43:
	jmp LB_38
LB_42:
	jmp LB_45
LB_44:
	add r14,1 
LB_45:
	cmp r14,r9
	jge LB_46
	JZ_LINE_SPC BYTE [r13+8+r14], LB_44
LB_46:
	call GRM_45
	cmp BYTE [r8+6],0
	jnz LB_48
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 9'(= r )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],RX2
; mov_ptn2.
	jmp LB_47
LB_48:
; .dlt.ptn 8'(= r )
; .add_rsp 1
	add rsp,8
	jmp LB_38
LB_47:
	jmp LB_50
LB_49:
; .dlt.ptn 9'(= r )
; .dlt.ptn 8'(= r )
; .add_rsp 2
	add rsp,16
	jmp LB_38
LB_50:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %21~1'(= r )%20~0'(= r )%19~9'(= r )%18~8'(= r )
; ∎ 0(<2)◂{ 8'(= r ) 9'(= r ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂{ 8'(= r ) 9'(= r ) } ⊢ 2'(= a3◂ [ *{ rr}] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov RX2,rax
	mov RX0,QWORD [rsp-8+8*2]
	mov QWORD [RX2+8],RX0 
	mov RX0,QWORD [rsp-8+8*1]
	mov QWORD [RX2+16],RX0 
	mov BYTE [RX2+6],0
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_51
LB_51:
	RET_GRM_DT 
	cmp BYTE [r8+6],0
	jz LB_37
LB_38:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_37:
; discard r14
	add rsp,8
	ret
LB_81:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_84+8*rax]
LB_84: dq LB_82,LB_83
LB_82:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_81
	pop r8 
	FREE_RCD 2, r8
	jmp LB_85
LB_83:
	jmp LB_85
LB_85:
	ret
ETR_66:
	PUSH_GRM_DT
	call GRM_66
	POP_GRM_DT
	ret
GRM_66:
	push r14
	jmp LB_70
LB_69:
	add r14,1 
LB_70:
	cmp r14,r9
	jge LB_71
	JZ_LINE_SPC BYTE [r13+8+r14], LB_69
LB_71:
	call GRM_45
	cmp BYTE [r8+6],0
	jnz LB_73
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],RX2
; mov_ptn2.
	jmp LB_72
LB_73:
	jmp LB_68
LB_72:
	jmp LB_75
LB_74:
	add r14,1 
LB_75:
	cmp r14,r9
	jge LB_76
	JZ_LINE_SPC BYTE [r13+8+r14], LB_74
LB_76:
	call GRM_66
	cmp BYTE [r8+6],0
	jnz LB_78
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ r] ) ⊢ 9'(= a2◂ [ r] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],RX2
; mov_ptn2.
	jmp LB_77
LB_78:
; .dlt.ptn 8'(= r )
; .add_rsp 1
	add rsp,8
	jmp LB_68
LB_77:
	jmp LB_80
LB_79:
; .dlt.ptn 9'(= a2◂ [ r] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_81
	C_POP_REGS
; .dlt.ptn 8'(= r )
; .add_rsp 2
	add rsp,16
	jmp LB_68
LB_80:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %11~1'(= r )%10~0'(= r )%9~9'(= a2◂ [ r] )%8~8'(= r )
; ∎ 0(<2)◂0(<2)◂{ 8'(= r ) 9'(= a2◂ [ r] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= r ) 9'(= a2◂ [ r] ) } ⊢ 2'(= a3◂ [ a2◂ [ r]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov RX2,rax
	mov RX0,QWORD [rsp-8+8*2]
	mov QWORD [RX2+8],RX0 
	mov RX0,QWORD [rsp-8+8*1]
	mov QWORD [RX2+16],RX0 
	mov BYTE [RX2+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],RX2
	mov RX2,rax
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_86
LB_86:
	RET_GRM_DT 
	cmp BYTE [r8+6],0
	jz LB_67
LB_68:
	mov r14,QWORD [rsp]
	jmp LB_90
LB_89:
	jmp LB_88
LB_90:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %13~1'(= r )%12~0'(= r )
; ∎ 0(<2)◂1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ r]] )
; {| 0010.. |}
	mov RX2,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],RX2
	mov RX2,rax
; mov_ptn2.
	jmp LB_91
LB_91:
	RET_GRM_DT 
	cmp BYTE [r8+6],0
	jz LB_67
LB_88:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_67:
; discard r14
	add rsp,8
	ret
ETR_53:
	PUSH_GRM_DT
	call GRM_53
	POP_GRM_DT
	ret
GRM_53:
	push r14
	jmp LB_57
LB_56:
	add r14,1 
LB_57:
	cmp r14,r9
	jge LB_58
	JZ_LINE_SPC BYTE [r13+8+r14], LB_56
LB_58:
	call GRM_45
	cmp BYTE [r8+6],0
	jnz LB_60
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],RX2
; mov_ptn2.
	jmp LB_59
LB_60:
	jmp LB_55
LB_59:
	jmp LB_62
LB_61:
	add r14,1 
LB_62:
	cmp r14,r9
	jge LB_63
	JZ_LINE_SPC BYTE [r13+8+r14], LB_61
LB_63:
	call GRM_66
	cmp BYTE [r8+6],0
	jnz LB_65
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ r] ) ⊢ 9'(= a2◂ [ r] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],RX2
; mov_ptn2.
	jmp LB_64
LB_65:
; .dlt.ptn 8'(= r )
; .add_rsp 1
	add rsp,8
	jmp LB_55
LB_64:
	jmp LB_94
LB_93:
; .dlt.ptn 9'(= a2◂ [ r] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_81
	C_POP_REGS
; .dlt.ptn 8'(= r )
; .add_rsp 2
	add rsp,16
	jmp LB_55
LB_94:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %11~1'(= r )%10~0'(= r )%9~9'(= a2◂ [ r] )%8~8'(= r )
; ∎ 0(<2)◂0(<2)◂{ 8'(= r ) 9'(= a2◂ [ r] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= r ) 9'(= a2◂ [ r] ) } ⊢ 2'(= a3◂ [ a2◂ [ r]] )
; {| 00100000110.. |}
	ALC_RCD 2, rax
	mov RX2,rax
	mov RX0,QWORD [rsp-8+8*2]
	mov QWORD [RX2+8],RX0 
	mov RX0,QWORD [rsp-8+8*1]
	mov QWORD [RX2+16],RX0 
	mov BYTE [RX2+6],0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],RX2
	mov RX2,rax
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_95
LB_95:
	RET_GRM_DT 
	cmp BYTE [r8+6],0
	jz LB_54
LB_55:
	mov r14,QWORD [rsp]
	jmp LB_99
LB_98:
	jmp LB_97
LB_99:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %13~1'(= r )%12~0'(= r )
; ∎ 0(<2)◂1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ r]] )
; {| 0010.. |}
	mov RX2,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],RX2
	mov RX2,rax
; mov_ptn2.
	jmp LB_100
LB_100:
	RET_GRM_DT 
	cmp BYTE [r8+6],0
	jz LB_54
LB_97:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_54:
; discard r14
	add rsp,8
	ret
LB_102:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_105+8*rax]
LB_105: dq LB_103,LB_104
LB_103:
	mov rdi,LB_107
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call emt_r64
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	mov rdi,r8
	call emt_r64
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_106
LB_104:
	mov rdi,LB_108
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_106
LB_106:
	ret
LB_109:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_112+8*rax]
LB_112: dq LB_110,LB_111
LB_110:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	FREE_RCD 2, r8
	jmp LB_113
LB_111:
	jmp LB_113
LB_113:
	ret
LB_114:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_117+8*rax]
LB_117: dq LB_115,LB_116
LB_115:
	mov rdi,LB_119
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_120
	jmp LB_118
LB_116:
	mov rdi,LB_121
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_118
LB_118:
	ret
LB_120:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_124+8*rax]
LB_124: dq LB_122,LB_123
LB_122:
	mov rdi,LB_126
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call emt_r64
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_120
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_125
LB_123:
	mov rdi,LB_127
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_125
LB_125:
	ret
LB_128:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_131+8*rax]
LB_131: dq LB_129,LB_130
LB_129:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_81
	jmp LB_132
LB_130:
	jmp LB_132
LB_132:
	ret
RTM_0:
;; rsp=0 , %0~0'(= {| {| l |}|} )
; ##46 { %[ "YiI Hoobaa fif" ] %[ 0r ] } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ *{ rr}] ) }
	sub rsp,8
	mov QWORD [rsp+0],RX0
; .mov_ptn2 { %[ "YiI Hoobaa fif" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; {| 1100000010.. |}
	mov RX1,0
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	add QWORD [S8_N],14
	C_CALL_SF calloc
	mov QWORD [rax],14
	mov BYTE [rax+8+0],89
	mov BYTE [rax+8+1],105
	mov BYTE [rax+8+2],73
	mov BYTE [rax+8+3],32
	mov BYTE [rax+8+4],72
	mov BYTE [rax+8+5],111
	mov BYTE [rax+8+6],111
	mov BYTE [rax+8+7],98
	mov BYTE [rax+8+8],97
	mov BYTE [rax+8+9],97
	mov BYTE [rax+8+10],32
	mov BYTE [rax+8+11],102
	mov BYTE [rax+8+12],105
	mov BYTE [rax+8+13],102
	mov RX0,rax
; mov_ptn2.
	call ETR_36
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
;; rsp=0 , %30~2'(= a3◂ [ *{ rr}] )%29~1'(= r )%0~0'(= {| {| l |}|} )
; ##10 { 1'(= r ) 2'(= a3◂ [ *{ rr}] ) } ⊢ { 1'(= r ) 2'(= a3◂ [ *{ rr}] ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rdi,RX1
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi
	call LB_102
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
; .dlt.ptn { 1'(= r ) 2'(= a3◂ [ *{ rr}] ) }
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi
	call LB_109
	C_POP_REGS
;; rsp=0 , %0~0'(= {| {| l |}|} )
; ##47 { %[ "YiI Hoobaae e e e e eYiI e yueo" ] %[ 0r ] } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ a2◂ [ r]] ) }
	sub rsp,8
	mov QWORD [rsp+0],RX0
; .mov_ptn2 { %[ "YiI Hoobaae e e e e eYiI e yueo" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; {| 1100000010.. |}
	mov RX1,0
	mov rsi,1  
	mov rdi,40
	xor rax,rax 
	add QWORD [S8_N],31
	C_CALL_SF calloc
	mov QWORD [rax],31
	mov BYTE [rax+8+0],89
	mov BYTE [rax+8+1],105
	mov BYTE [rax+8+2],73
	mov BYTE [rax+8+3],32
	mov BYTE [rax+8+4],72
	mov BYTE [rax+8+5],111
	mov BYTE [rax+8+6],111
	mov BYTE [rax+8+7],98
	mov BYTE [rax+8+8],97
	mov BYTE [rax+8+9],97
	mov BYTE [rax+8+10],101
	mov BYTE [rax+8+11],32
	mov BYTE [rax+8+12],101
	mov BYTE [rax+8+13],32
	mov BYTE [rax+8+14],101
	mov BYTE [rax+8+15],32
	mov BYTE [rax+8+16],101
	mov BYTE [rax+8+17],32
	mov BYTE [rax+8+18],101
	mov BYTE [rax+8+19],32
	mov BYTE [rax+8+20],101
	mov BYTE [rax+8+21],89
	mov BYTE [rax+8+22],105
	mov BYTE [rax+8+23],73
	mov BYTE [rax+8+24],32
	mov BYTE [rax+8+25],101
	mov BYTE [rax+8+26],32
	mov BYTE [rax+8+27],121
	mov BYTE [rax+8+28],117
	mov BYTE [rax+8+29],101
	mov BYTE [rax+8+30],111
	mov RX0,rax
; mov_ptn2.
	call ETR_53
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
;; rsp=0 , %34~2'(= a3◂ [ a2◂ [ r]] )%33~1'(= r )%0~0'(= {| {| l |}|} )
; ##10 { 1'(= r ) 2'(= a3◂ [ a2◂ [ r]] ) } ⊢ { 1'(= r ) 2'(= a3◂ [ a2◂ [ r]] ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	mov rdi,RX1
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi
	call LB_114
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
; .dlt.ptn { 1'(= r ) 2'(= a3◂ [ a2◂ [ r]] ) }
	mov rdi,RX2
	C_PUSH_REGS
	mov r8,rdi
	call LB_128
	C_POP_REGS
;; rsp=0 , %0~0'(= {| {| l |}|} )
; ∎
	jmp RTM_1
LB_133: ;; #37◂◂(_none◂{}) 0'(= a2◂ [ r] ) ⊢ 0'(= a2◂ [ r] ) : (_lst◂_r64◂→_lst◂_r64◂)
JMP_133:
;; rsp=0 , %4~0'(= a2◂ [ r] )
; ∎ 0'(= a2◂ [ r] )
; .mov_ptn2 0'(= a2◂ [ r] ) ⊢ 0'(= a2◂ [ r] )
; {| 10.. |}
; mov_ptn2.
; .add_rsp 0
	ret
LB_142:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_145+8*rax]
LB_145: dq LB_143,LB_144
LB_143:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_147
	jmp LB_146
LB_144:
	jmp LB_146
LB_146:
	ret
LB_147:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_150+8*rax]
LB_150: dq LB_148,LB_149
LB_148:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_152
	jmp LB_151
LB_149:
	jmp LB_151
LB_151:
	ret
LB_152:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_155+8*rax]
LB_155: dq LB_153,LB_154
LB_153:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_156
LB_154:
	jmp LB_156
LB_156:
	ret
LB_134: ;; #38◂◂(_none◂{}) 0'(= a3◂ [ a3◂ [ a3◂ [ r]]] ) ⊢ 0'(= r ) : (_opn◂_opn◂_opn◂_r64◂→_r64◂)
JMP_134:
;; rsp=0 , %5~0'(= a3◂ [ a3◂ [ a3◂ [ r]]] )
;; ?; 0'(= a3◂ [ a3◂ [ a3◂ [ r]]] ) ⊢ 0(<2)◂0(<2)◂0(<2)◂3'(= r )
	mov rdi,RX0
	cmp BYTE [rdi+6],0
	jnz LB_136
	jmp LB_137
LB_136:
	jmp LB_135
LB_137:
	mov QWORD [GBG_VCT+8*0],rdi
	mov RX1,QWORD [rdi+8]
	mov rdi,RX1
	cmp BYTE [rdi+6],0
	jnz LB_138
	jmp LB_139
LB_138:
	jmp LB_135
LB_139:
	mov QWORD [GBG_VCT+8*1],rdi
	mov RX2,QWORD [rdi+8]
	mov rdi,RX2
	cmp BYTE [rdi+6],0
	jnz LB_140
	jmp LB_141
LB_140:
	jmp LB_135
LB_141:
	mov QWORD [GBG_VCT+8*2],rdi
	mov RX3,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*2]
	FREE_LN rdi
	mov rdi,QWORD [GBG_VCT+8*1]
	FREE_LN rdi
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %6~3'(= r )
; ##11 3'(= r ) ⊢ 3'(= r )
	add RX3,1
;; rsp=0 , %7~3'(= r )
; ∎ 3'(= r )
; .mov_ptn2 3'(= r ) ⊢ 0'(= r )
; {| 10010.. |}
	mov RX0,RX3
; mov_ptn2.
; .add_rsp 0
	ret
LB_135:
;; rsp=0 , %5~0'(= a3◂ [ a3◂ [ a3◂ [ r]]] )
; ∎ %[ 0r ]
; .dlt.ptn 0'(= a3◂ [ a3◂ [ a3◂ [ r]]] )
	mov rdi,RX0
	C_PUSH_REGS
	mov r8,rdi
	call LB_142
	C_POP_REGS
; .mov_ptn2 %[ 0r ] ⊢ 0'(= r )
; {| 10.. |}
	mov RX0,0
; mov_ptn2.
; .add_rsp 0
	ret
RTM_1:
;; rsp=0 , %0~0'(= {| {| l |}|} )
; $ %[ #35 ] ⊢ %[ #35 ]
;; rsp=0 , %36~%[ #35 ]%0~0'(= {| {| l |}|} )
; $ %[ #35 ] ⊢ %[ #35 ],%[ #35 ]
;; rsp=0 , %38~%[ #35 ]%37~%[ #35 ]%0~0'(= {| {| l |}|} )
; ##37 %[ #35 ] ⊢ 1'(= a2◂ [ r] )
	sub rsp,8
	mov QWORD [rsp+0],RX0
; .mov_ptn2 %[ #35 ] ⊢ 0'(= a2◂ [ r] )
; {| 1000000010.. |}
	ALC_RCD 2, rax
	mov RX0,rax
	mov RX1,1
	mov QWORD [RX0+8],RX1 
	mov RX1,unt_1
	mov QWORD [RX0+16],RX1 
	mov BYTE [RX0+6],0
; mov_ptn2.
	call LB_133
	mov RX1,RX0
	mov RX0,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %39~1'(= a2◂ [ r] )%38~%[ #35 ]%0~0'(= {| {| l |}|} )
; ##10 1'(= a2◂ [ r] ) ⊢ 1'(= a2◂ [ r] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,RX1
	C_PUSH_REGS
	mov r8,rdi
	call LB_120
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
; .dlt.ptn 1'(= a2◂ [ r] )
	mov rdi,RX1
	C_PUSH_REGS
	mov r8,rdi
	call LB_81
	C_POP_REGS
;; rsp=0 , %38~%[ #35 ]%0~0'(= {| {| l |}|} )
; ##38 0(<2)◂0(<2)◂0(<2)◂%[ 1r ] ⊢ 1'(= r )
	sub rsp,8
	mov QWORD [rsp+0],RX0
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂%[ 1r ] ⊢ 0'(= a3◂ [ a3◂ [ a3◂ [ r]]] )
; {| 1000000010.. |}
	mov RX0,1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],RX0
	mov RX0,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],RX0
	mov RX0,rax
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],RX0
	mov RX0,rax
; mov_ptn2.
	call LB_134
	mov RX1,RX0
	mov RX0,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %41~1'(= r )%38~%[ #35 ]%0~0'(= {| {| l |}|} )
; ##10 1'(= r ) ⊢ 1'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,RX1
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
; .dlt.ptn 1'(= r )
;; rsp=0 , %38~%[ #35 ]%0~0'(= {| {| l |}|} )
; ∎
	jmp RTM_2
RTM_2:
	C_CALL exit

err: 
	mov rdi,fmt_err_line
	mov rsi,QWORD [err_n]
	xor rax,rax
	C_CALL printf
	mov rax,1
	mov rbx,0
	int 0x80
