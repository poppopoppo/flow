%include "HD.s"  
;	v.0
%define RCD_N 64
%define GLV_N 131
%define SS_NULL 0xffff_ffff_ffff_0000
%define EMT_BUF_MAX (KB<<1)				
 
section .bss
%include "BSS.s"

section .data
%include "DATA.s"
section .text
global _start
_start:
%include "START.s"
	jmp RTM_0
LB_16: ;; (=l(0x0))
	jmp QWORD [LB_20+8*r10]
LB_20: dq LB_18,LB_19
LB_18:
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
	MOV_RBX r10,SX(0x0)
	MOV_RBX r8,SX(0x1)
	call LB_22
	pop r8
	FREE_RCD 2,r8
	pop SRC_REG
	jmp LB_21
LB_19:
	RT_ERR 0xffff_1017
	jmp LB_21
LB_21:
 ret 
LB_22: ;; q()◂.a14
	jmp QWORD [LB_25+8*r10]
LB_25: dq LB_23,LB_24
LB_23:
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
	MOV_RBX r10,SX(0x0)
	MOV_RBX r8,SX(0x1)
	call LB_16
	MOV_RBX r10,SX(0x2)
	MOV_RBX r8,SX(0x3)
	call LB_22
	pop r8
	FREE_RCD 4,r8
	pop SRC_REG
	jmp LB_26
LB_24:
	jmp LB_26
LB_26:
 ret 
LB_0: ;; #0x57e◂◂(_none◂{}) 128'(= {| ? |} ) ⊢ - : ({ }◂{ }◂◂_r8◂_arr◂_arr→q())
JMP_0:
	MOV_RBX r8,GLX(0x80)
	GET_LEN rsi,r8
	mov rax,0 
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
LB_1:
	cmp rsi,0
	jz LB_2
	push rsi 
	MOV_RBX rdi,SX(0x0)
	FREE_OPQ 3
	pop rsi 
	sub rsi,1 
	lea SRC_REG,[SRC_REG+8*0x1]
	jmp LB_1
LB_2:
	pop rdi
	pop SRC_REG 
	FREE_OPQ 4
	mov rdi,1
	cmp rdi,0 
	jz err 
	push rdi 
	bsr rsi,rdi 
	add rsi,1 
	push rsi 
	xor rdi,rdi
	bts rdi,rsi 
	lea rdi,[4*rdi]
	lea rsi,[8+8*rdi]
	mov rdi,1 
	CALLOC_SF
	pop rsi 
	pop rdi 
	mov QWORD [rax],rdi 
	mov BYTE [rax+7],sil
	MOV_RBX GLX(0x81),rax
	push DST_REG
	lea DST_REG,[rax+8] 
	mov rax,rdi 
	and rax,3
 mov rsi,~3  
	and rdi,rsi
	MOV_RBX GLX(0x82),rdi
	push rdi
	jmp QWORD [LB_8+8*rax]
LB_8: dq LB_13,LB_10,LB_11,LB_12
LB_12:
	call LB_7
LB_11:
	call LB_7
LB_10:
	call LB_7
LB_13:
	pop rdi
LB_5:
	cmp rdi,0 
	jz LB_6
	push rdi 
	call LB_7
	call LB_7
	call LB_7
	call LB_7
	pop rdi
	sub rdi,4
	jmp LB_5
LB_7:
	mov DX(0x0),0x0
	ALC_RCD 2,rax
	mov DX(0x1),rax
	push DST_REG 
	lea DST_REG,[rax+8]
	mov DX(0x0),0x1
	mov DX(0x1),unt
	pop DST_REG
	mov DX(0x2),0x0
	ALC_RCD 2,rax
	mov DX(0x3),rax
	push DST_REG 
	lea DST_REG,[rax+8]
	mov DX(0x0),0x1
	mov DX(0x1),unt
	pop DST_REG
	lea DST_REG,[DST_REG+8*0x4]
	ret 
LB_6:
	pop DST_REG
	MOV_RBX r8,GLX(0x81)
	GET_LEN rsi,r8
	mov rax,0 
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
LB_14:
	cmp rsi,0
	jz LB_15
	push rsi 
	MOV_RBX r10,SX(0x0)
	MOV_RBX r8,SX(0x1)
	call LB_16
	MOV_RBX r10,SX(0x2)
	MOV_RBX r8,SX(0x3)
	call LB_16
	pop rsi 
	sub rsi,1 
	lea SRC_REG,[SRC_REG+8*0x4]
	jmp LB_14
LB_15:
	pop rdi
	pop SRC_REG 
	FREE_OPQ 17
	add rsp,8 
	pop rdi 
	mov rsi,0x6446e
	jmp exn 
RTM_0:
	push EXH_27
	MOV_RBX GLX(0x80),GLX(0x7f)
	call LB_0
	add rsp,8
	mov QWORD [EXIT],1
	C_CALL exit
EXH_27:
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
