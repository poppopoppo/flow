%include "HD.s"  
;	v.0
%define RCD_N 64
%define GLV_N 142
%define SS_NULL 0xffff_ffff_ffff_0000
%define EMT_BUF_MAX (KB<<1)				
 
section .bss
%include "BSS.s"

section .data
%include "DATA.s"
LB_5_H: dq 0x1
LB_5: db 34,0,0,0,0,0,0,0,0,0
LB_6_H: dq 0x11
LB_6: db 32,79,75,32,79,75,74,70,79,73,74,111,102,111,32,111,106,0,0,0,0,0,0,0,0,0
LB_7_H: dq 0x3
LB_7: db 32,58,32,0,0,0,0,0,0,0,0,0
LB_8_H: dq 0x13
LB_8: db 95,97,114,114,226,151,130,123,32,125,226,151,130,95,114,56,226,151,130,0,0,0,0,0,0,0,0,0
LB_9_H: dq 0x1
LB_9: db 10,0,0,0,0,0,0,0,0,0
LB_10_H: dq 0x7
LB_10: db 70,74,70,74,74,74,74,0,0,0,0,0,0,0,0,0
LB_12_H: dq 0x1
LB_12: db 44,0,0,0,0,0,0,0,0,0
LB_20_H: dq 0x7
LB_20: db 95,114,54,52,226,151,130,0,0,0,0,0,0,0,0,0
section .text
global _start
_start:
%include "START.s"
	jmp RTM_0
LB_11: ;; #0x2a◂◂(_none◂{}) { 131'(= [| _ |] ) 132'(= [| _ |] ) } ⊢ 0'(= {| l |} ) : ({ .p16◂_arr◂{ }◂_r8◂ .p16◂_arr◂{ }◂_r8◂}→_arr◂{ }◂_r8◂)
JMP_11:
	mov rdi,0
	mov rsi,GLX(0x83)
	mov rax,QWORD [rsi-8] 
	add rdi,rax 
	push rsi
	push rax 
	mov rsi,GLX(0x84)
	mov rax,QWORD [rsi-8] 
	add rdi,rax 
	push rsi
	push rax 
	add rdi,0x1
	push rdi 
	call mlc_s8 
	pop rdi
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	mov GLX(0x85),rax
	pop rcx 
	pop rsi
	lea rsi,[rsi+rcx-1]
	rep movsb
	lea rsi,[LB_12+0x1-1]
	mov rcx,0x1
	rep movsb
	pop rcx 
	pop rsi
	lea rsi,[rsi+rcx-1]
	rep movsb
	mov rcx,QWORD [tmp]
	mov r8,GLX(0x83)
	mov r8,GLX(0x84)
	MOV_RBX GLX(0x0),GLX(0x85)
 ret 
LB_15: ;; #0x28◂◂(_none◂{}) 134'(= r ) ⊢ 0'(= r ) : (_r64◂→_r64◂)
JMP_15:
	mov rax,GLX(0x86)
	cmp rax,0x6
	jge LB_18
	jmp QWORD [LB_17+8*rax]
LB_17: dq LB_17_0,LB_17_1,LB_17_2,LB_17_3,LB_17_4,LB_17_5,0
LB_17_0:
	mov rax,0x3
	mov GLX(0x87),rax
	MOV_RBX GLX(0x0),GLX(0x87)
 ret 
LB_17_1:
	mov rax,0x3
	mov GLX(0x88),rax
	MOV_RBX GLX(0x0),GLX(0x88)
 ret 
LB_17_2:
	mov rax,0x3
	mov GLX(0x89),rax
	MOV_RBX GLX(0x0),GLX(0x89)
 ret 
LB_17_3:
	mov rax,0x3
	mov GLX(0x8a),rax
	MOV_RBX GLX(0x0),GLX(0x8a)
 ret 
LB_17_4:
	mov rax,0x3
	mov GLX(0x8b),rax
	MOV_RBX GLX(0x0),GLX(0x8b)
 ret 
LB_17_5:
	mov rax,0x3
	mov GLX(0x8c),rax
	MOV_RBX GLX(0x0),GLX(0x8c)
 ret 
LB_18:
	add rsp,8 
	pop rdi 
	mov rsi,0x1fde
	jmp exn 
LB_16:
LB_0: ;; #0x2c◂◂(_none◂{}) 128'(= {| ? |} ) ⊢ { } : (_arr◂{ }◂_arr◂{ }◂_r8◂→{ })
JMP_0:
	mov r8,GLX(0x80)
	GET_LEN rsi,r8
	mov rax,0 
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
LB_1:
	cmp rsi,0
	jz LB_2
	push rsi 
	MOV_RBX r8,SX(0x0)
	mov rdi,r8 
	FREE_OPQ 3
	pop rsi 
	sub rsi,1 
	lea SRC_REG,[SRC_REG+8*0x1]
	jmp LB_1
LB_2:
	pop rdi
	pop SRC_REG 
	FREE_OPQ 4
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST LB_5,1
	EMT_CST LB_6,17
	EMT_CST LB_5,1
	EMT_CST fmt_nl,4
	EMT_CST LB_7,3
	EMT_CST LB_8,19
	EMT_CST LB_9,1
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov GLX(0x81),LB_10
	mov r8,GLX(0x81)
	mov rax,r8
	mov GLX(0x82),rax
	push EXH_13
	MOV_RBX GLX(0x83),GLX(0x81)
	MOV_RBX GLX(0x84),GLX(0x82)
	call LB_11
	add rsp,8
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(0x0)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_7,3
	EMT_CST LB_8,19
	EMT_CST LB_9,1
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov r8,GLX(0x0)
	mov rdi,r8 
	FREE_OPQ 14
	push EXH_19
	mov rax,0x10
	mov GLX(0x8d),rax
	MOV_RBX GLX(0x86),GLX(0x8d)
	call LB_15
	add rsp,8
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(0x0)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_7,3
	EMT_CST LB_20,7
	EMT_CST LB_9,1
	EMT_FLSH
	pop QWORD [SIG_ETR]
 ret 
EXH_13:
	add rsp,0x8
	pop rax
	jmp rax
EXH_19:
	add rsp,0x8
	pop rax
	jmp rax
RTM_0:
	push EXH_21
	MOV_RBX GLX(0x80),GLX(0x7f)
	call LB_0
	add rsp,8
	mov QWORD [EXIT],1
	C_CALL exit
EXH_21:
	add rsp,0x8
	pop rax
	jmp rax
	sig_alc_rcd_1:
	mov rbx,0x1
	jmp sig_alc_rcd
	sig_alc_rcd_2:
	mov rbx,0x2
	jmp sig_alc_rcd
	sig_alc_rcd_3:
	mov rbx,0x3
	jmp sig_alc_rcd
	sig_alc_rcd_4:
	mov rbx,0x4
	jmp sig_alc_rcd
	sig_alc_rcd_5:
	mov rbx,0x5
	jmp sig_alc_rcd
	sig_alc_rcd_6:
	mov rbx,0x6
	jmp sig_alc_rcd
	sig_alc_rcd_7:
	mov rbx,0x7
	jmp sig_alc_rcd
	sig_alc_rcd_8:
	mov rbx,0x8
	jmp sig_alc_rcd
	sig_alc_rcd_9:
	mov rbx,0x9
	jmp sig_alc_rcd
	sig_alc_rcd_10:
	mov rbx,0xa
	jmp sig_alc_rcd
	sig_alc_rcd_11:
	mov rbx,0xb
	jmp sig_alc_rcd
	sig_alc_rcd_12:
	mov rbx,0xc
	jmp sig_alc_rcd
	sig_alc_rcd_13:
	mov rbx,0xd
	jmp sig_alc_rcd
	sig_alc_rcd_14:
	mov rbx,0xe
	jmp sig_alc_rcd
	sig_alc_rcd_15:
	mov rbx,0xf
	jmp sig_alc_rcd
	sig_alc_rcd_16:
	mov rbx,0x10
	jmp sig_alc_rcd
	sig_alc_rcd_17:
	mov rbx,0x11
	jmp sig_alc_rcd
	sig_alc_rcd_18:
	mov rbx,0x12
	jmp sig_alc_rcd
	sig_alc_rcd_19:
	mov rbx,0x13
	jmp sig_alc_rcd
	sig_alc_rcd_20:
	mov rbx,0x14
	jmp sig_alc_rcd
	sig_alc_rcd_21:
	mov rbx,0x15
	jmp sig_alc_rcd
	sig_alc_rcd_22:
	mov rbx,0x16
	jmp sig_alc_rcd
	sig_alc_rcd_23:
	mov rbx,0x17
	jmp sig_alc_rcd
	sig_alc_rcd_24:
	mov rbx,0x18
	jmp sig_alc_rcd
	sig_alc_rcd_25:
	mov rbx,0x19
	jmp sig_alc_rcd
	sig_alc_rcd_26:
	mov rbx,0x1a
	jmp sig_alc_rcd
	sig_alc_rcd_27:
	mov rbx,0x1b
	jmp sig_alc_rcd
	sig_alc_rcd_28:
	mov rbx,0x1c
	jmp sig_alc_rcd
	sig_alc_rcd_29:
	mov rbx,0x1d
	jmp sig_alc_rcd
	sig_alc_rcd_30:
	mov rbx,0x1e
	jmp sig_alc_rcd
	sig_alc_rcd_31:
	mov rbx,0x1f
	jmp sig_alc_rcd
	sig_alc_rcd_32:
	mov rbx,0x20
	jmp sig_alc_rcd
	sig_alc_rcd_33:
	mov rbx,0x21
	jmp sig_alc_rcd
	sig_alc_rcd_34:
	mov rbx,0x22
	jmp sig_alc_rcd
	sig_alc_rcd_35:
	mov rbx,0x23
	jmp sig_alc_rcd
	sig_alc_rcd_36:
	mov rbx,0x24
	jmp sig_alc_rcd
	sig_alc_rcd_37:
	mov rbx,0x25
	jmp sig_alc_rcd
	sig_alc_rcd_38:
	mov rbx,0x26
	jmp sig_alc_rcd
	sig_alc_rcd_39:
	mov rbx,0x27
	jmp sig_alc_rcd
	sig_alc_rcd_40:
	mov rbx,0x28
	jmp sig_alc_rcd
	sig_alc_rcd_41:
	mov rbx,0x29
	jmp sig_alc_rcd
	sig_alc_rcd_42:
	mov rbx,0x2a
	jmp sig_alc_rcd
	sig_alc_rcd_43:
	mov rbx,0x2b
	jmp sig_alc_rcd
	sig_alc_rcd_44:
	mov rbx,0x2c
	jmp sig_alc_rcd
	sig_alc_rcd_45:
	mov rbx,0x2d
	jmp sig_alc_rcd
	sig_alc_rcd_46:
	mov rbx,0x2e
	jmp sig_alc_rcd
	sig_alc_rcd_47:
	mov rbx,0x2f
	jmp sig_alc_rcd
	sig_alc_rcd_48:
	mov rbx,0x30
	jmp sig_alc_rcd
	sig_alc_rcd_49:
	mov rbx,0x31
	jmp sig_alc_rcd
	sig_alc_rcd_50:
	mov rbx,0x32
	jmp sig_alc_rcd
	sig_alc_rcd_51:
	mov rbx,0x33
	jmp sig_alc_rcd
	sig_alc_rcd_52:
	mov rbx,0x34
	jmp sig_alc_rcd
	sig_alc_rcd_53:
	mov rbx,0x35
	jmp sig_alc_rcd
	sig_alc_rcd_54:
	mov rbx,0x36
	jmp sig_alc_rcd
	sig_alc_rcd_55:
	mov rbx,0x37
	jmp sig_alc_rcd
	sig_alc_rcd_56:
	mov rbx,0x38
	jmp sig_alc_rcd
	sig_alc_rcd_57:
	mov rbx,0x39
	jmp sig_alc_rcd
	sig_alc_rcd_58:
	mov rbx,0x3a
	jmp sig_alc_rcd
	sig_alc_rcd_59:
	mov rbx,0x3b
	jmp sig_alc_rcd
	sig_alc_rcd_60:
	mov rbx,0x3c
	jmp sig_alc_rcd
	sig_alc_rcd_61:
	mov rbx,0x3d
	jmp sig_alc_rcd
	sig_alc_rcd_62:
	mov rbx,0x3e
	jmp sig_alc_rcd
	sig_alc_rcd_63:
	mov rbx,0x3f
	jmp sig_alc_rcd

%include "TEXT.s"
