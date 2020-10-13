%include "HD.s"  
;	v.0
%define RCD_N 32
%define GLV_N 144
%define SS_NULL 0xffff_ffff_ffff_0000
%define EMT_BUF_MAX (KB<<1)				
 
section .bss
%include "BSS.s"

section .data
%include "DATA.s"
					
LB_11: db 32,58,32,95,114,54,52,226,151,130,10,0,0,0,0,0,0,0,0,0
LB_14: db 32,58,32,95,97,114,114,226,151,130,95,97,114,114,95,120,226,151,130,226,151,130,95,114,54,52,226,151,130,10,0,0,0,0,0,0,0,0,0
LB_16: db 32,58,32,95,114,54,52,226,151,130,10,0,0,0,0,0,0,0,0,0
LB_19: db 32,58,32,95,97,114,114,226,151,130,95,97,114,114,95,120,226,151,130,226,151,130,95,114,54,52,226,151,130,10,0,0,0,0,0,0,0,0,0
LB_31: db 32,58,32,95,97,114,114,226,151,130,95,97,114,114,95,120,226,151,130,226,151,130,95,114,54,52,226,151,130,10,0,0,0,0,0,0,0,0,0
LB_32: db 49,48,114,0,0,0,0,0,0,0,0,0
LB_33: db 54,114,0,0,0,0,0,0,0,0,0
LB_34: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,114,54,52,226,151,130,125,10,0,0,0,0,0,0,0,0,0
LB_35: db 51,48,114,0,0,0,0,0,0,0,0,0
LB_36: db 54,114,0,0,0,0,0,0,0,0,0
LB_37: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,114,54,52,226,151,130,125,10,0,0,0,0,0,0,0,0,0
LB_40: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,114,54,52,226,151,130,125,10,0,0,0,0,0,0,0,0,0
LB_48: db 34,70,70,34,0,0,0,0,0,0,0,0,0
LB_49: db 57,114,0,0,0,0,0,0,0,0,0
LB_50: db 50,114,0,0,0,0,0,0,0,0,0
LB_51: db 32,58,32,123,32,95,97,114,114,226,151,130,123,32,125,226,151,130,95,114,56,226,151,130,32,123,32,95,114,54,52,226,151,130,32,95,114,54,52,226,151,130,125,125,10,0,0,0,0,0,0,0,0,0
LB_52: db 52,114,0,0,0,0,0,0,0,0,0
LB_53: db 49,50,114,0,0,0,0,0,0,0,0,0
LB_54: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,114,54,52,226,151,130,125,10,0,0,0,0,0,0,0,0,0
LB_55: db 50,114,0,0,0,0,0,0,0,0,0
LB_56: db 51,114,0,0,0,0,0,0,0,0,0
LB_57: db 32,58,32,123,32,95,114,54,52,226,151,130,32,95,114,54,52,226,151,130,125,10,0,0,0,0,0,0,0,0,0
section .text
global _start
_start:
%include "START.s"
	jmp RTM_0
LB_38: ;; #15◂◂(_none◂{}) { 137'(= r ) 138'(= r ) } ⊢ { 0'(= r ) 1'(= r ) } : ({ _r64◂ _r64◂}→{ _r64◂ _r64◂})
JMP_38:
	mov rdi,GLX(138)
	sub GLX(137),rdi
	mov rdi,GLX(137)
	mov rsi,GLX(138)
 imul rdi,rsi 
	mov GLX(137),rdi
	mov rdi,GLX(138)
	add GLX(137),rdi
	MOV_RBX GLX(0),GLX(137)
	MOV_RBX GLX(1),GLX(138)
 ret 
LB_41: ;; #16◂◂(_none◂{}) 141'(= r ) ⊢ 0'(1)◂1' : (_r64◂→_opn◂_r64◂)
JMP_41:
	mov GLX(0),0
	push DST_REG 
	lea DST_REG,GLX(1)
	MOV_RDI DX(0),GLX(141)
	pop DST_REG
	ret
LB_43: ;; _r64◂
	jmp QWORD [LB_46+8*r10]
LB_46: dq LB_44,LB_45
LB_44
	jmp LB_47
LB_45
	jmp LB_47
LB_47
 ret 
LB_0: ;; #17◂◂(_none◂{}) 128'(= {| ? |} ) ⊢ { } : (_arr◂{ }◂_arr◂{ }◂_r8◂→{ })
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
	mov r8,SX(0)
	FREE_S8 r8
	pop rsi 
	sub rsi,1 
	lea SRC_REG,[SRC_REG+8*1]
	jmp LB_1
LB_2:
	pop rdi
	pop SRC_REG 
	C_CALL_SF free 
	mov rdi,15
	push rdi 
	bsr rsi,rdi 
	add rsi,1 
	push rsi 
	xor rdi,rdi
	bts rdi,rsi 
	mov rsi,1
 imul rdi,rsi 
	lea rsi,[8+8*rdi]
	mov rdi,1 
 C_CALL_SF calloc_sf
	pop rsi 
	pop rdi 
	mov QWORD [rax],rdi 
	mov BYTE [rax+7],sil
	mov GLX(129),rax
	push DST_REG
	lea DST_REG,[rax+8] 
	mov rax,rdi 
	and rax,3
 mov rsi,~3  
	and rdi,rsi
	mov GLX(130),rdi
	jmp QWORD [LB_6+8*rax]
LB_6: dq LB_3,LB_8,LB_9,LB_10
LB_10:
	call LB_5
LB_9:
	call LB_5
LB_8:
	call LB_5
	mov rdi,GLX(130)
LB_3:
	cmp rdi,0 
	jz LB_4
	mov GLX(130),rdi
	call LB_5
	call LB_5
	call LB_5
	call LB_5
	mov rdi,GLX(130)
	sub rdi,4
	jmp LB_3
LB_5:
	mov rax,3
	mov DX(0),rax
	lea DST_REG,[DST_REG+8*1]
	ret 
LB_4:
	pop DST_REG
	mov rdi,GLX(129)
	mov rsi,0x0000_ffff_ffff_ffff 
 mov rax,QWORD [rdi] 
	and rsi,rax
	mov GLX(131),rsi
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(131)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_11,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(129)
	C_PUSH_REGS
	mov r8,rdi 
	EMT_CST fmt_arr_l,8
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,QWORD [r8]
	mov rax,0 
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
LB_12:
	cmp rsi,rax 
	jz LB_13
	push rsi 
	push rax 
	mov rdi,SX(0)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	lea SRC_REG,[SRC_REG+8*1]
	EMT_CST fmt_spc,4
	pop rax 
	pop rsi 
	add rax,1 
	jmp LB_12
LB_13:
	pop r8 
	pop SRC_REG
	EMT_CST fmt_arr_r,4
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_14,30
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov rdi,GLX(129)
	movzx rsi,BYTE [rdi+7]
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,QWORD [rdi]
	add rax,1
	bt rax,rsi 
	jnc LB_15
	push rax 
	add rsi,1 
	push rsi 
	xor rax,rax
	bts rax,rsi 
	mov rsi,1
 imul rax,rsi 
	lea rsi,[8+8*rax]
 C_CALL_SF realloc
	cmp rax,QWORD [NULL] 
	jz err_NULL 
	mov GLX(129),rax
	mov rdi,rax
	pop rsi 
	pop rax 
LB_15:
	mov QWORD [rdi],rax 
	mov BYTE [rdi+7],sil
	mov rsi,1
	sub rax,1
 imul rax,rsi 
	lea DST_REG,[rdi+8+8*rax]
	mov rax,5
	mov DX(0),rax
	mov rdi,GLX(129)
	mov rsi,0x0000_ffff_ffff_ffff 
 mov rax,QWORD [rdi] 
	and rsi,rax
	mov GLX(132),rsi
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(132)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_16,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(129)
	C_PUSH_REGS
	mov r8,rdi 
	EMT_CST fmt_arr_l,8
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,QWORD [r8]
	mov rax,0 
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
LB_17:
	cmp rsi,rax 
	jz LB_18
	push rsi 
	push rax 
	mov rdi,SX(0)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	lea SRC_REG,[SRC_REG+8*1]
	EMT_CST fmt_spc,4
	pop rax 
	pop rsi 
	add rax,1 
	jmp LB_17
LB_18:
	pop r8 
	pop SRC_REG
	EMT_CST fmt_arr_r,4
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_19,30
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov rdi,GLX(129)
	movzx rsi,BYTE [rdi+7]
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,QWORD [rdi]
	add rax,1
	bt rax,rsi 
	jnc LB_20
	push rax 
	add rsi,1 
	push rsi 
	xor rax,rax
	bts rax,rsi 
	mov rsi,1
 imul rax,rsi 
	lea rsi,[8+8*rax]
 C_CALL_SF realloc
	cmp rax,QWORD [NULL] 
	jz err_NULL 
	mov GLX(129),rax
	mov rdi,rax
	pop rsi 
	pop rax 
LB_20:
	mov QWORD [rdi],rax 
	mov BYTE [rdi+7],sil
	mov rsi,1
	sub rax,1
 imul rax,rsi 
	lea DST_REG,[rdi+8+8*rax]
	mov rax,5
	mov DX(0),rax
	mov rdi,GLX(129)
	movzx rsi,BYTE [rdi+7]
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,QWORD [rdi]
	add rax,1
	bt rax,rsi 
	jnc LB_21
	push rax 
	add rsi,1 
	push rsi 
	xor rax,rax
	bts rax,rsi 
	mov rsi,1
 imul rax,rsi 
	lea rsi,[8+8*rax]
 C_CALL_SF realloc
	cmp rax,QWORD [NULL] 
	jz err_NULL 
	mov GLX(129),rax
	mov rdi,rax
	pop rsi 
	pop rax 
LB_21:
	mov QWORD [rdi],rax 
	mov BYTE [rdi+7],sil
	mov rsi,1
	sub rax,1
 imul rax,rsi 
	lea DST_REG,[rdi+8+8*rax]
	mov rax,6
	mov DX(0),rax
	mov rdi,GLX(129)
	movzx rsi,BYTE [rdi+7]
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,QWORD [rdi]
	add rax,1
	bt rax,rsi 
	jnc LB_22
	push rax 
	add rsi,1 
	push rsi 
	xor rax,rax
	bts rax,rsi 
	mov rsi,1
 imul rax,rsi 
	lea rsi,[8+8*rax]
 C_CALL_SF realloc
	cmp rax,QWORD [NULL] 
	jz err_NULL 
	mov GLX(129),rax
	mov rdi,rax
	pop rsi 
	pop rax 
LB_22:
	mov QWORD [rdi],rax 
	mov BYTE [rdi+7],sil
	mov rsi,1
	sub rax,1
 imul rax,rsi 
	lea DST_REG,[rdi+8+8*rax]
	mov rax,7
	mov DX(0),rax
	mov rdi,GLX(129)
	movzx rsi,BYTE [rdi+7]
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,QWORD [rdi]
	add rax,1
	bt rax,rsi 
	jnc LB_23
	push rax 
	add rsi,1 
	push rsi 
	xor rax,rax
	bts rax,rsi 
	mov rsi,1
 imul rax,rsi 
	lea rsi,[8+8*rax]
 C_CALL_SF realloc
	cmp rax,QWORD [NULL] 
	jz err_NULL 
	mov GLX(129),rax
	mov rdi,rax
	pop rsi 
	pop rax 
LB_23:
	mov QWORD [rdi],rax 
	mov BYTE [rdi+7],sil
	mov rsi,1
	sub rax,1
 imul rax,rsi 
	lea DST_REG,[rdi+8+8*rax]
	mov rax,8
	mov DX(0),rax
	mov rdi,GLX(129)
	movzx rsi,BYTE [rdi+7]
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,QWORD [rdi]
	add rax,1
	bt rax,rsi 
	jnc LB_24
	push rax 
	add rsi,1 
	push rsi 
	xor rax,rax
	bts rax,rsi 
	mov rsi,1
 imul rax,rsi 
	lea rsi,[8+8*rax]
 C_CALL_SF realloc
	cmp rax,QWORD [NULL] 
	jz err_NULL 
	mov GLX(129),rax
	mov rdi,rax
	pop rsi 
	pop rax 
LB_24:
	mov QWORD [rdi],rax 
	mov BYTE [rdi+7],sil
	mov rsi,1
	sub rax,1
 imul rax,rsi 
	lea DST_REG,[rdi+8+8*rax]
	mov rax,9
	mov DX(0),rax
	mov rdi,GLX(129)
	movzx rsi,BYTE [rdi+7]
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,QWORD [rdi]
	add rax,1
	bt rax,rsi 
	jnc LB_25
	push rax 
	add rsi,1 
	push rsi 
	xor rax,rax
	bts rax,rsi 
	mov rsi,1
 imul rax,rsi 
	lea rsi,[8+8*rax]
 C_CALL_SF realloc
	cmp rax,QWORD [NULL] 
	jz err_NULL 
	mov GLX(129),rax
	mov rdi,rax
	pop rsi 
	pop rax 
LB_25:
	mov QWORD [rdi],rax 
	mov BYTE [rdi+7],sil
	mov rsi,1
	sub rax,1
 imul rax,rsi 
	lea DST_REG,[rdi+8+8*rax]
	mov rax,10
	mov DX(0),rax
	mov rdi,GLX(129)
	movzx rsi,BYTE [rdi+7]
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,QWORD [rdi]
	add rax,1
	bt rax,rsi 
	jnc LB_26
	push rax 
	add rsi,1 
	push rsi 
	xor rax,rax
	bts rax,rsi 
	mov rsi,1
 imul rax,rsi 
	lea rsi,[8+8*rax]
 C_CALL_SF realloc
	cmp rax,QWORD [NULL] 
	jz err_NULL 
	mov GLX(129),rax
	mov rdi,rax
	pop rsi 
	pop rax 
LB_26:
	mov QWORD [rdi],rax 
	mov BYTE [rdi+7],sil
	mov rsi,1
	sub rax,1
 imul rax,rsi 
	lea DST_REG,[rdi+8+8*rax]
	mov rax,11
	mov DX(0),rax
	mov rdi,GLX(129)
	movzx rsi,BYTE [rdi+7]
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,QWORD [rdi]
	add rax,1
	bt rax,rsi 
	jnc LB_27
	push rax 
	add rsi,1 
	push rsi 
	xor rax,rax
	bts rax,rsi 
	mov rsi,1
 imul rax,rsi 
	lea rsi,[8+8*rax]
 C_CALL_SF realloc
	cmp rax,QWORD [NULL] 
	jz err_NULL 
	mov GLX(129),rax
	mov rdi,rax
	pop rsi 
	pop rax 
LB_27:
	mov QWORD [rdi],rax 
	mov BYTE [rdi+7],sil
	mov rsi,1
	sub rax,1
 imul rax,rsi 
	lea DST_REG,[rdi+8+8*rax]
	mov rax,12
	mov DX(0),rax
	mov rdi,GLX(129)
	movzx rsi,BYTE [rdi+7]
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,QWORD [rdi]
	add rax,1
	bt rax,rsi 
	jnc LB_28
	push rax 
	add rsi,1 
	push rsi 
	xor rax,rax
	bts rax,rsi 
	mov rsi,1
 imul rax,rsi 
	lea rsi,[8+8*rax]
 C_CALL_SF realloc
	cmp rax,QWORD [NULL] 
	jz err_NULL 
	mov GLX(129),rax
	mov rdi,rax
	pop rsi 
	pop rax 
LB_28:
	mov QWORD [rdi],rax 
	mov BYTE [rdi+7],sil
	mov rsi,1
	sub rax,1
 imul rax,rsi 
	lea DST_REG,[rdi+8+8*rax]
	mov rax,13
	mov DX(0),rax
	mov GLX(133),4
	mov rdi,GLX(129)
	mov rax,GLX(133)
	mov rsi,0x0000_ffff_ffff_ffff 
 mov rdx,QWORD [rdi] 
	and rsi,rdx 
	cmp rax,rsi 
	jge err_exc_q
	mov rdx,1
 imul rax,rdx 
	lea SRC_REG,[rdi+8+8*rax] 
	MOV_RDI GLX(134),SX(0)
	shl GLX(134),6
	mov rdi,GLX(129)
	mov rax,GLX(133)
	mov rsi,1
 imul rax,rsi 
	lea DST_REG,[rdi+8+8*rax]
	MOV_RDI DX(0),GLX(134)
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(129)
	C_PUSH_REGS
	mov r8,rdi 
	EMT_CST fmt_arr_l,8
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,QWORD [r8]
	mov rax,0 
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
LB_29:
	cmp rsi,rax 
	jz LB_30
	push rsi 
	push rax 
	mov rdi,SX(0)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	lea SRC_REG,[SRC_REG+8*1]
	EMT_CST fmt_spc,4
	pop rax 
	pop rsi 
	add rax,1 
	jmp LB_29
LB_30:
	pop r8 
	pop SRC_REG
	EMT_CST fmt_arr_r,4
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_31,30
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov rax,3
	mov rdi,GLX(129)
	mov rsi,0x0000_ffff_ffff_ffff 
 mov rbx,QWORD [rdi] 
	and rsi,rbx
	cmp rax,rsi 
	jge err_lod_q 
	BC ge,rsi
	mov rbx,1
 imul rax,rbx
	lea rdi,[rdi+8+8*rax]
	mov SRC_REG,rdi
	MOV_RDI GLX(135),SX(0)
	mov r8,GLX(135)
	mov rax,r8
	mov GLX(136),rax
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	EMT_CST LB_32,3
	EMT_CST fmt_spc,4
	EMT_CST LB_33,2
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_34,22
	EMT_FLSH
	pop QWORD [SIG_ETR]
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	EMT_CST LB_35,3
	EMT_CST fmt_spc,4
	EMT_CST LB_36,2
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_37,22
	EMT_FLSH
	pop QWORD [SIG_ETR]
	push EXH_39
	mov rax,8
	mov GLX(137),rax
	mov rax,6
	mov GLX(138),rax
	call LB_38
	add rsp,8
	MOV_RBX GLX(139),GLX(0)
	MOV_RBX GLX(140),GLX(1)
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(139)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,GLX(140)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_40,22
	EMT_FLSH
	pop QWORD [SIG_ETR]
	push EXH_42
	mov rax,0
	mov GLX(141),rax
	call LB_41
	add rsp,8
	MOV_RBX GLX(142),GLX(0)
	MOV_RBX GLX(143),GLX(1)
	mov r10,GLX(142)
	mov r8,GLX(143)
	call LB_43
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	EMT_CST LB_48,4
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_l,4
	EMT_CST LB_49,2
	EMT_CST fmt_spc,4
	EMT_CST LB_50,2
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_51,45
	EMT_FLSH
	pop QWORD [SIG_ETR]
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	EMT_CST LB_52,2
	EMT_CST fmt_spc,4
	EMT_CST LB_53,3
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_54,22
	EMT_FLSH
	pop QWORD [SIG_ETR]
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	EMT_CST LB_55,2
	EMT_CST fmt_spc,4
	EMT_CST LB_56,2
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_57,22
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov r8,GLX(129)
	GET_LEN rsi,r8
	mov rax,0 
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
LB_58:
	cmp rsi,0
	jz LB_59
	push rsi 
	pop rsi 
	sub rsi,1 
	lea SRC_REG,[SRC_REG+8*1]
	jmp LB_58
LB_59:
	pop rdi
	pop SRC_REG 
	C_CALL_SF free 
	ret
EXH_39:
	add rsp,8
	pop rax
	jmp rax
EXH_42:
	add rsp,8
	pop rax
	jmp rax
RTM_0:
	push EXH_60
	MOV_RBX GLX(128),GLX(127)
	call LB_0
	add rsp,8
	C_CALL exit
EXH_60:
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

%include "TEXT.s"
