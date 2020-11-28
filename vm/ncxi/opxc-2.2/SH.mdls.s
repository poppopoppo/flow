%include "HD.s"  
;	v.0
%define RCD_N 64
%define GLV_N 130
%define SS_NULL 0xffff_ffff_ffff_0000
%define EMT_BUF_MAX (KB<<1)				
 
section .bss
%include "BSS.s"

section .data
%include "DATA.s"
					
LB_5: db 32,58,32,0,0,0,0,0,0,0,0,0
LB_6: db 95,97,114,114,226,151,130,123,32,125,226,151,130,95,114,56,226,151,130,0,0,0,0,0,0,0,0,0
LB_7: db 10,0,0,0,0,0,0,0,0,0
section .text
global _start
_start:
%include "START.s"
	jmp RTM_0
LB_0: ;; #40◂◂(_none◂{}) 128'(= {| ? |} ) ⊢ { } : (_arr◂{ }◂_arr◂{ }◂_r8◂→{ })
JMP_0:
	mov r8,GLX(128)
	GET_LEN rsi,r8
	mov rax,0 
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
LB_1:
	cmp rsi,0
	jz LB_2
	push rsi 
	MOV_RBX r8,SX(0)
	mov rdi,r8 
	FREE_OPQ 3
	pop rsi 
	sub rsi,1 
	lea SRC_REG,[SRC_REG+8*1]
	jmp LB_1
LB_2:
	pop rdi
	pop SRC_REG 
	FREE_OPQ 4
	mov rdi,0
	mov rax,838
	mov rsi,rdi  
	sub rsp,128 
	mov rdi,rsp 
	push rsi 
	call pf_d 
	pop rdi
	add rdi,rax 
	push rax 
	add rdi,0
	push rdi 
	call mlc_s8 
	pop rdi
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	mov GLX(129),rax
	pop rcx 
	lea rsi,[rsp+rcx-1] 
	rep movsb
	add rsp,128
	mov rcx,QWORD [tmp]
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(129)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_5,3
	EMT_CST LB_6,19
	EMT_CST LB_7,1
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov r8,GLX(129)
	mov rdi,r8 
	FREE_OPQ 8
 ret 
RTM_0:
	push EXH_9
	MOV_RBX GLX(128),GLX(127)
	call LB_0
	add rsp,8
	mov QWORD [EXIT],1
	C_CALL exit
EXH_9:
	add rsp,8
	pop rax
	jmp rax
	sig_alc_rcd_1:
	mov rbx,1
	jmp sig_alc_rcd
	sig_alc_rcd_2:
	mov rbx,2
	jmp sig_alc_rcd
	sig_alc_rcd_3:
	mov rbx,3
	jmp sig_alc_rcd
	sig_alc_rcd_4:
	mov rbx,4
	jmp sig_alc_rcd
	sig_alc_rcd_5:
	mov rbx,5
	jmp sig_alc_rcd
	sig_alc_rcd_6:
	mov rbx,6
	jmp sig_alc_rcd
	sig_alc_rcd_7:
	mov rbx,7
	jmp sig_alc_rcd
	sig_alc_rcd_8:
	mov rbx,8
	jmp sig_alc_rcd
	sig_alc_rcd_9:
	mov rbx,9
	jmp sig_alc_rcd
	sig_alc_rcd_10:
	mov rbx,10
	jmp sig_alc_rcd
	sig_alc_rcd_11:
	mov rbx,11
	jmp sig_alc_rcd
	sig_alc_rcd_12:
	mov rbx,12
	jmp sig_alc_rcd
	sig_alc_rcd_13:
	mov rbx,13
	jmp sig_alc_rcd
	sig_alc_rcd_14:
	mov rbx,14
	jmp sig_alc_rcd
	sig_alc_rcd_15:
	mov rbx,15
	jmp sig_alc_rcd
	sig_alc_rcd_16:
	mov rbx,16
	jmp sig_alc_rcd
	sig_alc_rcd_17:
	mov rbx,17
	jmp sig_alc_rcd
	sig_alc_rcd_18:
	mov rbx,18
	jmp sig_alc_rcd
	sig_alc_rcd_19:
	mov rbx,19
	jmp sig_alc_rcd
	sig_alc_rcd_20:
	mov rbx,20
	jmp sig_alc_rcd
	sig_alc_rcd_21:
	mov rbx,21
	jmp sig_alc_rcd
	sig_alc_rcd_22:
	mov rbx,22
	jmp sig_alc_rcd
	sig_alc_rcd_23:
	mov rbx,23
	jmp sig_alc_rcd
	sig_alc_rcd_24:
	mov rbx,24
	jmp sig_alc_rcd
	sig_alc_rcd_25:
	mov rbx,25
	jmp sig_alc_rcd
	sig_alc_rcd_26:
	mov rbx,26
	jmp sig_alc_rcd
	sig_alc_rcd_27:
	mov rbx,27
	jmp sig_alc_rcd
	sig_alc_rcd_28:
	mov rbx,28
	jmp sig_alc_rcd
	sig_alc_rcd_29:
	mov rbx,29
	jmp sig_alc_rcd
	sig_alc_rcd_30:
	mov rbx,30
	jmp sig_alc_rcd
	sig_alc_rcd_31:
	mov rbx,31
	jmp sig_alc_rcd
	sig_alc_rcd_32:
	mov rbx,32
	jmp sig_alc_rcd
	sig_alc_rcd_33:
	mov rbx,33
	jmp sig_alc_rcd
	sig_alc_rcd_34:
	mov rbx,34
	jmp sig_alc_rcd
	sig_alc_rcd_35:
	mov rbx,35
	jmp sig_alc_rcd
	sig_alc_rcd_36:
	mov rbx,36
	jmp sig_alc_rcd
	sig_alc_rcd_37:
	mov rbx,37
	jmp sig_alc_rcd
	sig_alc_rcd_38:
	mov rbx,38
	jmp sig_alc_rcd
	sig_alc_rcd_39:
	mov rbx,39
	jmp sig_alc_rcd
	sig_alc_rcd_40:
	mov rbx,40
	jmp sig_alc_rcd
	sig_alc_rcd_41:
	mov rbx,41
	jmp sig_alc_rcd
	sig_alc_rcd_42:
	mov rbx,42
	jmp sig_alc_rcd
	sig_alc_rcd_43:
	mov rbx,43
	jmp sig_alc_rcd
	sig_alc_rcd_44:
	mov rbx,44
	jmp sig_alc_rcd
	sig_alc_rcd_45:
	mov rbx,45
	jmp sig_alc_rcd
	sig_alc_rcd_46:
	mov rbx,46
	jmp sig_alc_rcd
	sig_alc_rcd_47:
	mov rbx,47
	jmp sig_alc_rcd
	sig_alc_rcd_48:
	mov rbx,48
	jmp sig_alc_rcd
	sig_alc_rcd_49:
	mov rbx,49
	jmp sig_alc_rcd
	sig_alc_rcd_50:
	mov rbx,50
	jmp sig_alc_rcd
	sig_alc_rcd_51:
	mov rbx,51
	jmp sig_alc_rcd
	sig_alc_rcd_52:
	mov rbx,52
	jmp sig_alc_rcd
	sig_alc_rcd_53:
	mov rbx,53
	jmp sig_alc_rcd
	sig_alc_rcd_54:
	mov rbx,54
	jmp sig_alc_rcd
	sig_alc_rcd_55:
	mov rbx,55
	jmp sig_alc_rcd
	sig_alc_rcd_56:
	mov rbx,56
	jmp sig_alc_rcd
	sig_alc_rcd_57:
	mov rbx,57
	jmp sig_alc_rcd
	sig_alc_rcd_58:
	mov rbx,58
	jmp sig_alc_rcd
	sig_alc_rcd_59:
	mov rbx,59
	jmp sig_alc_rcd
	sig_alc_rcd_60:
	mov rbx,60
	jmp sig_alc_rcd
	sig_alc_rcd_61:
	mov rbx,61
	jmp sig_alc_rcd
	sig_alc_rcd_62:
	mov rbx,62
	jmp sig_alc_rcd
	sig_alc_rcd_63:
	mov rbx,63
	jmp sig_alc_rcd

%include "TEXT.s"
