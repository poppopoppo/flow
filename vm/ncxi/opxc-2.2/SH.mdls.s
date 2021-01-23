%include "HD.s"  
;	v.0
%define RCD_N 64
%define GLV_N 142
 
section .bss
%include "BSS.s"

section .data
%include "DATA.s"
LB_11_H: dq 0x7
LB_11: db 32,58,32,95,114,54,52,0,0,0,0,0,0,0,0,0
LB_14_H: dq 0x1
LB_14: db 34,0,0,0,0,0,0,0,0,0
LB_15_H: dq 0x7
LB_15: db 34,32,58,32,95,115,56,0,0,0,0,0,0,0,0,0
section .text
global _start
_start:
%include "START.s"
	jmp RTM_0
LB_10: ;; #0x38◂◂(_none◂{}) 131'(= r ) ⊢ 0'(= r ) : ((_r64◂)→(_r64◂))
JMP_10:
	MOV_RBX rax,GLX(0x83)
 sub rsp,32 
 mov rdi,rsp 
 mov BYTE [rdi],'0'
 mov BYTE [rdi+1],'x' 
 add rdi,2 
 call pf_x 
 mov BYTE [rdi+rax],'r' 
 sub rdi,2  
 add rax,3 
 mov rsi,rax  
 C_CALL fw
 add rsp,32 
	mov GLX(0x84),LB_11
	MOV_RBX rax,GLX(0x84)
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
	MOV_RBX GLX(0x0),GLX(0x83)
 ret 
LB_13: ;; #0x39◂◂(_none◂{}) 135'(= {| r8 |} ) ⊢ 0'(= {| r8 |} ) : ((_arr◂(_r8◂)◂{  })→(_arr◂(_r8◂)◂{  }))
JMP_13:
	mov GLX(0x88),LB_14
	MOV_RBX rax,GLX(0x88)
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
	MOV_RBX rax,GLX(0x87)
 mov rsi,0x0000_ffff_ffff_ffff 
 and rsi,QWORD [rax]
 lea rdi,[rax+8]
 C_CALL fw 
	mov GLX(0x89),LB_15
	MOV_RBX rax,GLX(0x89)
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
	MOV_RBX GLX(0x0),GLX(0x87)
 ret 
LB_5: ;; #0x89◂◂(_none◂{}) 129'◂130'' ⊢ 0'◂1'' : ((.a4◂(_arr◂(_r8◂)◂{  })◂(_r64◂))→(.a4◂(_arr◂(_r8◂)◂{  })◂(_r64◂)))
JMP_5:
	MOV_RBX rdi,GLX(0x81)
	jmp QWORD [LB_9+8*rdi]
LB_9: dq LB_7,LB_8
LB_7:
	push EXH_12
	MOV_RBX GLX(0x83),GLX(0x82)
	call LB_10
	add rsp,8
	mov GLX(0x85),0x0
	sub rsp,8
	mov DST_REG,rsp
	MOV_RDI DX(0x0),GLX(0x0)
	pop rax
	MOV_RBX GLX(0x86),rax
	MOV_RBX GLX(0x0),GLX(0x85)
	MOV_RBX GLX(0x1),GLX(0x86)
 ret 
LB_8:
	push EXH_16
	MOV_RBX GLX(0x87),GLX(0x82)
	call LB_13
	add rsp,8
	mov GLX(0x8a),0x1
	sub rsp,8
	mov DST_REG,rsp
	MOV_RDI DX(0x0),GLX(0x0)
	pop rax
	MOV_RBX GLX(0x8b),rax
	MOV_RBX GLX(0x0),GLX(0x8a)
	MOV_RBX GLX(0x1),GLX(0x8b)
 ret 
LB_6:
EXH_12:
	add rsp,0x8
	pop rax
	jmp rax
EXH_16:
	add rsp,0x8
	pop rax
	jmp rax
LB_18: ;; (_arr◂(_r8◂)◂{  }) (_r64◂)
	jmp QWORD [LB_21+8*r10]
LB_21: dq LB_19,LB_20
LB_19:
	jmp LB_22
LB_20:
	MOV_RBX rdi,r8
	FREE_OPQ 23
	jmp LB_22
LB_22:
 ret 
LB_0: ;; #0x8d◂◂(_none◂{}) 128'(= {| ? |} ) ⊢ { } : ((_arr◂(_arr◂(_r8◂)◂{  })◂{  })→{  })
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
	push EXH_17
	mov GLX(0x8c),0x0
	sub rsp,8
	mov DST_REG,rsp
	mov rax,0x37
	mov DX(0x0),rax
	pop rax
	MOV_RBX GLX(0x8d),rax
	MOV_RBX GLX(0x81),GLX(0x8c)
	MOV_RBX GLX(0x82),GLX(0x8d)
	call LB_5
	add rsp,8
	MOV_RBX r10,GLX(0x0)
	MOV_RBX r8,GLX(0x1)
	call LB_18
 ret 
EXH_17:
	add rsp,0x8
	pop rax
	jmp rax
RTM_0:
	push EXH_24
	MOV_RBX GLX(0x80),GLX(0x7f)
	call LB_0
	add rsp,8
	mov QWORD [EXIT],1
	C_CALL exit
EXH_24:
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
