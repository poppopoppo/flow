%include "cmu.s"
main:
	mov r12,~0
	call SFLS_X_INIT
pop r14 ; number of args
  pop rdi ; program name
  call mk_s8
	mov r8,rax
	mov rax,QWORD [SFLS_TBL+8*2]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*2],rdi
 mov r13,rax
    or rax,1
    mov [args],rax
    mov rcx,0x0000_0002_0200_fffc
    mov [r13],rcx
    mov [r13+8],r8
  args_lp:
    cmp r14,1
    jz args_end
    pop rdi
  call mk_s8
    mov r10,rax
    	mov rax,QWORD [SFLS_TBL+8*2]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*2],rdi
 mov r8,rax
    mov r9,r8
    or r9,1
    mov [r13+16],r9
    mov r13,r8
    mov rcx,0x0000_0002_0200_fffc
    mov [r13],rcx
    mov [r13+8],r10
    sub r14,1
    jmp args_lp
  args_end:
  	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
 mov rcx,0x0000_0000_0000_ffff
    mov [rax],rcx
    mov rcx,0x0100_0000_0000_0001
    or rax,rcx
    mov [r13+16],rax
	call exec_out
	jmp _end
NS_E_ID_36: dq 0
NS_E_36:
NS_E_RDI_36:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_38: dq 0
NS_E_38:
NS_E_RDI_38:
	mov rdi,fmt_emt
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	mov rdi,r13
	bt r12,0
	call pp0
	mov rdi,fmt_nl
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	ret
NS_E_66:
NS_E_RDI_66:
NS_E_66_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_67
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_67:
	mov r8,1
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_69:
NS_E_RDI_69:
NS_E_69_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_69_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_69_LB_0:
	mov r8,1
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rax],rsi
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_70:
NS_E_RDI_70:
NS_E_70_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_70_LB_0
	cmp r11,57
	ja NS_E_70_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_70_LB_0:
	mov rax,0
	ret
NS_E_73:
NS_E_RDI_73:
NS_E_73_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb LB_74
	cmp r11,122
	ja LB_74
	add rsi,1
	mov rax,1
	ret
LB_74:
	mov rax,0
	ret
NS_E_71:
NS_E_RDI_71:
NS_E_71_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb LB_72
	cmp r11,90
	ja LB_72
	add rsi,1
	mov rax,1
	ret
LB_72:
	mov rax,0
	ret
NS_E_45:
	mov rdi,r13
	bt r12,0
NS_E_RDI_45:
	mov rsi,0
	setc sil
	push rsi
	call pp_v
	push rax
	push rdi
	mov rdi,2
	call mlc
	pop QWORD [rax+8*1]
	pop QWORD [rax+8*2]
	pop rsi
	btr QWORD [rax],0
	btr QWORD [rax],1
	or QWORD [rax],rsi
	clc
	ret
NS_E_ID_59: dq 0
NS_E_59:
NS_E_RDI_59:
	push r13
	push r14
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rdi,QWORD [rdi+8+8*rax]
	bt rdi,0
	jc LB_86
	bt QWORD [rdi],17
	jnc LB_86
	bt QWORD [rdi],0
	jc LB_88
	btr r12,2
	clc
	jmp LB_89
LB_88:
	bts r12,2
	stc
LB_89:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_87
LB_86:
	btr r12,2
	clc
	call dcp
LB_87:
	mov r8,rax
	pop r14
	pop r13
	ret
NS_E_ID_24: dq 0
NS_E_24:
NS_E_RDI_24:
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rsi,QWORD [rdi+8+8*rax]
	mov QWORD [rdi+8+8*rax],NULL
	mov rdi,rsi
	bt rdi,0
	jc LB_83
	mov rax,[rdi]
	bt rax,17
	jnc LB_81
	bt QWORD rax,0
	jc LB_84
	btr r12,2
	clc
	jmp LB_85
LB_84:
	bts r12,2
	stc
LB_85:
	mov rsi,QWORD [rdi+8]
	push rsi
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	pop rdi
	jmp LB_82
LB_83:
	cmp rdi,NULL
	jz err
LB_81:
	btr r12,2
LB_82:
	mov r8,rdi
	ret
NS_E_ID_23: dq 0
NS_E_23:
NS_E_RDI_23:
	push r13
	push r14
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rdi,QWORD [rdi+8+8*rax]
	bt rdi,0
	jc LB_78
	mov rax,[rdi]
	bt QWORD rax,17
	jnc LB_76
	bt QWORD rax,0
	jc LB_79
	btr r12,2
	clc
	jmp LB_80
LB_79:
	bts r12,2
	stc
LB_80:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_77
LB_78:
	cmp rdi,NULL
	jz err
LB_76:
	btr r12,2
	clc
	call dcp
LB_77:
	mov r8,rax
	pop r14
	pop r13
	ret
NS_E_ID_22: dq 0
NS_E_22:
NS_E_RDI_22:
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	bt QWORD [rdi+8+8*rax],63
	jnc err
	bt r12,2
	jc LB_75
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_75:
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	mov QWORD [r13+8+8*r14],rax
	mov QWORD [rax+8],r8
	mov rdi,0x0000_0001_0102_ffff
	mov QWORD [rax],rdi
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
	mov rdi,r13
	push r13
	call mk_arr
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_35: dq 0
NS_E_35:
NS_E_RDI_35:
	mov eax,[r14+4]
	lea r8,[r8-1+r13]
	cmp r8,rax
	jge err_s8_ge
	mov eax,[r9+4]
	lea r10,[r10-1+r13]
	cmp r10,rax
	jge err_s8_ge
	lea rsi,[r14+8+r8]
	lea rdi,[r9+8+r10]
	mov rcx,r13
	std
	rep movsb
	cld
	add r8,1
	add r10,1
	ret
NS_E_ID_34: dq 0
NS_E_34:
NS_E_RDI_34:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	xchg al,BYTE [rdi+8+rsi]
	and rax,0xff
	ret
NS_E_ID_33: dq 0
NS_E_33:
NS_E_RDI_33:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_32: dq 0
NS_E_32:
NS_E_RDI_32:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	movzx rax,BYTE [rdi+8+rsi]
	mov r8,rax
	bts r12,2
	ret
NS_E_ID_31: dq 0
NS_E_31:
NS_E_RDI_31:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_37: dq 0
NS_E_37:
NS_E_RDI_37:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_68:
NS_E_RDI_68:
NS_E_68_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	push r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	call scf_d
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	cmp rdi,0
	jz NS_E_68_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_68_LB_0:
	mov r8,1
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rax],rsi
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
section .data
MOV_TBL: