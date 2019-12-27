%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
pop r14 ; number of args
  pop rdi ; program name
  call mk_s8
    mov r13,rbx
    mov rbx,[rbx]
    mov rsi,r13
    or rsi,1
    mov [args],rsi
    mov rcx,0x0000_0002_0000_fffc
    mov [r13],rcx
    mov [r13+8],rax
  args_lp:
    cmp r14,1
    jz args_end
    pop rdi
  call mk_s8
    mov r8,rbx
    mov rbx,[rbx]
    mov r9,r8
    or r9,1
    mov [r13+16],r9
    mov r13,r8
    mov rcx,0x0000_0002_0000_fffc
    mov [r13],rcx
    mov [r13+8],rax
    sub r14,1
    jmp args_lp
  args_end:
    mov r8,rbx
    mov rbx,[rbx]
    mov rcx,0x0000_0000_0000_ffff
    mov [r8],rcx
    mov rcx,0x0100_0000_0000_0001
    or r8,rcx
    mov [r13+16],r8
	call NS_E_14869
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
NS_E_904:
NS_E_RDI_904:
NS_E_904_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_905
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_905:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_907:
NS_E_RDI_907:
NS_E_907_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_907_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_907_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_908:
NS_E_RDI_908:
NS_E_908_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_908_LB_0
	cmp r11,57
	ja NS_E_908_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_908_LB_0:
	mov rax,0
	ret
NS_E_910:
NS_E_RDI_910:
NS_E_910_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_910_LB_0
	cmp r11,122
	ja NS_E_910_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_910_LB_0:
	mov rax,0
	ret
NS_E_909:
NS_E_RDI_909:
NS_E_909_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_909_LB_0
	cmp r11,90
	ja NS_E_909_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_909_LB_0:
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
	jc LB_922
	bt QWORD [rdi],17
	jnc LB_922
	bt QWORD [rdi],0
	jc LB_924
	btr r12,2
	clc
	jmp LB_925
LB_924:
	bts r12,2
	stc
LB_925:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_923
LB_922:
	btr r12,2
	clc
	call dcp
LB_923:
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
	jc LB_919
	mov rax,[rdi]
	bt rax,17
	jnc LB_917
	bt QWORD rax,0
	jc LB_920
	btr r12,2
	clc
	jmp LB_921
LB_920:
	bts r12,2
	stc
LB_921:
	mov rsi,QWORD [rdi+8]
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,rsi
	jmp LB_918
LB_919:
	cmp rdi,NULL
	jz err
LB_917:
	btr r12,2
LB_918:
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
	jc LB_914
	mov rax,[rdi]
	bt QWORD rax,17
	jnc LB_912
	bt QWORD rax,0
	jc LB_915
	btr r12,2
	clc
	jmp LB_916
LB_915:
	bts r12,2
	stc
LB_916:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_913
LB_914:
	cmp rdi,NULL
	jz err
LB_912:
	btr r12,2
	clc
	call dcp
LB_913:
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
	jc LB_911
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_911:
	mov rsi,rbx
	mov rbx,[rsi]
	mov QWORD [rdi+8+8*rax],rsi
	mov rax,r8
	mov QWORD [rsi+8],rax
	mov rax,0x0000_0001_0002_ffff
	mov QWORD [rsi],rax
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
NS_E_906:
NS_E_RDI_906:
NS_E_906_ETR_TBL:
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
	jz NS_E_906_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_906_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_929:
; 	|» { 0' 1' }
NS_E_RDI_929:
MTC_LB_936:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_937
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_938
	bt QWORD [rdi],0
	jc LB_939
	btr r12,2
	clc
	jmp LB_940
LB_939:
	bts r12,2
	stc
LB_940:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_938:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_941:
	cmp r15,0
	jz LB_942
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_941
LB_942:
; ∎ %_930
 ; {>  %_930~0':(_lst)◂(t127'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_937:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_943
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_944
	bt QWORD [rdi],0
	jc LB_945
	btr r12,4
	clc
	jmp LB_946
LB_945:
	bts r12,4
	stc
LB_946:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_944:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_949
	btr r12,5
	clc
	jmp LB_950
LB_949:
	bts r12,5
	stc
LB_950:
	mov r8,r11
	bt r12,5
	jc LB_947
	btr r12,2
	jmp LB_948
LB_947:
	bts r12,2
LB_948:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_953
	btr r12,5
	clc
	jmp LB_954
LB_953:
	bts r12,5
	stc
LB_954:
	mov r9,r11
	bt r12,5
	jc LB_951
	btr r12,3
	jmp LB_952
LB_951:
	bts r12,3
LB_952:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_955:
	cmp r15,0
	jz LB_956
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_955
LB_956:
; _cns { %_932 %_930 } ⊢ %_934 : %_934
 ; {>  %_933~3':(_lst)◂(t127'(-1)) %_930~0':(_lst)◂(t127'(-1)) %_932~2':t127'(-1) }
; _cns { 2' 0' } ⊢ °0◂{ 2' 0' }
; _f929 { %_934 %_933 } ⊢ %_935 : %_935
 ; {>  %_934~°0◂{ 2' 0' }:(_lst)◂(t127'(-1)) %_933~3':(_lst)◂(t127'(-1)) }
; _f929 { °0◂{ 2' 0' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °0◂{ 2' 0' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_957
	btr r12,1
	jmp LB_958
LB_957:
	bts r12,1
LB_958:
	mov r9,r13
	bt r12,0
	jc LB_959
	btr r12,3
	jmp LB_960
LB_959:
	bts r12,3
LB_960:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r8
	bt r12,2
	jc LB_965
	btr r12,4
	jmp LB_966
LB_965:
	bts r12,4
LB_966:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_963
	btr QWORD [rdi],0
	jmp LB_964
LB_963:
	bts QWORD [rdi],0
LB_964:
	mov r10,r9
	bt r12,3
	jc LB_969
	btr r12,4
	jmp LB_970
LB_969:
	bts r12,4
LB_970:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_967
	btr QWORD [rdi],1
	jmp LB_968
LB_967:
	bts QWORD [rdi],1
LB_968:
	mov rsi,1
	bt r12,0
	jc LB_961
	mov rsi,0
	bt r13,0
	jc LB_961
	jmp LB_962
LB_961:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_962:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	push 0
	push LB_971
	call NS_E_929
LB_971:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_935
 ; {>  %_935~0':(_lst)◂(t127'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_943:
NS_E_975:
; 	|» 0'
NS_E_RDI_975:
; _nil {  } ⊢ %_973 : %_973
 ; {>  %_972~0':(_lst)◂(t148'(-1)) }
; _nil {  } ⊢ °1◂{  }
; _f929 { %_973 %_972 } ⊢ %_974 : %_974
 ; {>  %_972~0':(_lst)◂(t148'(-1)) %_973~°1◂{  }:(_lst)◂(t145'(0)) }
; _f929 { °1◂{  } 0' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},{ °1◂{  } 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_976
	btr r12,1
	jmp LB_977
LB_976:
	bts r12,1
LB_977:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_978
	mov rsi,0
	bt r13,0
	jc LB_978
	jmp LB_979
LB_978:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_979:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	push 0
	push LB_980
	call NS_E_929
LB_980:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_974
 ; {>  %_974~0':(_lst)◂(t148'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
NS_E_981:
; 	|» { 0' 1' }
NS_E_RDI_981:
MTC_LB_988:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_989
; _emt_mov_ptn_to_ptn:{| 110.. |},0' ⊢ °0◂{ 2' 3' }
; 0' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_990
	bt QWORD [rdi],0
	jc LB_991
	btr r12,4
	clc
	jmp LB_992
LB_991:
	bts r12,4
	stc
LB_992:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_990:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_995
	btr r12,5
	clc
	jmp LB_996
LB_995:
	bts r12,5
	stc
LB_996:
	mov r8,r11
	bt r12,5
	jc LB_993
	btr r12,2
	jmp LB_994
LB_993:
	bts r12,2
LB_994:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_999
	btr r12,5
	clc
	jmp LB_1000
LB_999:
	bts r12,5
	stc
LB_1000:
	mov r9,r11
	bt r12,5
	jc LB_997
	btr r12,3
	jmp LB_998
LB_997:
	bts r12,3
LB_998:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1001:
	cmp r15,0
	jz LB_1002
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1001
LB_1002:
; _f981 { %_985 %_983 } ⊢ %_986 : %_986
 ; {>  %_985~3':(_lst)◂(t165'(-1)) %_983~1':(_lst)◂(t165'(-1)) %_984~2':t165'(-1) }
; _f981 { 3' 1' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01010.. |},{ 3' 1' } ⊢ { 0' 1' }
	mov r13,r9
	bt r12,3
	jc LB_1005
	btr r12,0
	jmp LB_1006
LB_1005:
	bts r12,0
LB_1006:
	push 2
	push LB_1007
	call NS_E_981
LB_1007:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1003
	btr r12,2
	clc
	jmp LB_1004
LB_1003:
	bts r12,2
	stc
LB_1004:
	add rsp,16
; _cns { %_984 %_986 } ⊢ %_987 : %_987
 ; {>  %_986~0':(_lst)◂(t165'(-1)) %_984~2':t165'(-1) }
; _cns { 2' 0' } ⊢ °0◂{ 2' 0' }
; ∎ %_987
 ; {>  %_987~°0◂{ 2' 0' }:(_lst)◂(t165'(-1)) }
; 	∎ °0◂{ 2' 0' }
; _emt_mov_ptn_to_ptn:{| 1010.. |},°0◂{ 2' 0' } ⊢ 0'
	mov r14,r13
	bt r12,0
	jc LB_1008
	btr r12,1
	jmp LB_1009
LB_1008:
	bts r12,1
LB_1009:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_1014
	btr r12,3
	jmp LB_1015
LB_1014:
	bts r12,3
LB_1015:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_1012
	btr QWORD [rdi],0
	jmp LB_1013
LB_1012:
	bts QWORD [rdi],0
LB_1013:
	mov r9,r14
	bt r12,1
	jc LB_1018
	btr r12,3
	jmp LB_1019
LB_1018:
	bts r12,3
LB_1019:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_1016
	btr QWORD [rdi],1
	jmp LB_1017
LB_1016:
	bts QWORD [rdi],1
LB_1017:
	mov rsi,1
	bt r12,0
	jc LB_1010
	mov rsi,0
	bt r13,0
	jc LB_1010
	jmp LB_1011
LB_1010:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_1011:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	ret
MTC_LB_989:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1020
; _emt_mov_ptn_to_ptn:{| 110.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_1021
	bt QWORD [rdi],0
	jc LB_1022
	btr r12,2
	clc
	jmp LB_1023
LB_1022:
	bts r12,2
	stc
LB_1023:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1021:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1024:
	cmp r15,0
	jz LB_1025
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1024
LB_1025:
; ∎ %_983
 ; {>  %_983~1':(_lst)◂(t165'(-1)) }
; 	∎ 1'
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1026
	btr r12,0
	jmp LB_1027
LB_1026:
	bts r12,0
LB_1027:
	ret
MTC_LB_1020:
NS_E_1028:
; 	|» { 0' 1' }
NS_E_RDI_1028:
MTC_LB_1042:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1043
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1044
	bt QWORD [rdi],0
	jc LB_1045
	btr r12,4
	clc
	jmp LB_1046
LB_1045:
	bts r12,4
	stc
LB_1046:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1044:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_1049
	btr r12,5
	clc
	jmp LB_1050
LB_1049:
	bts r12,5
	stc
LB_1050:
	mov r8,r11
	bt r12,5
	jc LB_1047
	btr r12,2
	jmp LB_1048
LB_1047:
	bts r12,2
LB_1048:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_1053
	btr r12,5
	clc
	jmp LB_1054
LB_1053:
	bts r12,5
	stc
LB_1054:
	mov r9,r11
	bt r12,5
	jc LB_1051
	btr r12,3
	jmp LB_1052
LB_1051:
	bts r12,3
LB_1052:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1055:
	cmp r15,0
	jz LB_1056
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1055
LB_1056:
; _f56 %_1029 ⊢ %_1033 : %_1033
 ; {>  %_1032~3':(_lst)◂(_r64) %_1031~2':_r64 %_1029~0':_r64 }
	add r13,1
; _f1028 { %_1033 %_1032 } ⊢ { %_1034 %_1035 } : { %_1034 %_1035 }
 ; {>  %_1032~3':(_lst)◂(_r64) %_1033~0':_r64 %_1031~2':_r64 }
; _f1028 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_1059
	btr r12,1
	jmp LB_1060
LB_1059:
	bts r12,1
LB_1060:
	push 3
	push LB_1061
	call NS_E_1028
LB_1061:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1057
	btr r12,2
	clc
	jmp LB_1058
LB_1057:
	bts r12,2
	stc
LB_1058:
	add rsp,16
; _f55 %_1034 ⊢ %_1036 : %_1036
 ; {>  %_1034~0':_r64 %_1035~1':_stg %_1031~2':_r64 }
	sub r13,1
; _f33 { %_1035 %_1036 %_1031 } ⊢ { %_1037 %_1038 %_1039 } : { %_1037 %_1038 %_1039 }
 ; {>  %_1036~0':_r64 %_1035~1':_stg %_1031~2':_r64 }
; _f33 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_1062
	btr r12,3
	jmp LB_1063
LB_1062:
	bts r12,3
LB_1063:
	mov r14,r13
	bt r12,0
	jc LB_1064
	btr r12,1
	jmp LB_1065
LB_1064:
	bts r12,1
LB_1065:
	mov r13,r9
	bt r12,3
	jc LB_1066
	btr r12,0
	jmp LB_1067
LB_1066:
	bts r12,0
LB_1067:
	push -1
	push LB_1068
	call NS_E_33
LB_1068:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_1038 %_1037 }
 ; {>  %_1039~2':_r64 %_1038~1':_r64 %_1037~0':_stg }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_1069
	mov rdi,r8
	call dlt
LB_1069:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_1070
	btr r12,2
	jmp LB_1071
LB_1070:
	bts r12,2
LB_1071:
	mov r14,r13
	bt r12,0
	jc LB_1072
	btr r12,1
	jmp LB_1073
LB_1072:
	bts r12,1
LB_1073:
	mov r13,r8
	bt r12,2
	jc LB_1074
	btr r12,0
	jmp LB_1075
LB_1074:
	bts r12,0
LB_1075:
	ret
MTC_LB_1043:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1076
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1077
	bt QWORD [rdi],0
	jc LB_1078
	btr r12,2
	clc
	jmp LB_1079
LB_1078:
	bts r12,2
	stc
LB_1079:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1077:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1080:
	cmp r15,0
	jz LB_1081
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1080
LB_1081:
; _f31 %_1029 ⊢ { %_1040 %_1041 } : { %_1040 %_1041 }
 ; {>  %_1029~0':_r64 }
; _f31 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push -1
	push LB_1082
	call NS_E_31
LB_1082:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_1040 %_1041 }
 ; {>  %_1040~0':_r64 %_1041~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_1076:
NS_E_1087:
; 	|» 0'
NS_E_RDI_1087:
; » 0xr0 |~ {  } ⊢ %_1084 : %_1084
 ; {>  %_1083~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_1084
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f1028 { %_1084 %_1083 } ⊢ { %_1085 %_1086 } : { %_1085 %_1086 }
 ; {>  %_1083~0':(_lst)◂(_r64) %_1084~1':_r64 }
; _f1028 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_1088
	btr r12,2
	jmp LB_1089
LB_1088:
	bts r12,2
LB_1089:
	mov r14,r13
	bt r12,0
	jc LB_1090
	btr r12,1
	jmp LB_1091
LB_1090:
	bts r12,1
LB_1091:
	mov r13,r8
	bt r12,2
	jc LB_1092
	btr r12,0
	jmp LB_1093
LB_1092:
	bts r12,0
LB_1093:
	push 3
	push LB_1094
	call NS_E_1028
LB_1094:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_1086
 ; {>  %_1085~0':_r64 %_1086~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1095
	mov rdi,r13
	call dlt
LB_1095:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1096
	btr r12,0
	jmp LB_1097
LB_1096:
	bts r12,0
LB_1097:
	ret
NS_E_1098:
; 	|» { 0' 1' }
NS_E_RDI_1098:
MTC_LB_1117:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1118
; _emt_mov_ptn_to_ptn:{| 110.. |},0' ⊢ °0◂{ { 2' 3' } 4' }
; 0' ⊢ °0◂{ { 2' 3' } 4' }
	btr r12,5
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_1119
	bt QWORD [rdi],0
	jc LB_1120
	btr r12,5
	clc
	jmp LB_1121
LB_1120:
	bts r12,5
	stc
LB_1121:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1119:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_1130
	btr r12,6
	clc
	jmp LB_1131
LB_1130:
	bts r12,6
	stc
LB_1131:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1124
	btr r12,4
	clc
	jmp LB_1125
LB_1124:
	bts r12,4
	stc
LB_1125:
	mov r8,r10
	bt r12,4
	jc LB_1122
	btr r12,2
	jmp LB_1123
LB_1122:
	bts r12,2
LB_1123:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1128
	btr r12,4
	clc
	jmp LB_1129
LB_1128:
	bts r12,4
	stc
LB_1129:
	mov r9,r10
	bt r12,4
	jc LB_1126
	btr r12,3
	jmp LB_1127
LB_1126:
	bts r12,3
LB_1127:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_1134
	btr r12,6
	clc
	jmp LB_1135
LB_1134:
	bts r12,6
	stc
LB_1135:
	mov r10,rcx
	bt r12,6
	jc LB_1132
	btr r12,4
	jmp LB_1133
LB_1132:
	bts r12,4
LB_1133:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1136:
	cmp r15,0
	jz LB_1137
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1136
LB_1137:
MTC_LB_1138:
	mov r15,0
	mov rdi,r14
	mov rsi,r8
	bt r12,1
	call eq
	jnz MTC_LB_1139
LB_1140:
	cmp r15,0
	jz LB_1141
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1140
LB_1141:
MTC_LB_1142:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1143
; _emt_mov_ptn_to_ptn:{| 011110.. |},3' ⊢ °0◂0'
; 3' ⊢ °0◂0'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_1144
	bt QWORD [rdi],0
	jc LB_1145
	btr r12,5
	clc
	jmp LB_1146
LB_1145:
	bts r12,5
	stc
LB_1146:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1144:
	mov r11,rdi
	mov r13,r11
	bt r12,5
	jc LB_1147
	btr r12,0
	jmp LB_1148
LB_1147:
	bts r12,0
LB_1148:
LB_1149:
	cmp r15,0
	jz LB_1150
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1149
LB_1150:
; _emt_mov_ptn_to_ptn:{| 111010.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_1151
	btr r12,3
	jmp LB_1152
LB_1151:
	bts r12,3
LB_1152:
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
	mov rdi,r9
	bt r12,3
	jc LB_1161
	btr r12,5
	clc
	jmp LB_1162
LB_1161:
	bts r12,5
	stc
LB_1162:
	call dcp
	mov r11,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_1159
	btr r12,4
	clc
	jmp LB_1160
LB_1159:
	bts r12,4
	stc
LB_1160:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_1157
	btr r12,3
	clc
	jmp LB_1158
LB_1157:
	bts r12,3
	stc
LB_1158:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1155
	btr r12,2
	clc
	jmp LB_1156
LB_1155:
	bts r12,2
	stc
LB_1156:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1153
	btr r12,1
	clc
	jmp LB_1154
LB_1153:
	bts r12,1
	stc
LB_1154:
	add rsp,40
; _some %_1105 ⊢ %_1107 : %_1107
 ; {>  %_1106~5':t252'(-1) %_1100~1':t244'(-1) %_1101~2':t244'(-1) %_1103~4':(_lst)◂({ t244'(-1) (_opn)◂(t252'(-1)) }) %_1105~3':t252'(-1) }
; _some 3' ⊢ °0◂3'
; _cns { { %_1101 %_1107 } %_1103 } ⊢ %_1108 : %_1108
 ; {>  %_1106~5':t252'(-1) %_1100~1':t244'(-1) %_1101~2':t244'(-1) %_1103~4':(_lst)◂({ t244'(-1) (_opn)◂(t252'(-1)) }) %_1107~°0◂3':(_opn)◂(t252'(-1)) }
; _cns { { 2' °0◂3' } 4' } ⊢ °0◂{ { 2' °0◂3' } 4' }
; _some %_1106 ⊢ %_1109 : %_1109
 ; {>  %_1108~°0◂{ { 2' °0◂3' } 4' }:(_lst)◂({ t244'(-1) (_opn)◂(t252'(-1)) }) %_1106~5':t252'(-1) %_1100~1':t244'(-1) }
; _some 5' ⊢ °0◂5'
; ∎ { %_1108 %_1100 %_1109 }
 ; {>  %_1109~°0◂5':(_opn)◂(t252'(-1)) %_1108~°0◂{ { 2' °0◂3' } 4' }:(_lst)◂({ t244'(-1) (_opn)◂(t252'(-1)) }) %_1100~1':t244'(-1) }
; 	∎ { °0◂{ { 2' °0◂3' } 4' } 1' °0◂5' }
; _emt_mov_ptn_to_ptn:{| 0111110.. |},{ °0◂{ { 2' °0◂3' } 4' } 1' °0◂5' } ⊢ { 0' 1' 2' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov rdx,r8
	bt r12,2
	jc LB_1169
	btr r12,7
	jmp LB_1170
LB_1169:
	bts r12,7
LB_1170:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_1167
	btr QWORD [rdi],0
	jmp LB_1168
LB_1167:
	bts QWORD [rdi],0
LB_1168:
	mov rdx,r9
	bt r12,3
	jc LB_1175
	btr r12,7
	jmp LB_1176
LB_1175:
	bts r12,7
LB_1176:
	mov rsi,1
	bt r12,7
	jc LB_1173
	mov rsi,0
	bt rdx,0
	jc LB_1173
	jmp LB_1174
LB_1173:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_1174:
	mov rax,0x0000_0000_0000_0001
	or rdx,rax
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_1171
	btr QWORD [rdi],1
	jmp LB_1172
LB_1171:
	bts QWORD [rdi],1
LB_1172:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_1165
	btr QWORD [rdi],0
	jmp LB_1166
LB_1165:
	bts QWORD [rdi],0
LB_1166:
	mov rcx,r10
	bt r12,4
	jc LB_1179
	btr r12,6
	jmp LB_1180
LB_1179:
	bts r12,6
LB_1180:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_1177
	btr QWORD [rdi],1
	jmp LB_1178
LB_1177:
	bts QWORD [rdi],1
LB_1178:
	mov rsi,1
	bt r12,0
	jc LB_1163
	mov rsi,0
	bt r13,0
	jc LB_1163
	jmp LB_1164
LB_1163:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_1164:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov r8,r11
	bt r12,5
	jc LB_1183
	btr r12,2
	jmp LB_1184
LB_1183:
	bts r12,2
LB_1184:
	mov rsi,1
	bt r12,2
	jc LB_1181
	mov rsi,0
	bt r8,0
	jc LB_1181
	jmp LB_1182
LB_1181:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_1182:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	ret
MTC_LB_1143:
	mov r15,0
LB_1186:
	cmp r15,0
	jz LB_1187
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1186
LB_1187:
; _cns { { %_1101 %_1102 } %_1103 } ⊢ %_1110 : %_1110
 ; {>  %_1100~1':t244'(-1) %_1101~2':t244'(-1) %_1103~4':(_lst)◂({ t244'(-1) (_opn)◂(t252'(-1)) }) %_1102~3':(_opn)◂(t252'(-1)) }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _none {  } ⊢ %_1111 : %_1111
 ; {>  %_1100~1':t244'(-1) %_1110~°0◂{ { 2' 3' } 4' }:(_lst)◂({ t244'(-1) (_opn)◂(t252'(-1)) }) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_1110 %_1100 %_1111 }
 ; {>  %_1100~1':t244'(-1) %_1110~°0◂{ { 2' 3' } 4' }:(_lst)◂({ t244'(-1) (_opn)◂(t252'(-1)) }) %_1111~°1◂{  }:(_opn)◂(t238'(0)) }
; 	∎ { °0◂{ { 2' 3' } 4' } 1' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 011110.. |},{ °0◂{ { 2' 3' } 4' } 1' °1◂{  } } ⊢ { 0' 1' 2' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r8
	bt r12,2
	jc LB_1194
	btr r12,6
	jmp LB_1195
LB_1194:
	bts r12,6
LB_1195:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_1192
	btr QWORD [rdi],0
	jmp LB_1193
LB_1192:
	bts QWORD [rdi],0
LB_1193:
	mov rcx,r9
	bt r12,3
	jc LB_1198
	btr r12,6
	jmp LB_1199
LB_1198:
	bts r12,6
LB_1199:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_1196
	btr QWORD [rdi],1
	jmp LB_1197
LB_1196:
	bts QWORD [rdi],1
LB_1197:
	mov rdi,r13
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_1190
	btr QWORD [rdi],0
	jmp LB_1191
LB_1190:
	bts QWORD [rdi],0
LB_1191:
	mov r11,r10
	bt r12,4
	jc LB_1202
	btr r12,5
	jmp LB_1203
LB_1202:
	bts r12,5
LB_1203:
	mov rdi,r13
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_1200
	btr QWORD [rdi],1
	jmp LB_1201
LB_1200:
	bts QWORD [rdi],1
LB_1201:
	mov rsi,1
	bt r12,0
	jc LB_1188
	mov rsi,0
	bt r13,0
	jc LB_1188
	jmp LB_1189
LB_1188:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_1189:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_1204
	mov rsi,0
	bt r8,0
	jc LB_1204
	jmp LB_1205
LB_1204:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_1205:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_1185:
MTC_LB_1139:
	mov r15,0
LB_1207:
	cmp r15,0
	jz LB_1208
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1207
LB_1208:
; _f1098 { %_1103 %_1100 } ⊢ { %_1112 %_1113 %_1114 } : { %_1112 %_1113 %_1114 }
 ; {>  %_1100~1':t244'(-1) %_1101~2':t244'(-1) %_1103~4':(_lst)◂({ t244'(-1) (_opn)◂(t252'(-1)) }) %_1102~3':(_opn)◂(t252'(-1)) }
; _f1098 { 4' 1' } ⊢ { 0' 1' 4' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010010.. |},{ 4' 1' } ⊢ { 0' 1' }
	mov r13,r10
	bt r12,4
	jc LB_1213
	btr r12,0
	jmp LB_1214
LB_1213:
	bts r12,0
LB_1214:
	push 5
	push LB_1217
	call NS_E_1098
LB_1217:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 4' }
	mov r10,r8
	bt r12,2
	jc LB_1215
	btr r12,4
	jmp LB_1216
LB_1215:
	bts r12,4
LB_1216:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_1211
	btr r12,3
	clc
	jmp LB_1212
LB_1211:
	bts r12,3
	stc
LB_1212:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1209
	btr r12,2
	clc
	jmp LB_1210
LB_1209:
	bts r12,2
	stc
LB_1210:
	add rsp,24
; _cns { { %_1101 %_1102 } %_1112 } ⊢ %_1115 : %_1115
 ; {>  %_1114~4':(_opn)◂(t252'(-1)) %_1101~2':t244'(-1) %_1113~1':t244'(-1) %_1102~3':(_opn)◂(t252'(-1)) %_1112~0':(_lst)◂({ t244'(-1) (_opn)◂(t252'(-1)) }) }
; _cns { { 2' 3' } 0' } ⊢ °0◂{ { 2' 3' } 0' }
; ∎ { %_1115 %_1113 %_1114 }
 ; {>  %_1115~°0◂{ { 2' 3' } 0' }:(_lst)◂({ t244'(-1) (_opn)◂(t252'(-1)) }) %_1114~4':(_opn)◂(t252'(-1)) %_1113~1':t244'(-1) }
; 	∎ { °0◂{ { 2' 3' } 0' } 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ °0◂{ { 2' 3' } 0' } 1' 4' } ⊢ { 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_1218
	btr r12,5
	jmp LB_1219
LB_1218:
	bts r12,5
LB_1219:
	mov r8,r10
	bt r12,4
	jc LB_1220
	btr r12,2
	jmp LB_1221
LB_1220:
	bts r12,2
LB_1221:
	mov r10,r13
	bt r12,0
	jc LB_1222
	btr r12,4
	jmp LB_1223
LB_1222:
	bts r12,4
LB_1223:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov rdx,r11
	bt r12,5
	jc LB_1230
	btr r12,7
	jmp LB_1231
LB_1230:
	bts r12,7
LB_1231:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_1228
	btr QWORD [rdi],0
	jmp LB_1229
LB_1228:
	bts QWORD [rdi],0
LB_1229:
	mov rdx,r9
	bt r12,3
	jc LB_1234
	btr r12,7
	jmp LB_1235
LB_1234:
	bts r12,7
LB_1235:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_1232
	btr QWORD [rdi],1
	jmp LB_1233
LB_1232:
	bts QWORD [rdi],1
LB_1233:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_1226
	btr QWORD [rdi],0
	jmp LB_1227
LB_1226:
	bts QWORD [rdi],0
LB_1227:
	mov rcx,r10
	bt r12,4
	jc LB_1238
	btr r12,6
	jmp LB_1239
LB_1238:
	bts r12,6
LB_1239:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_1236
	btr QWORD [rdi],1
	jmp LB_1237
LB_1236:
	bts QWORD [rdi],1
LB_1237:
	mov rsi,1
	bt r12,0
	jc LB_1224
	mov rsi,0
	bt r13,0
	jc LB_1224
	jmp LB_1225
LB_1224:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_1225:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	ret
MTC_LB_1206:
MTC_LB_1118:
	mov r15,0
LB_1241:
	cmp r15,0
	jz LB_1242
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1241
LB_1242:
; _none {  } ⊢ %_1116 : %_1116
 ; {>  %_1100~1':t244'(-1) %_1099~0':(_lst)◂({ t244'(-1) (_opn)◂(t252'(-1)) }) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_1099 %_1100 %_1116 }
 ; {>  %_1116~°1◂{  }:(_opn)◂(t249'(0)) %_1100~1':t244'(-1) %_1099~0':(_lst)◂({ t244'(-1) (_opn)◂(t252'(-1)) }) }
; 	∎ { 0' 1' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' °1◂{  } } ⊢ { 0' 1' 2' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_1243
	mov rsi,0
	bt r8,0
	jc LB_1243
	jmp LB_1244
LB_1243:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_1244:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_1240:
NS_E_1245:
NS_E_RDI_1245:
NS_E_1245_ETR_TBL:
NS_E_1245_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_1295
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,34
	jnz LB_1295
	jmp LB_1296
LB_1295:
	jmp LB_1285
LB_1296:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_1246_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1300
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1301
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1301:
	jmp LB_1285
LB_1300:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1288
	btr r12,1
	clc
	jmp LB_1289
LB_1288:
	bts r12,1
	stc
LB_1289:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1286
	btr r12,0
	clc
	jmp LB_1287
LB_1286:
	bts r12,0
	stc
LB_1287:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 6
	push LB_1282
	push LB_1282
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_1303
	btr r12,2
	jmp LB_1304
LB_1303:
	bts r12,2
LB_1304:
	mov r13,r14
	bt r12,1
	jc LB_1305
	btr r12,0
	jmp LB_1306
LB_1305:
	bts r12,0
LB_1306:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1087 %_1248 ⊢ %_1249 : %_1249
 ; {>  %_1248~0':(_lst)◂(_r64) %_68~2':_r64 %_69~1':_r64 }
; _f1087 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push 4
	push LB_1277
	call NS_E_1087
LB_1277:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1275
	btr r12,2
	clc
	jmp LB_1276
LB_1275:
	bts r12,2
	stc
LB_1276:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1273
	btr r12,1
	clc
	jmp LB_1274
LB_1273:
	bts r12,1
	stc
LB_1274:
	add rsp,24
; _some %_1249 ⊢ %_1250 : %_1250
 ; {>  %_68~2':_r64 %_69~1':_r64 %_1249~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_1250
 ; {>  %_1250~°0◂0':(_opn)◂(_stg) %_68~2':_r64 %_69~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_1278
	mov rdi,r8
	call dlt
LB_1278:
	bt r12,1
	jc LB_1279
	mov rdi,r14
	call dlt
LB_1279:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1280
	btr r12,3
	jmp LB_1281
LB_1280:
	bts r12,3
LB_1281:
	mov r8,0
	bts r12,2
	ret
LB_1282:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1284
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1283
LB_1284:
	add rsp,8
	ret
LB_1285:
	add rsp,32
	pop r14
LB_1283:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1246:
NS_E_RDI_1246:
NS_E_1246_ETR_TBL:
NS_E_1246_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_1322
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_1322
	jmp LB_1323
LB_1322:
	jmp LB_1312
LB_1323:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1315
	btr r12,0
	clc
	jmp LB_1316
LB_1315:
	bts r12,0
	stc
LB_1316:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 7
	push LB_1309
	push LB_1309
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _none {  } ⊢ %_1252 : %_1252
 ; {>  %_72~1':_r64 %_1251~{  }:{ } %_73~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_1252
 ; {>  %_72~1':_r64 %_1252~°1◂{  }:(_opn)◂(t296'(0)) %_1251~{  }:{ } %_73~0':_r64 }
; 	∎ °1◂{  }
	bt r12,1
	jc LB_1307
	mov rdi,r14
	call dlt
LB_1307:
	bt r12,0
	jc LB_1308
	mov rdi,r13
	call dlt
LB_1308:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_1309:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1311
	pop r14
	jmp LB_1314
LB_1311:
	add rsp,8
	ret
LB_1313:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_1314:
	ret
LB_1312:
	add rsp,16
	pop r14
LB_1310:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_1351
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,92
	jnz LB_1351
	jmp LB_1352
LB_1351:
	jmp LB_1339
LB_1352:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_1247_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1356
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1357
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1357:
	jmp LB_1339
LB_1356:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_1246_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1362
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1363
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1363:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1364
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1364:
	jmp LB_1339
LB_1362:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1344
	btr r12,2
	clc
	jmp LB_1345
LB_1344:
	bts r12,2
	stc
LB_1345:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1342
	btr r12,1
	clc
	jmp LB_1343
LB_1342:
	bts r12,1
	stc
LB_1343:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1340
	btr r12,0
	clc
	jmp LB_1341
LB_1340:
	bts r12,0
	stc
LB_1341:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 8
	push LB_1336
	push LB_1336
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_1366
	btr r12,3
	jmp LB_1367
LB_1366:
	bts r12,3
LB_1367:
	mov r14,r8
	bt r12,2
	jc LB_1368
	btr r12,1
	jmp LB_1369
LB_1368:
	bts r12,1
LB_1369:
	mov r8,r13
	bt r12,0
	jc LB_1370
	btr r12,2
	jmp LB_1371
LB_1370:
	bts r12,2
LB_1371:
	mov r13,r9
	bt r12,3
	jc LB_1372
	btr r12,0
	jmp LB_1373
LB_1372:
	bts r12,0
LB_1373:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _cns { %_1253 %_1254 } ⊢ %_1255 : %_1255
 ; {>  %_76~3':_r64 %_1253~0':_r64 %_1254~1':(_lst)◂(_r64) %_77~2':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_1255 ⊢ %_1256 : %_1256
 ; {>  %_76~3':_r64 %_77~2':_r64 %_1255~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_1256
 ; {>  %_76~3':_r64 %_1256~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) %_77~2':_r64 }
; 	∎ °0◂°0◂{ 0' 1' }
	bt r12,3
	jc LB_1324
	mov rdi,r9
	call dlt
LB_1324:
	bt r12,2
	jc LB_1325
	mov rdi,r8
	call dlt
LB_1325:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_1330
	btr r12,2
	jmp LB_1331
LB_1330:
	bts r12,2
LB_1331:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_1328
	btr QWORD [rdi],0
	jmp LB_1329
LB_1328:
	bts QWORD [rdi],0
LB_1329:
	mov r8,r14
	bt r12,1
	jc LB_1334
	btr r12,2
	jmp LB_1335
LB_1334:
	bts r12,2
LB_1335:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_1332
	btr QWORD [rdi],1
	jmp LB_1333
LB_1332:
	bts QWORD [rdi],1
LB_1333:
	mov rsi,1
	bt r12,3
	jc LB_1326
	mov rsi,0
	bt r9,0
	jc LB_1326
	jmp LB_1327
LB_1326:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1327:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_1336:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1338
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1337
LB_1338:
	add rsp,8
	ret
LB_1339:
	add rsp,48
	pop r14
LB_1337:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_1389
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,34
	jnz LB_1389
	jmp LB_1390
LB_1389:
	jmp LB_1381
LB_1390:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1382
	btr r12,0
	clc
	jmp LB_1383
LB_1382:
	bts r12,0
	stc
LB_1383:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 9
	push LB_1378
	push LB_1378
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_1257 : %_1257
 ; {>  %_80~1':_r64 %_81~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _some %_1257 ⊢ %_1258 : %_1258
 ; {>  %_1257~°1◂{  }:(_lst)◂(t306'(0)) %_80~1':_r64 %_81~0':_r64 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_1258
 ; {>  %_80~1':_r64 %_81~0':_r64 %_1258~°0◂°1◂{  }:(_opn)◂((_lst)◂(t309'(0))) }
; 	∎ °0◂°1◂{  }
	bt r12,1
	jc LB_1374
	mov rdi,r14
	call dlt
LB_1374:
	bt r12,0
	jc LB_1375
	mov rdi,r13
	call dlt
LB_1375:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_1376
	mov rsi,0
	bt r9,0
	jc LB_1376
	jmp LB_1377
LB_1376:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1377:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_1378:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1380
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1379
LB_1380:
	add rsp,8
	ret
LB_1381:
	add rsp,16
	pop r14
LB_1379:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_904_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1414
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1406
LB_1414:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_1246_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1419
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1420
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1420:
	jmp LB_1406
LB_1419:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1409
	btr r12,1
	clc
	jmp LB_1410
LB_1409:
	bts r12,1
	stc
LB_1410:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1407
	btr r12,0
	clc
	jmp LB_1408
LB_1407:
	bts r12,0
	stc
LB_1408:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 10
	push LB_1403
	push LB_1403
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _cns { %_1259 %_1260 } ⊢ %_1261 : %_1261
 ; {>  %_1259~0':_r64 %_84~3':_r64 %_1260~1':(_lst)◂(_r64) %_85~2':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_1261 ⊢ %_1262 : %_1262
 ; {>  %_84~3':_r64 %_1261~°0◂{ 0' 1' }:(_lst)◂(_r64) %_85~2':_r64 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_1262
 ; {>  %_1262~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) %_84~3':_r64 %_85~2':_r64 }
; 	∎ °0◂°0◂{ 0' 1' }
	bt r12,3
	jc LB_1391
	mov rdi,r9
	call dlt
LB_1391:
	bt r12,2
	jc LB_1392
	mov rdi,r8
	call dlt
LB_1392:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_1397
	btr r12,2
	jmp LB_1398
LB_1397:
	bts r12,2
LB_1398:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_1395
	btr QWORD [rdi],0
	jmp LB_1396
LB_1395:
	bts QWORD [rdi],0
LB_1396:
	mov r8,r14
	bt r12,1
	jc LB_1401
	btr r12,2
	jmp LB_1402
LB_1401:
	bts r12,2
LB_1402:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_1399
	btr QWORD [rdi],1
	jmp LB_1400
LB_1399:
	bts QWORD [rdi],1
LB_1400:
	mov rsi,1
	bt r12,3
	jc LB_1393
	mov rsi,0
	bt r9,0
	jc LB_1393
	jmp LB_1394
LB_1393:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1394:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_1403:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1405
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1404
LB_1405:
	add rsp,8
	ret
LB_1406:
	add rsp,32
	pop r14
LB_1404:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1247:
NS_E_RDI_1247:
NS_E_1247_ETR_TBL:
NS_E_1247_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_1437
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,92
	jnz LB_1437
	jmp LB_1438
LB_1437:
	jmp LB_1429
LB_1438:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1430
	btr r12,0
	clc
	jmp LB_1431
LB_1430:
	bts r12,0
	stc
LB_1431:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 11
	push LB_1426
	push LB_1426
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; » 0xr5c |~ {  } ⊢ %_1263 : %_1263
 ; {>  %_88~1':_r64 %_89~0':_r64 }
; 	» 0xr5c _ ⊢ 2' : %_1263
	mov rdi,0x5c
	mov r8,rdi
	bts r12,2
; _some %_1263 ⊢ %_1264 : %_1264
 ; {>  %_1263~2':_r64 %_88~1':_r64 %_89~0':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_1264
 ; {>  %_1264~°0◂2':(_opn)◂(_r64) %_88~1':_r64 %_89~0':_r64 }
; 	∎ °0◂2'
	bt r12,1
	jc LB_1422
	mov rdi,r14
	call dlt
LB_1422:
	bt r12,0
	jc LB_1423
	mov rdi,r13
	call dlt
LB_1423:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_1424
	btr r12,3
	jmp LB_1425
LB_1424:
	bts r12,3
LB_1425:
	mov r8,0
	bts r12,2
	ret
LB_1426:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1428
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1427
LB_1428:
	add rsp,8
	ret
LB_1429:
	add rsp,16
	pop r14
LB_1427:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_1454
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,34
	jnz LB_1454
	jmp LB_1455
LB_1454:
	jmp LB_1446
LB_1455:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1447
	btr r12,0
	clc
	jmp LB_1448
LB_1447:
	bts r12,0
	stc
LB_1448:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 12
	push LB_1443
	push LB_1443
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; » 0xr22 |~ {  } ⊢ %_1265 : %_1265
 ; {>  %_93~0':_r64 %_92~1':_r64 }
; 	» 0xr22 _ ⊢ 2' : %_1265
	mov rdi,0x22
	mov r8,rdi
	bts r12,2
; _some %_1265 ⊢ %_1266 : %_1266
 ; {>  %_1265~2':_r64 %_93~0':_r64 %_92~1':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_1266
 ; {>  %_93~0':_r64 %_1266~°0◂2':(_opn)◂(_r64) %_92~1':_r64 }
; 	∎ °0◂2'
	bt r12,0
	jc LB_1439
	mov rdi,r13
	call dlt
LB_1439:
	bt r12,1
	jc LB_1440
	mov rdi,r14
	call dlt
LB_1440:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_1441
	btr r12,3
	jmp LB_1442
LB_1441:
	bts r12,3
LB_1442:
	mov r8,0
	bts r12,2
	ret
LB_1443:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1445
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1444
LB_1445:
	add rsp,8
	ret
LB_1446:
	add rsp,16
	pop r14
LB_1444:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_1471
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,110
	jnz LB_1471
	jmp LB_1472
LB_1471:
	jmp LB_1463
LB_1472:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1464
	btr r12,0
	clc
	jmp LB_1465
LB_1464:
	bts r12,0
	stc
LB_1465:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 13
	push LB_1460
	push LB_1460
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; » 0xra |~ {  } ⊢ %_1267 : %_1267
 ; {>  %_97~0':_r64 %_96~1':_r64 }
; 	» 0xra _ ⊢ 2' : %_1267
	mov rdi,0xa
	mov r8,rdi
	bts r12,2
; _some %_1267 ⊢ %_1268 : %_1268
 ; {>  %_97~0':_r64 %_96~1':_r64 %_1267~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_1268
 ; {>  %_1268~°0◂2':(_opn)◂(_r64) %_97~0':_r64 %_96~1':_r64 }
; 	∎ °0◂2'
	bt r12,0
	jc LB_1456
	mov rdi,r13
	call dlt
LB_1456:
	bt r12,1
	jc LB_1457
	mov rdi,r14
	call dlt
LB_1457:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_1458
	btr r12,3
	jmp LB_1459
LB_1458:
	bts r12,3
LB_1459:
	mov r8,0
	bts r12,2
	ret
LB_1460:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1462
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1461
LB_1462:
	add rsp,8
	ret
LB_1463:
	add rsp,16
	pop r14
LB_1461:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_1488
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,116
	jnz LB_1488
	jmp LB_1489
LB_1488:
	jmp LB_1480
LB_1489:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1481
	btr r12,0
	clc
	jmp LB_1482
LB_1481:
	bts r12,0
	stc
LB_1482:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 14
	push LB_1477
	push LB_1477
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; » 0xr9 |~ {  } ⊢ %_1269 : %_1269
 ; {>  %_100~1':_r64 %_101~0':_r64 }
; 	» 0xr9 _ ⊢ 2' : %_1269
	mov rdi,0x9
	mov r8,rdi
	bts r12,2
; _some %_1269 ⊢ %_1270 : %_1270
 ; {>  %_100~1':_r64 %_101~0':_r64 %_1269~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_1270
 ; {>  %_100~1':_r64 %_101~0':_r64 %_1270~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,1
	jc LB_1473
	mov rdi,r14
	call dlt
LB_1473:
	bt r12,0
	jc LB_1474
	mov rdi,r13
	call dlt
LB_1474:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_1475
	btr r12,3
	jmp LB_1476
LB_1475:
	bts r12,3
LB_1476:
	mov r8,0
	bts r12,2
	ret
LB_1477:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1479
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1478
LB_1479:
	add rsp,8
	ret
LB_1480:
	add rsp,16
	pop r14
LB_1478:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_1505
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,48
	jnz LB_1505
	jmp LB_1506
LB_1505:
	jmp LB_1497
LB_1506:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1498
	btr r12,0
	clc
	jmp LB_1499
LB_1498:
	bts r12,0
	stc
LB_1499:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 15
	push LB_1494
	push LB_1494
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; » 0xr0 |~ {  } ⊢ %_1271 : %_1271
 ; {>  %_104~1':_r64 %_105~0':_r64 }
; 	» 0xr0 _ ⊢ 2' : %_1271
	mov rdi,0x0
	mov r8,rdi
	bts r12,2
; _some %_1271 ⊢ %_1272 : %_1272
 ; {>  %_104~1':_r64 %_105~0':_r64 %_1271~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_1272
 ; {>  %_104~1':_r64 %_105~0':_r64 %_1272~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,1
	jc LB_1490
	mov rdi,r14
	call dlt
LB_1490:
	bt r12,0
	jc LB_1491
	mov rdi,r13
	call dlt
LB_1491:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_1492
	btr r12,3
	jmp LB_1493
LB_1492:
	bts r12,3
LB_1493:
	mov r8,0
	bts r12,2
	ret
LB_1494:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1496
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1495
LB_1496:
	add rsp,8
	ret
LB_1497:
	add rsp,16
	pop r14
LB_1495:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1507:
NS_E_RDI_1507:
NS_E_1507_ETR_TBL:
NS_E_1507_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_904_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1550
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1544
LB_1550:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1545
	btr r12,0
	clc
	jmp LB_1546
LB_1545:
	bts r12,0
	stc
LB_1546:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 16
	push LB_1541
	push LB_1541
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; » 0xr30 |~ {  } ⊢ %_1509 : %_1509
 ; {>  %_1508~0':_r64 %_108~2':_r64 %_109~1':_r64 }
; 	» 0xr30 _ ⊢ 3' : %_1509
	mov rdi,0x30
	mov r9,rdi
	bts r12,3
; » 0xr39 |~ {  } ⊢ %_1510 : %_1510
 ; {>  %_1508~0':_r64 %_108~2':_r64 %_1509~3':_r64 %_109~1':_r64 }
; 	» 0xr39 _ ⊢ 4' : %_1510
	mov rdi,0x39
	mov r10,rdi
	bts r12,4
; _f50 { %_1508 %_1509 } ⊢ { %_1511 %_1512 %_1513 } : { %_1511 %_1512 %_1513 }
 ; {>  %_1510~4':_r64 %_1508~0':_r64 %_108~2':_r64 %_1509~3':_r64 %_109~1':_r64 }
	cmp r13,r9
	mov rsi,0
	setge sil
	mov r11,rsi
	bts r12,5
; _f50 { %_1510 %_1511 } ⊢ { %_1514 %_1515 %_1516 } : { %_1514 %_1515 %_1516 }
 ; {>  %_1510~4':_r64 %_1512~3':_r64 %_1513~5':_r64 %_108~2':_r64 %_1511~0':_r64 %_109~1':_r64 }
	cmp r10,r13
	mov rsi,0
	setge sil
	mov rcx,rsi
	bts r12,6
MTC_LB_1519:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r11
	jnz MTC_LB_1520
	mov QWORD rax,0x1
	cmp rax,rcx
	jnz MTC_LB_1520
LB_1521:
	cmp r15,0
	jz LB_1522
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1521
LB_1522:
; _some %_1515 ⊢ %_1517 : %_1517
 ; {>  %_1514~4':_r64 %_1512~3':_r64 %_1513~5':_r64 %_1516~6':_r64 %_108~2':_r64 %_109~1':_r64 %_1515~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1517
 ; {>  %_1514~4':_r64 %_1517~°0◂0':(_opn)◂(_r64) %_1512~3':_r64 %_1513~5':_r64 %_1516~6':_r64 %_108~2':_r64 %_109~1':_r64 }
; 	∎ °0◂0'
	bt r12,4
	jc LB_1523
	mov rdi,r10
	call dlt
LB_1523:
	bt r12,3
	jc LB_1524
	mov rdi,r9
	call dlt
LB_1524:
	bt r12,5
	jc LB_1525
	mov rdi,r11
	call dlt
LB_1525:
	bt r12,6
	jc LB_1526
	mov rdi,rcx
	call dlt
LB_1526:
	bt r12,2
	jc LB_1527
	mov rdi,r8
	call dlt
LB_1527:
	bt r12,1
	jc LB_1528
	mov rdi,r14
	call dlt
LB_1528:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1529
	btr r12,3
	jmp LB_1530
LB_1529:
	bts r12,3
LB_1530:
	mov r8,0
	bts r12,2
	ret
MTC_LB_1520:
	mov r15,0
LB_1532:
	cmp r15,0
	jz LB_1533
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1532
LB_1533:
; _none {  } ⊢ %_1518 : %_1518
 ; {>  %_1514~4':_r64 %_1512~3':_r64 %_1513~5':_r64 %_1516~6':_r64 %_108~2':_r64 %_109~1':_r64 %_1515~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_1518
 ; {>  %_1514~4':_r64 %_1518~°1◂{  }:(_opn)◂(t407'(0)) %_1512~3':_r64 %_1513~5':_r64 %_1516~6':_r64 %_108~2':_r64 %_109~1':_r64 %_1515~0':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_1534
	mov rdi,r10
	call dlt
LB_1534:
	bt r12,3
	jc LB_1535
	mov rdi,r9
	call dlt
LB_1535:
	bt r12,5
	jc LB_1536
	mov rdi,r11
	call dlt
LB_1536:
	bt r12,6
	jc LB_1537
	mov rdi,rcx
	call dlt
LB_1537:
	bt r12,2
	jc LB_1538
	mov rdi,r8
	call dlt
LB_1538:
	bt r12,1
	jc LB_1539
	mov rdi,r14
	call dlt
LB_1539:
	bt r12,0
	jc LB_1540
	mov rdi,r13
	call dlt
LB_1540:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_1531:
LB_1541:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1543
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1542
LB_1543:
	add rsp,8
	ret
LB_1544:
	add rsp,16
	pop r14
LB_1542:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1552:
NS_E_RDI_1552:
NS_E_1552_ETR_TBL:
NS_E_1552_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_904_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1595
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1589
LB_1595:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1590
	btr r12,0
	clc
	jmp LB_1591
LB_1590:
	bts r12,0
	stc
LB_1591:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 17
	push LB_1586
	push LB_1586
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; » 0xr61 |~ {  } ⊢ %_1554 : %_1554
 ; {>  %_1553~0':_r64 %_113~1':_r64 %_112~2':_r64 }
; 	» 0xr61 _ ⊢ 3' : %_1554
	mov rdi,0x61
	mov r9,rdi
	bts r12,3
; » 0xr7a |~ {  } ⊢ %_1555 : %_1555
 ; {>  %_1553~0':_r64 %_113~1':_r64 %_112~2':_r64 %_1554~3':_r64 }
; 	» 0xr7a _ ⊢ 4' : %_1555
	mov rdi,0x7a
	mov r10,rdi
	bts r12,4
; _f50 { %_1553 %_1554 } ⊢ { %_1556 %_1557 %_1558 } : { %_1556 %_1557 %_1558 }
 ; {>  %_1555~4':_r64 %_1553~0':_r64 %_113~1':_r64 %_112~2':_r64 %_1554~3':_r64 }
	cmp r13,r9
	mov rsi,0
	setge sil
	mov r11,rsi
	bts r12,5
; _f50 { %_1555 %_1556 } ⊢ { %_1559 %_1560 %_1561 } : { %_1559 %_1560 %_1561 }
 ; {>  %_1558~5':_r64 %_1555~4':_r64 %_1557~3':_r64 %_113~1':_r64 %_112~2':_r64 %_1556~0':_r64 }
	cmp r10,r13
	mov rsi,0
	setge sil
	mov rcx,rsi
	bts r12,6
MTC_LB_1564:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r11
	jnz MTC_LB_1565
	mov QWORD rax,0x1
	cmp rax,rcx
	jnz MTC_LB_1565
LB_1566:
	cmp r15,0
	jz LB_1567
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1566
LB_1567:
; _some %_1560 ⊢ %_1562 : %_1562
 ; {>  %_1558~5':_r64 %_1561~6':_r64 %_1560~0':_r64 %_1557~3':_r64 %_1559~4':_r64 %_113~1':_r64 %_112~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1562
 ; {>  %_1558~5':_r64 %_1562~°0◂0':(_opn)◂(_r64) %_1561~6':_r64 %_1557~3':_r64 %_1559~4':_r64 %_113~1':_r64 %_112~2':_r64 }
; 	∎ °0◂0'
	bt r12,5
	jc LB_1568
	mov rdi,r11
	call dlt
LB_1568:
	bt r12,6
	jc LB_1569
	mov rdi,rcx
	call dlt
LB_1569:
	bt r12,3
	jc LB_1570
	mov rdi,r9
	call dlt
LB_1570:
	bt r12,4
	jc LB_1571
	mov rdi,r10
	call dlt
LB_1571:
	bt r12,1
	jc LB_1572
	mov rdi,r14
	call dlt
LB_1572:
	bt r12,2
	jc LB_1573
	mov rdi,r8
	call dlt
LB_1573:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1574
	btr r12,3
	jmp LB_1575
LB_1574:
	bts r12,3
LB_1575:
	mov r8,0
	bts r12,2
	ret
MTC_LB_1565:
	mov r15,0
LB_1577:
	cmp r15,0
	jz LB_1578
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1577
LB_1578:
; _none {  } ⊢ %_1563 : %_1563
 ; {>  %_1558~5':_r64 %_1561~6':_r64 %_1560~0':_r64 %_1557~3':_r64 %_1559~4':_r64 %_113~1':_r64 %_112~2':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_1563
 ; {>  %_1563~°1◂{  }:(_opn)◂(t436'(0)) %_1558~5':_r64 %_1561~6':_r64 %_1560~0':_r64 %_1557~3':_r64 %_1559~4':_r64 %_113~1':_r64 %_112~2':_r64 }
; 	∎ °1◂{  }
	bt r12,5
	jc LB_1579
	mov rdi,r11
	call dlt
LB_1579:
	bt r12,6
	jc LB_1580
	mov rdi,rcx
	call dlt
LB_1580:
	bt r12,0
	jc LB_1581
	mov rdi,r13
	call dlt
LB_1581:
	bt r12,3
	jc LB_1582
	mov rdi,r9
	call dlt
LB_1582:
	bt r12,4
	jc LB_1583
	mov rdi,r10
	call dlt
LB_1583:
	bt r12,1
	jc LB_1584
	mov rdi,r14
	call dlt
LB_1584:
	bt r12,2
	jc LB_1585
	mov rdi,r8
	call dlt
LB_1585:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_1576:
LB_1586:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1588
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1587
LB_1588:
	add rsp,8
	ret
LB_1589:
	add rsp,16
	pop r14
LB_1587:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1597:
NS_E_RDI_1597:
NS_E_1597_ETR_TBL:
NS_E_1597_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_904_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1640
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1634
LB_1640:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1635
	btr r12,0
	clc
	jmp LB_1636
LB_1635:
	bts r12,0
	stc
LB_1636:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 18
	push LB_1631
	push LB_1631
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; » 0xr41 |~ {  } ⊢ %_1599 : %_1599
 ; {>  %_117~1':_r64 %_116~2':_r64 %_1598~0':_r64 }
; 	» 0xr41 _ ⊢ 3' : %_1599
	mov rdi,0x41
	mov r9,rdi
	bts r12,3
; » 0xr5a |~ {  } ⊢ %_1600 : %_1600
 ; {>  %_117~1':_r64 %_116~2':_r64 %_1598~0':_r64 %_1599~3':_r64 }
; 	» 0xr5a _ ⊢ 4' : %_1600
	mov rdi,0x5a
	mov r10,rdi
	bts r12,4
; _f50 { %_1598 %_1599 } ⊢ { %_1601 %_1602 %_1603 } : { %_1601 %_1602 %_1603 }
 ; {>  %_117~1':_r64 %_116~2':_r64 %_1598~0':_r64 %_1599~3':_r64 %_1600~4':_r64 }
	cmp r13,r9
	mov rsi,0
	setge sil
	mov r11,rsi
	bts r12,5
; _f50 { %_1600 %_1601 } ⊢ { %_1604 %_1605 %_1606 } : { %_1604 %_1605 %_1606 }
 ; {>  %_1602~3':_r64 %_117~1':_r64 %_116~2':_r64 %_1603~5':_r64 %_1600~4':_r64 %_1601~0':_r64 }
	cmp r10,r13
	mov rsi,0
	setge sil
	mov rcx,rsi
	bts r12,6
MTC_LB_1609:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r11
	jnz MTC_LB_1610
	mov QWORD rax,0x1
	cmp rax,rcx
	jnz MTC_LB_1610
LB_1611:
	cmp r15,0
	jz LB_1612
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1611
LB_1612:
; _some %_1605 ⊢ %_1607 : %_1607
 ; {>  %_1602~3':_r64 %_117~1':_r64 %_116~2':_r64 %_1605~0':_r64 %_1603~5':_r64 %_1606~6':_r64 %_1604~4':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1607
 ; {>  %_1602~3':_r64 %_117~1':_r64 %_116~2':_r64 %_1603~5':_r64 %_1606~6':_r64 %_1604~4':_r64 %_1607~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,3
	jc LB_1613
	mov rdi,r9
	call dlt
LB_1613:
	bt r12,1
	jc LB_1614
	mov rdi,r14
	call dlt
LB_1614:
	bt r12,2
	jc LB_1615
	mov rdi,r8
	call dlt
LB_1615:
	bt r12,5
	jc LB_1616
	mov rdi,r11
	call dlt
LB_1616:
	bt r12,6
	jc LB_1617
	mov rdi,rcx
	call dlt
LB_1617:
	bt r12,4
	jc LB_1618
	mov rdi,r10
	call dlt
LB_1618:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1619
	btr r12,3
	jmp LB_1620
LB_1619:
	bts r12,3
LB_1620:
	mov r8,0
	bts r12,2
	ret
MTC_LB_1610:
	mov r15,0
LB_1622:
	cmp r15,0
	jz LB_1623
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1622
LB_1623:
; _none {  } ⊢ %_1608 : %_1608
 ; {>  %_1602~3':_r64 %_117~1':_r64 %_116~2':_r64 %_1605~0':_r64 %_1603~5':_r64 %_1606~6':_r64 %_1604~4':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_1608
 ; {>  %_1602~3':_r64 %_117~1':_r64 %_116~2':_r64 %_1605~0':_r64 %_1603~5':_r64 %_1606~6':_r64 %_1604~4':_r64 %_1608~°1◂{  }:(_opn)◂(t465'(0)) }
; 	∎ °1◂{  }
	bt r12,3
	jc LB_1624
	mov rdi,r9
	call dlt
LB_1624:
	bt r12,1
	jc LB_1625
	mov rdi,r14
	call dlt
LB_1625:
	bt r12,2
	jc LB_1626
	mov rdi,r8
	call dlt
LB_1626:
	bt r12,0
	jc LB_1627
	mov rdi,r13
	call dlt
LB_1627:
	bt r12,5
	jc LB_1628
	mov rdi,r11
	call dlt
LB_1628:
	bt r12,6
	jc LB_1629
	mov rdi,rcx
	call dlt
LB_1629:
	bt r12,4
	jc LB_1630
	mov rdi,r10
	call dlt
LB_1630:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_1621:
LB_1631:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1633
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1632
LB_1633:
	add rsp,8
	ret
LB_1634:
	add rsp,16
	pop r14
LB_1632:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1642:
NS_E_RDI_1642:
NS_E_1642_ETR_TBL:
NS_E_1642_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_1597_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1660
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1654
LB_1660:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1655
	btr r12,0
	clc
	jmp LB_1656
LB_1655:
	bts r12,0
	stc
LB_1656:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 19
	push LB_1651
	push LB_1651
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some %_1643 ⊢ %_1644 : %_1644
 ; {>  %_120~2':_r64 %_1643~0':_r64 %_121~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1644
 ; {>  %_1644~°0◂0':(_opn)◂(_r64) %_120~2':_r64 %_121~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_1647
	mov rdi,r8
	call dlt
LB_1647:
	bt r12,1
	jc LB_1648
	mov rdi,r14
	call dlt
LB_1648:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1649
	btr r12,3
	jmp LB_1650
LB_1649:
	bts r12,3
LB_1650:
	mov r8,0
	bts r12,2
	ret
LB_1651:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1653
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1652
LB_1653:
	add rsp,8
	ret
LB_1654:
	add rsp,16
	pop r14
LB_1652:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_1552_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1675
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1669
LB_1675:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1670
	btr r12,0
	clc
	jmp LB_1671
LB_1670:
	bts r12,0
	stc
LB_1671:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 20
	push LB_1666
	push LB_1666
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some %_1645 ⊢ %_1646 : %_1646
 ; {>  %_125~1':_r64 %_1645~0':_r64 %_124~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1646
 ; {>  %_125~1':_r64 %_1646~°0◂0':(_opn)◂(_r64) %_124~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_1662
	mov rdi,r14
	call dlt
LB_1662:
	bt r12,2
	jc LB_1663
	mov rdi,r8
	call dlt
LB_1663:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1664
	btr r12,3
	jmp LB_1665
LB_1664:
	bts r12,3
LB_1665:
	mov r8,0
	bts r12,2
	ret
LB_1666:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1668
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1667
LB_1668:
	add rsp,8
	ret
LB_1669:
	add rsp,16
	pop r14
LB_1667:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1677:
NS_E_RDI_1677:
NS_E_1677_ETR_TBL:
NS_E_1677_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_1642_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1729
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1721
LB_1729:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_1678_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1734
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1735
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1735:
	jmp LB_1721
LB_1734:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1724
	btr r12,1
	clc
	jmp LB_1725
LB_1724:
	bts r12,1
	stc
LB_1725:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1722
	btr r12,0
	clc
	jmp LB_1723
LB_1722:
	bts r12,0
	stc
LB_1723:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 21
	push LB_1718
	push LB_1718
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _cns { %_1680 %_1681 } ⊢ %_1682 : %_1682
 ; {>  %_128~3':_r64 %_129~2':_r64 %_1681~1':(_lst)◂(_r64) %_1680~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f1087 %_1682 ⊢ %_1683 : %_1683
 ; {>  %_128~3':_r64 %_129~2':_r64 %_1682~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f1087 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_1701
	btr r12,2
	jmp LB_1702
LB_1701:
	bts r12,2
LB_1702:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_1707
	btr r12,3
	jmp LB_1708
LB_1707:
	bts r12,3
LB_1708:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_1705
	btr QWORD [rdi],0
	jmp LB_1706
LB_1705:
	bts QWORD [rdi],0
LB_1706:
	mov r9,r14
	bt r12,1
	jc LB_1711
	btr r12,3
	jmp LB_1712
LB_1711:
	bts r12,3
LB_1712:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_1709
	btr QWORD [rdi],1
	jmp LB_1710
LB_1709:
	bts QWORD [rdi],1
LB_1710:
	mov rsi,1
	bt r12,0
	jc LB_1703
	mov rsi,0
	bt r13,0
	jc LB_1703
	jmp LB_1704
LB_1703:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_1704:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	push 4
	push LB_1713
	call NS_E_1087
LB_1713:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_1699
	btr r12,3
	clc
	jmp LB_1700
LB_1699:
	bts r12,3
	stc
LB_1700:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1697
	btr r12,2
	clc
	jmp LB_1698
LB_1697:
	bts r12,2
	stc
LB_1698:
	add rsp,24
; _some %_1683 ⊢ %_1684 : %_1684
 ; {>  %_128~3':_r64 %_129~2':_r64 %_1683~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_1684
 ; {>  %_128~3':_r64 %_129~2':_r64 %_1684~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
	bt r12,3
	jc LB_1714
	mov rdi,r9
	call dlt
LB_1714:
	bt r12,2
	jc LB_1715
	mov rdi,r8
	call dlt
LB_1715:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1716
	btr r12,3
	jmp LB_1717
LB_1716:
	bts r12,3
LB_1717:
	mov r8,0
	bts r12,2
	ret
LB_1718:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1720
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1719
LB_1720:
	add rsp,8
	ret
LB_1721:
	add rsp,32
	pop r14
LB_1719:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1678:
NS_E_RDI_1678:
NS_E_1678_ETR_TBL:
NS_E_1678_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_1679_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1760
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1752
LB_1760:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_1678_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1765
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1766
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1766:
	jmp LB_1752
LB_1765:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1755
	btr r12,1
	clc
	jmp LB_1756
LB_1755:
	bts r12,1
	stc
LB_1756:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1753
	btr r12,0
	clc
	jmp LB_1754
LB_1753:
	bts r12,0
	stc
LB_1754:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 22
	push LB_1749
	push LB_1749
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _cns { %_1685 %_1686 } ⊢ %_1687 : %_1687
 ; {>  %_1686~1':(_lst)◂(_r64) %_132~3':_r64 %_133~2':_r64 %_1685~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_1687 ⊢ %_1688 : %_1688
 ; {>  %_132~3':_r64 %_133~2':_r64 %_1687~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_1688
 ; {>  %_132~3':_r64 %_133~2':_r64 %_1688~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
	bt r12,3
	jc LB_1737
	mov rdi,r9
	call dlt
LB_1737:
	bt r12,2
	jc LB_1738
	mov rdi,r8
	call dlt
LB_1738:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_1743
	btr r12,2
	jmp LB_1744
LB_1743:
	bts r12,2
LB_1744:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_1741
	btr QWORD [rdi],0
	jmp LB_1742
LB_1741:
	bts QWORD [rdi],0
LB_1742:
	mov r8,r14
	bt r12,1
	jc LB_1747
	btr r12,2
	jmp LB_1748
LB_1747:
	bts r12,2
LB_1748:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_1745
	btr QWORD [rdi],1
	jmp LB_1746
LB_1745:
	bts QWORD [rdi],1
LB_1746:
	mov rsi,1
	bt r12,3
	jc LB_1739
	mov rsi,0
	bt r9,0
	jc LB_1739
	jmp LB_1740
LB_1739:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1740:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_1749:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1751
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1750
LB_1751:
	add rsp,8
	ret
LB_1752:
	add rsp,32
	pop r14
LB_1750:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 23
	push LB_1772
	push LB_1772
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_1689 : %_1689
 ; {>  %_137~0':_r64 %_136~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; _some %_1689 ⊢ %_1690 : %_1690
 ; {>  %_137~0':_r64 %_136~1':_r64 %_1689~°1◂{  }:(_lst)◂(t515'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_1690
 ; {>  %_137~0':_r64 %_136~1':_r64 %_1690~°0◂°1◂{  }:(_opn)◂((_lst)◂(t518'(0))) }
; 	∎ °0◂°1◂{  }
	bt r12,0
	jc LB_1768
	mov rdi,r13
	call dlt
LB_1768:
	bt r12,1
	jc LB_1769
	mov rdi,r14
	call dlt
LB_1769:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_1770
	mov rsi,0
	bt r9,0
	jc LB_1770
	jmp LB_1771
LB_1770:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1771:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_1772:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1774
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1773
LB_1774:
	add rsp,8
	ret
LB_1775:
	add rsp,0
	pop r14
LB_1773:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1679:
NS_E_RDI_1679:
NS_E_1679_ETR_TBL:
NS_E_1679_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_1642_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1789
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1783
LB_1789:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1784
	btr r12,0
	clc
	jmp LB_1785
LB_1784:
	bts r12,0
	stc
LB_1785:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 24
	push LB_1780
	push LB_1780
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some %_1691 ⊢ %_1692 : %_1692
 ; {>  %_140~2':_r64 %_141~1':_r64 %_1691~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1692
 ; {>  %_1692~°0◂0':(_opn)◂(_r64) %_140~2':_r64 %_141~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_1776
	mov rdi,r8
	call dlt
LB_1776:
	bt r12,1
	jc LB_1777
	mov rdi,r14
	call dlt
LB_1777:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1778
	btr r12,3
	jmp LB_1779
LB_1778:
	bts r12,3
LB_1779:
	mov r8,0
	bts r12,2
	ret
LB_1780:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1782
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1781
LB_1782:
	add rsp,8
	ret
LB_1783:
	add rsp,16
	pop r14
LB_1781:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_1507_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1804
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1798
LB_1804:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1799
	btr r12,0
	clc
	jmp LB_1800
LB_1799:
	bts r12,0
	stc
LB_1800:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 25
	push LB_1795
	push LB_1795
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some %_1693 ⊢ %_1694 : %_1694
 ; {>  %_144~2':_r64 %_145~1':_r64 %_1693~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1694
 ; {>  %_144~2':_r64 %_1694~°0◂0':(_opn)◂(_r64) %_145~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_1791
	mov rdi,r8
	call dlt
LB_1791:
	bt r12,1
	jc LB_1792
	mov rdi,r14
	call dlt
LB_1792:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1793
	btr r12,3
	jmp LB_1794
LB_1793:
	bts r12,3
LB_1794:
	mov r8,0
	bts r12,2
	ret
LB_1795:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1797
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1796
LB_1797:
	add rsp,8
	ret
LB_1798:
	add rsp,16
	pop r14
LB_1796:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_1821
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,95
	jnz LB_1821
	jmp LB_1822
LB_1821:
	jmp LB_1813
LB_1822:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1814
	btr r12,0
	clc
	jmp LB_1815
LB_1814:
	bts r12,0
	stc
LB_1815:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 26
	push LB_1810
	push LB_1810
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; » 0xr5f |~ {  } ⊢ %_1695 : %_1695
 ; {>  %_149~0':_r64 %_148~1':_r64 }
; 	» 0xr5f _ ⊢ 2' : %_1695
	mov rdi,0x5f
	mov r8,rdi
	bts r12,2
; _some %_1695 ⊢ %_1696 : %_1696
 ; {>  %_149~0':_r64 %_1695~2':_r64 %_148~1':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_1696
 ; {>  %_1696~°0◂2':(_opn)◂(_r64) %_149~0':_r64 %_148~1':_r64 }
; 	∎ °0◂2'
	bt r12,0
	jc LB_1806
	mov rdi,r13
	call dlt
LB_1806:
	bt r12,1
	jc LB_1807
	mov rdi,r14
	call dlt
LB_1807:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_1808
	btr r12,3
	jmp LB_1809
LB_1808:
	bts r12,3
LB_1809:
	mov r8,0
	bts r12,2
	ret
LB_1810:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1812
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1811
LB_1812:
	add rsp,8
	ret
LB_1813:
	add rsp,16
	pop r14
LB_1811:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1823:
NS_E_RDI_1823:
NS_E_1823_ETR_TBL:
NS_E_1823_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_1851
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,95
	jnz LB_1851
	jmp LB_1852
LB_1851:
	jmp LB_1841
LB_1852:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_1678_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1856
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1857
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1857:
	jmp LB_1841
LB_1856:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1844
	btr r12,1
	clc
	jmp LB_1845
LB_1844:
	bts r12,1
	stc
LB_1845:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1842
	btr r12,0
	clc
	jmp LB_1843
LB_1842:
	bts r12,0
	stc
LB_1843:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 27
	push LB_1838
	push LB_1838
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_1859
	btr r12,2
	jmp LB_1860
LB_1859:
	bts r12,2
LB_1860:
	mov r13,r14
	bt r12,1
	jc LB_1861
	btr r12,0
	jmp LB_1862
LB_1861:
	bts r12,0
LB_1862:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1087 %_1824 ⊢ %_1825 : %_1825
 ; {>  %_152~2':_r64 %_1824~0':(_lst)◂(_r64) %_153~1':_r64 }
; _f1087 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push 4
	push LB_1833
	call NS_E_1087
LB_1833:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1831
	btr r12,2
	clc
	jmp LB_1832
LB_1831:
	bts r12,2
	stc
LB_1832:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1829
	btr r12,1
	clc
	jmp LB_1830
LB_1829:
	bts r12,1
	stc
LB_1830:
	add rsp,24
; _some %_1825 ⊢ %_1826 : %_1826
 ; {>  %_152~2':_r64 %_1825~0':_stg %_153~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1826
 ; {>  %_152~2':_r64 %_1826~°0◂0':(_opn)◂(_stg) %_153~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_1834
	mov rdi,r8
	call dlt
LB_1834:
	bt r12,1
	jc LB_1835
	mov rdi,r14
	call dlt
LB_1835:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1836
	btr r12,3
	jmp LB_1837
LB_1836:
	bts r12,3
LB_1837:
	mov r8,0
	bts r12,2
	ret
LB_1838:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1840
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1839
LB_1840:
	add rsp,8
	ret
LB_1841:
	add rsp,32
	pop r14
LB_1839:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_1677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1876
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1870
LB_1876:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1871
	btr r12,0
	clc
	jmp LB_1872
LB_1871:
	bts r12,0
	stc
LB_1872:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 28
	push LB_1867
	push LB_1867
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some %_1827 ⊢ %_1828 : %_1828
 ; {>  %_1827~0':_stg %_157~1':_r64 %_156~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1828
 ; {>  %_157~1':_r64 %_156~2':_r64 %_1828~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_1863
	mov rdi,r14
	call dlt
LB_1863:
	bt r12,2
	jc LB_1864
	mov rdi,r8
	call dlt
LB_1864:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1865
	btr r12,3
	jmp LB_1866
LB_1865:
	bts r12,3
LB_1866:
	mov r8,0
	bts r12,2
	ret
LB_1867:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1869
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1868
LB_1869:
	add rsp,8
	ret
LB_1870:
	add rsp,16
	pop r14
LB_1868:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1881:
; 	|» 0'
NS_E_RDI_1881:
MTC_LB_1890:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1891
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_1892
	bt QWORD [rdi],0
	jc LB_1893
	btr r12,3
	clc
	jmp LB_1894
LB_1893:
	bts r12,3
	stc
LB_1894:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1892:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1897
	btr r12,4
	clc
	jmp LB_1898
LB_1897:
	bts r12,4
	stc
LB_1898:
	mov r14,r10
	bt r12,4
	jc LB_1895
	btr r12,1
	jmp LB_1896
LB_1895:
	bts r12,1
LB_1896:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1901
	btr r12,4
	clc
	jmp LB_1902
LB_1901:
	bts r12,4
	stc
LB_1902:
	mov r8,r10
	bt r12,4
	jc LB_1899
	btr r12,2
	jmp LB_1900
LB_1899:
	bts r12,2
LB_1900:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1903:
	cmp r15,0
	jz LB_1904
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1903
LB_1904:
; _f1881 %_1884 ⊢ %_1885 : %_1885
 ; {>  %_1884~2':_p1878 %_1883~1':_stg }
; _f1881 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1907
	btr r12,0
	jmp LB_1908
LB_1907:
	bts r12,0
LB_1908:
	push 29
	push LB_1909
	call NS_E_1881
LB_1909:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1905
	btr r12,1
	clc
	jmp LB_1906
LB_1905:
	bts r12,1
	stc
LB_1906:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "."
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ %_1888
 ; {>  %_1888~2':_stg %_1887~0':_stg %_1886~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_1910
	mov rdi,r13
	call dlt
LB_1910:
	bt r12,1
	jc LB_1911
	mov rdi,r14
	call dlt
LB_1911:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1912
	btr r12,0
	jmp LB_1913
LB_1912:
	bts r12,0
LB_1913:
	ret
MTC_LB_1891:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1914
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_1915
	bt QWORD [rdi],0
	jc LB_1916
	btr r12,2
	clc
	jmp LB_1917
LB_1916:
	bts r12,2
	stc
LB_1917:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1915:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1918
	btr r12,1
	jmp LB_1919
LB_1918:
	bts r12,1
LB_1919:
LB_1920:
	cmp r15,0
	jz LB_1921
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1920
LB_1921:
; ∎ %_1889
 ; {>  %_1889~1':_stg }
; 	∎ 1'
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1922
	btr r12,0
	jmp LB_1923
LB_1922:
	bts r12,0
LB_1923:
	ret
MTC_LB_1914:
NS_E_2032:
; 	|» 0'
NS_E_RDI_2032:
MTC_LB_2033:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2034
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_2035
	bt QWORD [rdi],0
	jc LB_2036
	btr r12,2
	clc
	jmp LB_2037
LB_2036:
	bts r12,2
	stc
LB_2037:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2035:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_2038
	btr r12,1
	jmp LB_2039
LB_2038:
	bts r12,1
LB_2039:
LB_2040:
	cmp r15,0
	jz LB_2041
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2040
LB_2041:
; 	» "??r" _ ⊢ 0' : %_2027
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_72_3f_3f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_2027
 ; {>  %_2027~0':_stg %_2026~1':_r64 }
; 	∎ 0'
	bt r12,1
	jc LB_2042
	mov rdi,r14
	call dlt
LB_2042:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2034:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2043
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_2044
	bt QWORD [rdi],0
	jc LB_2045
	btr r12,2
	clc
	jmp LB_2046
LB_2045:
	bts r12,2
	stc
LB_2046:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2044:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_2047
	btr r12,1
	jmp LB_2048
LB_2047:
	bts r12,1
LB_2048:
LB_2049:
	cmp r15,0
	jz LB_2050
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2049
LB_2050:
; 	» ".." _ ⊢ 0' : %_2029
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_2e_2e
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_2029
 ; {>  %_2028~1':_stg %_2029~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_2051
	mov rdi,r14
	call dlt
LB_2051:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2043:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2052
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °2◂1'
; 0' ⊢ °2◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_2053
	bt QWORD [rdi],0
	jc LB_2054
	btr r12,2
	clc
	jmp LB_2055
LB_2054:
	bts r12,2
	stc
LB_2055:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2053:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_2056
	btr r12,1
	jmp LB_2057
LB_2056:
	bts r12,1
LB_2057:
LB_2058:
	cmp r15,0
	jz LB_2059
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2058
LB_2059:
; _f1881 %_2030 ⊢ %_2031 : %_2031
 ; {>  %_2030~1':_p1878 }
; _f1881 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2060
	btr r12,0
	jmp LB_2061
LB_2060:
	bts r12,0
LB_2061:
	push 29
	push LB_2062
	call NS_E_1881
LB_2062:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_2031
 ; {>  %_2031~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2052:
NS_E_2085:
; 	|» 0'
NS_E_RDI_2085:
MTC_LB_2095:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2096
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_2097
	bt QWORD [rdi],0
	jc LB_2098
	btr r12,3
	clc
	jmp LB_2099
LB_2098:
	bts r12,3
	stc
LB_2099:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2097:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2102
	btr r12,4
	clc
	jmp LB_2103
LB_2102:
	bts r12,4
	stc
LB_2103:
	mov r14,r10
	bt r12,4
	jc LB_2100
	btr r12,1
	jmp LB_2101
LB_2100:
	bts r12,1
LB_2101:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2106
	btr r12,4
	clc
	jmp LB_2107
LB_2106:
	bts r12,4
	stc
LB_2107:
	mov r8,r10
	bt r12,4
	jc LB_2104
	btr r12,2
	jmp LB_2105
LB_2104:
	bts r12,2
LB_2105:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2108:
	cmp r15,0
	jz LB_2109
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2108
LB_2109:
; _f2063 %_2087 ⊢ %_2089 : %_2089
 ; {>  %_2088~2':(_lst)◂((_p1924)◂((_p1937)◂(_stg))) %_2087~1':(_p1924)◂((_p1937)◂(_stg)) }
; _f2063 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2112
	btr r12,0
	jmp LB_2113
LB_2112:
	bts r12,0
LB_2113:
	push 31
	push LB_2114
	call NS_E_2063
LB_2114:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2110
	btr r12,2
	clc
	jmp LB_2111
LB_2110:
	bts r12,2
	stc
LB_2111:
	add rsp,16
; _f2085 %_2088 ⊢ %_2090 : %_2090
 ; {>  %_2089~0':_stg %_2088~2':(_lst)◂((_p1924)◂((_p1937)◂(_stg))) }
; _f2085 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2117
	btr r12,0
	jmp LB_2118
LB_2117:
	bts r12,0
LB_2118:
	push 32
	push LB_2121
	call NS_E_2085
LB_2121:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2119
	btr r12,1
	jmp LB_2120
LB_2119:
	bts r12,1
LB_2120:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2115
	btr r12,0
	clc
	jmp LB_2116
LB_2115:
	bts r12,0
	stc
LB_2116:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ %_2093
 ; {>  %_2091~0':_stg %_2092~1':_stg %_2093~2':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_2122
	mov rdi,r13
	call dlt
LB_2122:
	bt r12,1
	jc LB_2123
	mov rdi,r14
	call dlt
LB_2123:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2124
	btr r12,0
	jmp LB_2125
LB_2124:
	bts r12,0
LB_2125:
	ret
MTC_LB_2096:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2126
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_2127
	bt QWORD [rdi],0
	jc LB_2128
	btr r12,1
	clc
	jmp LB_2129
LB_2128:
	bts r12,1
	stc
LB_2129:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2127:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2130:
	cmp r15,0
	jz LB_2131
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2130
LB_2131:
; 	» "" _ ⊢ 0' : %_2094
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_2094
 ; {>  %_2094~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2126:
NS_E_2063:
; 	|» 0'
NS_E_RDI_2063:
MTC_LB_2132:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2133
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_2134
	bt QWORD [rdi],0
	jc LB_2135
	btr r12,2
	clc
	jmp LB_2136
LB_2135:
	bts r12,2
	stc
LB_2136:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2134:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_2137
	btr r12,1
	jmp LB_2138
LB_2137:
	bts r12,1
LB_2138:
LB_2139:
	cmp r15,0
	jz LB_2140
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2139
LB_2140:
; _f2085 %_2065 ⊢ %_2066 : %_2066
 ; {>  %_2065~1':(_lst)◂((_p1924)◂((_p1937)◂(_stg))) }
; _f2085 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2141
	btr r12,0
	jmp LB_2142
LB_2141:
	bts r12,0
LB_2142:
	push 32
	push LB_2143
	call NS_E_2085
LB_2143:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "{ "
	mov rsi,0x_7b
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "}"
	mov rsi,0x_7d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	add rsp,0
; ∎ %_2068
 ; {>  %_2067~0':_stg %_2068~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_2144
	mov rdi,r13
	call dlt
LB_2144:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2145
	btr r12,0
	jmp LB_2146
LB_2145:
	bts r12,0
LB_2146:
	ret
MTC_LB_2133:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2147
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_2148
	bt QWORD [rdi],0
	jc LB_2149
	btr r12,2
	clc
	jmp LB_2150
LB_2149:
	bts r12,2
	stc
LB_2150:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2148:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_2151
	btr r12,1
	jmp LB_2152
LB_2151:
	bts r12,1
LB_2152:
LB_2153:
	cmp r15,0
	jz LB_2154
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2153
LB_2154:
MTC_LB_2155:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2156
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °1◂0'
; 1' ⊢ °1◂0'
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2157
	bt QWORD [rdi],0
	jc LB_2158
	btr r12,2
	clc
	jmp LB_2159
LB_2158:
	bts r12,2
	stc
LB_2159:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2157:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_2160
	btr r12,0
	jmp LB_2161
LB_2160:
	bts r12,0
LB_2161:
LB_2162:
	cmp r15,0
	jz LB_2163
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2162
LB_2163:
; _f2032 %_2070 ⊢ %_2071 : %_2071
 ; {>  %_2070~0':_p1927 }
; _f2032 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push 30
	push LB_2164
	call NS_E_2032
LB_2164:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,3
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "%[ "
	mov rsi,0x_25
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5b
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " ] "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
	add rsp,0
; ∎ %_2073
 ; {>  %_2073~1':_stg %_2072~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_2165
	mov rdi,r13
	call dlt
LB_2165:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2166
	btr r12,0
	jmp LB_2167
LB_2166:
	bts r12,0
LB_2167:
	ret
MTC_LB_2156:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2168
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °0◂{ 0' 2' }
; 1' ⊢ °0◂{ 0' 2' }
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2169
	bt QWORD [rdi],0
	jc LB_2170
	btr r12,3
	clc
	jmp LB_2171
LB_2170:
	bts r12,3
	stc
LB_2171:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2169:
	mov r9,rdi
; 3' ⊢ { 0' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2174
	btr r12,4
	clc
	jmp LB_2175
LB_2174:
	bts r12,4
	stc
LB_2175:
	mov r13,r10
	bt r12,4
	jc LB_2172
	btr r12,0
	jmp LB_2173
LB_2172:
	bts r12,0
LB_2173:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2178
	btr r12,4
	clc
	jmp LB_2179
LB_2178:
	bts r12,4
	stc
LB_2179:
	mov r8,r10
	bt r12,4
	jc LB_2176
	btr r12,2
	jmp LB_2177
LB_2176:
	bts r12,2
LB_2177:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2180:
	cmp r15,0
	jz LB_2181
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2180
LB_2181:
; _f2063 %_2075 ⊢ %_2076 : %_2076
 ; {>  %_2074~0':_p1878 %_2075~2':(_p1924)◂((_p1937)◂(_stg)) }
; _f2063 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2184
	btr r12,0
	jmp LB_2185
LB_2184:
	bts r12,0
LB_2185:
	push 31
	push LB_2188
	call NS_E_2063
LB_2188:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2186
	btr r12,1
	jmp LB_2187
LB_2186:
	bts r12,1
LB_2187:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2182
	btr r12,0
	clc
	jmp LB_2183
LB_2182:
	bts r12,0
	stc
LB_2183:
	add rsp,16
; _f1881 %_2074 ⊢ %_2077 : %_2077
 ; {>  %_2074~0':_p1878 %_2076~1':_stg }
; _f1881 0' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push 29
	push LB_2191
	call NS_E_1881
LB_2191:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2189
	btr r12,1
	clc
	jmp LB_2190
LB_2189:
	bts r12,1
	stc
LB_2190:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\226\151\130"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_97
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_82
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ %_2080
 ; {>  %_2079~1':_stg %_2078~0':_stg %_2080~2':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_2192
	mov rdi,r14
	call dlt
LB_2192:
	bt r12,0
	jc LB_2193
	mov rdi,r13
	call dlt
LB_2193:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2194
	btr r12,0
	jmp LB_2195
LB_2194:
	bts r12,0
LB_2195:
	ret
MTC_LB_2168:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_2196
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °3◂0'
; 1' ⊢ °3◂0'
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2197
	bt QWORD [rdi],0
	jc LB_2198
	btr r12,2
	clc
	jmp LB_2199
LB_2198:
	bts r12,2
	stc
LB_2199:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2197:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_2200
	btr r12,0
	jmp LB_2201
LB_2200:
	bts r12,0
LB_2201:
LB_2202:
	cmp r15,0
	jz LB_2203
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2202
LB_2203:
; » _^ ..
	xor rax,rax
	add rax,1
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "%"
	mov rsi,0x_25
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ %_2083
 ; {>  %_2082~0':_stg %_2083~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_2204
	mov rdi,r13
	call dlt
LB_2204:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2205
	btr r12,0
	jmp LB_2206
LB_2205:
	bts r12,0
LB_2206:
	ret
MTC_LB_2196:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2207
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °2◂{  }
; 1' ⊢ °2◂{  }
	btr r12,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2208
	bt QWORD [rdi],0
	jc LB_2209
	btr r12,0
	clc
	jmp LB_2210
LB_2209:
	bts r12,0
	stc
LB_2210:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2208:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2211:
	cmp r15,0
	jz LB_2212
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2211
LB_2212:
; 	» "_" _ ⊢ 0' : %_2084
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_5f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_2084
 ; {>  %_2084~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2207:
MTC_LB_2147:
NS_E_2244:
; 	|» 0'
NS_E_RDI_2244:
MTC_LB_2254:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2255
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_2256
	bt QWORD [rdi],0
	jc LB_2257
	btr r12,3
	clc
	jmp LB_2258
LB_2257:
	bts r12,3
	stc
LB_2258:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2256:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2261
	btr r12,4
	clc
	jmp LB_2262
LB_2261:
	bts r12,4
	stc
LB_2262:
	mov r14,r10
	bt r12,4
	jc LB_2259
	btr r12,1
	jmp LB_2260
LB_2259:
	bts r12,1
LB_2260:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2265
	btr r12,4
	clc
	jmp LB_2266
LB_2265:
	bts r12,4
	stc
LB_2266:
	mov r8,r10
	bt r12,4
	jc LB_2263
	btr r12,2
	jmp LB_2264
LB_2263:
	bts r12,2
LB_2264:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2267:
	cmp r15,0
	jz LB_2268
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2267
LB_2268:
; _f2235 %_2246 ⊢ %_2248 : %_2248
 ; {>  %_2246~1':(_p1924)◂((_p1932)◂(_stg)) %_2247~2':(_lst)◂((_p1924)◂((_p1932)◂(_stg))) }
; _f2235 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2271
	btr r12,0
	jmp LB_2272
LB_2271:
	bts r12,0
LB_2272:
	push 35
	push LB_2273
	call NS_E_2235
LB_2273:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2269
	btr r12,2
	clc
	jmp LB_2270
LB_2269:
	bts r12,2
	stc
LB_2270:
	add rsp,16
; _f2244 %_2247 ⊢ %_2249 : %_2249
 ; {>  %_2248~0':_stg %_2247~2':(_lst)◂((_p1924)◂((_p1932)◂(_stg))) }
; _f2244 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2276
	btr r12,0
	jmp LB_2277
LB_2276:
	bts r12,0
LB_2277:
	push 36
	push LB_2280
	call NS_E_2244
LB_2280:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2278
	btr r12,1
	jmp LB_2279
LB_2278:
	bts r12,1
LB_2279:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2274
	btr r12,0
	clc
	jmp LB_2275
LB_2274:
	bts r12,0
	stc
LB_2275:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ %_2252
 ; {>  %_2250~0':_stg %_2251~1':_stg %_2252~2':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_2281
	mov rdi,r13
	call dlt
LB_2281:
	bt r12,1
	jc LB_2282
	mov rdi,r14
	call dlt
LB_2282:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2283
	btr r12,0
	jmp LB_2284
LB_2283:
	bts r12,0
LB_2284:
	ret
MTC_LB_2255:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2285
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_2286
	bt QWORD [rdi],0
	jc LB_2287
	btr r12,1
	clc
	jmp LB_2288
LB_2287:
	bts r12,1
	stc
LB_2288:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2286:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2289:
	cmp r15,0
	jz LB_2290
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2289
LB_2290:
; 	» "" _ ⊢ 0' : %_2253
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_2253
 ; {>  %_2253~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2285:
NS_E_2235:
; 	|» 0'
NS_E_RDI_2235:
MTC_LB_2291:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2292
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_2293
	bt QWORD [rdi],0
	jc LB_2294
	btr r12,2
	clc
	jmp LB_2295
LB_2294:
	bts r12,2
	stc
LB_2295:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2293:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_2296
	btr r12,1
	jmp LB_2297
LB_2296:
	bts r12,1
LB_2297:
LB_2298:
	cmp r15,0
	jz LB_2299
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2298
LB_2299:
; _f2244 %_2237 ⊢ %_2238 : %_2238
 ; {>  %_2237~1':(_lst)◂((_p1924)◂((_p1932)◂(_stg))) }
; _f2244 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2300
	btr r12,0
	jmp LB_2301
LB_2300:
	bts r12,0
LB_2301:
	push 36
	push LB_2302
	call NS_E_2244
LB_2302:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "{ "
	mov rsi,0x_7b
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "}"
	mov rsi,0x_7d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	add rsp,0
; ∎ %_2240
 ; {>  %_2239~0':_stg %_2240~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_2303
	mov rdi,r13
	call dlt
LB_2303:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2304
	btr r12,0
	jmp LB_2305
LB_2304:
	bts r12,0
LB_2305:
	ret
MTC_LB_2292:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2306
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_2307
	bt QWORD [rdi],0
	jc LB_2308
	btr r12,2
	clc
	jmp LB_2309
LB_2308:
	bts r12,2
	stc
LB_2309:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2307:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_2310
	btr r12,1
	jmp LB_2311
LB_2310:
	bts r12,1
LB_2311:
LB_2312:
	cmp r15,0
	jz LB_2313
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2312
LB_2313:
MTC_LB_2314:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2315
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °0◂{  }
; 1' ⊢ °0◂{  }
	btr r12,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2316
	bt QWORD [rdi],0
	jc LB_2317
	btr r12,0
	clc
	jmp LB_2318
LB_2317:
	bts r12,0
	stc
LB_2318:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2316:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2319:
	cmp r15,0
	jz LB_2320
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2319
LB_2320:
; 	» "_ " _ ⊢ 0' : %_2242
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_20_5f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_2242
 ; {>  %_2242~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2315:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2321
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °1◂0'
; 1' ⊢ °1◂0'
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2322
	bt QWORD [rdi],0
	jc LB_2323
	btr r12,2
	clc
	jmp LB_2324
LB_2323:
	bts r12,2
	stc
LB_2324:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2322:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_2325
	btr r12,0
	jmp LB_2326
LB_2325:
	bts r12,0
LB_2326:
LB_2327:
	cmp r15,0
	jz LB_2328
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2327
LB_2328:
; ∎ %_2243
 ; {>  %_2243~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2321:
MTC_LB_2306:
NS_E_2225:
; 	|» 0'
NS_E_RDI_2225:
MTC_LB_2329:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2330
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_2331
	bt QWORD [rdi],0
	jc LB_2332
	btr r12,3
	clc
	jmp LB_2333
LB_2332:
	bts r12,3
	stc
LB_2333:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2331:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2336
	btr r12,4
	clc
	jmp LB_2337
LB_2336:
	bts r12,4
	stc
LB_2337:
	mov r14,r10
	bt r12,4
	jc LB_2334
	btr r12,1
	jmp LB_2335
LB_2334:
	bts r12,1
LB_2335:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2340
	btr r12,4
	clc
	jmp LB_2341
LB_2340:
	bts r12,4
	stc
LB_2341:
	mov r8,r10
	bt r12,4
	jc LB_2338
	btr r12,2
	jmp LB_2339
LB_2338:
	bts r12,2
LB_2339:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2342:
	cmp r15,0
	jz LB_2343
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2342
LB_2343:
; _f2213 %_2227 ⊢ %_2229 : %_2229
 ; {>  %_2227~1':(_p1924)◂((_p1931)◂(_stg)) %_2228~2':(_lst)◂((_p1924)◂((_p1931)◂(_stg))) }
; _f2213 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2346
	btr r12,0
	jmp LB_2347
LB_2346:
	bts r12,0
LB_2347:
	push 33
	push LB_2348
	call NS_E_2213
LB_2348:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2344
	btr r12,2
	clc
	jmp LB_2345
LB_2344:
	bts r12,2
	stc
LB_2345:
	add rsp,16
; _f2225 %_2228 ⊢ %_2230 : %_2230
 ; {>  %_2229~0':_stg %_2228~2':(_lst)◂((_p1924)◂((_p1931)◂(_stg))) }
; _f2225 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2351
	btr r12,0
	jmp LB_2352
LB_2351:
	bts r12,0
LB_2352:
	push 34
	push LB_2355
	call NS_E_2225
LB_2355:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2353
	btr r12,1
	jmp LB_2354
LB_2353:
	bts r12,1
LB_2354:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2349
	btr r12,0
	clc
	jmp LB_2350
LB_2349:
	bts r12,0
	stc
LB_2350:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ %_2233
 ; {>  %_2231~0':_stg %_2233~2':_stg %_2232~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_2356
	mov rdi,r13
	call dlt
LB_2356:
	bt r12,1
	jc LB_2357
	mov rdi,r14
	call dlt
LB_2357:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2358
	btr r12,0
	jmp LB_2359
LB_2358:
	bts r12,0
LB_2359:
	ret
MTC_LB_2330:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2360
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_2361
	bt QWORD [rdi],0
	jc LB_2362
	btr r12,1
	clc
	jmp LB_2363
LB_2362:
	bts r12,1
	stc
LB_2363:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2361:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2364:
	cmp r15,0
	jz LB_2365
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2364
LB_2365:
; 	» "" _ ⊢ 0' : %_2234
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_2234
 ; {>  %_2234~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2360:
NS_E_2213:
; 	|» 0'
NS_E_RDI_2213:
MTC_LB_2366:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2367
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_2368
	bt QWORD [rdi],0
	jc LB_2369
	btr r12,2
	clc
	jmp LB_2370
LB_2369:
	bts r12,2
	stc
LB_2370:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2368:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_2371
	btr r12,1
	jmp LB_2372
LB_2371:
	bts r12,1
LB_2372:
LB_2373:
	cmp r15,0
	jz LB_2374
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2373
LB_2374:
; _f2225 %_2215 ⊢ %_2216 : %_2216
 ; {>  %_2215~1':(_lst)◂((_p1924)◂((_p1931)◂(_stg))) }
; _f2225 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2375
	btr r12,0
	jmp LB_2376
LB_2375:
	bts r12,0
LB_2376:
	push 34
	push LB_2377
	call NS_E_2225
LB_2377:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "{ "
	mov rsi,0x_7b
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "}"
	mov rsi,0x_7d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	add rsp,0
; ∎ %_2218
 ; {>  %_2218~1':_stg %_2217~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_2378
	mov rdi,r13
	call dlt
LB_2378:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2379
	btr r12,0
	jmp LB_2380
LB_2379:
	bts r12,0
LB_2380:
	ret
MTC_LB_2367:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2381
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_2382
	bt QWORD [rdi],0
	jc LB_2383
	btr r12,2
	clc
	jmp LB_2384
LB_2383:
	bts r12,2
	stc
LB_2384:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2382:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_2385
	btr r12,1
	jmp LB_2386
LB_2385:
	bts r12,1
LB_2386:
LB_2387:
	cmp r15,0
	jz LB_2388
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2387
LB_2388:
MTC_LB_2389:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2390
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °0◂0'
; 1' ⊢ °0◂0'
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2391
	bt QWORD [rdi],0
	jc LB_2392
	btr r12,2
	clc
	jmp LB_2393
LB_2392:
	bts r12,2
	stc
LB_2393:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2391:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_2394
	btr r12,0
	jmp LB_2395
LB_2394:
	bts r12,0
LB_2395:
LB_2396:
	cmp r15,0
	jz LB_2397
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2396
LB_2397:
; _f2032 %_2220 ⊢ %_2221 : %_2221
 ; {>  %_2220~0':_p1927 }
; _f2032 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push 30
	push LB_2398
	call NS_E_2032
LB_2398:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,3
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "%[ "
	mov rsi,0x_25
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5b
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " ] "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
	add rsp,0
; ∎ %_2223
 ; {>  %_2223~1':_stg %_2222~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_2399
	mov rdi,r13
	call dlt
LB_2399:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2400
	btr r12,0
	jmp LB_2401
LB_2400:
	bts r12,0
LB_2401:
	ret
MTC_LB_2390:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2402
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °1◂0'
; 1' ⊢ °1◂0'
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2403
	bt QWORD [rdi],0
	jc LB_2404
	btr r12,2
	clc
	jmp LB_2405
LB_2404:
	bts r12,2
	stc
LB_2405:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2403:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_2406
	btr r12,0
	jmp LB_2407
LB_2406:
	bts r12,0
LB_2407:
LB_2408:
	cmp r15,0
	jz LB_2409
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2408
LB_2409:
; ∎ %_2224
 ; {>  %_2224~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2402:
MTC_LB_2381:
NS_E_2551:
; 	|» { 0' 1' }
NS_E_RDI_2551:
MTC_LB_2615:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2616
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' 4' } 5' }
; 1' ⊢ °0◂{ { 2' 3' 4' } 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2617
	bt QWORD [rdi],0
	jc LB_2618
	btr r12,6
	clc
	jmp LB_2619
LB_2618:
	bts r12,6
	stc
LB_2619:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2617:
	mov rcx,rdi
; 6' ⊢ { { 2' 3' 4' } 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_2632
	btr r12,7
	clc
	jmp LB_2633
LB_2632:
	bts r12,7
	stc
LB_2633:
; 7' ⊢ { 2' 3' 4' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2622
	btr r12,5
	clc
	jmp LB_2623
LB_2622:
	bts r12,5
	stc
LB_2623:
	mov r8,r11
	bt r12,5
	jc LB_2620
	btr r12,2
	jmp LB_2621
LB_2620:
	bts r12,2
LB_2621:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2626
	btr r12,5
	clc
	jmp LB_2627
LB_2626:
	bts r12,5
	stc
LB_2627:
	mov r9,r11
	bt r12,5
	jc LB_2624
	btr r12,3
	jmp LB_2625
LB_2624:
	bts r12,3
LB_2625:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_2630
	btr r12,5
	clc
	jmp LB_2631
LB_2630:
	bts r12,5
	stc
LB_2631:
	mov r10,r11
	bt r12,5
	jc LB_2628
	btr r12,4
	jmp LB_2629
LB_2628:
	bts r12,4
LB_2629:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_2636
	btr r12,7
	clc
	jmp LB_2637
LB_2636:
	bts r12,7
	stc
LB_2637:
	mov r11,rdx
	bt r12,7
	jc LB_2634
	btr r12,5
	jmp LB_2635
LB_2634:
	bts r12,5
LB_2635:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2638:
	cmp r15,0
	jz LB_2639
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2638
LB_2639:
; _f2063 %_2554 ⊢ %_2558 : %_2558
 ; {>  %_2556~4':(_p1945)◂(_stg) %_2552~0':_r64 %_2554~2':(_p1924)◂((_p1937)◂(_stg)) %_2557~5':(_p926)◂({ (_p1924)◂((_p1937)◂(_stg)) (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_2555~3':(_lst)◂((_p1946)◂(_stg)) }
; _f2063 2' ⊢ 1'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2648
	btr r12,0
	jmp LB_2649
LB_2648:
	bts r12,0
LB_2649:
	push 31
	push LB_2652
	call NS_E_2063
LB_2652:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2650
	btr r12,1
	jmp LB_2651
LB_2650:
	bts r12,1
LB_2651:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_2646
	btr r12,5
	clc
	jmp LB_2647
LB_2646:
	bts r12,5
	stc
LB_2647:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2644
	btr r12,4
	clc
	jmp LB_2645
LB_2644:
	bts r12,4
	stc
LB_2645:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2642
	btr r12,3
	clc
	jmp LB_2643
LB_2642:
	bts r12,3
	stc
LB_2643:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2640
	btr r12,0
	clc
	jmp LB_2641
LB_2640:
	bts r12,0
	stc
LB_2641:
	add rsp,40
; _f2551 { %_2552 %_2557 } ⊢ { %_2559 %_2560 } : { %_2559 %_2560 }
 ; {>  %_2556~4':(_p1945)◂(_stg) %_2552~0':_r64 %_2558~1':_stg %_2557~5':(_p926)◂({ (_p1924)◂((_p1937)◂(_stg)) (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_2555~3':(_lst)◂((_p1946)◂(_stg)) }
; _f2551 { 0' 5' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2659
	btr r12,1
	jmp LB_2660
LB_2659:
	bts r12,1
LB_2660:
	push 40
	push LB_2663
	call NS_E_2551
LB_2663:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_2661
	btr r12,2
	jmp LB_2662
LB_2661:
	bts r12,2
LB_2662:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2657
	btr r12,4
	clc
	jmp LB_2658
LB_2657:
	bts r12,4
	stc
LB_2658:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2655
	btr r12,3
	clc
	jmp LB_2656
LB_2655:
	bts r12,3
	stc
LB_2656:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2653
	btr r12,1
	clc
	jmp LB_2654
LB_2653:
	bts r12,1
	stc
LB_2654:
	add rsp,32
MTC_LB_2664:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2665
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °0◂5'
; 4' ⊢ °0◂5'
	btr r12,6
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_2666
	bt QWORD [rdi],0
	jc LB_2667
	btr r12,6
	clc
	jmp LB_2668
LB_2667:
	bts r12,6
	stc
LB_2668:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2666:
	mov rcx,rdi
	mov r11,rcx
	bt r12,6
	jc LB_2669
	btr r12,5
	jmp LB_2670
LB_2669:
	bts r12,5
LB_2670:
LB_2671:
	cmp r15,0
	jz LB_2672
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2671
LB_2672:
; _f2492 { %_2559 %_2561 } ⊢ { %_2562 %_2563 } : { %_2562 %_2563 }
 ; {>  %_2561~5':(_p926)◂({ (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_2560~2':_stg %_2559~0':_r64 %_2558~1':_stg %_2555~3':(_lst)◂((_p1946)◂(_stg)) }
; _f2492 { 0' 5' } ⊢ { 0' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2679
	btr r12,1
	jmp LB_2680
LB_2679:
	bts r12,1
LB_2680:
	push 39
	push LB_2683
	call NS_E_2492
LB_2683:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 4' }
	mov r10,r14
	bt r12,1
	jc LB_2681
	btr r12,4
	jmp LB_2682
LB_2681:
	bts r12,4
LB_2682:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2677
	btr r12,3
	clc
	jmp LB_2678
LB_2677:
	bts r12,3
	stc
LB_2678:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2675
	btr r12,2
	clc
	jmp LB_2676
LB_2675:
	bts r12,2
	stc
LB_2676:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2673
	btr r12,1
	clc
	jmp LB_2674
LB_2673:
	bts r12,1
	stc
LB_2674:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,4
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r10
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r11,rax
	btr r12,5
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2684:
	cmp rax,0
	jz LB_2685
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2684
LB_2685:
; "\226\136\144 "
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_90
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ".. ;\n"
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_3b
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 3'
	push rcx
	mov rsi,r10
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_2564 %_2568 }
 ; {>  %_2567~4':_stg %_2568~5':_stg %_2564~0':_r64 %_2566~2':_stg %_2555~3':(_lst)◂((_p1946)◂(_stg)) %_2565~1':_stg }
; 	∎ { 0' 5' }
	bt r12,4
	jc LB_2686
	mov rdi,r10
	call dlt
LB_2686:
	bt r12,2
	jc LB_2687
	mov rdi,r8
	call dlt
LB_2687:
	bt r12,3
	jc LB_2688
	mov rdi,r9
	call dlt
LB_2688:
	bt r12,1
	jc LB_2689
	mov rdi,r14
	call dlt
LB_2689:
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2690
	btr r12,1
	jmp LB_2691
LB_2690:
	bts r12,1
LB_2691:
	ret
MTC_LB_2665:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2692
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °1◂{ 5' 6' }
; 4' ⊢ °1◂{ 5' 6' }
	btr r12,7
	mov rax,r10
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_2693
	bt QWORD [rdi],0
	jc LB_2694
	btr r12,7
	clc
	jmp LB_2695
LB_2694:
	bts r12,7
	stc
LB_2695:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2693:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_2698
	btr r12,8
	clc
	jmp LB_2699
LB_2698:
	bts r12,8
	stc
LB_2699:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_2696
	btr r12,5
	jmp LB_2697
LB_2696:
	bts r12,5
LB_2697:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_2702
	btr r12,8
	clc
	jmp LB_2703
LB_2702:
	bts r12,8
	stc
LB_2703:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_2700
	btr r12,6
	jmp LB_2701
LB_2700:
	bts r12,6
LB_2701:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2704:
	cmp r15,0
	jz LB_2705
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2704
LB_2705:
; _f2213 %_2569 ⊢ %_2571 : %_2571
 ; {>  %_2570~6':(_p926)◂({ (_p1924)◂((_p1937)◂(_stg)) (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_2560~2':_stg %_2559~0':_r64 %_2558~1':_stg %_2555~3':(_lst)◂((_p1946)◂(_stg)) %_2569~5':(_p1924)◂((_p1931)◂(_stg)) }
; _f2213 5' ⊢ 4'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_2716
	btr r12,0
	jmp LB_2717
LB_2716:
	bts r12,0
LB_2717:
	push 33
	push LB_2720
	call NS_E_2213
LB_2720:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_2718
	btr r12,4
	jmp LB_2719
LB_2718:
	bts r12,4
LB_2719:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_2714
	btr r12,6
	clc
	jmp LB_2715
LB_2714:
	bts r12,6
	stc
LB_2715:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_2712
	btr r12,3
	clc
	jmp LB_2713
LB_2712:
	bts r12,3
	stc
LB_2713:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_2710
	btr r12,2
	clc
	jmp LB_2711
LB_2710:
	bts r12,2
	stc
LB_2711:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2708
	btr r12,1
	clc
	jmp LB_2709
LB_2708:
	bts r12,1
	stc
LB_2709:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2706
	btr r12,0
	clc
	jmp LB_2707
LB_2706:
	bts r12,0
	stc
LB_2707:
	add rsp,48
; _f2551 { %_2559 %_2570 } ⊢ { %_2572 %_2573 } : { %_2572 %_2573 }
 ; {>  %_2570~6':(_p926)◂({ (_p1924)◂((_p1937)◂(_stg)) (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_2560~2':_stg %_2571~4':_stg %_2559~0':_r64 %_2558~1':_stg %_2555~3':(_lst)◂((_p1946)◂(_stg)) }
; _f2551 { 0' 6' } ⊢ { 0' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10000010.. |},{ 0' 6' } ⊢ { 0' 1' }
	mov r14,rcx
	bt r12,6
	jc LB_2729
	btr r12,1
	jmp LB_2730
LB_2729:
	bts r12,1
LB_2730:
	push 40
	push LB_2733
	call NS_E_2551
LB_2733:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 5' }
	mov r11,r14
	bt r12,1
	jc LB_2731
	btr r12,5
	jmp LB_2732
LB_2731:
	bts r12,5
LB_2732:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_2727
	btr r12,4
	clc
	jmp LB_2728
LB_2727:
	bts r12,4
	stc
LB_2728:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2725
	btr r12,3
	clc
	jmp LB_2726
LB_2725:
	bts r12,3
	stc
LB_2726:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2723
	btr r12,2
	clc
	jmp LB_2724
LB_2723:
	bts r12,2
	stc
LB_2724:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2721
	btr r12,1
	clc
	jmp LB_2722
LB_2721:
	bts r12,1
	stc
LB_2722:
	add rsp,40
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rsi,r10
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r11
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov rcx,rax
	btr r12,6
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2734:
	cmp rax,0
	jz LB_2735
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2734
LB_2735:
; "\226\136\144 .. ; "
	mov rsi,0x_3b_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 1'
	push rcx
	mov rsi,r10
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\226\138\162 \n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 3'
	push rcx
	mov rsi,r11
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_2574 %_2578 }
 ; {>  %_2577~5':_stg %_2575~4':_stg %_2574~0':_r64 %_2576~2':_stg %_2578~6':_stg %_2558~1':_stg %_2555~3':(_lst)◂((_p1946)◂(_stg)) }
; 	∎ { 0' 6' }
	bt r12,5
	jc LB_2736
	mov rdi,r11
	call dlt
LB_2736:
	bt r12,4
	jc LB_2737
	mov rdi,r10
	call dlt
LB_2737:
	bt r12,2
	jc LB_2738
	mov rdi,r8
	call dlt
LB_2738:
	bt r12,1
	jc LB_2739
	mov rdi,r14
	call dlt
LB_2739:
	bt r12,3
	jc LB_2740
	mov rdi,r9
	call dlt
LB_2740:
; _emt_mov_ptn_to_ptn:{| 10000010.. |},{ 0' 6' } ⊢ { 0' 1' }
	mov r14,rcx
	bt r12,6
	jc LB_2741
	btr r12,1
	jmp LB_2742
LB_2741:
	bts r12,1
LB_2742:
	ret
MTC_LB_2692:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2743
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °2◂5'
; 4' ⊢ °2◂5'
	btr r12,6
	mov rax,r10
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_2744
	bt QWORD [rdi],0
	jc LB_2745
	btr r12,6
	clc
	jmp LB_2746
LB_2745:
	bts r12,6
	stc
LB_2746:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2744:
	mov rcx,rdi
	mov r11,rcx
	bt r12,6
	jc LB_2747
	btr r12,5
	jmp LB_2748
LB_2747:
	bts r12,5
LB_2748:
LB_2749:
	cmp r15,0
	jz LB_2750
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2749
LB_2750:
; _f56 %_2559 ⊢ %_2580 : %_2580
 ; {>  %_2560~2':_stg %_2559~0':_r64 %_2558~1':_stg %_2555~3':(_lst)◂((_p1946)◂(_stg)) %_2579~5':(_p1942)◂(_stg) }
	add r13,1
; _f2410 { %_2580 %_2579 } ⊢ { %_2581 %_2582 } : { %_2581 %_2582 }
 ; {>  %_2580~0':_r64 %_2560~2':_stg %_2558~1':_stg %_2555~3':(_lst)◂((_p1946)◂(_stg)) %_2579~5':(_p1942)◂(_stg) }
; _f2410 { 0' 5' } ⊢ { 0' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2757
	btr r12,1
	jmp LB_2758
LB_2757:
	bts r12,1
LB_2758:
	push 37
	push LB_2761
	call NS_E_2410
LB_2761:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 4' }
	mov r10,r14
	bt r12,1
	jc LB_2759
	btr r12,4
	jmp LB_2760
LB_2759:
	bts r12,4
LB_2760:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2755
	btr r12,3
	clc
	jmp LB_2756
LB_2755:
	bts r12,3
	stc
LB_2756:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2753
	btr r12,2
	clc
	jmp LB_2754
LB_2753:
	bts r12,2
	stc
LB_2754:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2751
	btr r12,1
	clc
	jmp LB_2752
LB_2751:
	bts r12,1
	stc
LB_2752:
	add rsp,32
; _f55 %_2581 ⊢ %_2583 : %_2583
 ; {>  %_2581~0':_r64 %_2560~2':_stg %_2582~4':_stg %_2558~1':_stg %_2555~3':(_lst)◂((_p1946)◂(_stg)) }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rsi,r10
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r11,rax
	btr r12,5
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2762:
	cmp rax,0
	jz LB_2763
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2762
LB_2763:
; "\226\136\144 .. .\n"
	mov rsi,0x_2e_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 2'
	push rcx
	mov rsi,r10
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_2584 %_2587 }
 ; {>  %_2584~0':_r64 %_2587~5':_stg %_2586~4':_stg %_2558~1':_stg %_2555~3':(_lst)◂((_p1946)◂(_stg)) %_2585~2':_stg }
; 	∎ { 0' 5' }
	bt r12,4
	jc LB_2764
	mov rdi,r10
	call dlt
LB_2764:
	bt r12,1
	jc LB_2765
	mov rdi,r14
	call dlt
LB_2765:
	bt r12,3
	jc LB_2766
	mov rdi,r9
	call dlt
LB_2766:
	bt r12,2
	jc LB_2767
	mov rdi,r8
	call dlt
LB_2767:
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2768
	btr r12,1
	jmp LB_2769
LB_2768:
	bts r12,1
LB_2769:
	ret
MTC_LB_2743:
MTC_LB_2616:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2770
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' 4' }
; 1' ⊢ °1◂{ 2' 3' 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2771
	bt QWORD [rdi],0
	jc LB_2772
	btr r12,5
	clc
	jmp LB_2773
LB_2772:
	bts r12,5
	stc
LB_2773:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2771:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2776
	btr r12,6
	clc
	jmp LB_2777
LB_2776:
	bts r12,6
	stc
LB_2777:
	mov r8,rcx
	bt r12,6
	jc LB_2774
	btr r12,2
	jmp LB_2775
LB_2774:
	bts r12,2
LB_2775:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2780
	btr r12,6
	clc
	jmp LB_2781
LB_2780:
	bts r12,6
	stc
LB_2781:
	mov r9,rcx
	bt r12,6
	jc LB_2778
	btr r12,3
	jmp LB_2779
LB_2778:
	bts r12,3
LB_2779:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_2784
	btr r12,6
	clc
	jmp LB_2785
LB_2784:
	bts r12,6
	stc
LB_2785:
	mov r10,rcx
	bt r12,6
	jc LB_2782
	btr r12,4
	jmp LB_2783
LB_2782:
	bts r12,4
LB_2783:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2786:
	cmp r15,0
	jz LB_2787
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2786
LB_2787:
MTC_LB_2788:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2789
; _emt_mov_ptn_to_ptn:{| 101110.. |},4' ⊢ °0◂1'
; 4' ⊢ °0◂1'
	btr r12,5
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_2790
	bt QWORD [rdi],0
	jc LB_2791
	btr r12,5
	clc
	jmp LB_2792
LB_2791:
	bts r12,5
	stc
LB_2792:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2790:
	mov r11,rdi
	mov r14,r11
	bt r12,5
	jc LB_2793
	btr r12,1
	jmp LB_2794
LB_2793:
	bts r12,1
LB_2794:
LB_2795:
	cmp r15,0
	jz LB_2796
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2795
LB_2796:
; _f2063 %_2588 ⊢ %_2592 : %_2592
 ; {>  %_2588~2':(_p1924)◂((_p1937)◂(_stg)) %_2591~1':(_p926)◂({ (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_2552~0':_r64 %_2589~3':(_lst)◂((_p1946)◂(_stg)) }
; _f2063 2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2803
	btr r12,0
	jmp LB_2804
LB_2803:
	bts r12,0
LB_2804:
	push 31
	push LB_2807
	call NS_E_2063
LB_2807:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_2805
	btr r12,2
	jmp LB_2806
LB_2805:
	bts r12,2
LB_2806:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2801
	btr r12,3
	clc
	jmp LB_2802
LB_2801:
	bts r12,3
	stc
LB_2802:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2799
	btr r12,1
	clc
	jmp LB_2800
LB_2799:
	bts r12,1
	stc
LB_2800:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2797
	btr r12,0
	clc
	jmp LB_2798
LB_2797:
	bts r12,0
	stc
LB_2798:
	add rsp,32
; _f2492 { %_2552 %_2591 } ⊢ { %_2593 %_2594 } : { %_2593 %_2594 }
 ; {>  %_2591~1':(_p926)◂({ (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_2552~0':_r64 %_2592~2':_stg %_2589~3':(_lst)◂((_p1946)◂(_stg)) }
; _f2492 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	push 39
	push LB_2812
	call NS_E_2492
LB_2812:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2810
	btr r12,3
	clc
	jmp LB_2811
LB_2810:
	bts r12,3
	stc
LB_2811:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2808
	btr r12,2
	clc
	jmp LB_2809
LB_2808:
	bts r12,2
	stc
LB_2809:
	add rsp,24
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,10
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2813:
	cmp rax,0
	jz LB_2814
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2813
LB_2814:
; "\226\136\144. .. ;\n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_3b
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_2595 %_2597 }
 ; {>  %_2597~4':_stg %_2596~1':_stg %_2592~2':_stg %_2589~3':(_lst)◂((_p1946)◂(_stg)) %_2595~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_2815
	mov rdi,r14
	call dlt
LB_2815:
	bt r12,2
	jc LB_2816
	mov rdi,r8
	call dlt
LB_2816:
	bt r12,3
	jc LB_2817
	mov rdi,r9
	call dlt
LB_2817:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2818
	btr r12,1
	jmp LB_2819
LB_2818:
	bts r12,1
LB_2819:
	ret
MTC_LB_2789:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2820
; _emt_mov_ptn_to_ptn:{| 101110.. |},4' ⊢ °1◂{ 1' 5' }
; 4' ⊢ °1◂{ 1' 5' }
	btr r12,6
	mov rax,r10
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_2821
	bt QWORD [rdi],0
	jc LB_2822
	btr r12,6
	clc
	jmp LB_2823
LB_2822:
	bts r12,6
	stc
LB_2823:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2821:
	mov rcx,rdi
; 6' ⊢ { 1' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_2826
	btr r12,7
	clc
	jmp LB_2827
LB_2826:
	bts r12,7
	stc
LB_2827:
	mov r14,rdx
	bt r12,7
	jc LB_2824
	btr r12,1
	jmp LB_2825
LB_2824:
	bts r12,1
LB_2825:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_2830
	btr r12,7
	clc
	jmp LB_2831
LB_2830:
	bts r12,7
	stc
LB_2831:
	mov r11,rdx
	bt r12,7
	jc LB_2828
	btr r12,5
	jmp LB_2829
LB_2828:
	bts r12,5
LB_2829:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2832:
	cmp r15,0
	jz LB_2833
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2832
LB_2833:
; _f2213 %_2598 ⊢ %_2600 : %_2600
 ; {>  %_2588~2':(_p1924)◂((_p1937)◂(_stg)) %_2598~1':(_p1924)◂((_p1931)◂(_stg)) %_2552~0':_r64 %_2599~5':(_p926)◂({ (_p1924)◂((_p1937)◂(_stg)) (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_2589~3':(_lst)◂((_p1946)◂(_stg)) }
; _f2213 1' ⊢ 1'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2842
	btr r12,0
	jmp LB_2843
LB_2842:
	bts r12,0
LB_2843:
	push 33
	push LB_2846
	call NS_E_2213
LB_2846:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2844
	btr r12,1
	jmp LB_2845
LB_2844:
	bts r12,1
LB_2845:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_2840
	btr r12,5
	clc
	jmp LB_2841
LB_2840:
	bts r12,5
	stc
LB_2841:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2838
	btr r12,3
	clc
	jmp LB_2839
LB_2838:
	bts r12,3
	stc
LB_2839:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2836
	btr r12,2
	clc
	jmp LB_2837
LB_2836:
	bts r12,2
	stc
LB_2837:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2834
	btr r12,0
	clc
	jmp LB_2835
LB_2834:
	bts r12,0
	stc
LB_2835:
	add rsp,40
; _f2551 { %_2552 %_2599 } ⊢ { %_2601 %_2602 } : { %_2601 %_2602 }
 ; {>  %_2588~2':(_p1924)◂((_p1937)◂(_stg)) %_2552~0':_r64 %_2599~5':(_p926)◂({ (_p1924)◂((_p1937)◂(_stg)) (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_2589~3':(_lst)◂((_p1946)◂(_stg)) %_2600~1':_stg }
; _f2551 { 0' 5' } ⊢ { 0' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2853
	btr r12,1
	jmp LB_2854
LB_2853:
	bts r12,1
LB_2854:
	push 40
	push LB_2857
	call NS_E_2551
LB_2857:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 4' }
	mov r10,r14
	bt r12,1
	jc LB_2855
	btr r12,4
	jmp LB_2856
LB_2855:
	bts r12,4
LB_2856:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2851
	btr r12,3
	clc
	jmp LB_2852
LB_2851:
	bts r12,3
	stc
LB_2852:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2849
	btr r12,2
	clc
	jmp LB_2850
LB_2849:
	bts r12,2
	stc
LB_2850:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2847
	btr r12,1
	clc
	jmp LB_2848
LB_2847:
	bts r12,1
	stc
LB_2848:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r10
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r11,rax
	btr r12,5
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2858:
	cmp rax,0
	jz LB_2859
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2858
LB_2859:
; "\226\136\144 .. ; "
	mov rsi,0x_3b_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\226\138\162 \n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 2'
	push rcx
	mov rsi,r10
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_2603 %_2606 }
 ; {>  %_2588~2':(_p1924)◂((_p1937)◂(_stg)) %_2604~1':_stg %_2605~4':_stg %_2589~3':(_lst)◂((_p1946)◂(_stg)) %_2606~5':_stg %_2603~0':_r64 }
; 	∎ { 0' 5' }
	bt r12,2
	jc LB_2860
	mov rdi,r8
	call dlt
LB_2860:
	bt r12,1
	jc LB_2861
	mov rdi,r14
	call dlt
LB_2861:
	bt r12,4
	jc LB_2862
	mov rdi,r10
	call dlt
LB_2862:
	bt r12,3
	jc LB_2863
	mov rdi,r9
	call dlt
LB_2863:
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2864
	btr r12,1
	jmp LB_2865
LB_2864:
	bts r12,1
LB_2865:
	ret
MTC_LB_2820:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2866
; _emt_mov_ptn_to_ptn:{| 101110.. |},4' ⊢ °2◂1'
; 4' ⊢ °2◂1'
	btr r12,5
	mov rax,r10
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_2867
	bt QWORD [rdi],0
	jc LB_2868
	btr r12,5
	clc
	jmp LB_2869
LB_2868:
	bts r12,5
	stc
LB_2869:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2867:
	mov r11,rdi
	mov r14,r11
	bt r12,5
	jc LB_2870
	btr r12,1
	jmp LB_2871
LB_2870:
	bts r12,1
LB_2871:
LB_2872:
	cmp r15,0
	jz LB_2873
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2872
LB_2873:
; _f56 %_2552 ⊢ %_2608 : %_2608
 ; {>  %_2588~2':(_p1924)◂((_p1937)◂(_stg)) %_2552~0':_r64 %_2589~3':(_lst)◂((_p1946)◂(_stg)) %_2607~1':(_p1942)◂(_stg) }
	add r13,1
; _f2410 { %_2608 %_2607 } ⊢ { %_2609 %_2610 } : { %_2609 %_2610 }
 ; {>  %_2588~2':(_p1924)◂((_p1937)◂(_stg)) %_2589~3':(_lst)◂((_p1946)◂(_stg)) %_2608~0':_r64 %_2607~1':(_p1942)◂(_stg) }
; _f2410 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	push 37
	push LB_2878
	call NS_E_2410
LB_2878:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2876
	btr r12,3
	clc
	jmp LB_2877
LB_2876:
	bts r12,3
	stc
LB_2877:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2874
	btr r12,2
	clc
	jmp LB_2875
LB_2874:
	bts r12,2
	stc
LB_2875:
	add rsp,24
; _f55 %_2609 ⊢ %_2611 : %_2611
 ; {>  %_2588~2':(_p1924)◂((_p1937)◂(_stg)) %_2609~0':_r64 %_2589~3':(_lst)◂((_p1946)◂(_stg)) %_2610~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,10
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2879:
	cmp rax,0
	jz LB_2880
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2879
LB_2880:
; "\226\136\144. .. .\n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_2612 %_2614 }
 ; {>  %_2612~0':_r64 %_2588~2':(_p1924)◂((_p1937)◂(_stg)) %_2613~1':_stg %_2589~3':(_lst)◂((_p1946)◂(_stg)) %_2614~4':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_2881
	mov rdi,r8
	call dlt
LB_2881:
	bt r12,1
	jc LB_2882
	mov rdi,r14
	call dlt
LB_2882:
	bt r12,3
	jc LB_2883
	mov rdi,r9
	call dlt
LB_2883:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2884
	btr r12,1
	jmp LB_2885
LB_2884:
	bts r12,1
LB_2885:
	ret
MTC_LB_2866:
MTC_LB_2770:
NS_E_2492:
; 	|» { 0' 1' }
NS_E_RDI_2492:
MTC_LB_2886:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2887
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' } 4' }
; 1' ⊢ °0◂{ { 2' 3' } 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2888
	bt QWORD [rdi],0
	jc LB_2889
	btr r12,5
	clc
	jmp LB_2890
LB_2889:
	bts r12,5
	stc
LB_2890:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2888:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2899
	btr r12,6
	clc
	jmp LB_2900
LB_2899:
	bts r12,6
	stc
LB_2900:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2893
	btr r12,4
	clc
	jmp LB_2894
LB_2893:
	bts r12,4
	stc
LB_2894:
	mov r8,r10
	bt r12,4
	jc LB_2891
	btr r12,2
	jmp LB_2892
LB_2891:
	bts r12,2
LB_2892:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2897
	btr r12,4
	clc
	jmp LB_2898
LB_2897:
	bts r12,4
	stc
LB_2898:
	mov r9,r10
	bt r12,4
	jc LB_2895
	btr r12,3
	jmp LB_2896
LB_2895:
	bts r12,3
LB_2896:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2903
	btr r12,6
	clc
	jmp LB_2904
LB_2903:
	bts r12,6
	stc
LB_2904:
	mov r10,rcx
	bt r12,6
	jc LB_2901
	btr r12,4
	jmp LB_2902
LB_2901:
	bts r12,4
LB_2902:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2905:
	cmp r15,0
	jz LB_2906
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2905
LB_2906:
; _f2492 { %_2493 %_2497 } ⊢ { %_2498 %_2499 } : { %_2498 %_2499 }
 ; {>  %_2497~4':(_p926)◂({ (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_2495~2':(_lst)◂((_p1946)◂(_stg)) %_2496~3':(_p1945)◂(_stg) %_2493~0':_r64 }
; _f2492 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2911
	btr r12,1
	jmp LB_2912
LB_2911:
	bts r12,1
LB_2912:
	push 39
	push LB_2913
	call NS_E_2492
LB_2913:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2909
	btr r12,3
	clc
	jmp LB_2910
LB_2909:
	bts r12,3
	stc
LB_2910:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2907
	btr r12,2
	clc
	jmp LB_2908
LB_2907:
	bts r12,2
	stc
LB_2908:
	add rsp,24
MTC_LB_2914:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2915
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °0◂4'
; 3' ⊢ °0◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_2916
	bt QWORD [rdi],0
	jc LB_2917
	btr r12,5
	clc
	jmp LB_2918
LB_2917:
	bts r12,5
	stc
LB_2918:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2916:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_2919
	btr r12,4
	jmp LB_2920
LB_2919:
	bts r12,4
LB_2920:
LB_2921:
	cmp r15,0
	jz LB_2922
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2921
LB_2922:
; _f2492 { %_2498 %_2500 } ⊢ { %_2501 %_2502 } : { %_2501 %_2502 }
 ; {>  %_2495~2':(_lst)◂((_p1946)◂(_stg)) %_2500~4':(_p926)◂({ (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_2499~1':_stg %_2498~0':_r64 }
; _f2492 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2927
	btr r12,1
	jmp LB_2928
LB_2927:
	bts r12,1
LB_2928:
	push 39
	push LB_2931
	call NS_E_2492
LB_2931:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_2929
	btr r12,3
	jmp LB_2930
LB_2929:
	bts r12,3
LB_2930:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2925
	btr r12,2
	clc
	jmp LB_2926
LB_2925:
	bts r12,2
	stc
LB_2926:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2923
	btr r12,1
	clc
	jmp LB_2924
LB_2923:
	bts r12,1
	stc
LB_2924:
	add rsp,24
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2932:
	cmp rax,0
	jz LB_2933
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2932
LB_2933:
; "\226\136\144 .. ;\n"
	mov rsi,0x_3b_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_2503 %_2506 }
 ; {>  %_2503~0':_r64 %_2495~2':(_lst)◂((_p1946)◂(_stg)) %_2504~1':_stg %_2506~4':_stg %_2505~3':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_2934
	mov rdi,r8
	call dlt
LB_2934:
	bt r12,1
	jc LB_2935
	mov rdi,r14
	call dlt
LB_2935:
	bt r12,3
	jc LB_2936
	mov rdi,r9
	call dlt
LB_2936:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2937
	btr r12,1
	jmp LB_2938
LB_2937:
	bts r12,1
LB_2938:
	ret
MTC_LB_2915:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2939
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °1◂{ 4' 5' }
; 3' ⊢ °1◂{ 4' 5' }
	btr r12,6
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_2940
	bt QWORD [rdi],0
	jc LB_2941
	btr r12,6
	clc
	jmp LB_2942
LB_2941:
	bts r12,6
	stc
LB_2942:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2940:
	mov rcx,rdi
; 6' ⊢ { 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_2945
	btr r12,7
	clc
	jmp LB_2946
LB_2945:
	bts r12,7
	stc
LB_2946:
	mov r10,rdx
	bt r12,7
	jc LB_2943
	btr r12,4
	jmp LB_2944
LB_2943:
	bts r12,4
LB_2944:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_2949
	btr r12,7
	clc
	jmp LB_2950
LB_2949:
	bts r12,7
	stc
LB_2950:
	mov r11,rdx
	bt r12,7
	jc LB_2947
	btr r12,5
	jmp LB_2948
LB_2947:
	bts r12,5
LB_2948:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2951:
	cmp r15,0
	jz LB_2952
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2951
LB_2952:
; _f2213 %_2507 ⊢ %_2509 : %_2509
 ; {>  %_2507~4':(_p1924)◂((_p1931)◂(_stg)) %_2508~5':(_p926)◂({ (_p1924)◂((_p1937)◂(_stg)) (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_2495~2':(_lst)◂((_p1946)◂(_stg)) %_2499~1':_stg %_2498~0':_r64 }
; _f2213 4' ⊢ 3'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_2961
	btr r12,0
	jmp LB_2962
LB_2961:
	bts r12,0
LB_2962:
	push 33
	push LB_2965
	call NS_E_2213
LB_2965:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_2963
	btr r12,3
	jmp LB_2964
LB_2963:
	bts r12,3
LB_2964:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_2959
	btr r12,5
	clc
	jmp LB_2960
LB_2959:
	bts r12,5
	stc
LB_2960:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_2957
	btr r12,2
	clc
	jmp LB_2958
LB_2957:
	bts r12,2
	stc
LB_2958:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2955
	btr r12,1
	clc
	jmp LB_2956
LB_2955:
	bts r12,1
	stc
LB_2956:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2953
	btr r12,0
	clc
	jmp LB_2954
LB_2953:
	bts r12,0
	stc
LB_2954:
	add rsp,40
; _f2551 { %_2498 %_2508 } ⊢ { %_2510 %_2511 } : { %_2510 %_2511 }
 ; {>  %_2508~5':(_p926)◂({ (_p1924)◂((_p1937)◂(_stg)) (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_2495~2':(_lst)◂((_p1946)◂(_stg)) %_2509~3':_stg %_2499~1':_stg %_2498~0':_r64 }
; _f2551 { 0' 5' } ⊢ { 0' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2972
	btr r12,1
	jmp LB_2973
LB_2972:
	bts r12,1
LB_2973:
	push 40
	push LB_2976
	call NS_E_2551
LB_2976:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 4' }
	mov r10,r14
	bt r12,1
	jc LB_2974
	btr r12,4
	jmp LB_2975
LB_2974:
	bts r12,4
LB_2975:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2970
	btr r12,3
	clc
	jmp LB_2971
LB_2970:
	bts r12,3
	stc
LB_2971:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2968
	btr r12,2
	clc
	jmp LB_2969
LB_2968:
	bts r12,2
	stc
LB_2969:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2966
	btr r12,1
	clc
	jmp LB_2967
LB_2966:
	bts r12,1
	stc
LB_2967:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r10
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r11,rax
	btr r12,5
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2977:
	cmp rax,0
	jz LB_2978
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2977
LB_2978:
; "\226\136\144 .. ; "
	mov rsi,0x_3b_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 1'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\226\138\162 \n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 3'
	push rcx
	mov rsi,r10
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_2512 %_2516 }
 ; {>  %_2515~4':_stg %_2495~2':(_lst)◂((_p1946)◂(_stg)) %_2512~0':_r64 %_2516~5':_stg %_2513~3':_stg %_2514~1':_stg }
; 	∎ { 0' 5' }
	bt r12,4
	jc LB_2979
	mov rdi,r10
	call dlt
LB_2979:
	bt r12,2
	jc LB_2980
	mov rdi,r8
	call dlt
LB_2980:
	bt r12,3
	jc LB_2981
	mov rdi,r9
	call dlt
LB_2981:
	bt r12,1
	jc LB_2982
	mov rdi,r14
	call dlt
LB_2982:
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_2983
	btr r12,1
	jmp LB_2984
LB_2983:
	bts r12,1
LB_2984:
	ret
MTC_LB_2939:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2985
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °2◂4'
; 3' ⊢ °2◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_2986
	bt QWORD [rdi],0
	jc LB_2987
	btr r12,5
	clc
	jmp LB_2988
LB_2987:
	bts r12,5
	stc
LB_2988:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2986:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_2989
	btr r12,4
	jmp LB_2990
LB_2989:
	bts r12,4
LB_2990:
LB_2991:
	cmp r15,0
	jz LB_2992
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2991
LB_2992:
; _f56 %_2498 ⊢ %_2518 : %_2518
 ; {>  %_2517~4':(_p1942)◂(_stg) %_2495~2':(_lst)◂((_p1946)◂(_stg)) %_2499~1':_stg %_2498~0':_r64 }
	add r13,1
; _f2410 { %_2518 %_2517 } ⊢ { %_2519 %_2520 } : { %_2519 %_2520 }
 ; {>  %_2517~4':(_p1942)◂(_stg) %_2518~0':_r64 %_2495~2':(_lst)◂((_p1946)◂(_stg)) %_2499~1':_stg }
; _f2410 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2997
	btr r12,1
	jmp LB_2998
LB_2997:
	bts r12,1
LB_2998:
	push 37
	push LB_3001
	call NS_E_2410
LB_3001:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_2999
	btr r12,3
	jmp LB_3000
LB_2999:
	bts r12,3
LB_3000:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2995
	btr r12,2
	clc
	jmp LB_2996
LB_2995:
	bts r12,2
	stc
LB_2996:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2993
	btr r12,1
	clc
	jmp LB_2994
LB_2993:
	bts r12,1
	stc
LB_2994:
	add rsp,24
; _f55 %_2519 ⊢ %_2521 : %_2521
 ; {>  %_2520~3':_stg %_2495~2':(_lst)◂((_p1946)◂(_stg)) %_2499~1':_stg %_2519~0':_r64 }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_3002:
	cmp rax,0
	jz LB_3003
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3002
LB_3003:
; "\226\136\144 .. .\n"
	mov rsi,0x_2e_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_2522 %_2525 }
 ; {>  %_2524~3':_stg %_2523~1':_stg %_2495~2':(_lst)◂((_p1946)◂(_stg)) %_2525~4':_stg %_2522~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_3004
	mov rdi,r9
	call dlt
LB_3004:
	bt r12,1
	jc LB_3005
	mov rdi,r14
	call dlt
LB_3005:
	bt r12,2
	jc LB_3006
	mov rdi,r8
	call dlt
LB_3006:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3007
	btr r12,1
	jmp LB_3008
LB_3007:
	bts r12,1
LB_3008:
	ret
MTC_LB_2985:
MTC_LB_2887:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3009
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' }
; 1' ⊢ °1◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_3010
	bt QWORD [rdi],0
	jc LB_3011
	btr r12,4
	clc
	jmp LB_3012
LB_3011:
	bts r12,4
	stc
LB_3012:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3010:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3015
	btr r12,5
	clc
	jmp LB_3016
LB_3015:
	bts r12,5
	stc
LB_3016:
	mov r8,r11
	bt r12,5
	jc LB_3013
	btr r12,2
	jmp LB_3014
LB_3013:
	bts r12,2
LB_3014:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3019
	btr r12,5
	clc
	jmp LB_3020
LB_3019:
	bts r12,5
	stc
LB_3020:
	mov r9,r11
	bt r12,5
	jc LB_3017
	btr r12,3
	jmp LB_3018
LB_3017:
	bts r12,3
LB_3018:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3021:
	cmp r15,0
	jz LB_3022
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3021
LB_3022:
MTC_LB_3023:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3024
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °0◂1'
; 3' ⊢ °0◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_3025
	bt QWORD [rdi],0
	jc LB_3026
	btr r12,4
	clc
	jmp LB_3027
LB_3026:
	bts r12,4
	stc
LB_3027:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3025:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_3028
	btr r12,1
	jmp LB_3029
LB_3028:
	bts r12,1
LB_3029:
LB_3030:
	cmp r15,0
	jz LB_3031
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3030
LB_3031:
; _f2492 { %_2493 %_2528 } ⊢ { %_2529 %_2530 } : { %_2529 %_2530 }
 ; {>  %_2526~2':(_lst)◂((_p1946)◂(_stg)) %_2528~1':(_p926)◂({ (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_2493~0':_r64 }
; _f2492 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	push 39
	push LB_3034
	call NS_E_2492
LB_3034:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3032
	btr r12,2
	clc
	jmp LB_3033
LB_3032:
	bts r12,2
	stc
LB_3033:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,10
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_3035:
	cmp rax,0
	jz LB_3036
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3035
LB_3036:
; "\226\136\144. .. .\n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_2531 %_2533 }
 ; {>  %_2526~2':(_lst)◂((_p1946)◂(_stg)) %_2533~3':_stg %_2531~0':_r64 %_2532~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_3037
	mov rdi,r8
	call dlt
LB_3037:
	bt r12,1
	jc LB_3038
	mov rdi,r14
	call dlt
LB_3038:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3039
	btr r12,1
	jmp LB_3040
LB_3039:
	bts r12,1
LB_3040:
	ret
MTC_LB_3024:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3041
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °1◂{ 1' 4' }
; 3' ⊢ °1◂{ 1' 4' }
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_3042
	bt QWORD [rdi],0
	jc LB_3043
	btr r12,5
	clc
	jmp LB_3044
LB_3043:
	bts r12,5
	stc
LB_3044:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3042:
	mov r11,rdi
; 5' ⊢ { 1' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3047
	btr r12,6
	clc
	jmp LB_3048
LB_3047:
	bts r12,6
	stc
LB_3048:
	mov r14,rcx
	bt r12,6
	jc LB_3045
	btr r12,1
	jmp LB_3046
LB_3045:
	bts r12,1
LB_3046:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3051
	btr r12,6
	clc
	jmp LB_3052
LB_3051:
	bts r12,6
	stc
LB_3052:
	mov r10,rcx
	bt r12,6
	jc LB_3049
	btr r12,4
	jmp LB_3050
LB_3049:
	bts r12,4
LB_3050:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3053:
	cmp r15,0
	jz LB_3054
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3053
LB_3054:
; _f2213 %_2534 ⊢ %_2536 : %_2536
 ; {>  %_2526~2':(_lst)◂((_p1946)◂(_stg)) %_2535~4':(_p926)◂({ (_p1924)◂((_p1937)◂(_stg)) (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_2534~1':(_p1924)◂((_p1931)◂(_stg)) %_2493~0':_r64 }
; _f2213 1' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3061
	btr r12,0
	jmp LB_3062
LB_3061:
	bts r12,0
LB_3062:
	push 33
	push LB_3065
	call NS_E_2213
LB_3065:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3063
	btr r12,1
	jmp LB_3064
LB_3063:
	bts r12,1
LB_3064:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3059
	btr r12,4
	clc
	jmp LB_3060
LB_3059:
	bts r12,4
	stc
LB_3060:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3057
	btr r12,2
	clc
	jmp LB_3058
LB_3057:
	bts r12,2
	stc
LB_3058:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3055
	btr r12,0
	clc
	jmp LB_3056
LB_3055:
	bts r12,0
	stc
LB_3056:
	add rsp,32
; _f2551 { %_2493 %_2535 } ⊢ { %_2537 %_2538 } : { %_2537 %_2538 }
 ; {>  %_2536~1':_stg %_2526~2':(_lst)◂((_p1946)◂(_stg)) %_2535~4':(_p926)◂({ (_p1924)◂((_p1937)◂(_stg)) (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_2493~0':_r64 }
; _f2551 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3070
	btr r12,1
	jmp LB_3071
LB_3070:
	bts r12,1
LB_3071:
	push 40
	push LB_3074
	call NS_E_2551
LB_3074:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_3072
	btr r12,3
	jmp LB_3073
LB_3072:
	bts r12,3
LB_3073:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3068
	btr r12,2
	clc
	jmp LB_3069
LB_3068:
	bts r12,2
	stc
LB_3069:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3066
	btr r12,1
	clc
	jmp LB_3067
LB_3066:
	bts r12,1
	stc
LB_3067:
	add rsp,24
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_3075:
	cmp rax,0
	jz LB_3076
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3075
LB_3076:
; "\226\136\144 .. ; "
	mov rsi,0x_3b_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\226\138\162 \n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_2539 %_2542 }
 ; {>  %_2526~2':(_lst)◂((_p1946)◂(_stg)) %_2540~1':_stg %_2539~0':_r64 %_2542~4':_stg %_2541~3':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_3077
	mov rdi,r8
	call dlt
LB_3077:
	bt r12,1
	jc LB_3078
	mov rdi,r14
	call dlt
LB_3078:
	bt r12,3
	jc LB_3079
	mov rdi,r9
	call dlt
LB_3079:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3080
	btr r12,1
	jmp LB_3081
LB_3080:
	bts r12,1
LB_3081:
	ret
MTC_LB_3041:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,2
	jnz MTC_LB_3082
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °2◂1'
; 3' ⊢ °2◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_3083
	bt QWORD [rdi],0
	jc LB_3084
	btr r12,4
	clc
	jmp LB_3085
LB_3084:
	bts r12,4
	stc
LB_3085:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3083:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_3086
	btr r12,1
	jmp LB_3087
LB_3086:
	bts r12,1
LB_3087:
LB_3088:
	cmp r15,0
	jz LB_3089
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3088
LB_3089:
; _f56 %_2493 ⊢ %_2544 : %_2544
 ; {>  %_2526~2':(_lst)◂((_p1946)◂(_stg)) %_2493~0':_r64 %_2543~1':(_p1942)◂(_stg) }
	add r13,1
; _f2410 { %_2544 %_2543 } ⊢ { %_2545 %_2546 } : { %_2545 %_2546 }
 ; {>  %_2526~2':(_lst)◂((_p1946)◂(_stg)) %_2544~0':_r64 %_2543~1':(_p1942)◂(_stg) }
; _f2410 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	push 37
	push LB_3092
	call NS_E_2410
LB_3092:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3090
	btr r12,2
	clc
	jmp LB_3091
LB_3090:
	bts r12,2
	stc
LB_3091:
	add rsp,16
; _f55 %_2545 ⊢ %_2547 : %_2547
 ; {>  %_2545~0':_r64 %_2526~2':(_lst)◂((_p1946)◂(_stg)) %_2546~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,10
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_3093:
	cmp rax,0
	jz LB_3094
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3093
LB_3094:
; "\226\136\144. .. .\n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_2548 %_2550 }
 ; {>  %_2526~2':(_lst)◂((_p1946)◂(_stg)) %_2550~3':_stg %_2549~1':_stg %_2548~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_3095
	mov rdi,r8
	call dlt
LB_3095:
	bt r12,1
	jc LB_3096
	mov rdi,r14
	call dlt
LB_3096:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3097
	btr r12,1
	jmp LB_3098
LB_3097:
	bts r12,1
LB_3098:
	ret
MTC_LB_3082:
MTC_LB_3009:
NS_E_2450:
; 	|» { 0' 1' }
NS_E_RDI_2450:
MTC_LB_3099:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3100
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' 4' }
; 1' ⊢ °0◂{ 2' 3' 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_3101
	bt QWORD [rdi],0
	jc LB_3102
	btr r12,5
	clc
	jmp LB_3103
LB_3102:
	bts r12,5
	stc
LB_3103:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3101:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3106
	btr r12,6
	clc
	jmp LB_3107
LB_3106:
	bts r12,6
	stc
LB_3107:
	mov r8,rcx
	bt r12,6
	jc LB_3104
	btr r12,2
	jmp LB_3105
LB_3104:
	bts r12,2
LB_3105:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3110
	btr r12,6
	clc
	jmp LB_3111
LB_3110:
	bts r12,6
	stc
LB_3111:
	mov r9,rcx
	bt r12,6
	jc LB_3108
	btr r12,3
	jmp LB_3109
LB_3108:
	bts r12,3
LB_3109:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_3114
	btr r12,6
	clc
	jmp LB_3115
LB_3114:
	bts r12,6
	stc
LB_3115:
	mov r10,rcx
	bt r12,6
	jc LB_3112
	btr r12,4
	jmp LB_3113
LB_3112:
	bts r12,4
LB_3113:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3116:
	cmp r15,0
	jz LB_3117
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3116
LB_3117:
; _f2213 %_2454 ⊢ %_2456 : %_2456
 ; {>  %_2455~4':(_p1924)◂((_p1932)◂(_stg)) %_2451~0':_r64 %_2454~3':(_p1924)◂((_p1931)◂(_stg)) %_2453~2':_p1878 }
; _f2213 3' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_3124
	btr r12,0
	jmp LB_3125
LB_3124:
	bts r12,0
LB_3125:
	push 33
	push LB_3128
	call NS_E_2213
LB_3128:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3126
	btr r12,1
	jmp LB_3127
LB_3126:
	bts r12,1
LB_3127:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3122
	btr r12,4
	clc
	jmp LB_3123
LB_3122:
	bts r12,4
	stc
LB_3123:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3120
	btr r12,2
	clc
	jmp LB_3121
LB_3120:
	bts r12,2
	stc
LB_3121:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3118
	btr r12,0
	clc
	jmp LB_3119
LB_3118:
	bts r12,0
	stc
LB_3119:
	add rsp,32
; _f2235 %_2455 ⊢ %_2457 : %_2457
 ; {>  %_2455~4':(_p1924)◂((_p1932)◂(_stg)) %_2451~0':_r64 %_2456~1':_stg %_2453~2':_p1878 }
; _f2235 4' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_3135
	btr r12,0
	jmp LB_3136
LB_3135:
	bts r12,0
LB_3136:
	push 35
	push LB_3139
	call NS_E_2235
LB_3139:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_3137
	btr r12,3
	jmp LB_3138
LB_3137:
	bts r12,3
LB_3138:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_3133
	btr r12,2
	clc
	jmp LB_3134
LB_3133:
	bts r12,2
	stc
LB_3134:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_3131
	btr r12,1
	clc
	jmp LB_3132
LB_3131:
	bts r12,1
	stc
LB_3132:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3129
	btr r12,0
	clc
	jmp LB_3130
LB_3129:
	bts r12,0
	stc
LB_3130:
	add rsp,32
; _f1881 %_2453 ⊢ %_2458 : %_2458
 ; {>  %_2451~0':_r64 %_2457~3':_stg %_2456~1':_stg %_2453~2':_p1878 }
; _f1881 2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3146
	btr r12,0
	jmp LB_3147
LB_3146:
	bts r12,0
LB_3147:
	push 29
	push LB_3150
	call NS_E_1881
LB_3150:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_3148
	btr r12,2
	jmp LB_3149
LB_3148:
	bts r12,2
LB_3149:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_3144
	btr r12,3
	clc
	jmp LB_3145
LB_3144:
	bts r12,3
	stc
LB_3145:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_3142
	btr r12,1
	clc
	jmp LB_3143
LB_3142:
	bts r12,1
	stc
LB_3143:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3140
	btr r12,0
	clc
	jmp LB_3141
LB_3140:
	bts r12,0
	stc
LB_3141:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_3151:
	cmp rax,0
	jz LB_3152
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3151
LB_3152:
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	add rsp,0
; ∎ { %_2459 %_2463 }
 ; {>  %_2461~1':_stg %_2459~0':_r64 %_2463~4':_stg %_2460~2':_stg %_2462~3':_stg }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_3153
	mov rdi,r14
	call dlt
LB_3153:
	bt r12,2
	jc LB_3154
	mov rdi,r8
	call dlt
LB_3154:
	bt r12,3
	jc LB_3155
	mov rdi,r9
	call dlt
LB_3155:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3156
	btr r12,1
	jmp LB_3157
LB_3156:
	bts r12,1
LB_3157:
	ret
MTC_LB_3100:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3158
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' 4' }
; 1' ⊢ °1◂{ 2' 3' 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_3159
	bt QWORD [rdi],0
	jc LB_3160
	btr r12,5
	clc
	jmp LB_3161
LB_3160:
	bts r12,5
	stc
LB_3161:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3159:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3164
	btr r12,6
	clc
	jmp LB_3165
LB_3164:
	bts r12,6
	stc
LB_3165:
	mov r8,rcx
	bt r12,6
	jc LB_3162
	btr r12,2
	jmp LB_3163
LB_3162:
	bts r12,2
LB_3163:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3168
	btr r12,6
	clc
	jmp LB_3169
LB_3168:
	bts r12,6
	stc
LB_3169:
	mov r9,rcx
	bt r12,6
	jc LB_3166
	btr r12,3
	jmp LB_3167
LB_3166:
	bts r12,3
LB_3167:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_3172
	btr r12,6
	clc
	jmp LB_3173
LB_3172:
	bts r12,6
	stc
LB_3173:
	mov r10,rcx
	bt r12,6
	jc LB_3170
	btr r12,4
	jmp LB_3171
LB_3170:
	bts r12,4
LB_3171:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3174:
	cmp r15,0
	jz LB_3175
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3174
LB_3175:
; _f1926 %_2464 ⊢ %_2467 : %_2467
 ; {>  %_2451~0':_r64 %_2464~2':(_p1931)◂(_stg) %_2466~4':(_p1924)◂((_p1932)◂(_stg)) %_2465~3':(_p1924)◂((_p1931)◂(_stg)) }
; _f1926 2' ⊢ °1◂2'
; _f2213 %_2467 ⊢ %_2468 : %_2468
 ; {>  %_2467~°1◂2':(_p1924)◂((_p1931)◂(_stg)) %_2451~0':_r64 %_2466~4':(_p1924)◂((_p1932)◂(_stg)) %_2465~3':(_p1924)◂((_p1931)◂(_stg)) }
; _f2213 °1◂2' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},°1◂2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3184
	btr r12,0
	jmp LB_3185
LB_3184:
	bts r12,0
LB_3185:
	mov rsi,1
	bt r12,0
	jc LB_3182
	mov rsi,0
	bt r13,0
	jc LB_3182
	jmp LB_3183
LB_3182:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_3183:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	push 33
	push LB_3188
	call NS_E_2213
LB_3188:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3186
	btr r12,1
	jmp LB_3187
LB_3186:
	bts r12,1
LB_3187:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3180
	btr r12,4
	clc
	jmp LB_3181
LB_3180:
	bts r12,4
	stc
LB_3181:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3178
	btr r12,3
	clc
	jmp LB_3179
LB_3178:
	bts r12,3
	stc
LB_3179:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3176
	btr r12,0
	clc
	jmp LB_3177
LB_3176:
	bts r12,0
	stc
LB_3177:
	add rsp,32
; _f2213 %_2465 ⊢ %_2469 : %_2469
 ; {>  %_2451~0':_r64 %_2468~1':_stg %_2466~4':(_p1924)◂((_p1932)◂(_stg)) %_2465~3':(_p1924)◂((_p1931)◂(_stg)) }
; _f2213 3' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_3195
	btr r12,0
	jmp LB_3196
LB_3195:
	bts r12,0
LB_3196:
	push 33
	push LB_3199
	call NS_E_2213
LB_3199:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_3197
	btr r12,2
	jmp LB_3198
LB_3197:
	bts r12,2
LB_3198:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3193
	btr r12,4
	clc
	jmp LB_3194
LB_3193:
	bts r12,4
	stc
LB_3194:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_3191
	btr r12,1
	clc
	jmp LB_3192
LB_3191:
	bts r12,1
	stc
LB_3192:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3189
	btr r12,0
	clc
	jmp LB_3190
LB_3189:
	bts r12,0
	stc
LB_3190:
	add rsp,32
; _f2235 %_2466 ⊢ %_2470 : %_2470
 ; {>  %_2469~2':_stg %_2451~0':_r64 %_2468~1':_stg %_2466~4':(_p1924)◂((_p1932)◂(_stg)) }
; _f2235 4' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_3206
	btr r12,0
	jmp LB_3207
LB_3206:
	bts r12,0
LB_3207:
	push 35
	push LB_3210
	call NS_E_2235
LB_3210:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_3208
	btr r12,3
	jmp LB_3209
LB_3208:
	bts r12,3
LB_3209:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_3204
	btr r12,2
	clc
	jmp LB_3205
LB_3204:
	bts r12,2
	stc
LB_3205:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_3202
	btr r12,1
	clc
	jmp LB_3203
LB_3202:
	bts r12,1
	stc
LB_3203:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3200
	btr r12,0
	clc
	jmp LB_3201
LB_3200:
	bts r12,0
	stc
LB_3201:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,4
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_3211:
	cmp rax,0
	jz LB_3212
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3211
LB_3212:
; "\226\151\130 "
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_97
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_82
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ","
	mov rsi,0x_2c
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	add rsp,0
; ∎ { %_2471 %_2475 }
 ; {>  %_2473~2':_stg %_2475~4':_stg %_2474~3':_stg %_2471~0':_r64 %_2472~1':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_3213
	mov rdi,r8
	call dlt
LB_3213:
	bt r12,3
	jc LB_3214
	mov rdi,r9
	call dlt
LB_3214:
	bt r12,1
	jc LB_3215
	mov rdi,r14
	call dlt
LB_3215:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3216
	btr r12,1
	jmp LB_3217
LB_3216:
	bts r12,1
LB_3217:
	ret
MTC_LB_3158:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_3218
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂{ 2' 3' 4' }
; 1' ⊢ °2◂{ 2' 3' 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_3219
	bt QWORD [rdi],0
	jc LB_3220
	btr r12,5
	clc
	jmp LB_3221
LB_3220:
	bts r12,5
	stc
LB_3221:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3219:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3224
	btr r12,6
	clc
	jmp LB_3225
LB_3224:
	bts r12,6
	stc
LB_3225:
	mov r8,rcx
	bt r12,6
	jc LB_3222
	btr r12,2
	jmp LB_3223
LB_3222:
	bts r12,2
LB_3223:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3228
	btr r12,6
	clc
	jmp LB_3229
LB_3228:
	bts r12,6
	stc
LB_3229:
	mov r9,rcx
	bt r12,6
	jc LB_3226
	btr r12,3
	jmp LB_3227
LB_3226:
	bts r12,3
LB_3227:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_3232
	btr r12,6
	clc
	jmp LB_3233
LB_3232:
	bts r12,6
	stc
LB_3233:
	mov r10,rcx
	bt r12,6
	jc LB_3230
	btr r12,4
	jmp LB_3231
LB_3230:
	bts r12,4
LB_3231:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3234:
	cmp r15,0
	jz LB_3235
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3234
LB_3235:
; _f2213 %_2477 ⊢ %_2479 : %_2479
 ; {>  %_2451~0':_r64 %_2476~2':_p1927 %_2477~3':(_p1924)◂((_p1931)◂(_stg)) %_2478~4':(_p1924)◂((_p1932)◂(_stg)) }
; _f2213 3' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_3242
	btr r12,0
	jmp LB_3243
LB_3242:
	bts r12,0
LB_3243:
	push 33
	push LB_3246
	call NS_E_2213
LB_3246:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3244
	btr r12,1
	jmp LB_3245
LB_3244:
	bts r12,1
LB_3245:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3240
	btr r12,4
	clc
	jmp LB_3241
LB_3240:
	bts r12,4
	stc
LB_3241:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3238
	btr r12,2
	clc
	jmp LB_3239
LB_3238:
	bts r12,2
	stc
LB_3239:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3236
	btr r12,0
	clc
	jmp LB_3237
LB_3236:
	bts r12,0
	stc
LB_3237:
	add rsp,32
; _f2235 %_2478 ⊢ %_2480 : %_2480
 ; {>  %_2479~1':_stg %_2451~0':_r64 %_2476~2':_p1927 %_2478~4':(_p1924)◂((_p1932)◂(_stg)) }
; _f2235 4' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_3253
	btr r12,0
	jmp LB_3254
LB_3253:
	bts r12,0
LB_3254:
	push 35
	push LB_3257
	call NS_E_2235
LB_3257:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_3255
	btr r12,3
	jmp LB_3256
LB_3255:
	bts r12,3
LB_3256:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_3251
	btr r12,2
	clc
	jmp LB_3252
LB_3251:
	bts r12,2
	stc
LB_3252:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_3249
	btr r12,1
	clc
	jmp LB_3250
LB_3249:
	bts r12,1
	stc
LB_3250:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3247
	btr r12,0
	clc
	jmp LB_3248
LB_3247:
	bts r12,0
	stc
LB_3248:
	add rsp,32
; _f2032 %_2476 ⊢ %_2481 : %_2481
 ; {>  %_2479~1':_stg %_2451~0':_r64 %_2476~2':_p1927 %_2480~3':_stg }
; _f2032 2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3264
	btr r12,0
	jmp LB_3265
LB_3264:
	bts r12,0
LB_3265:
	push 30
	push LB_3268
	call NS_E_2032
LB_3268:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_3266
	btr r12,2
	jmp LB_3267
LB_3266:
	bts r12,2
LB_3267:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_3262
	btr r12,3
	clc
	jmp LB_3263
LB_3262:
	bts r12,3
	stc
LB_3263:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_3260
	btr r12,1
	clc
	jmp LB_3261
LB_3260:
	bts r12,1
	stc
LB_3261:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3258
	btr r12,0
	clc
	jmp LB_3259
LB_3258:
	bts r12,0
	stc
LB_3259:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_3269:
	cmp rax,0
	jz LB_3270
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3269
LB_3270:
; "\194\187 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_bb
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	add rsp,0
; ∎ { %_2482 %_2486 }
 ; {>  %_2485~3':_stg %_2484~1':_stg %_2482~0':_r64 %_2486~4':_stg %_2483~2':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_3271
	mov rdi,r9
	call dlt
LB_3271:
	bt r12,1
	jc LB_3272
	mov rdi,r14
	call dlt
LB_3272:
	bt r12,2
	jc LB_3273
	mov rdi,r8
	call dlt
LB_3273:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3274
	btr r12,1
	jmp LB_3275
LB_3274:
	bts r12,1
LB_3275:
	ret
MTC_LB_3218:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_3276
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °3◂{ 2' 3' 4' }
; 1' ⊢ °3◂{ 2' 3' 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_3277
	bt QWORD [rdi],0
	jc LB_3278
	btr r12,5
	clc
	jmp LB_3279
LB_3278:
	bts r12,5
	stc
LB_3279:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3277:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3282
	btr r12,6
	clc
	jmp LB_3283
LB_3282:
	bts r12,6
	stc
LB_3283:
	mov r8,rcx
	bt r12,6
	jc LB_3280
	btr r12,2
	jmp LB_3281
LB_3280:
	bts r12,2
LB_3281:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3286
	btr r12,6
	clc
	jmp LB_3287
LB_3286:
	bts r12,6
	stc
LB_3287:
	mov r9,rcx
	bt r12,6
	jc LB_3284
	btr r12,3
	jmp LB_3285
LB_3284:
	bts r12,3
LB_3285:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_3290
	btr r12,6
	clc
	jmp LB_3291
LB_3290:
	bts r12,6
	stc
LB_3291:
	mov r10,rcx
	bt r12,6
	jc LB_3288
	btr r12,4
	jmp LB_3289
LB_3288:
	bts r12,4
LB_3289:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3292:
	cmp r15,0
	jz LB_3293
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3292
LB_3293:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,8
	add rax,7
	add rax,1
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_3294:
	cmp rax,0
	jz LB_3295
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3294
LB_3295:
; "\194\187 _^ .."
	mov rsi,0x_2e_2e_20_5e_5f_20_bb_c2
	mov QWORD [rdi+8*0],rsi
	add rdi,8
; " \226\138\162 .."
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; " .. //\n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2f
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2f
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
	add rsp,0
; ∎ { %_2490 %_2491 }
 ; {>  %_2490~0':_r64 %_2488~3':(_lst)◂((_p1931)◂(_stg)) %_2489~4':(_lst)◂((_p1932)◂(_stg)) %_2487~2':(_lst)◂(_p1948) %_2491~1':_stg }
; 	∎ { 0' 1' }
	bt r12,3
	jc LB_3296
	mov rdi,r9
	call dlt
LB_3296:
	bt r12,4
	jc LB_3297
	mov rdi,r10
	call dlt
LB_3297:
	bt r12,2
	jc LB_3298
	mov rdi,r8
	call dlt
LB_3298:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3276:
NS_E_2410:
; 	|» { 0' 1' }
NS_E_RDI_2410:
MTC_LB_3299:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3300
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_3301
	bt QWORD [rdi],0
	jc LB_3302
	btr r12,4
	clc
	jmp LB_3303
LB_3302:
	bts r12,4
	stc
LB_3303:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3301:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3306
	btr r12,5
	clc
	jmp LB_3307
LB_3306:
	bts r12,5
	stc
LB_3307:
	mov r8,r11
	bt r12,5
	jc LB_3304
	btr r12,2
	jmp LB_3305
LB_3304:
	bts r12,2
LB_3305:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3310
	btr r12,5
	clc
	jmp LB_3311
LB_3310:
	bts r12,5
	stc
LB_3311:
	mov r9,r11
	bt r12,5
	jc LB_3308
	btr r12,3
	jmp LB_3309
LB_3308:
	bts r12,3
LB_3309:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3312:
	cmp r15,0
	jz LB_3313
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3312
LB_3313:
; _f2450 { %_2411 %_2413 } ⊢ { %_2415 %_2416 } : { %_2415 %_2416 }
 ; {>  %_2414~3':(_p1942)◂(_stg) %_2413~2':(_p1944)◂(_stg) %_2411~0':_r64 }
; _f2450 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3316
	btr r12,1
	jmp LB_3317
LB_3316:
	bts r12,1
LB_3317:
	push 38
	push LB_3318
	call NS_E_2450
LB_3318:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_3314
	btr r12,3
	clc
	jmp LB_3315
LB_3314:
	bts r12,3
	stc
LB_3315:
	add rsp,16
; _f2410 { %_2415 %_2414 } ⊢ { %_2417 %_2418 } : { %_2417 %_2418 }
 ; {>  %_2414~3':(_p1942)◂(_stg) %_2415~0':_r64 %_2416~1':_stg }
; _f2410 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3321
	btr r12,1
	jmp LB_3322
LB_3321:
	bts r12,1
LB_3322:
	push 37
	push LB_3325
	call NS_E_2410
LB_3325:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_3323
	btr r12,2
	jmp LB_3324
LB_3323:
	bts r12,2
LB_3324:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3319
	btr r12,1
	clc
	jmp LB_3320
LB_3319:
	bts r12,1
	stc
LB_3320:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_2417 %_2421 }
 ; {>  %_2421~3':_stg %_2419~1':_stg %_2420~2':_stg %_2417~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_3326
	mov rdi,r14
	call dlt
LB_3326:
	bt r12,2
	jc LB_3327
	mov rdi,r8
	call dlt
LB_3327:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3328
	btr r12,1
	jmp LB_3329
LB_3328:
	bts r12,1
LB_3329:
	ret
MTC_LB_3300:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3330
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_3331
	bt QWORD [rdi],0
	jc LB_3332
	btr r12,3
	clc
	jmp LB_3333
LB_3332:
	bts r12,3
	stc
LB_3333:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3331:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3334
	btr r12,2
	jmp LB_3335
LB_3334:
	bts r12,2
LB_3335:
LB_3336:
	cmp r15,0
	jz LB_3337
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3336
LB_3337:
; _f2492 { %_2411 %_2422 } ⊢ { %_2423 %_2424 } : { %_2423 %_2424 }
 ; {>  %_2411~0':_r64 %_2422~2':(_p926)◂({ (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) }
; _f2492 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3338
	btr r12,1
	jmp LB_3339
LB_3338:
	bts r12,1
LB_3339:
	push 39
	push LB_3340
	call NS_E_2492
LB_3340:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_2423 %_2424 }
 ; {>  %_2424~1':_stg %_2423~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3330:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_3341
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂{ 2' 3' }
; 1' ⊢ °2◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_3342
	bt QWORD [rdi],0
	jc LB_3343
	btr r12,4
	clc
	jmp LB_3344
LB_3343:
	bts r12,4
	stc
LB_3344:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3342:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3347
	btr r12,5
	clc
	jmp LB_3348
LB_3347:
	bts r12,5
	stc
LB_3348:
	mov r8,r11
	bt r12,5
	jc LB_3345
	btr r12,2
	jmp LB_3346
LB_3345:
	bts r12,2
LB_3346:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3351
	btr r12,5
	clc
	jmp LB_3352
LB_3351:
	bts r12,5
	stc
LB_3352:
	mov r9,r11
	bt r12,5
	jc LB_3349
	btr r12,3
	jmp LB_3350
LB_3349:
	bts r12,3
LB_3350:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3353:
	cmp r15,0
	jz LB_3354
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3353
LB_3354:
; _f2213 %_2425 ⊢ %_2427 : %_2427
 ; {>  %_2425~2':(_p1924)◂((_p1931)◂(_stg)) %_2426~3':(_p1943)◂(_stg) %_2411~0':_r64 }
; _f2213 2' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3359
	btr r12,0
	jmp LB_3360
LB_3359:
	bts r12,0
LB_3360:
	push 33
	push LB_3363
	call NS_E_2213
LB_3363:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3361
	btr r12,1
	jmp LB_3362
LB_3361:
	bts r12,1
LB_3362:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3357
	btr r12,3
	clc
	jmp LB_3358
LB_3357:
	bts r12,3
	stc
LB_3358:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3355
	btr r12,0
	clc
	jmp LB_3356
LB_3355:
	bts r12,0
	stc
LB_3356:
	add rsp,24
MTC_LB_3364:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3365
; _emt_mov_ptn_to_ptn:{| 11010.. |},3' ⊢ °1◂{ 2' 4' }
; 3' ⊢ °1◂{ 2' 4' }
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_3366
	bt QWORD [rdi],0
	jc LB_3367
	btr r12,5
	clc
	jmp LB_3368
LB_3367:
	bts r12,5
	stc
LB_3368:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3366:
	mov r11,rdi
; 5' ⊢ { 2' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3371
	btr r12,6
	clc
	jmp LB_3372
LB_3371:
	bts r12,6
	stc
LB_3372:
	mov r8,rcx
	bt r12,6
	jc LB_3369
	btr r12,2
	jmp LB_3370
LB_3369:
	bts r12,2
LB_3370:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3375
	btr r12,6
	clc
	jmp LB_3376
LB_3375:
	bts r12,6
	stc
LB_3376:
	mov r10,rcx
	bt r12,6
	jc LB_3373
	btr r12,4
	jmp LB_3374
LB_3373:
	bts r12,4
LB_3374:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3377:
	cmp r15,0
	jz LB_3378
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3377
LB_3378:
; _f2244 %_2428 ⊢ %_2430 : %_2430
 ; {>  %_2429~4':(_p1942)◂(_stg) %_2411~0':_r64 %_2428~2':(_lst)◂((_p1924)◂((_p1932)◂(_stg))) %_2427~1':_stg }
; _f2244 2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3385
	btr r12,0
	jmp LB_3386
LB_3385:
	bts r12,0
LB_3386:
	push 36
	push LB_3389
	call NS_E_2244
LB_3389:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_3387
	btr r12,2
	jmp LB_3388
LB_3387:
	bts r12,2
LB_3388:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3383
	btr r12,4
	clc
	jmp LB_3384
LB_3383:
	bts r12,4
	stc
LB_3384:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_3381
	btr r12,1
	clc
	jmp LB_3382
LB_3381:
	bts r12,1
	stc
LB_3382:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3379
	btr r12,0
	clc
	jmp LB_3380
LB_3379:
	bts r12,0
	stc
LB_3380:
	add rsp,32
; _f2410 { %_2411 %_2429 } ⊢ { %_2431 %_2432 } : { %_2431 %_2432 }
 ; {>  %_2429~4':(_p1942)◂(_stg) %_2411~0':_r64 %_2430~2':_stg %_2427~1':_stg }
; _f2410 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3394
	btr r12,1
	jmp LB_3395
LB_3394:
	bts r12,1
LB_3395:
	push 37
	push LB_3398
	call NS_E_2410
LB_3398:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_3396
	btr r12,3
	jmp LB_3397
LB_3396:
	bts r12,3
LB_3397:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3392
	btr r12,2
	clc
	jmp LB_3393
LB_3392:
	bts r12,2
	stc
LB_3393:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3390
	btr r12,1
	clc
	jmp LB_3391
LB_3390:
	bts r12,1
	stc
LB_3391:
	add rsp,24
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_3399:
	cmp rax,0
	jz LB_3400
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3399
LB_3400:
; "$ "
	mov rsi,0x_24
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_2433 %_2437 }
 ; {>  %_2437~4':_stg %_2436~3':_stg %_2435~2':_stg %_2433~0':_r64 %_2434~1':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_3401
	mov rdi,r9
	call dlt
LB_3401:
	bt r12,2
	jc LB_3402
	mov rdi,r8
	call dlt
LB_3402:
	bt r12,1
	jc LB_3403
	mov rdi,r14
	call dlt
LB_3403:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3404
	btr r12,1
	jmp LB_3405
LB_3404:
	bts r12,1
LB_3405:
	ret
MTC_LB_3365:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3406
; _emt_mov_ptn_to_ptn:{| 11010.. |},3' ⊢ °0◂2'
; 3' ⊢ °0◂2'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_3407
	bt QWORD [rdi],0
	jc LB_3408
	btr r12,4
	clc
	jmp LB_3409
LB_3408:
	bts r12,4
	stc
LB_3409:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3407:
	mov r10,rdi
	mov r8,r10
	bt r12,4
	jc LB_3410
	btr r12,2
	jmp LB_3411
LB_3410:
	bts r12,2
LB_3411:
LB_3412:
	cmp r15,0
	jz LB_3413
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3412
LB_3413:
; _f2551 { %_2411 %_2438 } ⊢ { %_2439 %_2440 } : { %_2439 %_2440 }
 ; {>  %_2438~2':(_p926)◂({ (_p1924)◂((_p1937)◂(_stg)) (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_2411~0':_r64 %_2427~1':_stg }
; _f2551 { 0' 2' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3416
	btr r12,1
	jmp LB_3417
LB_3416:
	bts r12,1
LB_3417:
	push 40
	push LB_3420
	call NS_E_2551
LB_3420:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_3418
	btr r12,2
	jmp LB_3419
LB_3418:
	bts r12,2
LB_3419:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3414
	btr r12,1
	clc
	jmp LB_3415
LB_3414:
	bts r12,1
	stc
LB_3415:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_3421:
	cmp rax,0
	jz LB_3422
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3421
LB_3422:
; "$ "
	mov rsi,0x_24
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162\n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_2441 %_2444 }
 ; {>  %_2444~3':_stg %_2443~2':_stg %_2441~0':_r64 %_2442~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_3423
	mov rdi,r8
	call dlt
LB_3423:
	bt r12,1
	jc LB_3424
	mov rdi,r14
	call dlt
LB_3424:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3425
	btr r12,1
	jmp LB_3426
LB_3425:
	bts r12,1
LB_3426:
	ret
MTC_LB_3406:
MTC_LB_3341:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_3427
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °3◂2'
; 1' ⊢ °3◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_3428
	bt QWORD [rdi],0
	jc LB_3429
	btr r12,3
	clc
	jmp LB_3430
LB_3429:
	bts r12,3
	stc
LB_3430:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3428:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3431
	btr r12,2
	jmp LB_3432
LB_3431:
	bts r12,2
LB_3432:
LB_3433:
	cmp r15,0
	jz LB_3434
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3433
LB_3434:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_3435:
	cmp rax,0
	jz LB_3436
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3435
LB_3436:
; "\226\136\142 ..\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
	add rsp,0
; ∎ { %_2446 %_2447 }
 ; {>  %_2446~0':_r64 %_2447~1':_stg %_2445~2':(_p1924)◂((_p1931)◂(_stg)) }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_3437
	mov rdi,r8
	call dlt
LB_3437:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3427:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_3438
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °4◂{  }
; 1' ⊢ °4◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_3439
	bt QWORD [rdi],0
	jc LB_3440
	btr r12,2
	clc
	jmp LB_3441
LB_3440:
	bts r12,2
	stc
LB_3441:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3439:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3442:
	cmp r15,0
	jz LB_3443
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3442
LB_3443:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,5
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_3444:
	cmp rax,0
	jz LB_3445
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3444
LB_3445:
; "\226\136\142|\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_7c
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
	add rsp,0
; ∎ { %_2448 %_2449 }
 ; {>  %_2448~0':_r64 %_2449~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3438:
NS_E_3744:
; 	|» { 0' 1' }
NS_E_RDI_3744:
MTC_LB_3765:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3766
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' 4' } 5' }
; 1' ⊢ °0◂{ { 2' 3' 4' } 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_3767
	bt QWORD [rdi],0
	jc LB_3768
	btr r12,6
	clc
	jmp LB_3769
LB_3768:
	bts r12,6
	stc
LB_3769:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3767:
	mov rcx,rdi
; 6' ⊢ { { 2' 3' 4' } 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_3782
	btr r12,7
	clc
	jmp LB_3783
LB_3782:
	bts r12,7
	stc
LB_3783:
; 7' ⊢ { 2' 3' 4' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3772
	btr r12,5
	clc
	jmp LB_3773
LB_3772:
	bts r12,5
	stc
LB_3773:
	mov r8,r11
	bt r12,5
	jc LB_3770
	btr r12,2
	jmp LB_3771
LB_3770:
	bts r12,2
LB_3771:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3776
	btr r12,5
	clc
	jmp LB_3777
LB_3776:
	bts r12,5
	stc
LB_3777:
	mov r9,r11
	bt r12,5
	jc LB_3774
	btr r12,3
	jmp LB_3775
LB_3774:
	bts r12,3
LB_3775:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_3780
	btr r12,5
	clc
	jmp LB_3781
LB_3780:
	bts r12,5
	stc
LB_3781:
	mov r10,r11
	bt r12,5
	jc LB_3778
	btr r12,4
	jmp LB_3779
LB_3778:
	bts r12,4
LB_3779:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_3786
	btr r12,7
	clc
	jmp LB_3787
LB_3786:
	bts r12,7
	stc
LB_3787:
	mov r11,rdx
	bt r12,7
	jc LB_3784
	btr r12,5
	jmp LB_3785
LB_3784:
	bts r12,5
LB_3785:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3788:
	cmp r15,0
	jz LB_3789
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3788
LB_3789:
; _f2235 %_3748 ⊢ %_3751 : %_3751
 ; {>  %_3750~5':(_lst)◂({ _stg (_p1924)◂((_p1932)◂(_stg)) (_p1942)◂(_stg) }) %_3747~2':_stg %_3749~4':(_p1942)◂(_stg) %_3745~0':_r64 %_3748~3':(_p1924)◂((_p1932)◂(_stg)) }
; _f2235 3' ⊢ 1'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_3798
	btr r12,0
	jmp LB_3799
LB_3798:
	bts r12,0
LB_3799:
	push 35
	push LB_3802
	call NS_E_2235
LB_3802:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3800
	btr r12,1
	jmp LB_3801
LB_3800:
	bts r12,1
LB_3801:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_3796
	btr r12,5
	clc
	jmp LB_3797
LB_3796:
	bts r12,5
	stc
LB_3797:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3794
	btr r12,4
	clc
	jmp LB_3795
LB_3794:
	bts r12,4
	stc
LB_3795:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3792
	btr r12,2
	clc
	jmp LB_3793
LB_3792:
	bts r12,2
	stc
LB_3793:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3790
	btr r12,0
	clc
	jmp LB_3791
LB_3790:
	bts r12,0
	stc
LB_3791:
	add rsp,40
; _f3744 { %_3745 %_3750 } ⊢ { %_3752 %_3753 } : { %_3752 %_3753 }
 ; {>  %_3750~5':(_lst)◂({ _stg (_p1924)◂((_p1932)◂(_stg)) (_p1942)◂(_stg) }) %_3747~2':_stg %_3749~4':(_p1942)◂(_stg) %_3745~0':_r64 %_3751~1':_stg }
; _f3744 { 0' 5' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_3809
	btr r12,1
	jmp LB_3810
LB_3809:
	bts r12,1
LB_3810:
	push 55
	push LB_3813
	call NS_E_3744
LB_3813:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_3811
	btr r12,3
	jmp LB_3812
LB_3811:
	bts r12,3
LB_3812:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3807
	btr r12,4
	clc
	jmp LB_3808
LB_3807:
	bts r12,4
	stc
LB_3808:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3805
	btr r12,2
	clc
	jmp LB_3806
LB_3805:
	bts r12,2
	stc
LB_3806:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3803
	btr r12,1
	clc
	jmp LB_3804
LB_3803:
	bts r12,1
	stc
LB_3804:
	add rsp,32
; _f56 %_3752 ⊢ %_3754 : %_3754
 ; {>  %_3747~2':_stg %_3749~4':(_p1942)◂(_stg) %_3753~3':_stg %_3751~1':_stg %_3752~0':_r64 }
	add r13,1
; _f2410 { %_3754 %_3749 } ⊢ { %_3755 %_3756 } : { %_3755 %_3756 }
 ; {>  %_3747~2':_stg %_3754~0':_r64 %_3749~4':(_p1942)◂(_stg) %_3753~3':_stg %_3751~1':_stg }
; _f2410 { 0' 4' } ⊢ { 0' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_3820
	btr r12,1
	jmp LB_3821
LB_3820:
	bts r12,1
LB_3821:
	push 37
	push LB_3824
	call NS_E_2410
LB_3824:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 4' }
	mov r10,r14
	bt r12,1
	jc LB_3822
	btr r12,4
	jmp LB_3823
LB_3822:
	bts r12,4
LB_3823:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_3818
	btr r12,3
	clc
	jmp LB_3819
LB_3818:
	bts r12,3
	stc
LB_3819:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3816
	btr r12,2
	clc
	jmp LB_3817
LB_3816:
	bts r12,2
	stc
LB_3817:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3814
	btr r12,1
	clc
	jmp LB_3815
LB_3814:
	bts r12,1
	stc
LB_3815:
	add rsp,32
; _f55 %_3755 ⊢ %_3757 : %_3757
 ; {>  %_3747~2':_stg %_3756~4':_stg %_3755~0':_r64 %_3753~3':_stg %_3751~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r10
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r11,rax
	btr r12,5
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_3825:
	cmp rax,0
	jz LB_3826
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_3825
LB_3826:
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 3'
	push rcx
	mov rsi,r10
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 4'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_3758 %_3763 }
 ; {>  %_3761~4':_stg %_3760~1':_stg %_3763~5':_stg %_3759~2':_stg %_3758~0':_r64 %_3762~3':_stg }
; 	∎ { 0' 5' }
	bt r12,4
	jc LB_3827
	mov rdi,r10
	call dlt
LB_3827:
	bt r12,1
	jc LB_3828
	mov rdi,r14
	call dlt
LB_3828:
	bt r12,2
	jc LB_3829
	mov rdi,r8
	call dlt
LB_3829:
	bt r12,3
	jc LB_3830
	mov rdi,r9
	call dlt
LB_3830:
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_3831
	btr r12,1
	jmp LB_3832
LB_3831:
	bts r12,1
LB_3832:
	ret
MTC_LB_3766:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3833
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_3834
	bt QWORD [rdi],0
	jc LB_3835
	btr r12,2
	clc
	jmp LB_3836
LB_3835:
	bts r12,2
	stc
LB_3836:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3834:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3837:
	cmp r15,0
	jz LB_3838
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3837
LB_3838:
; 	» "" _ ⊢ 1' : %_3764
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_3745 %_3764 }
 ; {>  %_3745~0':_r64 %_3764~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3833:
NS_E_3720:
; 	|» { 0' 1' }
NS_E_RDI_3720:
MTC_LB_3839:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3840
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_3841
	bt QWORD [rdi],0
	jc LB_3842
	btr r12,4
	clc
	jmp LB_3843
LB_3842:
	bts r12,4
	stc
LB_3843:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3841:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3846
	btr r12,5
	clc
	jmp LB_3847
LB_3846:
	bts r12,5
	stc
LB_3847:
	mov r8,r11
	bt r12,5
	jc LB_3844
	btr r12,2
	jmp LB_3845
LB_3844:
	bts r12,2
LB_3845:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3850
	btr r12,5
	clc
	jmp LB_3851
LB_3850:
	bts r12,5
	stc
LB_3851:
	mov r9,r11
	bt r12,5
	jc LB_3848
	btr r12,3
	jmp LB_3849
LB_3848:
	bts r12,3
LB_3849:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3852:
	cmp r15,0
	jz LB_3853
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3852
LB_3853:
; _f2235 %_3723 ⊢ %_3725 : %_3725
 ; {>  %_3721~0':_r64 %_3723~2':(_p1924)◂((_p1932)◂(_stg)) %_3724~3':(_p1942)◂(_stg) }
; _f2235 2' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3858
	btr r12,0
	jmp LB_3859
LB_3858:
	bts r12,0
LB_3859:
	push 35
	push LB_3862
	call NS_E_2235
LB_3862:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3860
	btr r12,1
	jmp LB_3861
LB_3860:
	bts r12,1
LB_3861:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_3856
	btr r12,3
	clc
	jmp LB_3857
LB_3856:
	bts r12,3
	stc
LB_3857:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3854
	btr r12,0
	clc
	jmp LB_3855
LB_3854:
	bts r12,0
	stc
LB_3855:
	add rsp,24
; _f56 %_3721 ⊢ %_3726 : %_3726
 ; {>  %_3725~1':_stg %_3721~0':_r64 %_3724~3':(_p1942)◂(_stg) }
	add r13,1
; _f2410 { %_3726 %_3724 } ⊢ { %_3727 %_3728 } : { %_3727 %_3728 }
 ; {>  %_3725~1':_stg %_3726~0':_r64 %_3724~3':(_p1942)◂(_stg) }
; _f2410 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3865
	btr r12,1
	jmp LB_3866
LB_3865:
	bts r12,1
LB_3866:
	push 37
	push LB_3869
	call NS_E_2410
LB_3869:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_3867
	btr r12,2
	jmp LB_3868
LB_3867:
	bts r12,2
LB_3868:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3863
	btr r12,1
	clc
	jmp LB_3864
LB_3863:
	bts r12,1
	stc
LB_3864:
	add rsp,16
; _f55 %_3727 ⊢ %_3729 : %_3729
 ; {>  %_3725~1':_stg %_3727~0':_r64 %_3728~2':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_3729 %_3732 }
 ; {>  %_3732~3':_stg %_3731~2':_stg %_3730~1':_stg %_3729~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_3870
	mov rdi,r8
	call dlt
LB_3870:
	bt r12,1
	jc LB_3871
	mov rdi,r14
	call dlt
LB_3871:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3872
	btr r12,1
	jmp LB_3873
LB_3872:
	bts r12,1
LB_3873:
	ret
MTC_LB_3840:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3874
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_3875
	bt QWORD [rdi],0
	jc LB_3876
	btr r12,3
	clc
	jmp LB_3877
LB_3876:
	bts r12,3
	stc
LB_3877:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3875:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3878
	btr r12,2
	jmp LB_3879
LB_3878:
	bts r12,2
LB_3879:
LB_3880:
	cmp r15,0
	jz LB_3881
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3880
LB_3881:
; _f2032 %_3733 ⊢ %_3734 : %_3734
 ; {>  %_3721~0':_r64 %_3733~2':_p1927 }
; _f2032 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3884
	btr r12,0
	jmp LB_3885
LB_3884:
	bts r12,0
LB_3885:
	push 30
	push LB_3888
	call NS_E_2032
LB_3888:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3886
	btr r12,1
	jmp LB_3887
LB_3886:
	bts r12,1
LB_3887:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3882
	btr r12,0
	clc
	jmp LB_3883
LB_3882:
	bts r12,0
	stc
LB_3883:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " = "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	add rsp,0
; ∎ { %_3721 %_3736 }
 ; {>  %_3721~0':_r64 %_3735~1':_stg %_3736~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_3889
	mov rdi,r14
	call dlt
LB_3889:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3890
	btr r12,1
	jmp LB_3891
LB_3890:
	bts r12,1
LB_3891:
	ret
MTC_LB_3874:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_3892
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂2'
; 1' ⊢ °2◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_3893
	bt QWORD [rdi],0
	jc LB_3894
	btr r12,3
	clc
	jmp LB_3895
LB_3894:
	bts r12,3
	stc
LB_3895:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3893:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_3896
	btr r12,2
	jmp LB_3897
LB_3896:
	bts r12,2
LB_3897:
LB_3898:
	cmp r15,0
	jz LB_3899
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3898
LB_3899:
; _f56 %_3721 ⊢ %_3738 : %_3738
 ; {>  %_3737~2':(_p1942)◂(_stg) %_3721~0':_r64 }
	add r13,1
; _f2410 { %_3738 %_3737 } ⊢ { %_3739 %_3740 } : { %_3739 %_3740 }
 ; {>  %_3737~2':(_p1942)◂(_stg) %_3738~0':_r64 }
; _f2410 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3900
	btr r12,1
	jmp LB_3901
LB_3900:
	bts r12,1
LB_3901:
	push 37
	push LB_3902
	call NS_E_2410
LB_3902:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_3739 ⊢ %_3741 : %_3741
 ; {>  %_3739~0':_r64 %_3740~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	add rax,5
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " \194\171 \n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_ab
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_3741 %_3743 }
 ; {>  %_3741~0':_r64 %_3742~1':_stg %_3743~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_3903
	mov rdi,r14
	call dlt
LB_3903:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3904
	btr r12,1
	jmp LB_3905
LB_3904:
	bts r12,1
LB_3905:
	ret
MTC_LB_3892:
NS_E_3710:
; 	|» 0'
NS_E_RDI_3710:
MTC_LB_3906:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3907
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_3908
	bt QWORD [rdi],0
	jc LB_3909
	btr r12,3
	clc
	jmp LB_3910
LB_3909:
	bts r12,3
	stc
LB_3910:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3908:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3913
	btr r12,4
	clc
	jmp LB_3914
LB_3913:
	bts r12,4
	stc
LB_3914:
	mov r14,r10
	bt r12,4
	jc LB_3911
	btr r12,1
	jmp LB_3912
LB_3911:
	bts r12,1
LB_3912:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3917
	btr r12,4
	clc
	jmp LB_3918
LB_3917:
	bts r12,4
	stc
LB_3918:
	mov r8,r10
	bt r12,4
	jc LB_3915
	btr r12,2
	jmp LB_3916
LB_3915:
	bts r12,2
LB_3916:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3919:
	cmp r15,0
	jz LB_3920
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3919
LB_3920:
; _f3685 %_3712 ⊢ %_3714 : %_3714
 ; {>  %_3712~1':_p1988 %_3713~2':(_lst)◂(_p1988) }
; _f3685 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3923
	btr r12,0
	jmp LB_3924
LB_3923:
	bts r12,0
LB_3924:
	push 52
	push LB_3925
	call NS_E_3685
LB_3925:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3921
	btr r12,2
	clc
	jmp LB_3922
LB_3921:
	bts r12,2
	stc
LB_3922:
	add rsp,16
; _f3710 %_3713 ⊢ %_3715 : %_3715
 ; {>  %_3713~2':(_lst)◂(_p1988) %_3714~0':_stg }
; _f3710 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3928
	btr r12,0
	jmp LB_3929
LB_3928:
	bts r12,0
LB_3929:
	push 53
	push LB_3932
	call NS_E_3710
LB_3932:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3930
	btr r12,1
	jmp LB_3931
LB_3930:
	bts r12,1
LB_3931:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3926
	btr r12,0
	clc
	jmp LB_3927
LB_3926:
	bts r12,0
	stc
LB_3927:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ %_3718
 ; {>  %_3718~2':_stg %_3717~1':_stg %_3716~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_3933
	mov rdi,r14
	call dlt
LB_3933:
	bt r12,0
	jc LB_3934
	mov rdi,r13
	call dlt
LB_3934:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3935
	btr r12,0
	jmp LB_3936
LB_3935:
	bts r12,0
LB_3936:
	ret
MTC_LB_3907:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3937
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_3938
	bt QWORD [rdi],0
	jc LB_3939
	btr r12,1
	clc
	jmp LB_3940
LB_3939:
	bts r12,1
	stc
LB_3940:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3938:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3941:
	cmp r15,0
	jz LB_3942
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3941
LB_3942:
; 	» "" _ ⊢ 0' : %_3719
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_3719
 ; {>  %_3719~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_3937:
NS_E_3685:
; 	|» 0'
NS_E_RDI_3685:
MTC_LB_3943:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3944
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_3945
	bt QWORD [rdi],0
	jc LB_3946
	btr r12,2
	clc
	jmp LB_3947
LB_3946:
	bts r12,2
	stc
LB_3947:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3945:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_3948
	btr r12,1
	jmp LB_3949
LB_3948:
	bts r12,1
LB_3949:
LB_3950:
	cmp r15,0
	jz LB_3951
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3950
LB_3951:
; _f3710 %_3687 ⊢ %_3688 : %_3688
 ; {>  %_3687~1':(_lst)◂(_p1988) }
; _f3710 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3952
	btr r12,0
	jmp LB_3953
LB_3952:
	bts r12,0
LB_3953:
	push 53
	push LB_3954
	call NS_E_3710
LB_3954:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "{ "
	mov rsi,0x_7b
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "}"
	mov rsi,0x_7d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	add rsp,0
; ∎ %_3690
 ; {>  %_3690~1':_stg %_3689~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_3955
	mov rdi,r13
	call dlt
LB_3955:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3956
	btr r12,0
	jmp LB_3957
LB_3956:
	bts r12,0
LB_3957:
	ret
MTC_LB_3944:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3958
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{ 1' 2' }
; 0' ⊢ °1◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_3959
	bt QWORD [rdi],0
	jc LB_3960
	btr r12,3
	clc
	jmp LB_3961
LB_3960:
	bts r12,3
	stc
LB_3961:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3959:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3964
	btr r12,4
	clc
	jmp LB_3965
LB_3964:
	bts r12,4
	stc
LB_3965:
	mov r14,r10
	bt r12,4
	jc LB_3962
	btr r12,1
	jmp LB_3963
LB_3962:
	bts r12,1
LB_3963:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3968
	btr r12,4
	clc
	jmp LB_3969
LB_3968:
	bts r12,4
	stc
LB_3969:
	mov r8,r10
	bt r12,4
	jc LB_3966
	btr r12,2
	jmp LB_3967
LB_3966:
	bts r12,2
LB_3967:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3970:
	cmp r15,0
	jz LB_3971
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3970
LB_3971:
; _f3685 %_3691 ⊢ %_3693 : %_3693
 ; {>  %_3691~1':_p1988 %_3692~2':_p1988 }
; _f3685 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3974
	btr r12,0
	jmp LB_3975
LB_3974:
	bts r12,0
LB_3975:
	push 52
	push LB_3976
	call NS_E_3685
LB_3976:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3972
	btr r12,2
	clc
	jmp LB_3973
LB_3972:
	bts r12,2
	stc
LB_3973:
	add rsp,16
; _f3685 %_3692 ⊢ %_3694 : %_3694
 ; {>  %_3693~0':_stg %_3692~2':_p1988 }
; _f3685 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3979
	btr r12,0
	jmp LB_3980
LB_3979:
	bts r12,0
LB_3980:
	push 52
	push LB_3983
	call NS_E_3685
LB_3983:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3981
	btr r12,1
	jmp LB_3982
LB_3981:
	bts r12,1
LB_3982:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3977
	btr r12,0
	clc
	jmp LB_3978
LB_3977:
	bts r12,0
	stc
LB_3978:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\134\146 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_86
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_92
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ %_3697
 ; {>  %_3697~2':_stg %_3695~0':_stg %_3696~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_3984
	mov rdi,r13
	call dlt
LB_3984:
	bt r12,1
	jc LB_3985
	mov rdi,r14
	call dlt
LB_3985:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3986
	btr r12,0
	jmp LB_3987
LB_3986:
	bts r12,0
LB_3987:
	ret
MTC_LB_3958:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_3988
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °2◂{ 1' 2' }
; 0' ⊢ °2◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_3989
	bt QWORD [rdi],0
	jc LB_3990
	btr r12,3
	clc
	jmp LB_3991
LB_3990:
	bts r12,3
	stc
LB_3991:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3989:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3994
	btr r12,4
	clc
	jmp LB_3995
LB_3994:
	bts r12,4
	stc
LB_3995:
	mov r14,r10
	bt r12,4
	jc LB_3992
	btr r12,1
	jmp LB_3993
LB_3992:
	bts r12,1
LB_3993:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3998
	btr r12,4
	clc
	jmp LB_3999
LB_3998:
	bts r12,4
	stc
LB_3999:
	mov r8,r10
	bt r12,4
	jc LB_3996
	btr r12,2
	jmp LB_3997
LB_3996:
	bts r12,2
LB_3997:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4000:
	cmp r15,0
	jz LB_4001
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4000
LB_4001:
; _f3685 %_3698 ⊢ %_3700 : %_3700
 ; {>  %_3699~2':_p1988 %_3698~1':_p1988 }
; _f3685 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_4004
	btr r12,0
	jmp LB_4005
LB_4004:
	bts r12,0
LB_4005:
	push 52
	push LB_4006
	call NS_E_3685
LB_4006:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_4002
	btr r12,2
	clc
	jmp LB_4003
LB_4002:
	bts r12,2
	stc
LB_4003:
	add rsp,16
; _f3685 %_3699 ⊢ %_3701 : %_3701
 ; {>  %_3700~0':_stg %_3699~2':_p1988 }
; _f3685 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_4009
	btr r12,0
	jmp LB_4010
LB_4009:
	bts r12,0
LB_4010:
	push 52
	push LB_4013
	call NS_E_3685
LB_4013:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_4011
	btr r12,1
	jmp LB_4012
LB_4011:
	bts r12,1
LB_4012:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4007
	btr r12,0
	clc
	jmp LB_4008
LB_4007:
	bts r12,0
	stc
LB_4008:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\226\151\130"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_97
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_82
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ %_3704
 ; {>  %_3704~2':_stg %_3702~0':_stg %_3703~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_4014
	mov rdi,r13
	call dlt
LB_4014:
	bt r12,1
	jc LB_4015
	mov rdi,r14
	call dlt
LB_4015:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_4016
	btr r12,0
	jmp LB_4017
LB_4016:
	bts r12,0
LB_4017:
	ret
MTC_LB_3988:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz MTC_LB_4018
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °3◂1'
; 0' ⊢ °3◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_4019
	bt QWORD [rdi],0
	jc LB_4020
	btr r12,2
	clc
	jmp LB_4021
LB_4020:
	bts r12,2
	stc
LB_4021:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4019:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_4022
	btr r12,1
	jmp LB_4023
LB_4022:
	bts r12,1
LB_4023:
LB_4024:
	cmp r15,0
	jz LB_4025
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4024
LB_4025:
; _f1881 %_3705 ⊢ %_3706 : %_3706
 ; {>  %_3705~1':_p1878 }
; _f1881 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_4026
	btr r12,0
	jmp LB_4027
LB_4026:
	bts r12,0
LB_4027:
	push 29
	push LB_4028
	call NS_E_1881
LB_4028:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_3706
 ; {>  %_3706~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_4018:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz MTC_LB_4029
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °4◂1'
; 0' ⊢ °4◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_4030
	bt QWORD [rdi],0
	jc LB_4031
	btr r12,2
	clc
	jmp LB_4032
LB_4031:
	bts r12,2
	stc
LB_4032:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4030:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_4033
	btr r12,1
	jmp LB_4034
LB_4033:
	bts r12,1
LB_4034:
LB_4035:
	cmp r15,0
	jz LB_4036
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4035
LB_4036:
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r13,rax
	btr r12,0
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "'"
	mov rsi,0x_27
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	add rsp,0
; ∎ %_3709
 ; {>  %_3708~1':_stg %_3709~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_4037
	mov rdi,r14
	call dlt
LB_4037:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_4029:
NS_E_3670:
; 	|» { 0' 1' }
NS_E_RDI_3670:
MTC_LB_4038:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4039
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' } 4' }
; 1' ⊢ °0◂{ { 2' 3' } 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4040
	bt QWORD [rdi],0
	jc LB_4041
	btr r12,5
	clc
	jmp LB_4042
LB_4041:
	bts r12,5
	stc
LB_4042:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4040:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_4051
	btr r12,6
	clc
	jmp LB_4052
LB_4051:
	bts r12,6
	stc
LB_4052:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_4045
	btr r12,4
	clc
	jmp LB_4046
LB_4045:
	bts r12,4
	stc
LB_4046:
	mov r8,r10
	bt r12,4
	jc LB_4043
	btr r12,2
	jmp LB_4044
LB_4043:
	bts r12,2
LB_4044:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_4049
	btr r12,4
	clc
	jmp LB_4050
LB_4049:
	bts r12,4
	stc
LB_4050:
	mov r9,r10
	bt r12,4
	jc LB_4047
	btr r12,3
	jmp LB_4048
LB_4047:
	bts r12,3
LB_4048:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_4055
	btr r12,6
	clc
	jmp LB_4056
LB_4055:
	bts r12,6
	stc
LB_4056:
	mov r10,rcx
	bt r12,6
	jc LB_4053
	btr r12,4
	jmp LB_4054
LB_4053:
	bts r12,4
LB_4054:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4057:
	cmp r15,0
	jz LB_4058
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4057
LB_4058:
; _f3670 { %_3671 %_3675 } ⊢ { %_3676 %_3677 } : { %_3676 %_3677 }
 ; {>  %_3671~0':_r64 %_3673~2':_stg %_3675~4':(_lst)◂({ _stg _p1988 }) %_3674~3':_p1988 }
; _f3670 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_4063
	btr r12,1
	jmp LB_4064
LB_4063:
	bts r12,1
LB_4064:
	push 51
	push LB_4065
	call NS_E_3670
LB_4065:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_4061
	btr r12,3
	clc
	jmp LB_4062
LB_4061:
	bts r12,3
	stc
LB_4062:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_4059
	btr r12,2
	clc
	jmp LB_4060
LB_4059:
	bts r12,2
	stc
LB_4060:
	add rsp,24
; _f3685 %_3674 ⊢ %_3678 : %_3678
 ; {>  %_3677~1':_stg %_3676~0':_r64 %_3673~2':_stg %_3674~3':_p1988 }
; _f3685 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_4072
	btr r12,0
	jmp LB_4073
LB_4072:
	bts r12,0
LB_4073:
	push 52
	push LB_4076
	call NS_E_3685
LB_4076:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_4074
	btr r12,3
	jmp LB_4075
LB_4074:
	bts r12,3
LB_4075:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_4070
	btr r12,2
	clc
	jmp LB_4071
LB_4070:
	bts r12,2
	stc
LB_4071:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_4068
	btr r12,1
	clc
	jmp LB_4069
LB_4068:
	bts r12,1
	stc
LB_4069:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4066
	btr r12,0
	clc
	jmp LB_4067
LB_4066:
	bts r12,0
	stc
LB_4067:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,4
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_4077:
	cmp rax,0
	jz LB_4078
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4077
LB_4078:
; "\226\136\144 "
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_90
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " : "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3a
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 3'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_3679 %_3683 }
 ; {>  %_3680~2':_stg %_3679~0':_r64 %_3681~3':_stg %_3683~4':_stg %_3682~1':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_4079
	mov rdi,r8
	call dlt
LB_4079:
	bt r12,3
	jc LB_4080
	mov rdi,r9
	call dlt
LB_4080:
	bt r12,1
	jc LB_4081
	mov rdi,r14
	call dlt
LB_4081:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_4082
	btr r12,1
	jmp LB_4083
LB_4082:
	bts r12,1
LB_4083:
	ret
MTC_LB_4039:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4084
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4085
	bt QWORD [rdi],0
	jc LB_4086
	btr r12,2
	clc
	jmp LB_4087
LB_4086:
	bts r12,2
	stc
LB_4087:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4085:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4088:
	cmp r15,0
	jz LB_4089
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4088
LB_4089:
; 	» "" _ ⊢ 1' : %_3684
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_3671 %_3684 }
 ; {>  %_3671~0':_r64 %_3684~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_4084:
NS_E_3656:
; 	|» { 0' 1' }
NS_E_RDI_3656:
MTC_LB_4090:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4091
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂2'
; 1' ⊢ °0◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4092
	bt QWORD [rdi],0
	jc LB_4093
	btr r12,3
	clc
	jmp LB_4094
LB_4093:
	bts r12,3
	stc
LB_4094:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4092:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_4095
	btr r12,2
	jmp LB_4096
LB_4095:
	bts r12,2
LB_4096:
LB_4097:
	cmp r15,0
	jz LB_4098
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4097
LB_4098:
; _f56 %_3657 ⊢ %_3660 : %_3660
 ; {>  %_3659~2':(_lst)◂({ _stg _p1988 }) %_3657~0':_r64 }
	add r13,1
; _f3670 { %_3660 %_3659 } ⊢ { %_3661 %_3662 } : { %_3661 %_3662 }
 ; {>  %_3659~2':(_lst)◂({ _stg _p1988 }) %_3660~0':_r64 }
; _f3670 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4099
	btr r12,1
	jmp LB_4100
LB_4099:
	bts r12,1
LB_4100:
	push 51
	push LB_4101
	call NS_E_3670
LB_4101:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_3661 ⊢ %_3663 : %_3663
 ; {>  %_3662~1':_stg %_3661~0':_r64 }
	sub r13,1
; » _^ ..
	xor rax,rax
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_3663 %_3664 }
 ; {>  %_3663~0':_r64 %_3664~1':_stg %_3665~2':_stg }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_4102
	mov rdi,r8
	call dlt
LB_4102:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_4091:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4103
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4104
	bt QWORD [rdi],0
	jc LB_4105
	btr r12,3
	clc
	jmp LB_4106
LB_4105:
	bts r12,3
	stc
LB_4106:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4104:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_4107
	btr r12,2
	jmp LB_4108
LB_4107:
	bts r12,2
LB_4108:
LB_4109:
	cmp r15,0
	jz LB_4110
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4109
LB_4110:
; _f3685 %_3666 ⊢ %_3667 : %_3667
 ; {>  %_3666~2':_p1988 %_3657~0':_r64 }
; _f3685 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_4113
	btr r12,0
	jmp LB_4114
LB_4113:
	bts r12,0
LB_4114:
	push 52
	push LB_4117
	call NS_E_3685
LB_4117:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_4115
	btr r12,1
	jmp LB_4116
LB_4115:
	bts r12,1
LB_4116:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4111
	btr r12,0
	clc
	jmp LB_4112
LB_4111:
	bts r12,0
	stc
LB_4112:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " = "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	add rsp,0
; ∎ { %_3657 %_3669 }
 ; {>  %_3668~1':_stg %_3669~2':_stg %_3657~0':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_4118
	mov rdi,r14
	call dlt
LB_4118:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4119
	btr r12,1
	jmp LB_4120
LB_4119:
	bts r12,1
LB_4120:
	ret
MTC_LB_4103:
NS_E_3648:
; 	|» 0'
NS_E_RDI_3648:
MTC_LB_4121:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4122
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_4123
	bt QWORD [rdi],0
	jc LB_4124
	btr r12,3
	clc
	jmp LB_4125
LB_4124:
	bts r12,3
	stc
LB_4125:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4123:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_4128
	btr r12,4
	clc
	jmp LB_4129
LB_4128:
	bts r12,4
	stc
LB_4129:
	mov r14,r10
	bt r12,4
	jc LB_4126
	btr r12,1
	jmp LB_4127
LB_4126:
	bts r12,1
LB_4127:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_4132
	btr r12,4
	clc
	jmp LB_4133
LB_4132:
	bts r12,4
	stc
LB_4133:
	mov r8,r10
	bt r12,4
	jc LB_4130
	btr r12,2
	jmp LB_4131
LB_4130:
	bts r12,2
LB_4131:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4134:
	cmp r15,0
	jz LB_4135
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4134
LB_4135:
; _f3648 %_3651 ⊢ %_3652 : %_3652
 ; {>  %_3651~2':_p1985 %_3650~1':_p1986 }
; _f3648 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_4138
	btr r12,0
	jmp LB_4139
LB_4138:
	bts r12,0
LB_4139:
	push 49
	push LB_4140
	call NS_E_3648
LB_4140:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_4136
	btr r12,1
	clc
	jmp LB_4137
LB_4136:
	bts r12,1
	stc
LB_4137:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,4
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " .. "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ %_3654
 ; {>  %_3654~2':_stg %_3653~0':_stg %_3650~1':_p1986 }
; 	∎ 2'
	bt r12,0
	jc LB_4141
	mov rdi,r13
	call dlt
LB_4141:
	bt r12,1
	jc LB_4142
	mov rdi,r14
	call dlt
LB_4142:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_4143
	btr r12,0
	jmp LB_4144
LB_4143:
	bts r12,0
LB_4144:
	ret
MTC_LB_4122:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4145
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_4146
	bt QWORD [rdi],0
	jc LB_4147
	btr r12,1
	clc
	jmp LB_4148
LB_4147:
	bts r12,1
	stc
LB_4148:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4146:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4149:
	cmp r15,0
	jz LB_4150
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4149
LB_4150:
; 	» "" _ ⊢ 0' : %_3655
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_3655
 ; {>  %_3655~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_4145:
NS_E_3634:
; 	|» { 0' 1' }
NS_E_RDI_3634:
MTC_LB_4151:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4152
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂2'
; 1' ⊢ °0◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4153
	bt QWORD [rdi],0
	jc LB_4154
	btr r12,3
	clc
	jmp LB_4155
LB_4154:
	bts r12,3
	stc
LB_4155:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4153:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_4156
	btr r12,2
	jmp LB_4157
LB_4156:
	bts r12,2
LB_4157:
LB_4158:
	cmp r15,0
	jz LB_4159
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4158
LB_4159:
; _f3648 %_3637 ⊢ %_3638 : %_3638
 ; {>  %_3637~2':_p1985 %_3635~0':t1461'(-1) }
; _f3648 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_4162
	btr r12,0
	jmp LB_4163
LB_4162:
	bts r12,0
LB_4163:
	push 49
	push LB_4166
	call NS_E_3648
LB_4166:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_4164
	btr r12,1
	jmp LB_4165
LB_4164:
	bts r12,1
LB_4165:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4160
	btr r12,0
	clc
	jmp LB_4161
LB_4160:
	bts r12,0
	stc
LB_4161:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,4
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " !| "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_21
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_7c
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_3635 %_3640 }
 ; {>  %_3640~2':_stg %_3639~1':_stg %_3635~0':t1461'(-1) }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_4167
	mov rdi,r14
	call dlt
LB_4167:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4168
	btr r12,1
	jmp LB_4169
LB_4168:
	bts r12,1
LB_4169:
	ret
MTC_LB_4152:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4170
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' }
; 1' ⊢ °1◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4171
	bt QWORD [rdi],0
	jc LB_4172
	btr r12,4
	clc
	jmp LB_4173
LB_4172:
	bts r12,4
	stc
LB_4173:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4171:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_4176
	btr r12,5
	clc
	jmp LB_4177
LB_4176:
	bts r12,5
	stc
LB_4177:
	mov r8,r11
	bt r12,5
	jc LB_4174
	btr r12,2
	jmp LB_4175
LB_4174:
	bts r12,2
LB_4175:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_4180
	btr r12,5
	clc
	jmp LB_4181
LB_4180:
	bts r12,5
	stc
LB_4181:
	mov r9,r11
	bt r12,5
	jc LB_4178
	btr r12,3
	jmp LB_4179
LB_4178:
	bts r12,3
LB_4179:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4182:
	cmp r15,0
	jz LB_4183
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4182
LB_4183:
; _f3634 { %_3635 %_3642 } ⊢ { %_3643 %_3644 } : { %_3643 %_3644 }
 ; {>  %_3641~2':_p1986 %_3642~3':_p1984 %_3635~0':t1461'(-1) }
; _f3634 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4186
	btr r12,1
	jmp LB_4187
LB_4186:
	bts r12,1
LB_4187:
	push 48
	push LB_4188
	call NS_E_3634
LB_4188:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_4184
	btr r12,2
	clc
	jmp LB_4185
LB_4184:
	bts r12,2
	stc
LB_4185:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,4
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; " .. "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_3643 %_3646 }
 ; {>  %_3643~0':t1461'(-1) %_3646~3':_stg %_3641~2':_p1986 %_3645~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_4189
	mov rdi,r8
	call dlt
LB_4189:
	bt r12,1
	jc LB_4190
	mov rdi,r14
	call dlt
LB_4190:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4191
	btr r12,1
	jmp LB_4192
LB_4191:
	bts r12,1
LB_4192:
	ret
MTC_LB_4170:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_4193
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂{  }
; 1' ⊢ °2◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4194
	bt QWORD [rdi],0
	jc LB_4195
	btr r12,2
	clc
	jmp LB_4196
LB_4195:
	bts r12,2
	stc
LB_4196:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4194:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4197:
	cmp r15,0
	jz LB_4198
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4197
LB_4198:
; 	» "" _ ⊢ 1' : %_3647
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_3635 %_3647 }
 ; {>  %_3647~1':_stg %_3635~0':t1461'(-1) }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_4193:
NS_E_3599:
; 	|» { 0' 1' }
NS_E_RDI_3599:
MTC_LB_4199:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4200
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' 4' 5' 6' 7' }
; 1' ⊢ °0◂{ 2' 3' 4' 5' 6' 7' }
	btr r12,8
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4201
	bt QWORD [rdi],0
	jc LB_4202
	btr r12,8
	clc
	jmp LB_4203
LB_4202:
	bts r12,8
	stc
LB_4203:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4201:
	mov QWORD [st_vct+8*8],rdi
; 8' ⊢ { 2' 3' 4' 5' 6' 7' }
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],0
	jc LB_4206
	btr r12,9
	clc
	jmp LB_4207
LB_4206:
	bts r12,9
	stc
LB_4207:
	mov r8,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_4204
	btr r12,2
	jmp LB_4205
LB_4204:
	bts r12,2
LB_4205:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],1
	jc LB_4210
	btr r12,9
	clc
	jmp LB_4211
LB_4210:
	bts r12,9
	stc
LB_4211:
	mov r9,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_4208
	btr r12,3
	jmp LB_4209
LB_4208:
	bts r12,3
LB_4209:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],2
	jc LB_4214
	btr r12,9
	clc
	jmp LB_4215
LB_4214:
	bts r12,9
	stc
LB_4215:
	mov r10,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_4212
	btr r12,4
	jmp LB_4213
LB_4212:
	bts r12,4
LB_4213:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],3
	jc LB_4218
	btr r12,9
	clc
	jmp LB_4219
LB_4218:
	bts r12,9
	stc
LB_4219:
	mov r11,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_4216
	btr r12,5
	jmp LB_4217
LB_4216:
	bts r12,5
LB_4217:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],4
	jc LB_4222
	btr r12,9
	clc
	jmp LB_4223
LB_4222:
	bts r12,9
	stc
LB_4223:
	mov rcx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_4220
	btr r12,6
	jmp LB_4221
LB_4220:
	bts r12,6
LB_4221:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*5]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],5
	jc LB_4226
	btr r12,9
	clc
	jmp LB_4227
LB_4226:
	bts r12,9
	stc
LB_4227:
	mov rdx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_4224
	btr r12,7
	jmp LB_4225
LB_4224:
	bts r12,7
LB_4225:
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4228:
	cmp r15,0
	jz LB_4229
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4228
LB_4229:
; _f2235 %_3602 ⊢ %_3608 : %_3608
 ; {>  %_3603~3':(_p1942)◂(_stg) %_3605~5':_p1984 %_3602~2':(_p1924)◂((_p1932)◂(_stg)) %_3600~0':_r64 %_3606~6':(_opn)◂({ (_p1924)◂((_p1932)◂(_stg)) _p1982 }) %_3604~4':_p1983 %_3607~7':_p1982 }
; _f2235 2' ⊢ 1'
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp+8+8*5],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_4242
	btr r12,0
	jmp LB_4243
LB_4242:
	bts r12,0
LB_4243:
	push 35
	push LB_4246
	call NS_E_2235
LB_4246:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_4244
	btr r12,1
	jmp LB_4245
LB_4244:
	bts r12,1
LB_4245:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*5]
	bt QWORD rax,7
	jc LB_4240
	btr r12,7
	clc
	jmp LB_4241
LB_4240:
	bts r12,7
	stc
LB_4241:
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_4238
	btr r12,6
	clc
	jmp LB_4239
LB_4238:
	bts r12,6
	stc
LB_4239:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_4236
	btr r12,5
	clc
	jmp LB_4237
LB_4236:
	bts r12,5
	stc
LB_4237:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_4234
	btr r12,4
	clc
	jmp LB_4235
LB_4234:
	bts r12,4
	stc
LB_4235:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_4232
	btr r12,3
	clc
	jmp LB_4233
LB_4232:
	bts r12,3
	stc
LB_4233:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4230
	btr r12,0
	clc
	jmp LB_4231
LB_4230:
	bts r12,0
	stc
LB_4231:
	add rsp,56
; _f56 %_3600 ⊢ %_3609 : %_3609
 ; {>  %_3603~3':(_p1942)◂(_stg) %_3605~5':_p1984 %_3600~0':_r64 %_3606~6':(_opn)◂({ (_p1924)◂((_p1932)◂(_stg)) _p1982 }) %_3608~1':_stg %_3604~4':_p1983 %_3607~7':_p1982 }
	add r13,1
; _f2410 { %_3609 %_3603 } ⊢ { %_3610 %_3611 } : { %_3610 %_3611 }
 ; {>  %_3603~3':(_p1942)◂(_stg) %_3605~5':_p1984 %_3606~6':(_opn)◂({ (_p1924)◂((_p1932)◂(_stg)) _p1982 }) %_3608~1':_stg %_3609~0':_r64 %_3604~4':_p1983 %_3607~7':_p1982 }
; _f2410 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp+8+8*2],r11
	mov QWORD [rsp+8+8*3],rcx
	mov QWORD [rsp+8+8*4],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4257
	btr r12,1
	jmp LB_4258
LB_4257:
	bts r12,1
LB_4258:
	push 37
	push LB_4261
	call NS_E_2410
LB_4261:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_4259
	btr r12,2
	jmp LB_4260
LB_4259:
	bts r12,2
LB_4260:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*4]
	bt QWORD rax,7
	jc LB_4255
	btr r12,7
	clc
	jmp LB_4256
LB_4255:
	bts r12,7
	stc
LB_4256:
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_4253
	btr r12,6
	clc
	jmp LB_4254
LB_4253:
	bts r12,6
	stc
LB_4254:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_4251
	btr r12,5
	clc
	jmp LB_4252
LB_4251:
	bts r12,5
	stc
LB_4252:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_4249
	btr r12,4
	clc
	jmp LB_4250
LB_4249:
	bts r12,4
	stc
LB_4250:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_4247
	btr r12,1
	clc
	jmp LB_4248
LB_4247:
	bts r12,1
	stc
LB_4248:
	add rsp,48
; _f55 %_3610 ⊢ %_3612 : %_3612
 ; {>  %_3611~2':_stg %_3605~5':_p1984 %_3610~0':_r64 %_3606~6':(_opn)◂({ (_p1924)◂((_p1932)◂(_stg)) _p1982 }) %_3608~1':_stg %_3604~4':_p1983 %_3607~7':_p1982 }
	sub r13,1
; _f3599 { %_3612 %_3607 } ⊢ { %_3613 %_3614 } : { %_3613 %_3614 }
 ; {>  %_3611~2':_stg %_3605~5':_p1984 %_3612~0':_r64 %_3606~6':(_opn)◂({ (_p1924)◂((_p1932)◂(_stg)) _p1982 }) %_3608~1':_stg %_3604~4':_p1983 %_3607~7':_p1982 }
; _f3599 { 0' 7' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100000010.. |},{ 0' 7' } ⊢ { 0' 1' }
	mov r14,rdx
	bt r12,7
	jc LB_4272
	btr r12,1
	jmp LB_4273
LB_4272:
	bts r12,1
LB_4273:
	push 47
	push LB_4276
	call NS_E_3599
LB_4276:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_4274
	btr r12,3
	jmp LB_4275
LB_4274:
	bts r12,3
LB_4275:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_4270
	btr r12,6
	clc
	jmp LB_4271
LB_4270:
	bts r12,6
	stc
LB_4271:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_4268
	btr r12,5
	clc
	jmp LB_4269
LB_4268:
	bts r12,5
	stc
LB_4269:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_4266
	btr r12,4
	clc
	jmp LB_4267
LB_4266:
	bts r12,4
	stc
LB_4267:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_4264
	btr r12,2
	clc
	jmp LB_4265
LB_4264:
	bts r12,2
	stc
LB_4265:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_4262
	btr r12,1
	clc
	jmp LB_4263
LB_4262:
	bts r12,1
	stc
LB_4263:
	add rsp,48
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,11
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov rdx,rax
	btr r12,7
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_4277:
	cmp rax,0
	jz LB_4278
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4277
LB_4278:
; "\226\136\144 .. \226\138\162 "
	mov rsi,0x_e2_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_8a
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+2],sil
	add rdi,11
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_3615 %_3619 }
 ; {>  %_3619~7':_stg %_3618~3':_stg %_3605~5':_p1984 %_3617~2':_stg %_3606~6':(_opn)◂({ (_p1924)◂((_p1932)◂(_stg)) _p1982 }) %_3615~0':_r64 %_3604~4':_p1983 %_3616~1':_stg }
; 	∎ { 0' 7' }
	bt r12,3
	jc LB_4279
	mov rdi,r9
	call dlt
LB_4279:
	bt r12,5
	jc LB_4280
	mov rdi,r11
	call dlt
LB_4280:
	bt r12,2
	jc LB_4281
	mov rdi,r8
	call dlt
LB_4281:
	bt r12,6
	jc LB_4282
	mov rdi,rcx
	call dlt
LB_4282:
	bt r12,4
	jc LB_4283
	mov rdi,r10
	call dlt
LB_4283:
	bt r12,1
	jc LB_4284
	mov rdi,r14
	call dlt
LB_4284:
; _emt_mov_ptn_to_ptn:{| 100000010.. |},{ 0' 7' } ⊢ { 0' 1' }
	mov r14,rdx
	bt r12,7
	jc LB_4285
	btr r12,1
	jmp LB_4286
LB_4285:
	bts r12,1
LB_4286:
	ret
MTC_LB_4200:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4287
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' 4' 5' 6' }
; 1' ⊢ °1◂{ 2' 3' 4' 5' 6' }
	btr r12,7
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4288
	bt QWORD [rdi],0
	jc LB_4289
	btr r12,7
	clc
	jmp LB_4290
LB_4289:
	bts r12,7
	stc
LB_4290:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4288:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_4293
	btr r12,8
	clc
	jmp LB_4294
LB_4293:
	bts r12,8
	stc
LB_4294:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_4291
	btr r12,2
	jmp LB_4292
LB_4291:
	bts r12,2
LB_4292:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_4297
	btr r12,8
	clc
	jmp LB_4298
LB_4297:
	bts r12,8
	stc
LB_4298:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_4295
	btr r12,3
	jmp LB_4296
LB_4295:
	bts r12,3
LB_4296:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_4301
	btr r12,8
	clc
	jmp LB_4302
LB_4301:
	bts r12,8
	stc
LB_4302:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_4299
	btr r12,4
	jmp LB_4300
LB_4299:
	bts r12,4
LB_4300:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_4305
	btr r12,8
	clc
	jmp LB_4306
LB_4305:
	bts r12,8
	stc
LB_4306:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_4303
	btr r12,5
	jmp LB_4304
LB_4303:
	bts r12,5
LB_4304:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_4309
	btr r12,8
	clc
	jmp LB_4310
LB_4309:
	bts r12,8
	stc
LB_4310:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_4307
	btr r12,6
	jmp LB_4308
LB_4307:
	bts r12,6
LB_4308:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4311:
	cmp r15,0
	jz LB_4312
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4311
LB_4312:
; _f2235 %_3620 ⊢ %_3625 : %_3625
 ; {>  %_3623~5':_p1984 %_3620~2':(_p1924)◂((_p1932)◂(_stg)) %_3622~4':_p1983 %_3621~3':(_p1942)◂(_stg) %_3600~0':_r64 %_3624~6':(_opn)◂({ (_p1924)◂((_p1932)◂(_stg)) _p1982 }) }
; _f2235 2' ⊢ 1'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_4323
	btr r12,0
	jmp LB_4324
LB_4323:
	bts r12,0
LB_4324:
	push 35
	push LB_4327
	call NS_E_2235
LB_4327:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_4325
	btr r12,1
	jmp LB_4326
LB_4325:
	bts r12,1
LB_4326:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_4321
	btr r12,6
	clc
	jmp LB_4322
LB_4321:
	bts r12,6
	stc
LB_4322:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_4319
	btr r12,5
	clc
	jmp LB_4320
LB_4319:
	bts r12,5
	stc
LB_4320:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_4317
	btr r12,4
	clc
	jmp LB_4318
LB_4317:
	bts r12,4
	stc
LB_4318:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_4315
	btr r12,3
	clc
	jmp LB_4316
LB_4315:
	bts r12,3
	stc
LB_4316:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4313
	btr r12,0
	clc
	jmp LB_4314
LB_4313:
	bts r12,0
	stc
LB_4314:
	add rsp,48
; _f56 %_3600 ⊢ %_3626 : %_3626
 ; {>  %_3623~5':_p1984 %_3622~4':_p1983 %_3621~3':(_p1942)◂(_stg) %_3600~0':_r64 %_3624~6':(_opn)◂({ (_p1924)◂((_p1932)◂(_stg)) _p1982 }) %_3625~1':_stg }
	add r13,1
; _f2410 { %_3626 %_3621 } ⊢ { %_3627 %_3628 } : { %_3627 %_3628 }
 ; {>  %_3623~5':_p1984 %_3622~4':_p1983 %_3621~3':(_p1942)◂(_stg) %_3624~6':(_opn)◂({ (_p1924)◂((_p1932)◂(_stg)) _p1982 }) %_3625~1':_stg %_3626~0':_r64 }
; _f2410 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp+8+8*2],r11
	mov QWORD [rsp+8+8*3],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4336
	btr r12,1
	jmp LB_4337
LB_4336:
	bts r12,1
LB_4337:
	push 37
	push LB_4340
	call NS_E_2410
LB_4340:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_4338
	btr r12,2
	jmp LB_4339
LB_4338:
	bts r12,2
LB_4339:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_4334
	btr r12,6
	clc
	jmp LB_4335
LB_4334:
	bts r12,6
	stc
LB_4335:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_4332
	btr r12,5
	clc
	jmp LB_4333
LB_4332:
	bts r12,5
	stc
LB_4333:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_4330
	btr r12,4
	clc
	jmp LB_4331
LB_4330:
	bts r12,4
	stc
LB_4331:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_4328
	btr r12,1
	clc
	jmp LB_4329
LB_4328:
	bts r12,1
	stc
LB_4329:
	add rsp,40
; _f55 %_3627 ⊢ %_3629 : %_3629
 ; {>  %_3623~5':_p1984 %_3622~4':_p1983 %_3628~2':_stg %_3627~0':_r64 %_3624~6':(_opn)◂({ (_p1924)◂((_p1932)◂(_stg)) _p1982 }) %_3625~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,12
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_4341:
	cmp rax,0
	jz LB_4342
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4341
LB_4342:
; "\226\136\144. .. \226\138\162 "
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_e2
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+3],sil
	add rdi,12
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_3630 %_3633 }
 ; {>  %_3631~1':_stg %_3623~5':_p1984 %_3622~4':_p1983 %_3630~0':_r64 %_3633~3':_stg %_3624~6':(_opn)◂({ (_p1924)◂((_p1932)◂(_stg)) _p1982 }) %_3632~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_4343
	mov rdi,r14
	call dlt
LB_4343:
	bt r12,5
	jc LB_4344
	mov rdi,r11
	call dlt
LB_4344:
	bt r12,4
	jc LB_4345
	mov rdi,r10
	call dlt
LB_4345:
	bt r12,6
	jc LB_4346
	mov rdi,rcx
	call dlt
LB_4346:
	bt r12,2
	jc LB_4347
	mov rdi,r8
	call dlt
LB_4347:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4348
	btr r12,1
	jmp LB_4349
LB_4348:
	bts r12,1
LB_4349:
	ret
MTC_LB_4287:
NS_E_3580:
; 	|» { 0' 1' }
NS_E_RDI_3580:
MTC_LB_4350:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4351
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' 4' 5' 6' }
; 1' ⊢ °0◂{ 2' 3' 4' 5' 6' }
	btr r12,7
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4352
	bt QWORD [rdi],0
	jc LB_4353
	btr r12,7
	clc
	jmp LB_4354
LB_4353:
	bts r12,7
	stc
LB_4354:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4352:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_4357
	btr r12,8
	clc
	jmp LB_4358
LB_4357:
	bts r12,8
	stc
LB_4358:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_4355
	btr r12,2
	jmp LB_4356
LB_4355:
	bts r12,2
LB_4356:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_4361
	btr r12,8
	clc
	jmp LB_4362
LB_4361:
	bts r12,8
	stc
LB_4362:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_4359
	btr r12,3
	jmp LB_4360
LB_4359:
	bts r12,3
LB_4360:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_4365
	btr r12,8
	clc
	jmp LB_4366
LB_4365:
	bts r12,8
	stc
LB_4366:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_4363
	btr r12,4
	jmp LB_4364
LB_4363:
	bts r12,4
LB_4364:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_4369
	btr r12,8
	clc
	jmp LB_4370
LB_4369:
	bts r12,8
	stc
LB_4370:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_4367
	btr r12,5
	jmp LB_4368
LB_4367:
	bts r12,5
LB_4368:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_4373
	btr r12,8
	clc
	jmp LB_4374
LB_4373:
	bts r12,8
	stc
LB_4374:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_4371
	btr r12,6
	jmp LB_4372
LB_4371:
	bts r12,6
LB_4372:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4375:
	cmp r15,0
	jz LB_4376
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4375
LB_4376:
; _f3580 { %_3581 %_3587 } ⊢ { %_3588 %_3589 } : { %_3588 %_3589 }
 ; {>  %_3587~6':_p1981 %_3586~5':(_opn)◂(_p1981) %_3581~0':_r64 %_3584~3':_p1983 %_3585~4':_p1984 %_3583~2':(_opn)◂(_stg) }
; _f3580 { 0' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10000010.. |},{ 0' 6' } ⊢ { 0' 1' }
	mov r14,rcx
	bt r12,6
	jc LB_4385
	btr r12,1
	jmp LB_4386
LB_4385:
	bts r12,1
LB_4386:
	push 46
	push LB_4387
	call NS_E_3580
LB_4387:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_4383
	btr r12,5
	clc
	jmp LB_4384
LB_4383:
	bts r12,5
	stc
LB_4384:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_4381
	btr r12,4
	clc
	jmp LB_4382
LB_4381:
	bts r12,4
	stc
LB_4382:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_4379
	btr r12,3
	clc
	jmp LB_4380
LB_4379:
	bts r12,3
	stc
LB_4380:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_4377
	btr r12,2
	clc
	jmp LB_4378
LB_4377:
	bts r12,2
	stc
LB_4378:
	add rsp,40
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,7
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov rcx,rax
	btr r12,6
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_4388:
	cmp rax,0
	jz LB_4389
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4388
LB_4389:
; "\226\136\144 ..\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_90
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_3590 %_3592 }
 ; {>  %_3592~6':_stg %_3590~0':_r64 %_3586~5':(_opn)◂(_p1981) %_3584~3':_p1983 %_3585~4':_p1984 %_3591~1':_stg %_3583~2':(_opn)◂(_stg) }
; 	∎ { 0' 6' }
	bt r12,5
	jc LB_4390
	mov rdi,r11
	call dlt
LB_4390:
	bt r12,3
	jc LB_4391
	mov rdi,r9
	call dlt
LB_4391:
	bt r12,4
	jc LB_4392
	mov rdi,r10
	call dlt
LB_4392:
	bt r12,1
	jc LB_4393
	mov rdi,r14
	call dlt
LB_4393:
	bt r12,2
	jc LB_4394
	mov rdi,r8
	call dlt
LB_4394:
; _emt_mov_ptn_to_ptn:{| 10000010.. |},{ 0' 6' } ⊢ { 0' 1' }
	mov r14,rcx
	bt r12,6
	jc LB_4395
	btr r12,1
	jmp LB_4396
LB_4395:
	bts r12,1
LB_4396:
	ret
MTC_LB_4351:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4397
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' 4' 5' }
; 1' ⊢ °1◂{ 2' 3' 4' 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4398
	bt QWORD [rdi],0
	jc LB_4399
	btr r12,6
	clc
	jmp LB_4400
LB_4399:
	bts r12,6
	stc
LB_4400:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4398:
	mov rcx,rdi
; 6' ⊢ { 2' 3' 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_4403
	btr r12,7
	clc
	jmp LB_4404
LB_4403:
	bts r12,7
	stc
LB_4404:
	mov r8,rdx
	bt r12,7
	jc LB_4401
	btr r12,2
	jmp LB_4402
LB_4401:
	bts r12,2
LB_4402:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_4407
	btr r12,7
	clc
	jmp LB_4408
LB_4407:
	bts r12,7
	stc
LB_4408:
	mov r9,rdx
	bt r12,7
	jc LB_4405
	btr r12,3
	jmp LB_4406
LB_4405:
	bts r12,3
LB_4406:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_4411
	btr r12,7
	clc
	jmp LB_4412
LB_4411:
	bts r12,7
	stc
LB_4412:
	mov r10,rdx
	bt r12,7
	jc LB_4409
	btr r12,4
	jmp LB_4410
LB_4409:
	bts r12,4
LB_4410:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*3]
	mov rdx,rax
	bt QWORD [rdi],3
	jc LB_4415
	btr r12,7
	clc
	jmp LB_4416
LB_4415:
	bts r12,7
	stc
LB_4416:
	mov r11,rdx
	bt r12,7
	jc LB_4413
	btr r12,5
	jmp LB_4414
LB_4413:
	bts r12,5
LB_4414:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4417:
	cmp r15,0
	jz LB_4418
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4417
LB_4418:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_4419:
	cmp rax,0
	jz LB_4420
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4419
LB_4420:
; "\226\136\144. .. \n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
	add rsp,0
; ∎ { %_3597 %_3598 }
 ; {>  %_3596~5':(_opn)◂(_p1981) %_3598~1':_stg %_3597~0':_r64 %_3595~4':_p1984 %_3593~2':(_opn)◂(_stg) %_3594~3':_p1983 }
; 	∎ { 0' 1' }
	bt r12,5
	jc LB_4421
	mov rdi,r11
	call dlt
LB_4421:
	bt r12,4
	jc LB_4422
	mov rdi,r10
	call dlt
LB_4422:
	bt r12,2
	jc LB_4423
	mov rdi,r8
	call dlt
LB_4423:
	bt r12,3
	jc LB_4424
	mov rdi,r9
	call dlt
LB_4424:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_4397:
NS_E_3571:
; 	|» { 0' 1' }
NS_E_RDI_3571:
MTC_LB_4425:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4426
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂2'
; 1' ⊢ °0◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4427
	bt QWORD [rdi],0
	jc LB_4428
	btr r12,3
	clc
	jmp LB_4429
LB_4428:
	bts r12,3
	stc
LB_4429:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4427:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_4430
	btr r12,2
	jmp LB_4431
LB_4430:
	bts r12,2
LB_4431:
LB_4432:
	cmp r15,0
	jz LB_4433
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4432
LB_4433:
; _f3580 { %_3572 %_3574 } ⊢ { %_3575 %_3576 } : { %_3575 %_3576 }
 ; {>  %_3574~2':_p1981 %_3572~0':_r64 }
; _f3580 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4434
	btr r12,1
	jmp LB_4435
LB_4434:
	bts r12,1
LB_4435:
	push 46
	push LB_4436
	call NS_E_3580
LB_4436:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_3575 %_3576 }
 ; {>  %_3576~1':_stg %_3575~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_4426:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4437
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4438
	bt QWORD [rdi],0
	jc LB_4439
	btr r12,3
	clc
	jmp LB_4440
LB_4439:
	bts r12,3
	stc
LB_4440:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4438:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_4441
	btr r12,2
	jmp LB_4442
LB_4441:
	bts r12,2
LB_4442:
LB_4443:
	cmp r15,0
	jz LB_4444
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4443
LB_4444:
; _f3599 { %_3572 %_3577 } ⊢ { %_3578 %_3579 } : { %_3578 %_3579 }
 ; {>  %_3577~2':_p1982 %_3572~0':_r64 }
; _f3599 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4445
	btr r12,1
	jmp LB_4446
LB_4445:
	bts r12,1
LB_4446:
	push 47
	push LB_4447
	call NS_E_3599
LB_4447:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_3578 %_3579 }
 ; {>  %_3578~0':_r64 %_3579~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_4437:
NS_E_3553:
; 	|» { 0' 1' }
NS_E_RDI_3553:
MTC_LB_4448:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4449
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' } 4' }
; 1' ⊢ °0◂{ { 2' 3' } 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4450
	bt QWORD [rdi],0
	jc LB_4451
	btr r12,5
	clc
	jmp LB_4452
LB_4451:
	bts r12,5
	stc
LB_4452:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4450:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_4461
	btr r12,6
	clc
	jmp LB_4462
LB_4461:
	bts r12,6
	stc
LB_4462:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_4455
	btr r12,4
	clc
	jmp LB_4456
LB_4455:
	bts r12,4
	stc
LB_4456:
	mov r8,r10
	bt r12,4
	jc LB_4453
	btr r12,2
	jmp LB_4454
LB_4453:
	bts r12,2
LB_4454:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_4459
	btr r12,4
	clc
	jmp LB_4460
LB_4459:
	bts r12,4
	stc
LB_4460:
	mov r9,r10
	bt r12,4
	jc LB_4457
	btr r12,3
	jmp LB_4458
LB_4457:
	bts r12,3
LB_4458:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_4465
	btr r12,6
	clc
	jmp LB_4466
LB_4465:
	bts r12,6
	stc
LB_4466:
	mov r10,rcx
	bt r12,6
	jc LB_4463
	btr r12,4
	jmp LB_4464
LB_4463:
	bts r12,4
LB_4464:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4467:
	cmp r15,0
	jz LB_4468
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4467
LB_4468:
; _f56 %_3554 ⊢ %_3559 : %_3559
 ; {>  %_3558~4':(_lst)◂({ _stg _p1980 }) %_3557~3':_p1980 %_3554~0':_r64 %_3556~2':_stg }
	add r13,1
; _f3571 { %_3559 %_3557 } ⊢ { %_3560 %_3561 } : { %_3560 %_3561 }
 ; {>  %_3558~4':(_lst)◂({ _stg _p1980 }) %_3557~3':_p1980 %_3559~0':_r64 %_3556~2':_stg }
; _f3571 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4473
	btr r12,1
	jmp LB_4474
LB_4473:
	bts r12,1
LB_4474:
	push 45
	push LB_4475
	call NS_E_3571
LB_4475:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_4471
	btr r12,4
	clc
	jmp LB_4472
LB_4471:
	bts r12,4
	stc
LB_4472:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_4469
	btr r12,2
	clc
	jmp LB_4470
LB_4469:
	bts r12,2
	stc
LB_4470:
	add rsp,24
; _f55 %_3560 ⊢ %_3562 : %_3562
 ; {>  %_3560~0':_r64 %_3561~1':_stg %_3558~4':(_lst)◂({ _stg _p1980 }) %_3556~2':_stg }
	sub r13,1
; _f3553 { %_3562 %_3558 } ⊢ { %_3563 %_3564 } : { %_3563 %_3564 }
 ; {>  %_3561~1':_stg %_3558~4':(_lst)◂({ _stg _p1980 }) %_3562~0':_r64 %_3556~2':_stg }
; _f3553 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_4480
	btr r12,1
	jmp LB_4481
LB_4480:
	bts r12,1
LB_4481:
	push 44
	push LB_4484
	call NS_E_3553
LB_4484:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_4482
	btr r12,3
	jmp LB_4483
LB_4482:
	bts r12,3
LB_4483:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_4478
	btr r12,2
	clc
	jmp LB_4479
LB_4478:
	bts r12,2
	stc
LB_4479:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_4476
	btr r12,1
	clc
	jmp LB_4477
LB_4476:
	bts r12,1
	stc
LB_4477:
	add rsp,24
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_4485:
	cmp rax,0
	jz LB_4486
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4485
LB_4486:
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_3565 %_3569 }
 ; {>  %_3569~4':_stg %_3568~3':_stg %_3566~2':_stg %_3565~0':_r64 %_3567~1':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_4487
	mov rdi,r9
	call dlt
LB_4487:
	bt r12,2
	jc LB_4488
	mov rdi,r8
	call dlt
LB_4488:
	bt r12,1
	jc LB_4489
	mov rdi,r14
	call dlt
LB_4489:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_4490
	btr r12,1
	jmp LB_4491
LB_4490:
	bts r12,1
LB_4491:
	ret
MTC_LB_4449:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4492
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4493
	bt QWORD [rdi],0
	jc LB_4494
	btr r12,2
	clc
	jmp LB_4495
LB_4494:
	bts r12,2
	stc
LB_4495:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4493:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4496:
	cmp r15,0
	jz LB_4497
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4496
LB_4497:
; 	» "" _ ⊢ 1' : %_3570
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_3554 %_3570 }
 ; {>  %_3570~1':_stg %_3554~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_4492:
NS_E_3528:
; 	|» { 0' 1' }
NS_E_RDI_3528:
MTC_LB_4498:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4499
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' } 4' }
; 1' ⊢ °0◂{ { 2' 3' } 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4500
	bt QWORD [rdi],0
	jc LB_4501
	btr r12,5
	clc
	jmp LB_4502
LB_4501:
	bts r12,5
	stc
LB_4502:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4500:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_4511
	btr r12,6
	clc
	jmp LB_4512
LB_4511:
	bts r12,6
	stc
LB_4512:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_4505
	btr r12,4
	clc
	jmp LB_4506
LB_4505:
	bts r12,4
	stc
LB_4506:
	mov r8,r10
	bt r12,4
	jc LB_4503
	btr r12,2
	jmp LB_4504
LB_4503:
	bts r12,2
LB_4504:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_4509
	btr r12,4
	clc
	jmp LB_4510
LB_4509:
	bts r12,4
	stc
LB_4510:
	mov r9,r10
	bt r12,4
	jc LB_4507
	btr r12,3
	jmp LB_4508
LB_4507:
	bts r12,3
LB_4508:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_4515
	btr r12,6
	clc
	jmp LB_4516
LB_4515:
	bts r12,6
	stc
LB_4516:
	mov r10,rcx
	bt r12,6
	jc LB_4513
	btr r12,4
	jmp LB_4514
LB_4513:
	bts r12,4
LB_4514:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4517:
	cmp r15,0
	jz LB_4518
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4517
LB_4518:
; _f38 %_3529 ⊢ %_3534 : %_3534
 ; {>  %_3533~4':(_lst)◂({ _stg _p1979 }) %_3531~2':_stg %_3532~3':_p1979 %_3529~0':_r64 }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push -1
	push LB_4525
	call NS_E_38
LB_4525:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_4523
	btr r12,4
	clc
	jmp LB_4524
LB_4523:
	bts r12,4
	stc
LB_4524:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_4521
	btr r12,3
	clc
	jmp LB_4522
LB_4521:
	bts r12,3
	stc
LB_4522:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_4519
	btr r12,2
	clc
	jmp LB_4520
LB_4519:
	bts r12,2
	stc
LB_4520:
	add rsp,32
; _f3528 { %_3534 %_3533 } ⊢ { %_3535 %_3536 } : { %_3535 %_3536 }
 ; {>  %_3534~0':_r64 %_3533~4':(_lst)◂({ _stg _p1979 }) %_3531~2':_stg %_3532~3':_p1979 }
; _f3528 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_4530
	btr r12,1
	jmp LB_4531
LB_4530:
	bts r12,1
LB_4531:
	push 43
	push LB_4532
	call NS_E_3528
LB_4532:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_4528
	btr r12,3
	clc
	jmp LB_4529
LB_4528:
	bts r12,3
	stc
LB_4529:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_4526
	btr r12,2
	clc
	jmp LB_4527
LB_4526:
	bts r12,2
	stc
LB_4527:
	add rsp,24
MTC_LB_4533:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4534
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °0◂4'
; 3' ⊢ °0◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_4535
	bt QWORD [rdi],0
	jc LB_4536
	btr r12,5
	clc
	jmp LB_4537
LB_4536:
	bts r12,5
	stc
LB_4537:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4535:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_4538
	btr r12,4
	jmp LB_4539
LB_4538:
	bts r12,4
LB_4539:
LB_4540:
	cmp r15,0
	jz LB_4541
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4540
LB_4541:
; _f56 %_3535 ⊢ %_3538 : %_3538
 ; {>  %_3535~0':_r64 %_3537~4':(_lst)◂({ _stg _p1988 }) %_3531~2':_stg %_3536~1':_stg }
	add r13,1
; _f3670 { %_3538 %_3537 } ⊢ { %_3539 %_3540 } : { %_3539 %_3540 }
 ; {>  %_3537~4':(_lst)◂({ _stg _p1988 }) %_3538~0':_r64 %_3531~2':_stg %_3536~1':_stg }
; _f3670 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_4546
	btr r12,1
	jmp LB_4547
LB_4546:
	bts r12,1
LB_4547:
	push 51
	push LB_4550
	call NS_E_3670
LB_4550:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_4548
	btr r12,3
	jmp LB_4549
LB_4548:
	bts r12,3
LB_4549:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_4544
	btr r12,2
	clc
	jmp LB_4545
LB_4544:
	bts r12,2
	stc
LB_4545:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_4542
	btr r12,1
	clc
	jmp LB_4543
LB_4542:
	bts r12,1
	stc
LB_4543:
	add rsp,24
; _f55 %_3539 ⊢ %_3541 : %_3541
 ; {>  %_3540~3':_stg %_3539~0':_r64 %_3531~2':_stg %_3536~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_4551:
	cmp rax,0
	jz LB_4552
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4551
LB_4552:
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 3'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_3542 %_3546 }
 ; {>  %_3543~2':_stg %_3542~0':_r64 %_3545~1':_stg %_3544~3':_stg %_3546~4':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_4553
	mov rdi,r8
	call dlt
LB_4553:
	bt r12,1
	jc LB_4554
	mov rdi,r14
	call dlt
LB_4554:
	bt r12,3
	jc LB_4555
	mov rdi,r9
	call dlt
LB_4555:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_4556
	btr r12,1
	jmp LB_4557
LB_4556:
	bts r12,1
LB_4557:
	ret
MTC_LB_4534:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4558
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °1◂4'
; 3' ⊢ °1◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_4559
	bt QWORD [rdi],0
	jc LB_4560
	btr r12,5
	clc
	jmp LB_4561
LB_4560:
	bts r12,5
	stc
LB_4561:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4559:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_4562
	btr r12,4
	jmp LB_4563
LB_4562:
	bts r12,4
LB_4563:
LB_4564:
	cmp r15,0
	jz LB_4565
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4564
LB_4565:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,7
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_4566:
	cmp rax,0
	jz LB_4567
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4566
LB_4567:
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " = .. \n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_3548 %_3551 }
 ; {>  %_3549~2':_stg %_3548~0':_r64 %_3550~1':_stg %_3547~4':_p1988 %_3551~3':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_4568
	mov rdi,r8
	call dlt
LB_4568:
	bt r12,1
	jc LB_4569
	mov rdi,r14
	call dlt
LB_4569:
	bt r12,4
	jc LB_4570
	mov rdi,r10
	call dlt
LB_4570:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4571
	btr r12,1
	jmp LB_4572
LB_4571:
	bts r12,1
LB_4572:
	ret
MTC_LB_4558:
MTC_LB_4499:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4573
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4574
	bt QWORD [rdi],0
	jc LB_4575
	btr r12,2
	clc
	jmp LB_4576
LB_4575:
	bts r12,2
	stc
LB_4576:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4574:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4577:
	cmp r15,0
	jz LB_4578
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4577
LB_4578:
; 	» "" _ ⊢ 1' : %_3552
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_3529 %_3552 }
 ; {>  %_3529~0':_r64 %_3552~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_4573:
NS_E_3459:
; 	|» { 0' 1' }
NS_E_RDI_3459:
MTC_LB_4579:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4580
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4581
	bt QWORD [rdi],0
	jc LB_4582
	btr r12,4
	clc
	jmp LB_4583
LB_4582:
	bts r12,4
	stc
LB_4583:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4581:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_4586
	btr r12,5
	clc
	jmp LB_4587
LB_4586:
	bts r12,5
	stc
LB_4587:
	mov r8,r11
	bt r12,5
	jc LB_4584
	btr r12,2
	jmp LB_4585
LB_4584:
	bts r12,2
LB_4585:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_4590
	btr r12,5
	clc
	jmp LB_4591
LB_4590:
	bts r12,5
	stc
LB_4591:
	mov r9,r11
	bt r12,5
	jc LB_4588
	btr r12,3
	jmp LB_4589
LB_4588:
	bts r12,3
LB_4589:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4592:
	cmp r15,0
	jz LB_4593
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4592
LB_4593:
MTC_LB_4594:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4595
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °0◂1'
; 3' ⊢ °0◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_4596
	bt QWORD [rdi],0
	jc LB_4597
	btr r12,4
	clc
	jmp LB_4598
LB_4597:
	bts r12,4
	stc
LB_4598:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4596:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_4599
	btr r12,1
	jmp LB_4600
LB_4599:
	bts r12,1
LB_4600:
LB_4601:
	cmp r15,0
	jz LB_4602
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4601
LB_4602:
; _f56 %_3460 ⊢ %_3465 : %_3465
 ; {>  %_3462~2':_stg %_3464~1':(_lst)◂(_p1976) %_3460~0':_r64 }
	add r13,1
; _f3446 { %_3465 %_3464 } ⊢ { %_3466 %_3467 } : { %_3466 %_3467 }
 ; {>  %_3465~0':_r64 %_3462~2':_stg %_3464~1':(_lst)◂(_p1976) }
; _f3446 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	push 41
	push LB_4605
	call NS_E_3446
LB_4605:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_4603
	btr r12,2
	clc
	jmp LB_4604
LB_4603:
	bts r12,2
	stc
LB_4604:
	add rsp,16
; _f55 %_3466 ⊢ %_3468 : %_3468
 ; {>  %_3462~2':_stg %_3466~0':_r64 %_3467~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,5
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,1
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_4606:
	cmp rax,0
	jz LB_4607
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4606
LB_4607:
; "\194\167\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 0*"\t"
	mov rax,r13
LB_4608:
	cmp rax,0
	jz LB_4609
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4608
LB_4609:
; "\t"
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "\226\136\142\226\136\142\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
	add rsp,0
; ∎ { %_3469 %_3472 }
 ; {>  %_3471~1':_stg %_3470~2':_stg %_3469~0':_r64 %_3472~3':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_4610
	mov rdi,r14
	call dlt
LB_4610:
	bt r12,2
	jc LB_4611
	mov rdi,r8
	call dlt
LB_4611:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4612
	btr r12,1
	jmp LB_4613
LB_4612:
	bts r12,1
LB_4613:
	ret
MTC_LB_4595:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4614
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °1◂1'
; 3' ⊢ °1◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_4615
	bt QWORD [rdi],0
	jc LB_4616
	btr r12,4
	clc
	jmp LB_4617
LB_4616:
	bts r12,4
	stc
LB_4617:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4615:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_4618
	btr r12,1
	jmp LB_4619
LB_4618:
	bts r12,1
LB_4619:
LB_4620:
	cmp r15,0
	jz LB_4621
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4620
LB_4621:
; _f1881 %_3473 ⊢ %_3474 : %_3474
 ; {>  %_3462~2':_stg %_3473~1':_p1878 %_3460~0':_r64 }
; _f1881 1' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_4626
	btr r12,0
	jmp LB_4627
LB_4626:
	bts r12,0
LB_4627:
	push 29
	push LB_4630
	call NS_E_1881
LB_4630:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_4628
	btr r12,1
	jmp LB_4629
LB_4628:
	bts r12,1
LB_4629:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_4624
	btr r12,2
	clc
	jmp LB_4625
LB_4624:
	bts r12,2
	stc
LB_4625:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4622
	btr r12,0
	clc
	jmp LB_4623
LB_4622:
	bts r12,0
	stc
LB_4623:
	add rsp,24
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,5
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_4631:
	cmp rax,0
	jz LB_4632
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4631
LB_4632:
; "\194\167\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " = "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	add rsp,0
; ∎ { %_3475 %_3478 }
 ; {>  %_3475~0':_r64 %_3477~1':_stg %_3476~2':_stg %_3478~3':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_4633
	mov rdi,r14
	call dlt
LB_4633:
	bt r12,2
	jc LB_4634
	mov rdi,r8
	call dlt
LB_4634:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4635
	btr r12,1
	jmp LB_4636
LB_4635:
	bts r12,1
LB_4636:
	ret
MTC_LB_4614:
MTC_LB_4580:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4637
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4638
	bt QWORD [rdi],0
	jc LB_4639
	btr r12,3
	clc
	jmp LB_4640
LB_4639:
	bts r12,3
	stc
LB_4640:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4638:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_4641
	btr r12,2
	jmp LB_4642
LB_4641:
	bts r12,2
LB_4642:
LB_4643:
	cmp r15,0
	jz LB_4644
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4643
LB_4644:
; _f56 %_3460 ⊢ %_3480 : %_3480
 ; {>  %_3479~2':(_lst)◂({ _stg _p1980 }) %_3460~0':_r64 }
	add r13,1
; _f3553 { %_3480 %_3479 } ⊢ { %_3481 %_3482 } : { %_3481 %_3482 }
 ; {>  %_3479~2':(_lst)◂({ _stg _p1980 }) %_3480~0':_r64 }
; _f3553 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4645
	btr r12,1
	jmp LB_4646
LB_4645:
	bts r12,1
LB_4646:
	push 44
	push LB_4647
	call NS_E_3553
LB_4647:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_3481 ⊢ %_3483 : %_3483
 ; {>  %_3481~0':_r64 %_3482~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,8
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_4648:
	cmp rax,0
	jz LB_4649
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4648
LB_4649:
; "\194\167\194\167+s8\n"
	mov rsi,0x_0a_38_73_2b_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	add rdi,8
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_3484 %_3486 }
 ; {>  %_3486~2':_stg %_3484~0':_r64 %_3485~1':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_4650
	mov rdi,r14
	call dlt
LB_4650:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4651
	btr r12,1
	jmp LB_4652
LB_4651:
	bts r12,1
LB_4652:
	ret
MTC_LB_4637:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_4653
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂{ 2' 3' }
; 1' ⊢ °2◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4654
	bt QWORD [rdi],0
	jc LB_4655
	btr r12,4
	clc
	jmp LB_4656
LB_4655:
	bts r12,4
	stc
LB_4656:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4654:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_4659
	btr r12,5
	clc
	jmp LB_4660
LB_4659:
	bts r12,5
	stc
LB_4660:
	mov r8,r11
	bt r12,5
	jc LB_4657
	btr r12,2
	jmp LB_4658
LB_4657:
	bts r12,2
LB_4658:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_4663
	btr r12,5
	clc
	jmp LB_4664
LB_4663:
	bts r12,5
	stc
LB_4664:
	mov r9,r11
	bt r12,5
	jc LB_4661
	btr r12,3
	jmp LB_4662
LB_4661:
	bts r12,3
LB_4662:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4665:
	cmp r15,0
	jz LB_4666
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4665
LB_4666:
; _f56 %_3460 ⊢ %_3489 : %_3489
 ; {>  %_3487~2':_stg %_3460~0':_r64 %_3488~3':_p1978 }
	add r13,1
; _f3720 { %_3489 %_3488 } ⊢ { %_3490 %_3491 } : { %_3490 %_3491 }
 ; {>  %_3489~0':_r64 %_3487~2':_stg %_3488~3':_p1978 }
; _f3720 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4669
	btr r12,1
	jmp LB_4670
LB_4669:
	bts r12,1
LB_4670:
	push 54
	push LB_4671
	call NS_E_3720
LB_4671:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_4667
	btr r12,2
	clc
	jmp LB_4668
LB_4667:
	bts r12,2
	stc
LB_4668:
	add rsp,16
; _f55 %_3490 ⊢ %_3492 : %_3492
 ; {>  %_3491~1':_stg %_3490~0':_r64 %_3487~2':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_4672:
	cmp rax,0
	jz LB_4673
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4672
LB_4673:
; "\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_3493 %_3496 }
 ; {>  %_3495~1':_stg %_3496~3':_stg %_3493~0':_r64 %_3494~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_4674
	mov rdi,r14
	call dlt
LB_4674:
	bt r12,2
	jc LB_4675
	mov rdi,r8
	call dlt
LB_4675:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4676
	btr r12,1
	jmp LB_4677
LB_4676:
	bts r12,1
LB_4677:
	ret
MTC_LB_4653:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_4678
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °3◂2'
; 1' ⊢ °3◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4679
	bt QWORD [rdi],0
	jc LB_4680
	btr r12,3
	clc
	jmp LB_4681
LB_4680:
	bts r12,3
	stc
LB_4681:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4679:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_4682
	btr r12,2
	jmp LB_4683
LB_4682:
	bts r12,2
LB_4683:
LB_4684:
	cmp r15,0
	jz LB_4685
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4684
LB_4685:
; _f56 %_3460 ⊢ %_3498 : %_3498
 ; {>  %_3497~2':(_lst)◂({ _stg (_p1924)◂((_p1932)◂(_stg)) (_p1942)◂(_stg) }) %_3460~0':_r64 }
	add r13,1
; _f3744 { %_3498 %_3497 } ⊢ { %_3499 %_3500 } : { %_3499 %_3500 }
 ; {>  %_3497~2':(_lst)◂({ _stg (_p1924)◂((_p1932)◂(_stg)) (_p1942)◂(_stg) }) %_3498~0':_r64 }
; _f3744 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4686
	btr r12,1
	jmp LB_4687
LB_4686:
	bts r12,1
LB_4687:
	push 55
	push LB_4688
	call NS_E_3744
LB_4688:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_3499 ⊢ %_3501 : %_3501
 ; {>  %_3500~1':_stg %_3499~0':_r64 }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,4
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_4689:
	cmp rax,0
	jz LB_4690
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4689
LB_4690:
; "\194\167 \n"
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_3502 %_3504 }
 ; {>  %_3502~0':_r64 %_3503~1':_stg %_3504~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_4691
	mov rdi,r14
	call dlt
LB_4691:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4692
	btr r12,1
	jmp LB_4693
LB_4692:
	bts r12,1
LB_4693:
	ret
MTC_LB_4678:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_4694
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °4◂{ 2' 3' }
; 1' ⊢ °4◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4695
	bt QWORD [rdi],0
	jc LB_4696
	btr r12,4
	clc
	jmp LB_4697
LB_4696:
	bts r12,4
	stc
LB_4697:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4695:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_4700
	btr r12,5
	clc
	jmp LB_4701
LB_4700:
	bts r12,5
	stc
LB_4701:
	mov r8,r11
	bt r12,5
	jc LB_4698
	btr r12,2
	jmp LB_4699
LB_4698:
	bts r12,2
LB_4699:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_4704
	btr r12,5
	clc
	jmp LB_4705
LB_4704:
	bts r12,5
	stc
LB_4705:
	mov r9,r11
	bt r12,5
	jc LB_4702
	btr r12,3
	jmp LB_4703
LB_4702:
	bts r12,3
LB_4703:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4706:
	cmp r15,0
	jz LB_4707
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4706
LB_4707:
MTC_LB_4708:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4709
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °0◂1'
; 3' ⊢ °0◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_4710
	bt QWORD [rdi],0
	jc LB_4711
	btr r12,4
	clc
	jmp LB_4712
LB_4711:
	bts r12,4
	stc
LB_4712:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4710:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_4713
	btr r12,1
	jmp LB_4714
LB_4713:
	bts r12,1
LB_4714:
LB_4715:
	cmp r15,0
	jz LB_4716
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4715
LB_4716:
; _f56 %_3460 ⊢ %_3508 : %_3508
 ; {>  %_3505~2':_stg %_3507~1':(_lst)◂({ _stg _p1988 }) %_3460~0':_r64 }
	add r13,1
; _f3670 { %_3508 %_3507 } ⊢ { %_3509 %_3510 } : { %_3509 %_3510 }
 ; {>  %_3505~2':_stg %_3507~1':(_lst)◂({ _stg _p1988 }) %_3508~0':_r64 }
; _f3670 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	push 51
	push LB_4719
	call NS_E_3670
LB_4719:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_4717
	btr r12,2
	clc
	jmp LB_4718
LB_4717:
	bts r12,2
	stc
LB_4718:
	add rsp,16
; _f55 %_3509 ⊢ %_3511 : %_3511
 ; {>  %_3509~0':_r64 %_3505~2':_stg %_3510~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_4720:
	cmp rax,0
	jz LB_4721
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4720
LB_4721:
; "\194\182 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_3512 %_3515 }
 ; {>  %_3513~2':_stg %_3515~3':_stg %_3514~1':_stg %_3512~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_4722
	mov rdi,r8
	call dlt
LB_4722:
	bt r12,1
	jc LB_4723
	mov rdi,r14
	call dlt
LB_4723:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4724
	btr r12,1
	jmp LB_4725
LB_4724:
	bts r12,1
LB_4725:
	ret
MTC_LB_4709:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4726
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °1◂1'
; 3' ⊢ °1◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_4727
	bt QWORD [rdi],0
	jc LB_4728
	btr r12,4
	clc
	jmp LB_4729
LB_4728:
	bts r12,4
	stc
LB_4729:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4727:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_4730
	btr r12,1
	jmp LB_4731
LB_4730:
	bts r12,1
LB_4731:
LB_4732:
	cmp r15,0
	jz LB_4733
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4732
LB_4733:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_4734:
	cmp rax,0
	jz LB_4735
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4734
LB_4735:
; "\194\182 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " = .. \n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
	add rsp,0
; ∎ { %_3517 %_3519 }
 ; {>  %_3517~0':_r64 %_3519~3':_stg %_3518~2':_stg %_3516~1':_p1988 }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_4736
	mov rdi,r8
	call dlt
LB_4736:
	bt r12,1
	jc LB_4737
	mov rdi,r14
	call dlt
LB_4737:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4738
	btr r12,1
	jmp LB_4739
LB_4738:
	bts r12,1
LB_4739:
	ret
MTC_LB_4726:
MTC_LB_4694:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,5
	jnz MTC_LB_4740
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °5◂2'
; 1' ⊢ °5◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,5
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4741
	bt QWORD [rdi],0
	jc LB_4742
	btr r12,3
	clc
	jmp LB_4743
LB_4742:
	bts r12,3
	stc
LB_4743:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4741:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_4744
	btr r12,2
	jmp LB_4745
LB_4744:
	bts r12,2
LB_4745:
LB_4746:
	cmp r15,0
	jz LB_4747
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4746
LB_4747:
; _f56 %_3460 ⊢ %_3521 : %_3521
 ; {>  %_3520~2':(_lst)◂({ _stg _p1979 }) %_3460~0':_r64 }
	add r13,1
; _f3528 { %_3521 %_3520 } ⊢ { %_3522 %_3523 } : { %_3522 %_3523 }
 ; {>  %_3521~0':_r64 %_3520~2':(_lst)◂({ _stg _p1979 }) }
; _f3528 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4748
	btr r12,1
	jmp LB_4749
LB_4748:
	bts r12,1
LB_4749:
	push 43
	push LB_4750
	call NS_E_3528
LB_4750:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_3522 ⊢ %_3524 : %_3524
 ; {>  %_3523~1':_stg %_3522~0':_r64 }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_4751:
	cmp rax,0
	jz LB_4752
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_4751
LB_4752:
; "\194\182\n"
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_3525 %_3527 }
 ; {>  %_3527~2':_stg %_3525~0':_r64 %_3526~1':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_4753
	mov rdi,r14
	call dlt
LB_4753:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4754
	btr r12,1
	jmp LB_4755
LB_4754:
	bts r12,1
LB_4755:
	ret
MTC_LB_4740:
NS_E_3446:
; 	|» { 0' 1' }
NS_E_RDI_3446:
MTC_LB_4756:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4757
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4758
	bt QWORD [rdi],0
	jc LB_4759
	btr r12,2
	clc
	jmp LB_4760
LB_4759:
	bts r12,2
	stc
LB_4760:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4758:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4761:
	cmp r15,0
	jz LB_4762
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4761
LB_4762:
; 	» "" _ ⊢ 1' : %_3449
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_3447 %_3449 }
 ; {>  %_3449~1':_stg %_3447~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_4757:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4763
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_4764
	bt QWORD [rdi],0
	jc LB_4765
	btr r12,4
	clc
	jmp LB_4766
LB_4765:
	bts r12,4
	stc
LB_4766:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4764:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_4769
	btr r12,5
	clc
	jmp LB_4770
LB_4769:
	bts r12,5
	stc
LB_4770:
	mov r8,r11
	bt r12,5
	jc LB_4767
	btr r12,2
	jmp LB_4768
LB_4767:
	bts r12,2
LB_4768:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_4773
	btr r12,5
	clc
	jmp LB_4774
LB_4773:
	bts r12,5
	stc
LB_4774:
	mov r9,r11
	bt r12,5
	jc LB_4771
	btr r12,3
	jmp LB_4772
LB_4771:
	bts r12,3
LB_4772:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4775:
	cmp r15,0
	jz LB_4776
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4775
LB_4776:
; _f3459 { %_3447 %_3450 } ⊢ { %_3452 %_3453 } : { %_3452 %_3453 }
 ; {>  %_3451~3':(_lst)◂(_p1976) %_3447~0':_r64 %_3450~2':_p1976 }
; _f3459 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4779
	btr r12,1
	jmp LB_4780
LB_4779:
	bts r12,1
LB_4780:
	push 42
	push LB_4781
	call NS_E_3459
LB_4781:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_4777
	btr r12,3
	clc
	jmp LB_4778
LB_4777:
	bts r12,3
	stc
LB_4778:
	add rsp,16
; _f3446 { %_3452 %_3451 } ⊢ { %_3454 %_3455 } : { %_3454 %_3455 }
 ; {>  %_3452~0':_r64 %_3451~3':(_lst)◂(_p1976) %_3453~1':_stg }
; _f3446 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4784
	btr r12,1
	jmp LB_4785
LB_4784:
	bts r12,1
LB_4785:
	push 41
	push LB_4788
	call NS_E_3446
LB_4788:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_4786
	btr r12,2
	jmp LB_4787
LB_4786:
	bts r12,2
LB_4787:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_4782
	btr r12,1
	clc
	jmp LB_4783
LB_4782:
	bts r12,1
	stc
LB_4783:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,0
; ∎ { %_3454 %_3458 }
 ; {>  %_3457~2':_stg %_3458~3':_stg %_3454~0':_r64 %_3456~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_4789
	mov rdi,r8
	call dlt
LB_4789:
	bt r12,1
	jc LB_4790
	mov rdi,r14
	call dlt
LB_4790:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4791
	btr r12,1
	jmp LB_4792
LB_4791:
	bts r12,1
LB_4792:
	ret
MTC_LB_4763:
NS_E_4793:
NS_E_RDI_4793:
NS_E_4793_ETR_TBL:
NS_E_4793_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_4876
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,95
	jnz LB_4876
	jmp LB_4877
LB_4876:
	jmp LB_4862
LB_4877:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	push r10
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; " "
	add r14,1
	cmp r14,r10
	jg LB_4819
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,32
	jnz LB_4819
	jmp LB_4820
LB_4819:
	jmp LB_4811
LB_4820:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4812
	btr r12,0
	clc
	jmp LB_4813
LB_4812:
	bts r12,0
	stc
LB_4813:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 56
	push LB_4808
	push LB_4808
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some {  } ⊢ %_4795 : %_4795
 ; {>  %_161~0':_r64 %_160~1':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_4795
 ; {>  %_4795~°0◂{  }:(_opn)◂({ }) %_161~0':_r64 %_160~1':_r64 }
; 	∎ °0◂{  }
	bt r12,0
	jc LB_4806
	mov rdi,r13
	call dlt
LB_4806:
	bt r12,1
	jc LB_4807
	mov rdi,r14
	call dlt
LB_4807:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,0
	bts r12,2
	ret
LB_4808:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4810
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4809
LB_4810:
	add rsp,8
	jmp LB_4804
LB_4811:
	add rsp,16
	pop r14
LB_4809:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_4834
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,9
	jnz LB_4834
	jmp LB_4835
LB_4834:
	jmp LB_4826
LB_4835:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4827
	btr r12,0
	clc
	jmp LB_4828
LB_4827:
	bts r12,0
	stc
LB_4828:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 57
	push LB_4823
	push LB_4823
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some {  } ⊢ %_4796 : %_4796
 ; {>  %_164~1':_r64 %_165~0':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_4796
 ; {>  %_164~1':_r64 %_165~0':_r64 %_4796~°0◂{  }:(_opn)◂({ }) }
; 	∎ °0◂{  }
	bt r12,1
	jc LB_4821
	mov rdi,r14
	call dlt
LB_4821:
	bt r12,0
	jc LB_4822
	mov rdi,r13
	call dlt
LB_4822:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,0
	bts r12,2
	ret
LB_4823:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4825
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4824
LB_4825:
	add rsp,8
	jmp LB_4804
LB_4826:
	add rsp,16
	pop r14
LB_4824:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; wc_tl
	push r10
	call NS_E_4794_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4849
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4841
LB_4849:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4844
	btr r12,0
	clc
	jmp LB_4845
LB_4844:
	bts r12,0
	stc
LB_4845:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 58
	push LB_4838
	push LB_4838
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _none {  } ⊢ %_4798 : %_4798
 ; {>  %_4797~{  }:{ } %_168~1':_r64 %_169~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_4798
 ; {>  %_4798~°1◂{  }:(_opn)◂(t1842'(1)) %_4797~{  }:{ } %_168~1':_r64 %_169~0':_r64 }
; 	∎ °1◂{  }
	bt r12,1
	jc LB_4836
	mov rdi,r14
	call dlt
LB_4836:
	bt r12,0
	jc LB_4837
	mov rdi,r13
	call dlt
LB_4837:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_4838:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4840
	pop r14
	jmp LB_4843
LB_4840:
	add rsp,8
	jmp LB_4804
LB_4842:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_4843:
	jmp LB_4804
LB_4841:
	add rsp,16
	pop r14
LB_4839:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 59
	push LB_4853
	push LB_4853
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some {  } ⊢ %_4799 : %_4799
 ; {>  %_172~1':_r64 %_173~0':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_4799
 ; {>  %_4799~°0◂{  }:(_opn)◂({ }) %_172~1':_r64 %_173~0':_r64 }
; 	∎ °0◂{  }
	bt r12,1
	jc LB_4851
	mov rdi,r14
	call dlt
LB_4851:
	bt r12,0
	jc LB_4852
	mov rdi,r13
	call dlt
LB_4852:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,0
	bts r12,2
	ret
LB_4853:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4855
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4854
LB_4855:
	add rsp,8
	jmp LB_4804
LB_4856:
	add rsp,0
	pop r14
LB_4854:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	jmp LB_4804
LB_4804:
	pop r10
	cmp r8,0
	jz LB_4805
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4869
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4869:
	jmp LB_4862
LB_4805:
	mov rdi,r13
	mov rsi,r14
	mov r14,r9
	bt r12,3
	jc LB_4867
	btr r12,1
	clc
	jmp LB_4868
LB_4867:
	bts r12,1
	stc
LB_4868:
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4865
	btr r12,0
	clc
	jmp LB_4866
LB_4865:
	bts r12,0
	stc
LB_4866:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 60
	push LB_4859
	push LB_4859
; _emt_mov_ptn_to_ptn:{| 110.. |},{ { 0' } 1' } ⊢ { { {  } } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some {  } ⊢ %_4801 : %_4801
 ; {>  %_4800~{  }:{ } %_176~0':_r64 %_175~1':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_4801
 ; {>  %_4800~{  }:{ } %_176~0':_r64 %_4801~°0◂{  }:(_opn)◂({ }) %_175~1':_r64 }
; 	∎ °0◂{  }
	bt r12,0
	jc LB_4857
	mov rdi,r13
	call dlt
LB_4857:
	bt r12,1
	jc LB_4858
	mov rdi,r14
	call dlt
LB_4858:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,0
	bts r12,2
	ret
LB_4859:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4861
	pop r14
	jmp LB_4864
LB_4861:
	add rsp,8
	ret
LB_4863:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_4864:
	ret
LB_4862:
	add rsp,16
	pop r14
LB_4860:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4794:
NS_E_RDI_4794:
NS_E_4794_ETR_TBL:
NS_E_4794_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ","
	add r14,1
	cmp r14,r10
	jg LB_4893
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,44
	jnz LB_4893
	jmp LB_4894
LB_4893:
	jmp LB_4883
LB_4894:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4886
	btr r12,0
	clc
	jmp LB_4887
LB_4886:
	bts r12,0
	stc
LB_4887:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 61
	push LB_4880
	push LB_4880
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _none {  } ⊢ %_4802 : %_4802
 ; {>  %_179~1':_r64 %_180~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_4802
 ; {>  %_179~1':_r64 %_4802~°1◂{  }:(_opn)◂(t1851'(0)) %_180~0':_r64 }
; 	∎ °1◂{  }
	bt r12,1
	jc LB_4878
	mov rdi,r14
	call dlt
LB_4878:
	bt r12,0
	jc LB_4879
	mov rdi,r13
	call dlt
LB_4879:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_4880:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4882
	pop r14
	jmp LB_4885
LB_4882:
	add rsp,8
	ret
LB_4884:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_4885:
	ret
LB_4883:
	add rsp,16
	pop r14
LB_4881:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 62
	push LB_4897
	push LB_4897
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some {  } ⊢ %_4803 : %_4803
 ; {>  %_183~1':_r64 %_184~0':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_4803
 ; {>  %_183~1':_r64 %_4803~°0◂{  }:(_opn)◂({ }) %_184~0':_r64 }
; 	∎ °0◂{  }
	bt r12,1
	jc LB_4895
	mov rdi,r14
	call dlt
LB_4895:
	bt r12,0
	jc LB_4896
	mov rdi,r13
	call dlt
LB_4896:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,0
	bts r12,2
	ret
LB_4897:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4899
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4898
LB_4899:
	add rsp,8
	ret
LB_4900:
	add rsp,0
	pop r14
LB_4898:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4901:
NS_E_RDI_4901:
NS_E_4901_ETR_TBL:
NS_E_4901_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; prm_word
	jmp LB_4932
LB_4931:
	add r14,1
LB_4932:
	cmp r14,r10
	jge LB_4933
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4931
	cmp al,32
	jz LB_4931
LB_4933:
	push r10
	call NS_E_1823_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4934
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4924
LB_4934:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_4937
LB_4936:
	add r14,1
LB_4937:
	cmp r14,r10
	jge LB_4938
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4936
	cmp al,32
	jz LB_4936
LB_4938:
	add r14,1
	cmp r14,r10
	jg LB_4942
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,46
	jnz LB_4942
	jmp LB_4943
LB_4942:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4940
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4940:
	jmp LB_4924
LB_4943:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_4945
LB_4944:
	add r14,1
LB_4945:
	cmp r14,r10
	jge LB_4946
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4944
	cmp al,32
	jz LB_4944
LB_4946:
	push r10
	call NS_E_4901_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4947
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4948
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4948:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4949
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4949:
	jmp LB_4924
LB_4947:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4929
	btr r12,2
	clc
	jmp LB_4930
LB_4929:
	bts r12,2
	stc
LB_4930:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4927
	btr r12,1
	clc
	jmp LB_4928
LB_4927:
	bts r12,1
	stc
LB_4928:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4925
	btr r12,0
	clc
	jmp LB_4926
LB_4925:
	bts r12,0
	stc
LB_4926:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 63
	push LB_4921
	push LB_4921
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_4951
	btr r12,3
	jmp LB_4952
LB_4951:
	bts r12,3
LB_4952:
	mov r14,r8
	bt r12,2
	jc LB_4953
	btr r12,1
	jmp LB_4954
LB_4953:
	bts r12,1
LB_4954:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _f1879 { %_4902 %_4903 } ⊢ %_4904 : %_4904
 ; {>  %_4903~1':_p1878 %_188~2':_r64 %_4902~0':_stg %_187~3':_r64 }
; _f1879 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4904 ⊢ %_4905 : %_4905
 ; {>  %_4904~°0◂{ 0' 1' }:_p1878 %_188~2':_r64 %_187~3':_r64 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4905
 ; {>  %_4905~°0◂°0◂{ 0' 1' }:(_opn)◂(_p1878) %_188~2':_r64 %_187~3':_r64 }
; 	∎ °0◂°0◂{ 0' 1' }
	bt r12,2
	jc LB_4909
	mov rdi,r8
	call dlt
LB_4909:
	bt r12,3
	jc LB_4910
	mov rdi,r9
	call dlt
LB_4910:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_4915
	btr r12,2
	jmp LB_4916
LB_4915:
	bts r12,2
LB_4916:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_4913
	btr QWORD [rdi],0
	jmp LB_4914
LB_4913:
	bts QWORD [rdi],0
LB_4914:
	mov r8,r14
	bt r12,1
	jc LB_4919
	btr r12,2
	jmp LB_4920
LB_4919:
	bts r12,2
LB_4920:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_4917
	btr QWORD [rdi],1
	jmp LB_4918
LB_4917:
	bts QWORD [rdi],1
LB_4918:
	mov rsi,1
	bt r12,3
	jc LB_4911
	mov rsi,0
	bt r9,0
	jc LB_4911
	jmp LB_4912
LB_4911:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4912:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4921:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4923
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4922
LB_4923:
	add rsp,8
	ret
LB_4924:
	add rsp,48
	pop r14
LB_4922:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_4968
LB_4967:
	add r14,1
LB_4968:
	cmp r14,r10
	jge LB_4969
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4967
	cmp al,32
	jz LB_4967
LB_4969:
	push r10
	call NS_E_1823_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4970
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4964
LB_4970:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4965
	btr r12,0
	clc
	jmp LB_4966
LB_4965:
	bts r12,0
	stc
LB_4966:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 64
	push LB_4961
	push LB_4961
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1880 %_4906 ⊢ %_4907 : %_4907
 ; {>  %_192~1':_r64 %_191~2':_r64 %_4906~0':_stg }
; _f1880 0' ⊢ °1◂0'
; _some %_4907 ⊢ %_4908 : %_4908
 ; {>  %_192~1':_r64 %_191~2':_r64 %_4907~°1◂0':_p1878 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4908
 ; {>  %_192~1':_r64 %_191~2':_r64 %_4908~°0◂°1◂0':(_opn)◂(_p1878) }
; 	∎ °0◂°1◂0'
	bt r12,1
	jc LB_4955
	mov rdi,r14
	call dlt
LB_4955:
	bt r12,2
	jc LB_4956
	mov rdi,r8
	call dlt
LB_4956:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4959
	btr r12,3
	jmp LB_4960
LB_4959:
	bts r12,3
LB_4960:
	mov rsi,1
	bt r12,3
	jc LB_4957
	mov rsi,0
	bt r9,0
	jc LB_4957
	jmp LB_4958
LB_4957:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4958:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4961:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4963
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4962
LB_4963:
	add rsp,8
	ret
LB_4964:
	add rsp,16
	pop r14
LB_4962:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4972:
NS_E_RDI_4972:
NS_E_4972_ETR_TBL:
NS_E_4972_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_906_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4999
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4991
LB_4999:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_5007
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,114
	jnz LB_5007
	jmp LB_5008
LB_5007:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5005
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5005:
	jmp LB_4991
LB_5008:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4994
	btr r12,1
	clc
	jmp LB_4995
LB_4994:
	bts r12,1
	stc
LB_4995:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4992
	btr r12,0
	clc
	jmp LB_4993
LB_4992:
	bts r12,0
	stc
LB_4993:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 65
	push LB_4988
	push LB_4988
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1928 %_4973 ⊢ %_4974 : %_4974
 ; {>  %_196~1':_r64 %_4973~0':_r64 %_195~2':_r64 }
; _f1928 0' ⊢ °0◂0'
; _some %_4974 ⊢ %_4975 : %_4975
 ; {>  %_196~1':_r64 %_4974~°0◂0':_p1927 %_195~2':_r64 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_4975
 ; {>  %_4975~°0◂°0◂0':(_opn)◂(_p1927) %_196~1':_r64 %_195~2':_r64 }
; 	∎ °0◂°0◂0'
	bt r12,1
	jc LB_4982
	mov rdi,r14
	call dlt
LB_4982:
	bt r12,2
	jc LB_4983
	mov rdi,r8
	call dlt
LB_4983:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4986
	btr r12,3
	jmp LB_4987
LB_4986:
	bts r12,3
LB_4987:
	mov rsi,1
	bt r12,3
	jc LB_4984
	mov rsi,0
	bt r9,0
	jc LB_4984
	jmp LB_4985
LB_4984:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4985:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4988:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4990
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4989
LB_4990:
	add rsp,8
	ret
LB_4991:
	add rsp,32
	pop r14
LB_4989:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_1245_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5024
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5018
LB_5024:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5019
	btr r12,0
	clc
	jmp LB_5020
LB_5019:
	bts r12,0
	stc
LB_5020:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 66
	push LB_5015
	push LB_5015
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1929 %_4976 ⊢ %_4977 : %_4977
 ; {>  %_4976~0':_stg %_200~1':_r64 %_199~2':_r64 }
; _f1929 0' ⊢ °1◂0'
; _some %_4977 ⊢ %_4978 : %_4978
 ; {>  %_4977~°1◂0':_p1927 %_200~1':_r64 %_199~2':_r64 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4978
 ; {>  %_4978~°0◂°1◂0':(_opn)◂(_p1927) %_200~1':_r64 %_199~2':_r64 }
; 	∎ °0◂°1◂0'
	bt r12,1
	jc LB_5009
	mov rdi,r14
	call dlt
LB_5009:
	bt r12,2
	jc LB_5010
	mov rdi,r8
	call dlt
LB_5010:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5013
	btr r12,3
	jmp LB_5014
LB_5013:
	bts r12,3
LB_5014:
	mov rsi,1
	bt r12,3
	jc LB_5011
	mov rsi,0
	bt r9,0
	jc LB_5011
	jmp LB_5012
LB_5011:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5012:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5015:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5017
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5016
LB_5017:
	add rsp,8
	ret
LB_5018:
	add rsp,16
	pop r14
LB_5016:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_4901_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5041
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5035
LB_5041:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5036
	btr r12,0
	clc
	jmp LB_5037
LB_5036:
	bts r12,0
	stc
LB_5037:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 67
	push LB_5032
	push LB_5032
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1930 %_4979 ⊢ %_4980 : %_4980
 ; {>  %_204~1':_r64 %_4979~0':_p1878 %_203~2':_r64 }
; _f1930 0' ⊢ °2◂0'
; _some %_4980 ⊢ %_4981 : %_4981
 ; {>  %_204~1':_r64 %_4980~°2◂0':_p1927 %_203~2':_r64 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_4981
 ; {>  %_204~1':_r64 %_4981~°0◂°2◂0':(_opn)◂(_p1927) %_203~2':_r64 }
; 	∎ °0◂°2◂0'
	bt r12,1
	jc LB_5026
	mov rdi,r14
	call dlt
LB_5026:
	bt r12,2
	jc LB_5027
	mov rdi,r8
	call dlt
LB_5027:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5030
	btr r12,3
	jmp LB_5031
LB_5030:
	bts r12,3
LB_5031:
	mov rsi,1
	bt r12,3
	jc LB_5028
	mov rsi,0
	bt r9,0
	jc LB_5028
	jmp LB_5029
LB_5028:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5029:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5032:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5034
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5033
LB_5034:
	add rsp,8
	ret
LB_5035:
	add rsp,16
	pop r14
LB_5033:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5044:
NS_E_RDI_5044:
NS_E_5044_ETR_TBL:
NS_E_5044_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\n"
	jmp LB_5051
LB_5050:
	add r14,1
LB_5051:
	cmp r14,r10
	jge LB_5052
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5050
	cmp al,32
	jz LB_5050
LB_5052:
	add r14,1
	cmp r14,r10
	jg LB_5055
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_5055
	jmp LB_5056
LB_5055:
	jmp LB_5046
LB_5056:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ "\n" ⟧
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov rsi,0x01_00_0000_0000_0001
	or rdi,rsi
LB_5061:
	jmp LB_5058
LB_5057:
	add r14,1
LB_5058:
	cmp r14,r10
	jge LB_5059
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5057
	cmp al,32
	jz LB_5057
LB_5059:
	add r14,1
	cmp r14,r10
	jg LB_5060
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_5060
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov [rax+8*1],rsi
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_5061
LB_5060:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5047
	btr QWORD [rdi],1
LB_5047:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5048
	btr QWORD [rdi],0
LB_5048:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_5046:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5065:
; 	|» 0'
NS_E_RDI_5065:
MTC_LB_5078:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_5079
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ { 1' 2' 3' } 4' }
; 0' ⊢ °0◂{ { 1' 2' 3' } 4' }
	btr r12,5
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_5080
	bt QWORD [rdi],0
	jc LB_5081
	btr r12,5
	clc
	jmp LB_5082
LB_5081:
	bts r12,5
	stc
LB_5082:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_5080:
	mov r11,rdi
; 5' ⊢ { { 1' 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_5095
	btr r12,6
	clc
	jmp LB_5096
LB_5095:
	bts r12,6
	stc
LB_5096:
; 6' ⊢ { 1' 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_5085
	btr r12,4
	clc
	jmp LB_5086
LB_5085:
	bts r12,4
	stc
LB_5086:
	mov r14,r10
	bt r12,4
	jc LB_5083
	btr r12,1
	jmp LB_5084
LB_5083:
	bts r12,1
LB_5084:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_5089
	btr r12,4
	clc
	jmp LB_5090
LB_5089:
	bts r12,4
	stc
LB_5090:
	mov r8,r10
	bt r12,4
	jc LB_5087
	btr r12,2
	jmp LB_5088
LB_5087:
	bts r12,2
LB_5088:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_5093
	btr r12,4
	clc
	jmp LB_5094
LB_5093:
	bts r12,4
	stc
LB_5094:
	mov r9,r10
	bt r12,4
	jc LB_5091
	btr r12,3
	jmp LB_5092
LB_5091:
	bts r12,3
LB_5092:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_5099
	btr r12,6
	clc
	jmp LB_5100
LB_5099:
	bts r12,6
	stc
LB_5100:
	mov r10,rcx
	bt r12,6
	jc LB_5097
	btr r12,4
	jmp LB_5098
LB_5097:
	bts r12,4
LB_5098:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_5101:
	cmp r15,0
	jz LB_5102
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5101
LB_5102:
; _f5065 %_5070 ⊢ %_5071 : %_5071
 ; {>  %_5068~2':_r64 %_5067~1':_r64 %_5070~4':(_lst)◂({ _r64 _r64 _stg }) %_5069~3':_stg }
; _f5065 4' ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_5109
	btr r12,0
	jmp LB_5110
LB_5109:
	bts r12,0
LB_5110:
	push 68
	push LB_5111
	call NS_E_5065
LB_5111:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_5107
	btr r12,3
	clc
	jmp LB_5108
LB_5107:
	bts r12,3
	stc
LB_5108:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_5105
	btr r12,2
	clc
	jmp LB_5106
LB_5105:
	bts r12,2
	stc
LB_5106:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_5103
	btr r12,1
	clc
	jmp LB_5104
LB_5103:
	bts r12,1
	stc
LB_5104:
	add rsp,32
; » _^ ..
	xor rax,rax
	add rax,8
	sub rsp,124
	mov rdi,rsp
	push rax
	push r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdx,r14
	xor rax,rax
	mov rsi,fmt_d
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call sprintf
	mov rsp,QWORD [rsp_tmp]
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	pop rsi
	mov r11,rsp
	mov rcx,rax
	add rax,rsi
	add rax,1
	sub rsp,124
	mov rdi,rsp
	push rax
	push r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdx,r8
	xor rax,rax
	mov rsi,fmt_d
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call sprintf
	mov rsp,QWORD [rsp_tmp]
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	pop rsi
	mov rdx,rsp
	mov QWORD [st_vct+8*8],rax
	add rax,rsi
	add rax,1
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; "prs_err "
	mov rsi,0x_20_72_72_65_5f_73_72_70
	mov QWORD [rdi+8*0],rsi
	add rdi,8
; 0'
	push rcx
	mov rsi,r11
	mov rcx,rcx
	cld
	rep movsb
	pop rcx
; "-"
	mov rsi,0x_2d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,rdx
	mov rcx,QWORD [st_vct+8*8]
	cld
	rep movsb
	pop rcx
; ":"
	mov rsi,0x_3a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 3'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,248
; ∎ %_5076
 ; {>  %_5075~0':_stg %_5076~4':_stg %_5074~3':_stg %_5072~1':_r64 %_5073~2':_r64 }
; 	∎ 4'
	bt r12,0
	jc LB_5112
	mov rdi,r13
	call dlt
LB_5112:
	bt r12,3
	jc LB_5113
	mov rdi,r9
	call dlt
LB_5113:
	bt r12,1
	jc LB_5114
	mov rdi,r14
	call dlt
LB_5114:
	bt r12,2
	jc LB_5115
	mov rdi,r8
	call dlt
LB_5115:
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_5116
	btr r12,0
	jmp LB_5117
LB_5116:
	bts r12,0
LB_5117:
	ret
MTC_LB_5079:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_5118
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_5119
	bt QWORD [rdi],0
	jc LB_5120
	btr r12,1
	clc
	jmp LB_5121
LB_5120:
	bts r12,1
	stc
LB_5121:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_5119:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_5122:
	cmp r15,0
	jz LB_5123
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5122
LB_5123:
; 	» "" _ ⊢ 0' : %_5077
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_5077
 ; {>  %_5077~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_5118:
NS_E_5124:
; 	|» { 0' 1' }
NS_E_RDI_5124:
MTC_LB_5131:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_5132
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_5133
	bt QWORD [rdi],0
	jc LB_5134
	btr r12,4
	clc
	jmp LB_5135
LB_5134:
	bts r12,4
	stc
LB_5135:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_5133:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_5138
	btr r12,5
	clc
	jmp LB_5139
LB_5138:
	bts r12,5
	stc
LB_5139:
	mov r8,r11
	bt r12,5
	jc LB_5136
	btr r12,2
	jmp LB_5137
LB_5136:
	bts r12,2
LB_5137:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_5142
	btr r12,5
	clc
	jmp LB_5143
LB_5142:
	bts r12,5
	stc
LB_5143:
	mov r9,r11
	bt r12,5
	jc LB_5140
	btr r12,3
	jmp LB_5141
LB_5140:
	bts r12,3
LB_5141:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_5144:
	cmp r15,0
	jz LB_5145
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5144
LB_5145:
; _f2022 { %_5125 %_5127 } ⊢ %_5129 : %_5129
 ; {>  %_5128~3':(_lst)◂(_p1988) %_5127~2':_p1988 %_5125~0':_p1988 }
; _f2022 { 0' 2' } ⊢ °2◂{ 0' 2' }
; _f5124 { %_5129 %_5128 } ⊢ %_5130 : %_5130
 ; {>  %_5129~°2◂{ 0' 2' }:_p1988 %_5128~3':(_lst)◂(_p1988) }
; _f5124 { °2◂{ 0' 2' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °2◂{ 0' 2' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_5146
	btr r12,1
	jmp LB_5147
LB_5146:
	bts r12,1
LB_5147:
	mov r9,r13
	bt r12,0
	jc LB_5148
	btr r12,3
	jmp LB_5149
LB_5148:
	bts r12,3
LB_5149:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_5154
	btr r12,4
	jmp LB_5155
LB_5154:
	bts r12,4
LB_5155:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_5152
	btr QWORD [rdi],0
	jmp LB_5153
LB_5152:
	bts QWORD [rdi],0
LB_5153:
	mov r10,r8
	bt r12,2
	jc LB_5158
	btr r12,4
	jmp LB_5159
LB_5158:
	bts r12,4
LB_5159:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_5156
	btr QWORD [rdi],1
	jmp LB_5157
LB_5156:
	bts QWORD [rdi],1
LB_5157:
	mov rsi,1
	bt r12,0
	jc LB_5150
	mov rsi,0
	bt r13,0
	jc LB_5150
	jmp LB_5151
LB_5150:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_5151:
	mov rax,0x0200_0000_0000_0001
	or r13,rax
	push 69
	push LB_5160
	call NS_E_5124
LB_5160:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_5130
 ; {>  %_5130~0':_p1988 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_5132:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_5161
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_5162
	bt QWORD [rdi],0
	jc LB_5163
	btr r12,2
	clc
	jmp LB_5164
LB_5163:
	bts r12,2
	stc
LB_5164:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_5162:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_5165:
	cmp r15,0
	jz LB_5166
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_5165
LB_5166:
; ∎ %_5125
 ; {>  %_5125~0':_p1988 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_5161:
NS_E_5167:
NS_E_RDI_5167:
NS_E_5167_ETR_TBL:
NS_E_5167_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_5221
LB_5220:
	add r14,1
LB_5221:
	cmp r14,r10
	jge LB_5222
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5220
	cmp al,10
	jz LB_5220
	cmp al,32
	jz LB_5220
LB_5222:
	add r14,1
	cmp r14,r10
	jg LB_5225
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,123
	jnz LB_5225
	jmp LB_5226
LB_5225:
	jmp LB_5213
LB_5226:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_ptn_lst
	jmp LB_5228
LB_5227:
	add r14,1
LB_5228:
	cmp r14,r10
	jge LB_5229
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5227
	cmp al,10
	jz LB_5227
	cmp al,32
	jz LB_5227
LB_5229:
	push r10
	call NS_E_5168_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5230
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5231
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5231:
	jmp LB_5213
LB_5230:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_5234
LB_5233:
	add r14,1
LB_5234:
	cmp r14,r10
	jge LB_5235
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5233
	cmp al,10
	jz LB_5233
	cmp al,32
	jz LB_5233
LB_5235:
	add r14,1
	cmp r14,r10
	jg LB_5240
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,125
	jnz LB_5240
	jmp LB_5241
LB_5240:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5237
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5237:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5238
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5238:
	jmp LB_5213
LB_5241:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5218
	btr r12,2
	clc
	jmp LB_5219
LB_5218:
	bts r12,2
	stc
LB_5219:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5216
	btr r12,1
	clc
	jmp LB_5217
LB_5216:
	bts r12,1
	stc
LB_5217:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5214
	btr r12,0
	clc
	jmp LB_5215
LB_5214:
	bts r12,0
	stc
LB_5215:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 70
	push LB_5210
	push LB_5210
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_5242
	btr r12,3
	jmp LB_5243
LB_5242:
	bts r12,3
LB_5243:
	mov r13,r14
	bt r12,1
	jc LB_5244
	btr r12,0
	jmp LB_5245
LB_5244:
	bts r12,0
LB_5245:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1925 %_5171 ⊢ %_5172 : %_5172
 ; {>  %_207~2':_r64 %_208~1':_r64 %_5171~0':(_lst)◂((_p1924)◂((_p1937)◂(_stg))) }
; _f1925 0' ⊢ °0◂0'
; _some %_5172 ⊢ %_5173 : %_5173
 ; {>  %_5172~°0◂0':(_p1924)◂((_p1937)◂(_stg)) %_207~2':_r64 %_208~1':_r64 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5173
 ; {>  %_207~2':_r64 %_208~1':_r64 %_5173~°0◂°0◂0':(_opn)◂((_p1924)◂((_p1937)◂(_stg))) }
; 	∎ °0◂°0◂0'
	bt r12,2
	jc LB_5204
	mov rdi,r8
	call dlt
LB_5204:
	bt r12,1
	jc LB_5205
	mov rdi,r14
	call dlt
LB_5205:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5208
	btr r12,3
	jmp LB_5209
LB_5208:
	bts r12,3
LB_5209:
	mov rsi,1
	bt r12,3
	jc LB_5206
	mov rsi,0
	bt r9,0
	jc LB_5206
	jmp LB_5207
LB_5206:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5207:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5210:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5212
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5211
LB_5212:
	add rsp,8
	ret
LB_5213:
	add rsp,48
	pop r14
LB_5211:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; mtc
	jmp LB_5259
LB_5258:
	add r14,1
LB_5259:
	cmp r14,r10
	jge LB_5260
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5258
	cmp al,10
	jz LB_5258
	cmp al,32
	jz LB_5258
LB_5260:
	push r10
	call NS_E_5170_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5261
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5255
LB_5261:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5256
	btr r12,0
	clc
	jmp LB_5257
LB_5256:
	bts r12,0
	stc
LB_5257:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 71
	push LB_5252
	push LB_5252
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1926 %_5174 ⊢ %_5175 : %_5175
 ; {>  %_211~2':_r64 %_5174~0':(_p1937)◂(_stg) %_212~1':_r64 }
; _f1926 0' ⊢ °1◂0'
; _some %_5175 ⊢ %_5176 : %_5176
 ; {>  %_211~2':_r64 %_212~1':_r64 %_5175~°1◂0':(_p1924)◂((_p1937)◂(_stg)) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5176
 ; {>  %_211~2':_r64 %_5176~°0◂°1◂0':(_opn)◂((_p1924)◂((_p1937)◂(_stg))) %_212~1':_r64 }
; 	∎ °0◂°1◂0'
	bt r12,2
	jc LB_5246
	mov rdi,r8
	call dlt
LB_5246:
	bt r12,1
	jc LB_5247
	mov rdi,r14
	call dlt
LB_5247:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5250
	btr r12,3
	jmp LB_5251
LB_5250:
	bts r12,3
LB_5251:
	mov rsi,1
	bt r12,3
	jc LB_5248
	mov rsi,0
	bt r9,0
	jc LB_5248
	jmp LB_5249
LB_5248:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5249:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5252:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5254
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5253
LB_5254:
	add rsp,8
	ret
LB_5255:
	add rsp,16
	pop r14
LB_5253:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5168:
NS_E_RDI_5168:
NS_E_5168_ETR_TBL:
NS_E_5168_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; mtc_ptn
	jmp LB_5284
LB_5283:
	add r14,1
LB_5284:
	cmp r14,r10
	jge LB_5285
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5283
	cmp al,10
	jz LB_5283
	cmp al,32
	jz LB_5283
LB_5285:
	push r10
	call NS_E_5167_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5286
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5278
LB_5286:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mtc_ptn_lst
	jmp LB_5289
LB_5288:
	add r14,1
LB_5289:
	cmp r14,r10
	jge LB_5290
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5288
	cmp al,10
	jz LB_5288
	cmp al,32
	jz LB_5288
LB_5290:
	push r10
	call NS_E_5168_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5291
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5292
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5292:
	jmp LB_5278
LB_5291:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5281
	btr r12,1
	clc
	jmp LB_5282
LB_5281:
	bts r12,1
	stc
LB_5282:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5279
	btr r12,0
	clc
	jmp LB_5280
LB_5279:
	bts r12,0
	stc
LB_5280:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 72
	push LB_5275
	push LB_5275
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _cns { %_5177 %_5178 } ⊢ %_5179 : %_5179
 ; {>  %_216~2':_r64 %_5177~0':(_p1924)◂((_p1937)◂(_stg)) %_215~3':_r64 %_5178~1':(_lst)◂((_p1924)◂((_p1937)◂(_stg))) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5179 ⊢ %_5180 : %_5180
 ; {>  %_216~2':_r64 %_5179~°0◂{ 0' 1' }:(_lst)◂((_p1924)◂((_p1937)◂(_stg))) %_215~3':_r64 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5180
 ; {>  %_216~2':_r64 %_215~3':_r64 %_5180~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1924)◂((_p1937)◂(_stg)))) }
; 	∎ °0◂°0◂{ 0' 1' }
	bt r12,2
	jc LB_5263
	mov rdi,r8
	call dlt
LB_5263:
	bt r12,3
	jc LB_5264
	mov rdi,r9
	call dlt
LB_5264:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_5269
	btr r12,2
	jmp LB_5270
LB_5269:
	bts r12,2
LB_5270:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5267
	btr QWORD [rdi],0
	jmp LB_5268
LB_5267:
	bts QWORD [rdi],0
LB_5268:
	mov r8,r14
	bt r12,1
	jc LB_5273
	btr r12,2
	jmp LB_5274
LB_5273:
	bts r12,2
LB_5274:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5271
	btr QWORD [rdi],1
	jmp LB_5272
LB_5271:
	bts QWORD [rdi],1
LB_5272:
	mov rsi,1
	bt r12,3
	jc LB_5265
	mov rsi,0
	bt r9,0
	jc LB_5265
	jmp LB_5266
LB_5265:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5266:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5275:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5277
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5276
LB_5277:
	add rsp,8
	ret
LB_5278:
	add rsp,32
	pop r14
LB_5276:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 73
	push LB_5298
	push LB_5298
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_5181 : %_5181
 ; {>  %_219~1':_r64 %_220~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _some %_5181 ⊢ %_5182 : %_5182
 ; {>  %_219~1':_r64 %_5181~°1◂{  }:(_lst)◂(t2008'(0)) %_220~0':_r64 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5182
 ; {>  %_219~1':_r64 %_5182~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2011'(0))) %_220~0':_r64 }
; 	∎ °0◂°1◂{  }
	bt r12,1
	jc LB_5294
	mov rdi,r14
	call dlt
LB_5294:
	bt r12,0
	jc LB_5295
	mov rdi,r13
	call dlt
LB_5295:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_5296
	mov rsi,0
	bt r9,0
	jc LB_5296
	jmp LB_5297
LB_5296:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5297:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5298:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5300
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5299
LB_5300:
	add rsp,8
	ret
LB_5301:
	add rsp,0
	pop r14
LB_5299:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5169:
NS_E_RDI_5169:
NS_E_5169_ETR_TBL:
NS_E_5169_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_5340
LB_5339:
	add r14,1
LB_5340:
	cmp r14,r10
	jge LB_5341
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5339
	cmp al,10
	jz LB_5339
	cmp al,32
	jz LB_5339
LB_5341:
	add r14,1
	cmp r14,r10
	jg LB_5344
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,44
	jnz LB_5344
	jmp LB_5345
LB_5344:
	jmp LB_5317
LB_5345:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc
	jmp LB_5327
LB_5326:
	add r14,1
LB_5327:
	cmp r14,r10
	jge LB_5328
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5326
	cmp al,10
	jz LB_5326
	cmp al,32
	jz LB_5326
LB_5328:
	push r10
	call NS_E_5170_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5329
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5330
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5330:
	jmp LB_5318
LB_5329:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_tl
	jmp LB_5333
LB_5332:
	add r14,1
LB_5333:
	cmp r14,r10
	jge LB_5334
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5332
	cmp al,10
	jz LB_5332
	cmp al,32
	jz LB_5332
LB_5334:
	push r10
	call NS_E_5169_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5335
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5336
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5336:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5337
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5337:
	jmp LB_5318
LB_5335:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5324
	btr r12,2
	clc
	jmp LB_5325
LB_5324:
	bts r12,2
	stc
LB_5325:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5322
	btr r12,1
	clc
	jmp LB_5323
LB_5322:
	bts r12,1
	stc
LB_5323:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5320
	btr r12,0
	clc
	jmp LB_5321
LB_5320:
	bts r12,0
	stc
LB_5321:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 74
	push LB_5314
	push LB_5314
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_5346
	btr r12,3
	jmp LB_5347
LB_5346:
	bts r12,3
LB_5347:
	mov r14,r8
	bt r12,2
	jc LB_5348
	btr r12,1
	jmp LB_5349
LB_5348:
	bts r12,1
LB_5349:
	mov r8,r13
	bt r12,0
	jc LB_5350
	btr r12,2
	jmp LB_5351
LB_5350:
	bts r12,2
LB_5351:
	mov r13,r9
	bt r12,3
	jc LB_5352
	btr r12,0
	jmp LB_5353
LB_5352:
	bts r12,0
LB_5353:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _cns { %_5183 %_5184 } ⊢ %_5185 : %_5185
 ; {>  %_224~2':_r64 %_223~3':_r64 %_5183~0':(_p1937)◂(_stg) %_5184~1':(_lst)◂((_p1937)◂(_stg)) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5185 ⊢ %_5186 : %_5186
 ; {>  %_224~2':_r64 %_5185~°0◂{ 0' 1' }:(_lst)◂((_p1937)◂(_stg)) %_223~3':_r64 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5186
 ; {>  %_224~2':_r64 %_223~3':_r64 %_5186~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1937)◂(_stg))) }
; 	∎ °0◂°0◂{ 0' 1' }
	bt r12,2
	jc LB_5302
	mov rdi,r8
	call dlt
LB_5302:
	bt r12,3
	jc LB_5303
	mov rdi,r9
	call dlt
LB_5303:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_5308
	btr r12,2
	jmp LB_5309
LB_5308:
	bts r12,2
LB_5309:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5306
	btr QWORD [rdi],0
	jmp LB_5307
LB_5306:
	bts QWORD [rdi],0
LB_5307:
	mov r8,r14
	bt r12,1
	jc LB_5312
	btr r12,2
	jmp LB_5313
LB_5312:
	bts r12,2
LB_5313:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5310
	btr QWORD [rdi],1
	jmp LB_5311
LB_5310:
	bts QWORD [rdi],1
LB_5311:
	mov rsi,1
	bt r12,3
	jc LB_5304
	mov rsi,0
	bt r9,0
	jc LB_5304
	jmp LB_5305
LB_5304:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5305:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5314:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5316
	pop r14
	jmp LB_5319
LB_5316:
	add rsp,8
	ret
LB_5318:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_5319:
	ret
LB_5317:
	add rsp,48
	pop r14
LB_5315:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 75
	push LB_5358
	push LB_5358
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_5187 : %_5187
 ; {>  %_227~1':_r64 %_228~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _some %_5187 ⊢ %_5188 : %_5188
 ; {>  %_5187~°1◂{  }:(_lst)◂(t2021'(0)) %_227~1':_r64 %_228~0':_r64 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5188
 ; {>  %_227~1':_r64 %_228~0':_r64 %_5188~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2024'(0))) }
; 	∎ °0◂°1◂{  }
	bt r12,1
	jc LB_5354
	mov rdi,r14
	call dlt
LB_5354:
	bt r12,0
	jc LB_5355
	mov rdi,r13
	call dlt
LB_5355:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_5356
	mov rsi,0
	bt r9,0
	jc LB_5356
	jmp LB_5357
LB_5356:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5357:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5358:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5360
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5359
LB_5360:
	add rsp,8
	ret
LB_5361:
	add rsp,0
	pop r14
LB_5359:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5170:
NS_E_RDI_5170:
NS_E_5170_ETR_TBL:
NS_E_5170_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; name
	jmp LB_5385
LB_5384:
	add r14,1
LB_5385:
	cmp r14,r10
	jge LB_5386
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5384
	cmp al,10
	jz LB_5384
	cmp al,32
	jz LB_5384
LB_5386:
	push r10
	call NS_E_4901_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5387
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5377
LB_5387:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\151\130"
	jmp LB_5390
LB_5389:
	add r14,1
LB_5390:
	cmp r14,r10
	jge LB_5391
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5389
	cmp al,10
	jz LB_5389
	cmp al,32
	jz LB_5389
LB_5391:
	add r14,3
	cmp r14,r10
	jg LB_5395
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_5395
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,151
	jnz LB_5395
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,130
	jnz LB_5395
	jmp LB_5396
LB_5395:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5393
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5393:
	jmp LB_5377
LB_5396:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_ptn
	jmp LB_5398
LB_5397:
	add r14,1
LB_5398:
	cmp r14,r10
	jge LB_5399
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5397
	cmp al,10
	jz LB_5397
	cmp al,32
	jz LB_5397
LB_5399:
	push r10
	call NS_E_5167_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5400
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5401
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5401:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5402
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5402:
	jmp LB_5377
LB_5400:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5382
	btr r12,2
	clc
	jmp LB_5383
LB_5382:
	bts r12,2
	stc
LB_5383:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5380
	btr r12,1
	clc
	jmp LB_5381
LB_5380:
	bts r12,1
	stc
LB_5381:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5378
	btr r12,0
	clc
	jmp LB_5379
LB_5378:
	bts r12,0
	stc
LB_5379:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 76
	push LB_5374
	push LB_5374
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_5404
	btr r12,3
	jmp LB_5405
LB_5404:
	bts r12,3
LB_5405:
	mov r14,r8
	bt r12,2
	jc LB_5406
	btr r12,1
	jmp LB_5407
LB_5406:
	bts r12,1
LB_5407:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _f1938 { %_5189 %_5190 } ⊢ %_5191 : %_5191
 ; {>  %_5190~1':(_p1924)◂((_p1937)◂(_stg)) %_232~2':_r64 %_231~3':_r64 %_5189~0':_p1878 }
; _f1938 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5191 ⊢ %_5192 : %_5192
 ; {>  %_232~2':_r64 %_231~3':_r64 %_5191~°0◂{ 0' 1' }:(_p1937)◂(_stg) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5192
 ; {>  %_5192~°0◂°0◂{ 0' 1' }:(_opn)◂((_p1937)◂(_stg)) %_232~2':_r64 %_231~3':_r64 }
; 	∎ °0◂°0◂{ 0' 1' }
	bt r12,2
	jc LB_5362
	mov rdi,r8
	call dlt
LB_5362:
	bt r12,3
	jc LB_5363
	mov rdi,r9
	call dlt
LB_5363:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_5368
	btr r12,2
	jmp LB_5369
LB_5368:
	bts r12,2
LB_5369:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5366
	btr QWORD [rdi],0
	jmp LB_5367
LB_5366:
	bts QWORD [rdi],0
LB_5367:
	mov r8,r14
	bt r12,1
	jc LB_5372
	btr r12,2
	jmp LB_5373
LB_5372:
	bts r12,2
LB_5373:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5370
	btr QWORD [rdi],1
	jmp LB_5371
LB_5370:
	bts QWORD [rdi],1
LB_5371:
	mov rsi,1
	bt r12,3
	jc LB_5364
	mov rsi,0
	bt r9,0
	jc LB_5364
	jmp LB_5365
LB_5364:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5365:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5374:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5376
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5375
LB_5376:
	add rsp,8
	ret
LB_5377:
	add rsp,48
	pop r14
LB_5375:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "%["
	jmp LB_5442
LB_5441:
	add r14,1
LB_5442:
	cmp r14,r10
	jge LB_5443
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5441
	cmp al,10
	jz LB_5441
	cmp al,32
	jz LB_5441
LB_5443:
	add r14,2
	cmp r14,r10
	jg LB_5446
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,37
	jnz LB_5446
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,91
	jnz LB_5446
	jmp LB_5447
LB_5446:
	jmp LB_5417
LB_5447:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_5427
LB_5426:
	add r14,1
LB_5427:
	cmp r14,r10
	jge LB_5428
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5426
	cmp al,10
	jz LB_5426
	cmp al,32
	jz LB_5426
LB_5428:
	push r10
	call NS_E_4972_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5429
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5430
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5430:
	jmp LB_5418
LB_5429:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "]"
	jmp LB_5433
LB_5432:
	add r14,1
LB_5433:
	cmp r14,r10
	jge LB_5434
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5432
	cmp al,10
	jz LB_5432
	cmp al,32
	jz LB_5432
LB_5434:
	add r14,1
	cmp r14,r10
	jg LB_5439
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,93
	jnz LB_5439
	jmp LB_5440
LB_5439:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5436
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5436:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5437
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5437:
	jmp LB_5418
LB_5440:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5424
	btr r12,2
	clc
	jmp LB_5425
LB_5424:
	bts r12,2
	stc
LB_5425:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5422
	btr r12,1
	clc
	jmp LB_5423
LB_5422:
	bts r12,1
	stc
LB_5423:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5420
	btr r12,0
	clc
	jmp LB_5421
LB_5420:
	bts r12,0
	stc
LB_5421:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 77
	push LB_5414
	push LB_5414
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_5448
	btr r12,3
	jmp LB_5449
LB_5448:
	bts r12,3
LB_5449:
	mov r13,r14
	bt r12,1
	jc LB_5450
	btr r12,0
	jmp LB_5451
LB_5450:
	bts r12,0
LB_5451:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1939 %_5193 ⊢ %_5194 : %_5194
 ; {>  %_5193~0':_p1927 %_235~2':_r64 %_236~1':_r64 }
; _f1939 0' ⊢ °1◂0'
; _some %_5194 ⊢ %_5195 : %_5195
 ; {>  %_5194~°1◂0':(_p1937)◂(t2037'(0)) %_235~2':_r64 %_236~1':_r64 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5195
 ; {>  %_5195~°0◂°1◂0':(_opn)◂((_p1937)◂(t2040'(0))) %_235~2':_r64 %_236~1':_r64 }
; 	∎ °0◂°1◂0'
	bt r12,2
	jc LB_5408
	mov rdi,r8
	call dlt
LB_5408:
	bt r12,1
	jc LB_5409
	mov rdi,r14
	call dlt
LB_5409:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5412
	btr r12,3
	jmp LB_5413
LB_5412:
	bts r12,3
LB_5413:
	mov rsi,1
	bt r12,3
	jc LB_5410
	mov rsi,0
	bt r9,0
	jc LB_5410
	jmp LB_5411
LB_5410:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5411:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5414:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5416
	pop r14
	jmp LB_5419
LB_5416:
	add rsp,8
	ret
LB_5418:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_5419:
	ret
LB_5417:
	add rsp,48
	pop r14
LB_5415:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	jmp LB_5475
LB_5474:
	add r14,1
LB_5475:
	cmp r14,r10
	jge LB_5476
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5474
	cmp al,10
	jz LB_5474
	cmp al,32
	jz LB_5474
LB_5476:
	add r14,1
	cmp r14,r10
	jg LB_5479
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,37
	jnz LB_5479
	jmp LB_5480
LB_5479:
	jmp LB_5461
LB_5480:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; prm_word
	jmp LB_5469
LB_5468:
	add r14,1
LB_5469:
	cmp r14,r10
	jge LB_5470
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5468
	cmp al,10
	jz LB_5468
	cmp al,32
	jz LB_5468
LB_5470:
	push r10
	call NS_E_1823_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5471
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5472
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5472:
	jmp LB_5462
LB_5471:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5466
	btr r12,1
	clc
	jmp LB_5467
LB_5466:
	bts r12,1
	stc
LB_5467:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5464
	btr r12,0
	clc
	jmp LB_5465
LB_5464:
	bts r12,0
	stc
LB_5465:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 78
	push LB_5458
	push LB_5458
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5481
	btr r12,2
	jmp LB_5482
LB_5481:
	bts r12,2
LB_5482:
	mov r13,r14
	bt r12,1
	jc LB_5483
	btr r12,0
	jmp LB_5484
LB_5483:
	bts r12,0
LB_5484:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1941 %_5196 ⊢ %_5197 : %_5197
 ; {>  %_240~1':_r64 %_239~2':_r64 %_5196~0':_stg }
; _f1941 0' ⊢ °3◂0'
; _some %_5197 ⊢ %_5198 : %_5198
 ; {>  %_240~1':_r64 %_239~2':_r64 %_5197~°3◂0':(_p1937)◂(_stg) }
; _some °3◂0' ⊢ °0◂°3◂0'
; ∎ %_5198
 ; {>  %_240~1':_r64 %_239~2':_r64 %_5198~°0◂°3◂0':(_opn)◂((_p1937)◂(_stg)) }
; 	∎ °0◂°3◂0'
	bt r12,1
	jc LB_5452
	mov rdi,r14
	call dlt
LB_5452:
	bt r12,2
	jc LB_5453
	mov rdi,r8
	call dlt
LB_5453:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°3◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5456
	btr r12,3
	jmp LB_5457
LB_5456:
	bts r12,3
LB_5457:
	mov rsi,1
	bt r12,3
	jc LB_5454
	mov rsi,0
	bt r9,0
	jc LB_5454
	jmp LB_5455
LB_5454:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5455:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5458:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5460
	pop r14
	jmp LB_5463
LB_5460:
	add rsp,8
	ret
LB_5462:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_5463:
	ret
LB_5461:
	add rsp,32
	pop r14
LB_5459:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_5498
LB_5497:
	add r14,1
LB_5498:
	cmp r14,r10
	jge LB_5499
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5497
	cmp al,10
	jz LB_5497
	cmp al,32
	jz LB_5497
LB_5499:
	push r10
	call NS_E_1823_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5500
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5494
LB_5500:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5495
	btr r12,0
	clc
	jmp LB_5496
LB_5495:
	bts r12,0
	stc
LB_5496:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 79
	push LB_5491
	push LB_5491
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1941 %_5199 ⊢ %_5200 : %_5200
 ; {>  %_5199~0':_stg %_243~2':_r64 %_244~1':_r64 }
; _f1941 0' ⊢ °3◂0'
; _some %_5200 ⊢ %_5201 : %_5201
 ; {>  %_243~2':_r64 %_5200~°3◂0':(_p1937)◂(_stg) %_244~1':_r64 }
; _some °3◂0' ⊢ °0◂°3◂0'
; ∎ %_5201
 ; {>  %_5201~°0◂°3◂0':(_opn)◂((_p1937)◂(_stg)) %_243~2':_r64 %_244~1':_r64 }
; 	∎ °0◂°3◂0'
	bt r12,2
	jc LB_5485
	mov rdi,r8
	call dlt
LB_5485:
	bt r12,1
	jc LB_5486
	mov rdi,r14
	call dlt
LB_5486:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°3◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5489
	btr r12,3
	jmp LB_5490
LB_5489:
	bts r12,3
LB_5490:
	mov rsi,1
	bt r12,3
	jc LB_5487
	mov rsi,0
	bt r9,0
	jc LB_5487
	jmp LB_5488
LB_5487:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5488:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5491:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5493
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5492
LB_5493:
	add rsp,8
	ret
LB_5494:
	add rsp,16
	pop r14
LB_5492:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	jmp LB_5513
LB_5512:
	add r14,1
LB_5513:
	cmp r14,r10
	jge LB_5514
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5512
	cmp al,10
	jz LB_5512
	cmp al,32
	jz LB_5512
LB_5514:
	add r14,1
	cmp r14,r10
	jg LB_5517
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,95
	jnz LB_5517
	jmp LB_5518
LB_5517:
	jmp LB_5509
LB_5518:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5510
	btr r12,0
	clc
	jmp LB_5511
LB_5510:
	bts r12,0
	stc
LB_5511:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 80
	push LB_5506
	push LB_5506
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _f1940 {  } ⊢ %_5202 : %_5202
 ; {>  %_248~0':_r64 %_247~1':_r64 }
; _f1940 {  } ⊢ °2◂{  }
; _some %_5202 ⊢ %_5203 : %_5203
 ; {>  %_248~0':_r64 %_247~1':_r64 %_5202~°2◂{  }:(_p1937)◂(t2054'(0)) }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_5203
 ; {>  %_248~0':_r64 %_5203~°0◂°2◂{  }:(_opn)◂((_p1937)◂(t2057'(0))) %_247~1':_r64 }
; 	∎ °0◂°2◂{  }
	bt r12,0
	jc LB_5502
	mov rdi,r13
	call dlt
LB_5502:
	bt r12,1
	jc LB_5503
	mov rdi,r14
	call dlt
LB_5503:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_5504
	mov rsi,0
	bt r9,0
	jc LB_5504
	jmp LB_5505
LB_5504:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5505:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5506:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5508
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5507
LB_5508:
	add rsp,8
	ret
LB_5509:
	add rsp,16
	pop r14
LB_5507:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5519:
NS_E_RDI_5519:
NS_E_5519_ETR_TBL:
NS_E_5519_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_5567
LB_5566:
	add r14,1
LB_5567:
	cmp r14,r10
	jge LB_5568
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5566
	cmp al,10
	jz LB_5566
	cmp al,32
	jz LB_5566
LB_5568:
	add r14,1
	cmp r14,r10
	jg LB_5571
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,123
	jnz LB_5571
	jmp LB_5572
LB_5571:
	jmp LB_5559
LB_5572:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn_lst
	jmp LB_5574
LB_5573:
	add r14,1
LB_5574:
	cmp r14,r10
	jge LB_5575
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5573
	cmp al,10
	jz LB_5573
	cmp al,32
	jz LB_5573
LB_5575:
	push r10
	call NS_E_5520_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5576
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5577
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5577:
	jmp LB_5559
LB_5576:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_5580
LB_5579:
	add r14,1
LB_5580:
	cmp r14,r10
	jge LB_5581
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5579
	cmp al,10
	jz LB_5579
	cmp al,32
	jz LB_5579
LB_5581:
	add r14,1
	cmp r14,r10
	jg LB_5586
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,125
	jnz LB_5586
	jmp LB_5587
LB_5586:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5583
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5583:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5584
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5584:
	jmp LB_5559
LB_5587:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5564
	btr r12,2
	clc
	jmp LB_5565
LB_5564:
	bts r12,2
	stc
LB_5565:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5562
	btr r12,1
	clc
	jmp LB_5563
LB_5562:
	bts r12,1
	stc
LB_5563:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5560
	btr r12,0
	clc
	jmp LB_5561
LB_5560:
	bts r12,0
	stc
LB_5561:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 81
	push LB_5556
	push LB_5556
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_5588
	btr r12,3
	jmp LB_5589
LB_5588:
	bts r12,3
LB_5589:
	mov r13,r14
	bt r12,1
	jc LB_5590
	btr r12,0
	jmp LB_5591
LB_5590:
	bts r12,0
LB_5591:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1925 %_5523 ⊢ %_5524 : %_5524
 ; {>  %_5523~0':(_lst)◂((_p1924)◂((_p1931)◂(_stg))) %_252~1':_r64 %_251~2':_r64 }
; _f1925 0' ⊢ °0◂0'
; _some %_5524 ⊢ %_5525 : %_5525
 ; {>  %_5524~°0◂0':(_p1924)◂((_p1931)◂(_stg)) %_252~1':_r64 %_251~2':_r64 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5525
 ; {>  %_5525~°0◂°0◂0':(_opn)◂((_p1924)◂((_p1931)◂(_stg))) %_252~1':_r64 %_251~2':_r64 }
; 	∎ °0◂°0◂0'
	bt r12,1
	jc LB_5550
	mov rdi,r14
	call dlt
LB_5550:
	bt r12,2
	jc LB_5551
	mov rdi,r8
	call dlt
LB_5551:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5554
	btr r12,3
	jmp LB_5555
LB_5554:
	bts r12,3
LB_5555:
	mov rsi,1
	bt r12,3
	jc LB_5552
	mov rsi,0
	bt r9,0
	jc LB_5552
	jmp LB_5553
LB_5552:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5553:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5556:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5558
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5557
LB_5558:
	add rsp,8
	ret
LB_5559:
	add rsp,48
	pop r14
LB_5557:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; src
	jmp LB_5605
LB_5604:
	add r14,1
LB_5605:
	cmp r14,r10
	jge LB_5606
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5604
	cmp al,10
	jz LB_5604
	cmp al,32
	jz LB_5604
LB_5606:
	push r10
	call NS_E_5522_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5607
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5601
LB_5607:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5602
	btr r12,0
	clc
	jmp LB_5603
LB_5602:
	bts r12,0
	stc
LB_5603:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 82
	push LB_5598
	push LB_5598
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1926 %_5526 ⊢ %_5527 : %_5527
 ; {>  %_255~2':_r64 %_5526~0':(_p1931)◂(_stg) %_256~1':_r64 }
; _f1926 0' ⊢ °1◂0'
; _some %_5527 ⊢ %_5528 : %_5528
 ; {>  %_255~2':_r64 %_5527~°1◂0':(_p1924)◂((_p1931)◂(_stg)) %_256~1':_r64 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5528
 ; {>  %_255~2':_r64 %_5528~°0◂°1◂0':(_opn)◂((_p1924)◂((_p1931)◂(_stg))) %_256~1':_r64 }
; 	∎ °0◂°1◂0'
	bt r12,2
	jc LB_5592
	mov rdi,r8
	call dlt
LB_5592:
	bt r12,1
	jc LB_5593
	mov rdi,r14
	call dlt
LB_5593:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5596
	btr r12,3
	jmp LB_5597
LB_5596:
	bts r12,3
LB_5597:
	mov rsi,1
	bt r12,3
	jc LB_5594
	mov rsi,0
	bt r9,0
	jc LB_5594
	jmp LB_5595
LB_5594:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5595:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5598:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5600
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5599
LB_5600:
	add rsp,8
	ret
LB_5601:
	add rsp,16
	pop r14
LB_5599:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5520:
NS_E_RDI_5520:
NS_E_5520_ETR_TBL:
NS_E_5520_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; src_ptn
	jmp LB_5630
LB_5629:
	add r14,1
LB_5630:
	cmp r14,r10
	jge LB_5631
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5629
	cmp al,10
	jz LB_5629
	cmp al,32
	jz LB_5629
LB_5631:
	push r10
	call NS_E_5519_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5632
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5624
LB_5632:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn_lst
	jmp LB_5635
LB_5634:
	add r14,1
LB_5635:
	cmp r14,r10
	jge LB_5636
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5634
	cmp al,10
	jz LB_5634
	cmp al,32
	jz LB_5634
LB_5636:
	push r10
	call NS_E_5520_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5637
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5638
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5638:
	jmp LB_5624
LB_5637:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5627
	btr r12,1
	clc
	jmp LB_5628
LB_5627:
	bts r12,1
	stc
LB_5628:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5625
	btr r12,0
	clc
	jmp LB_5626
LB_5625:
	bts r12,0
	stc
LB_5626:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 83
	push LB_5621
	push LB_5621
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _cns { %_5529 %_5530 } ⊢ %_5531 : %_5531
 ; {>  %_5529~0':(_p1924)◂((_p1931)◂(_stg)) %_259~3':_r64 %_5530~1':(_lst)◂((_p1924)◂((_p1931)◂(_stg))) %_260~2':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5531 ⊢ %_5532 : %_5532
 ; {>  %_5531~°0◂{ 0' 1' }:(_lst)◂((_p1924)◂((_p1931)◂(_stg))) %_259~3':_r64 %_260~2':_r64 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5532
 ; {>  %_5532~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1924)◂((_p1931)◂(_stg)))) %_259~3':_r64 %_260~2':_r64 }
; 	∎ °0◂°0◂{ 0' 1' }
	bt r12,3
	jc LB_5609
	mov rdi,r9
	call dlt
LB_5609:
	bt r12,2
	jc LB_5610
	mov rdi,r8
	call dlt
LB_5610:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_5615
	btr r12,2
	jmp LB_5616
LB_5615:
	bts r12,2
LB_5616:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5613
	btr QWORD [rdi],0
	jmp LB_5614
LB_5613:
	bts QWORD [rdi],0
LB_5614:
	mov r8,r14
	bt r12,1
	jc LB_5619
	btr r12,2
	jmp LB_5620
LB_5619:
	bts r12,2
LB_5620:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5617
	btr QWORD [rdi],1
	jmp LB_5618
LB_5617:
	bts QWORD [rdi],1
LB_5618:
	mov rsi,1
	bt r12,3
	jc LB_5611
	mov rsi,0
	bt r9,0
	jc LB_5611
	jmp LB_5612
LB_5611:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5612:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5621:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5623
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5622
LB_5623:
	add rsp,8
	ret
LB_5624:
	add rsp,32
	pop r14
LB_5622:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 84
	push LB_5644
	push LB_5644
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_5533 : %_5533
 ; {>  %_263~1':_r64 %_264~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _some %_5533 ⊢ %_5534 : %_5534
 ; {>  %_263~1':_r64 %_264~0':_r64 %_5533~°1◂{  }:(_lst)◂(t2171'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5534
 ; {>  %_263~1':_r64 %_264~0':_r64 %_5534~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2174'(0))) }
; 	∎ °0◂°1◂{  }
	bt r12,1
	jc LB_5640
	mov rdi,r14
	call dlt
LB_5640:
	bt r12,0
	jc LB_5641
	mov rdi,r13
	call dlt
LB_5641:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_5642
	mov rsi,0
	bt r9,0
	jc LB_5642
	jmp LB_5643
LB_5642:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5643:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5644:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5646
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5645
LB_5646:
	add rsp,8
	ret
LB_5647:
	add rsp,0
	pop r14
LB_5645:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5521:
NS_E_RDI_5521:
NS_E_5521_ETR_TBL:
NS_E_5521_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_5686
LB_5685:
	add r14,1
LB_5686:
	cmp r14,r10
	jge LB_5687
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5685
	cmp al,10
	jz LB_5685
	cmp al,32
	jz LB_5685
LB_5687:
	add r14,1
	cmp r14,r10
	jg LB_5690
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,44
	jnz LB_5690
	jmp LB_5691
LB_5690:
	jmp LB_5663
LB_5691:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src
	jmp LB_5673
LB_5672:
	add r14,1
LB_5673:
	cmp r14,r10
	jge LB_5674
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5672
	cmp al,10
	jz LB_5672
	cmp al,32
	jz LB_5672
LB_5674:
	push r10
	call NS_E_5522_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5675
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5676
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5676:
	jmp LB_5664
LB_5675:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; src_tl
	jmp LB_5679
LB_5678:
	add r14,1
LB_5679:
	cmp r14,r10
	jge LB_5680
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5678
	cmp al,10
	jz LB_5678
	cmp al,32
	jz LB_5678
LB_5680:
	push r10
	call NS_E_5521_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5681
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5682
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5682:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5683
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5683:
	jmp LB_5664
LB_5681:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5670
	btr r12,2
	clc
	jmp LB_5671
LB_5670:
	bts r12,2
	stc
LB_5671:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5668
	btr r12,1
	clc
	jmp LB_5669
LB_5668:
	bts r12,1
	stc
LB_5669:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5666
	btr r12,0
	clc
	jmp LB_5667
LB_5666:
	bts r12,0
	stc
LB_5667:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 85
	push LB_5660
	push LB_5660
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_5692
	btr r12,3
	jmp LB_5693
LB_5692:
	bts r12,3
LB_5693:
	mov r14,r8
	bt r12,2
	jc LB_5694
	btr r12,1
	jmp LB_5695
LB_5694:
	bts r12,1
LB_5695:
	mov r8,r13
	bt r12,0
	jc LB_5696
	btr r12,2
	jmp LB_5697
LB_5696:
	bts r12,2
LB_5697:
	mov r13,r9
	bt r12,3
	jc LB_5698
	btr r12,0
	jmp LB_5699
LB_5698:
	bts r12,0
LB_5699:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _cns { %_5535 %_5536 } ⊢ %_5537 : %_5537
 ; {>  %_5536~1':(_lst)◂((_p1931)◂(_stg)) %_5535~0':(_p1931)◂(_stg) %_268~2':_r64 %_267~3':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5537 ⊢ %_5538 : %_5538
 ; {>  %_268~2':_r64 %_267~3':_r64 %_5537~°0◂{ 0' 1' }:(_lst)◂((_p1931)◂(_stg)) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5538
 ; {>  %_268~2':_r64 %_267~3':_r64 %_5538~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1931)◂(_stg))) }
; 	∎ °0◂°0◂{ 0' 1' }
	bt r12,2
	jc LB_5648
	mov rdi,r8
	call dlt
LB_5648:
	bt r12,3
	jc LB_5649
	mov rdi,r9
	call dlt
LB_5649:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_5654
	btr r12,2
	jmp LB_5655
LB_5654:
	bts r12,2
LB_5655:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5652
	btr QWORD [rdi],0
	jmp LB_5653
LB_5652:
	bts QWORD [rdi],0
LB_5653:
	mov r8,r14
	bt r12,1
	jc LB_5658
	btr r12,2
	jmp LB_5659
LB_5658:
	bts r12,2
LB_5659:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5656
	btr QWORD [rdi],1
	jmp LB_5657
LB_5656:
	bts QWORD [rdi],1
LB_5657:
	mov rsi,1
	bt r12,3
	jc LB_5650
	mov rsi,0
	bt r9,0
	jc LB_5650
	jmp LB_5651
LB_5650:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5651:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5660:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5662
	pop r14
	jmp LB_5665
LB_5662:
	add rsp,8
	ret
LB_5664:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_5665:
	ret
LB_5663:
	add rsp,48
	pop r14
LB_5661:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 86
	push LB_5704
	push LB_5704
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_5539 : %_5539
 ; {>  %_271~1':_r64 %_272~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _some %_5539 ⊢ %_5540 : %_5540
 ; {>  %_5539~°1◂{  }:(_lst)◂(t2184'(0)) %_271~1':_r64 %_272~0':_r64 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5540
 ; {>  %_5540~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2187'(0))) %_271~1':_r64 %_272~0':_r64 }
; 	∎ °0◂°1◂{  }
	bt r12,1
	jc LB_5700
	mov rdi,r14
	call dlt
LB_5700:
	bt r12,0
	jc LB_5701
	mov rdi,r13
	call dlt
LB_5701:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_5702
	mov rsi,0
	bt r9,0
	jc LB_5702
	jmp LB_5703
LB_5702:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5703:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5704:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5706
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5705
LB_5706:
	add rsp,8
	ret
LB_5707:
	add rsp,0
	pop r14
LB_5705:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5522:
NS_E_RDI_5522:
NS_E_5522_ETR_TBL:
NS_E_5522_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "%["
	jmp LB_5725
LB_5724:
	add r14,1
LB_5725:
	cmp r14,r10
	jge LB_5726
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5724
	cmp al,10
	jz LB_5724
	cmp al,32
	jz LB_5724
LB_5726:
	add r14,2
	cmp r14,r10
	jg LB_5729
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,37
	jnz LB_5729
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,91
	jnz LB_5729
	jmp LB_5730
LB_5729:
	jmp LB_5717
LB_5730:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_5732
LB_5731:
	add r14,1
LB_5732:
	cmp r14,r10
	jge LB_5733
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5731
	cmp al,10
	jz LB_5731
	cmp al,32
	jz LB_5731
LB_5733:
	push r10
	call NS_E_4972_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5734
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5735
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5735:
	jmp LB_5717
LB_5734:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "]"
	jmp LB_5738
LB_5737:
	add r14,1
LB_5738:
	cmp r14,r10
	jge LB_5739
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5737
	cmp al,10
	jz LB_5737
	cmp al,32
	jz LB_5737
LB_5739:
	add r14,1
	cmp r14,r10
	jg LB_5744
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,93
	jnz LB_5744
	jmp LB_5745
LB_5744:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5741
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5741:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5742
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5742:
	jmp LB_5717
LB_5745:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5722
	btr r12,2
	clc
	jmp LB_5723
LB_5722:
	bts r12,2
	stc
LB_5723:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5720
	btr r12,1
	clc
	jmp LB_5721
LB_5720:
	bts r12,1
	stc
LB_5721:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5718
	btr r12,0
	clc
	jmp LB_5719
LB_5718:
	bts r12,0
	stc
LB_5719:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 87
	push LB_5714
	push LB_5714
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_5746
	btr r12,3
	jmp LB_5747
LB_5746:
	bts r12,3
LB_5747:
	mov r13,r14
	bt r12,1
	jc LB_5748
	btr r12,0
	jmp LB_5749
LB_5748:
	bts r12,0
LB_5749:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1933 %_5541 ⊢ %_5542 : %_5542
 ; {>  %_276~1':_r64 %_275~2':_r64 %_5541~0':_p1927 }
; _f1933 0' ⊢ °0◂0'
; _some %_5542 ⊢ %_5543 : %_5543
 ; {>  %_276~1':_r64 %_5542~°0◂0':(_p1931)◂(t2192'(0)) %_275~2':_r64 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5543
 ; {>  %_276~1':_r64 %_5543~°0◂°0◂0':(_opn)◂((_p1931)◂(t2195'(0))) %_275~2':_r64 }
; 	∎ °0◂°0◂0'
	bt r12,1
	jc LB_5708
	mov rdi,r14
	call dlt
LB_5708:
	bt r12,2
	jc LB_5709
	mov rdi,r8
	call dlt
LB_5709:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5712
	btr r12,3
	jmp LB_5713
LB_5712:
	bts r12,3
LB_5713:
	mov rsi,1
	bt r12,3
	jc LB_5710
	mov rsi,0
	bt r9,0
	jc LB_5710
	jmp LB_5711
LB_5710:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5711:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5714:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5716
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5715
LB_5716:
	add rsp,8
	ret
LB_5717:
	add rsp,48
	pop r14
LB_5715:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_5777
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,37
	jnz LB_5777
	jmp LB_5778
LB_5777:
	jmp LB_5759
LB_5778:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; prm_word
	push r10
	call NS_E_1823_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5769
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5770
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5770:
	jmp LB_5760
LB_5769:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5764
	btr r12,1
	clc
	jmp LB_5765
LB_5764:
	bts r12,1
	stc
LB_5765:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5762
	btr r12,0
	clc
	jmp LB_5763
LB_5762:
	bts r12,0
	stc
LB_5763:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 88
	push LB_5756
	push LB_5756
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5779
	btr r12,2
	jmp LB_5780
LB_5779:
	bts r12,2
LB_5780:
	mov r13,r14
	bt r12,1
	jc LB_5781
	btr r12,0
	jmp LB_5782
LB_5781:
	bts r12,0
LB_5782:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1934 %_5544 ⊢ %_5545 : %_5545
 ; {>  %_279~2':_r64 %_280~1':_r64 %_5544~0':_stg }
; _f1934 0' ⊢ °1◂0'
; _some %_5545 ⊢ %_5546 : %_5546
 ; {>  %_279~2':_r64 %_280~1':_r64 %_5545~°1◂0':(_p1931)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5546
 ; {>  %_279~2':_r64 %_280~1':_r64 %_5546~°0◂°1◂0':(_opn)◂((_p1931)◂(_stg)) }
; 	∎ °0◂°1◂0'
	bt r12,2
	jc LB_5750
	mov rdi,r8
	call dlt
LB_5750:
	bt r12,1
	jc LB_5751
	mov rdi,r14
	call dlt
LB_5751:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5754
	btr r12,3
	jmp LB_5755
LB_5754:
	bts r12,3
LB_5755:
	mov rsi,1
	bt r12,3
	jc LB_5752
	mov rsi,0
	bt r9,0
	jc LB_5752
	jmp LB_5753
LB_5752:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5753:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5756:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5758
	pop r14
	jmp LB_5761
LB_5758:
	add rsp,8
	ret
LB_5760:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_5761:
	ret
LB_5759:
	add rsp,32
	pop r14
LB_5757:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_5796
LB_5795:
	add r14,1
LB_5796:
	cmp r14,r10
	jge LB_5797
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5795
	cmp al,10
	jz LB_5795
	cmp al,32
	jz LB_5795
LB_5797:
	push r10
	call NS_E_1823_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5798
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5792
LB_5798:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5793
	btr r12,0
	clc
	jmp LB_5794
LB_5793:
	bts r12,0
	stc
LB_5794:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 89
	push LB_5789
	push LB_5789
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1934 %_5547 ⊢ %_5548 : %_5548
 ; {>  %_284~1':_r64 %_283~2':_r64 %_5547~0':_stg }
; _f1934 0' ⊢ °1◂0'
; _some %_5548 ⊢ %_5549 : %_5549
 ; {>  %_5548~°1◂0':(_p1931)◂(_stg) %_284~1':_r64 %_283~2':_r64 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5549
 ; {>  %_284~1':_r64 %_5549~°0◂°1◂0':(_opn)◂((_p1931)◂(_stg)) %_283~2':_r64 }
; 	∎ °0◂°1◂0'
	bt r12,1
	jc LB_5783
	mov rdi,r14
	call dlt
LB_5783:
	bt r12,2
	jc LB_5784
	mov rdi,r8
	call dlt
LB_5784:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5787
	btr r12,3
	jmp LB_5788
LB_5787:
	bts r12,3
LB_5788:
	mov rsi,1
	bt r12,3
	jc LB_5785
	mov rsi,0
	bt r9,0
	jc LB_5785
	jmp LB_5786
LB_5785:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5786:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5789:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5791
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5790
LB_5791:
	add rsp,8
	ret
LB_5792:
	add rsp,16
	pop r14
LB_5790:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5800:
NS_E_RDI_5800:
NS_E_5800_ETR_TBL:
NS_E_5800_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_5854
LB_5853:
	add r14,1
LB_5854:
	cmp r14,r10
	jge LB_5855
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5853
	cmp al,10
	jz LB_5853
	cmp al,32
	jz LB_5853
LB_5855:
	add r14,1
	cmp r14,r10
	jg LB_5858
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,123
	jnz LB_5858
	jmp LB_5859
LB_5858:
	jmp LB_5846
LB_5859:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn_lst
	jmp LB_5861
LB_5860:
	add r14,1
LB_5861:
	cmp r14,r10
	jge LB_5862
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5860
	cmp al,10
	jz LB_5860
	cmp al,32
	jz LB_5860
LB_5862:
	push r10
	call NS_E_5801_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5863
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5864
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5864:
	jmp LB_5846
LB_5863:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_5867
LB_5866:
	add r14,1
LB_5867:
	cmp r14,r10
	jge LB_5868
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5866
	cmp al,10
	jz LB_5866
	cmp al,32
	jz LB_5866
LB_5868:
	add r14,1
	cmp r14,r10
	jg LB_5873
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,125
	jnz LB_5873
	jmp LB_5874
LB_5873:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5870
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5870:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5871
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5871:
	jmp LB_5846
LB_5874:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5851
	btr r12,2
	clc
	jmp LB_5852
LB_5851:
	bts r12,2
	stc
LB_5852:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5849
	btr r12,1
	clc
	jmp LB_5850
LB_5849:
	bts r12,1
	stc
LB_5850:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5847
	btr r12,0
	clc
	jmp LB_5848
LB_5847:
	bts r12,0
	stc
LB_5848:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 90
	push LB_5843
	push LB_5843
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_5875
	btr r12,3
	jmp LB_5876
LB_5875:
	bts r12,3
LB_5876:
	mov r13,r14
	bt r12,1
	jc LB_5877
	btr r12,0
	jmp LB_5878
LB_5877:
	bts r12,0
LB_5878:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1925 %_5805 ⊢ %_5806 : %_5806
 ; {>  %_288~1':_r64 %_287~2':_r64 %_5805~0':(_lst)◂((_p1924)◂((_p1932)◂(_stg))) }
; _f1925 0' ⊢ °0◂0'
; _some %_5806 ⊢ %_5807 : %_5807
 ; {>  %_288~1':_r64 %_287~2':_r64 %_5806~°0◂0':(_p1924)◂((_p1932)◂(_stg)) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5807
 ; {>  %_5807~°0◂°0◂0':(_opn)◂((_p1924)◂((_p1932)◂(_stg))) %_288~1':_r64 %_287~2':_r64 }
; 	∎ °0◂°0◂0'
	bt r12,1
	jc LB_5837
	mov rdi,r14
	call dlt
LB_5837:
	bt r12,2
	jc LB_5838
	mov rdi,r8
	call dlt
LB_5838:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5841
	btr r12,3
	jmp LB_5842
LB_5841:
	bts r12,3
LB_5842:
	mov rsi,1
	bt r12,3
	jc LB_5839
	mov rsi,0
	bt r9,0
	jc LB_5839
	jmp LB_5840
LB_5839:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5840:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5843:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5845
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5844
LB_5845:
	add rsp,8
	ret
LB_5846:
	add rsp,48
	pop r14
LB_5844:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dst
	jmp LB_5892
LB_5891:
	add r14,1
LB_5892:
	cmp r14,r10
	jge LB_5893
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5891
	cmp al,10
	jz LB_5891
	cmp al,32
	jz LB_5891
LB_5893:
	push r10
	call NS_E_5804_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5894
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5888
LB_5894:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5889
	btr r12,0
	clc
	jmp LB_5890
LB_5889:
	bts r12,0
	stc
LB_5890:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 91
	push LB_5885
	push LB_5885
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1926 %_5808 ⊢ %_5809 : %_5809
 ; {>  %_291~2':_r64 %_292~1':_r64 %_5808~0':(_p1932)◂(_stg) }
; _f1926 0' ⊢ °1◂0'
; _some %_5809 ⊢ %_5810 : %_5810
 ; {>  %_291~2':_r64 %_292~1':_r64 %_5809~°1◂0':(_p1924)◂((_p1932)◂(_stg)) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5810
 ; {>  %_291~2':_r64 %_292~1':_r64 %_5810~°0◂°1◂0':(_opn)◂((_p1924)◂((_p1932)◂(_stg))) }
; 	∎ °0◂°1◂0'
	bt r12,2
	jc LB_5879
	mov rdi,r8
	call dlt
LB_5879:
	bt r12,1
	jc LB_5880
	mov rdi,r14
	call dlt
LB_5880:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5883
	btr r12,3
	jmp LB_5884
LB_5883:
	bts r12,3
LB_5884:
	mov rsi,1
	bt r12,3
	jc LB_5881
	mov rsi,0
	bt r9,0
	jc LB_5881
	jmp LB_5882
LB_5881:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5882:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5885:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5887
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5886
LB_5887:
	add rsp,8
	ret
LB_5888:
	add rsp,16
	pop r14
LB_5886:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5801:
NS_E_RDI_5801:
NS_E_5801_ETR_TBL:
NS_E_5801_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_5917
LB_5916:
	add r14,1
LB_5917:
	cmp r14,r10
	jge LB_5918
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5916
	cmp al,10
	jz LB_5916
	cmp al,32
	jz LB_5916
LB_5918:
	push r10
	call NS_E_5800_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5919
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5911
LB_5919:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dst_ptn_lst
	jmp LB_5922
LB_5921:
	add r14,1
LB_5922:
	cmp r14,r10
	jge LB_5923
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5921
	cmp al,10
	jz LB_5921
	cmp al,32
	jz LB_5921
LB_5923:
	push r10
	call NS_E_5801_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5924
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5925
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5925:
	jmp LB_5911
LB_5924:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5914
	btr r12,1
	clc
	jmp LB_5915
LB_5914:
	bts r12,1
	stc
LB_5915:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5912
	btr r12,0
	clc
	jmp LB_5913
LB_5912:
	bts r12,0
	stc
LB_5913:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 92
	push LB_5908
	push LB_5908
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _cns { %_5811 %_5812 } ⊢ %_5813 : %_5813
 ; {>  %_295~3':_r64 %_5811~0':(_p1924)◂((_p1932)◂(_stg)) %_5812~1':(_lst)◂((_p1924)◂((_p1932)◂(_stg))) %_296~2':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5813 ⊢ %_5814 : %_5814
 ; {>  %_295~3':_r64 %_296~2':_r64 %_5813~°0◂{ 0' 1' }:(_lst)◂((_p1924)◂((_p1932)◂(_stg))) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5814
 ; {>  %_295~3':_r64 %_5814~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1924)◂((_p1932)◂(_stg)))) %_296~2':_r64 }
; 	∎ °0◂°0◂{ 0' 1' }
	bt r12,3
	jc LB_5896
	mov rdi,r9
	call dlt
LB_5896:
	bt r12,2
	jc LB_5897
	mov rdi,r8
	call dlt
LB_5897:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_5902
	btr r12,2
	jmp LB_5903
LB_5902:
	bts r12,2
LB_5903:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5900
	btr QWORD [rdi],0
	jmp LB_5901
LB_5900:
	bts QWORD [rdi],0
LB_5901:
	mov r8,r14
	bt r12,1
	jc LB_5906
	btr r12,2
	jmp LB_5907
LB_5906:
	bts r12,2
LB_5907:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5904
	btr QWORD [rdi],1
	jmp LB_5905
LB_5904:
	bts QWORD [rdi],1
LB_5905:
	mov rsi,1
	bt r12,3
	jc LB_5898
	mov rsi,0
	bt r9,0
	jc LB_5898
	jmp LB_5899
LB_5898:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5899:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5908:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5910
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5909
LB_5910:
	add rsp,8
	ret
LB_5911:
	add rsp,32
	pop r14
LB_5909:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 93
	push LB_5931
	push LB_5931
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_5815 : %_5815
 ; {>  %_299~1':_r64 %_300~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _some %_5815 ⊢ %_5816 : %_5816
 ; {>  %_299~1':_r64 %_300~0':_r64 %_5815~°1◂{  }:(_lst)◂(t2302'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5816
 ; {>  %_299~1':_r64 %_5816~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2305'(0))) %_300~0':_r64 }
; 	∎ °0◂°1◂{  }
	bt r12,1
	jc LB_5927
	mov rdi,r14
	call dlt
LB_5927:
	bt r12,0
	jc LB_5928
	mov rdi,r13
	call dlt
LB_5928:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_5929
	mov rsi,0
	bt r9,0
	jc LB_5929
	jmp LB_5930
LB_5929:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5930:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5931:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5933
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5932
LB_5933:
	add rsp,8
	ret
LB_5934:
	add rsp,0
	pop r14
LB_5932:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5802:
NS_E_RDI_5802:
NS_E_5802_ETR_TBL:
NS_E_5802_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_5973
LB_5972:
	add r14,1
LB_5973:
	cmp r14,r10
	jge LB_5974
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5972
	cmp al,10
	jz LB_5972
	cmp al,32
	jz LB_5972
LB_5974:
	add r14,1
	cmp r14,r10
	jg LB_5977
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,44
	jnz LB_5977
	jmp LB_5978
LB_5977:
	jmp LB_5950
LB_5978:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_5960
LB_5959:
	add r14,1
LB_5960:
	cmp r14,r10
	jge LB_5961
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5959
	cmp al,10
	jz LB_5959
	cmp al,32
	jz LB_5959
LB_5961:
	push r10
	call NS_E_5800_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5962
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5963
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5963:
	jmp LB_5951
LB_5962:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_ptn_tl
	jmp LB_5966
LB_5965:
	add r14,1
LB_5966:
	cmp r14,r10
	jge LB_5967
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5965
	cmp al,10
	jz LB_5965
	cmp al,32
	jz LB_5965
LB_5967:
	push r10
	call NS_E_5802_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5968
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5969
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5969:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5970
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5970:
	jmp LB_5951
LB_5968:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5957
	btr r12,2
	clc
	jmp LB_5958
LB_5957:
	bts r12,2
	stc
LB_5958:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5955
	btr r12,1
	clc
	jmp LB_5956
LB_5955:
	bts r12,1
	stc
LB_5956:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5953
	btr r12,0
	clc
	jmp LB_5954
LB_5953:
	bts r12,0
	stc
LB_5954:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 94
	push LB_5947
	push LB_5947
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_5979
	btr r12,3
	jmp LB_5980
LB_5979:
	bts r12,3
LB_5980:
	mov r14,r8
	bt r12,2
	jc LB_5981
	btr r12,1
	jmp LB_5982
LB_5981:
	bts r12,1
LB_5982:
	mov r8,r13
	bt r12,0
	jc LB_5983
	btr r12,2
	jmp LB_5984
LB_5983:
	bts r12,2
LB_5984:
	mov r13,r9
	bt r12,3
	jc LB_5985
	btr r12,0
	jmp LB_5986
LB_5985:
	bts r12,0
LB_5986:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _cns { %_5817 %_5818 } ⊢ %_5819 : %_5819
 ; {>  %_5817~0':(_p1924)◂((_p1932)◂(_stg)) %_304~2':_r64 %_303~3':_r64 %_5818~1':(_lst)◂((_p1924)◂((_p1932)◂(_stg))) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5819 ⊢ %_5820 : %_5820
 ; {>  %_304~2':_r64 %_5819~°0◂{ 0' 1' }:(_lst)◂((_p1924)◂((_p1932)◂(_stg))) %_303~3':_r64 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5820
 ; {>  %_5820~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1924)◂((_p1932)◂(_stg)))) %_304~2':_r64 %_303~3':_r64 }
; 	∎ °0◂°0◂{ 0' 1' }
	bt r12,2
	jc LB_5935
	mov rdi,r8
	call dlt
LB_5935:
	bt r12,3
	jc LB_5936
	mov rdi,r9
	call dlt
LB_5936:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_5941
	btr r12,2
	jmp LB_5942
LB_5941:
	bts r12,2
LB_5942:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5939
	btr QWORD [rdi],0
	jmp LB_5940
LB_5939:
	bts QWORD [rdi],0
LB_5940:
	mov r8,r14
	bt r12,1
	jc LB_5945
	btr r12,2
	jmp LB_5946
LB_5945:
	bts r12,2
LB_5946:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_5943
	btr QWORD [rdi],1
	jmp LB_5944
LB_5943:
	bts QWORD [rdi],1
LB_5944:
	mov rsi,1
	bt r12,3
	jc LB_5937
	mov rsi,0
	bt r9,0
	jc LB_5937
	jmp LB_5938
LB_5937:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5938:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5947:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5949
	pop r14
	jmp LB_5952
LB_5949:
	add rsp,8
	ret
LB_5951:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_5952:
	ret
LB_5950:
	add rsp,48
	pop r14
LB_5948:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 95
	push LB_5991
	push LB_5991
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_5821 : %_5821
 ; {>  %_307~1':_r64 %_308~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _some %_5821 ⊢ %_5822 : %_5822
 ; {>  %_307~1':_r64 %_5821~°1◂{  }:(_lst)◂(t2315'(0)) %_308~0':_r64 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5822
 ; {>  %_307~1':_r64 %_5822~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2318'(0))) %_308~0':_r64 }
; 	∎ °0◂°1◂{  }
	bt r12,1
	jc LB_5987
	mov rdi,r14
	call dlt
LB_5987:
	bt r12,0
	jc LB_5988
	mov rdi,r13
	call dlt
LB_5988:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_5989
	mov rsi,0
	bt r9,0
	jc LB_5989
	jmp LB_5990
LB_5989:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5990:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5991:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5993
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5992
LB_5993:
	add rsp,8
	ret
LB_5994:
	add rsp,0
	pop r14
LB_5992:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5803:
NS_E_RDI_5803:
NS_E_5803_ETR_TBL:
NS_E_5803_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_6033
LB_6032:
	add r14,1
LB_6033:
	cmp r14,r10
	jge LB_6034
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6032
	cmp al,10
	jz LB_6032
	cmp al,32
	jz LB_6032
LB_6034:
	add r14,1
	cmp r14,r10
	jg LB_6037
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,44
	jnz LB_6037
	jmp LB_6038
LB_6037:
	jmp LB_6010
LB_6038:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst
	jmp LB_6020
LB_6019:
	add r14,1
LB_6020:
	cmp r14,r10
	jge LB_6021
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6019
	cmp al,10
	jz LB_6019
	cmp al,32
	jz LB_6019
LB_6021:
	push r10
	call NS_E_5804_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6022
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6023
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6023:
	jmp LB_6011
LB_6022:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_tl
	jmp LB_6026
LB_6025:
	add r14,1
LB_6026:
	cmp r14,r10
	jge LB_6027
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6025
	cmp al,10
	jz LB_6025
	cmp al,32
	jz LB_6025
LB_6027:
	push r10
	call NS_E_5803_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6028
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6029
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6029:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6030
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6030:
	jmp LB_6011
LB_6028:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6017
	btr r12,2
	clc
	jmp LB_6018
LB_6017:
	bts r12,2
	stc
LB_6018:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6015
	btr r12,1
	clc
	jmp LB_6016
LB_6015:
	bts r12,1
	stc
LB_6016:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6013
	btr r12,0
	clc
	jmp LB_6014
LB_6013:
	bts r12,0
	stc
LB_6014:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 96
	push LB_6007
	push LB_6007
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_6039
	btr r12,3
	jmp LB_6040
LB_6039:
	bts r12,3
LB_6040:
	mov r14,r8
	bt r12,2
	jc LB_6041
	btr r12,1
	jmp LB_6042
LB_6041:
	bts r12,1
LB_6042:
	mov r8,r13
	bt r12,0
	jc LB_6043
	btr r12,2
	jmp LB_6044
LB_6043:
	bts r12,2
LB_6044:
	mov r13,r9
	bt r12,3
	jc LB_6045
	btr r12,0
	jmp LB_6046
LB_6045:
	bts r12,0
LB_6046:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _cns { %_5823 %_5824 } ⊢ %_5825 : %_5825
 ; {>  %_311~3':_r64 %_5823~0':(_p1932)◂(_stg) %_5824~1':(_lst)◂((_p1932)◂(_stg)) %_312~2':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5825 ⊢ %_5826 : %_5826
 ; {>  %_311~3':_r64 %_5825~°0◂{ 0' 1' }:(_lst)◂((_p1932)◂(_stg)) %_312~2':_r64 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5826
 ; {>  %_311~3':_r64 %_312~2':_r64 %_5826~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1932)◂(_stg))) }
; 	∎ °0◂°0◂{ 0' 1' }
	bt r12,3
	jc LB_5995
	mov rdi,r9
	call dlt
LB_5995:
	bt r12,2
	jc LB_5996
	mov rdi,r8
	call dlt
LB_5996:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_6001
	btr r12,2
	jmp LB_6002
LB_6001:
	bts r12,2
LB_6002:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_5999
	btr QWORD [rdi],0
	jmp LB_6000
LB_5999:
	bts QWORD [rdi],0
LB_6000:
	mov r8,r14
	bt r12,1
	jc LB_6005
	btr r12,2
	jmp LB_6006
LB_6005:
	bts r12,2
LB_6006:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_6003
	btr QWORD [rdi],1
	jmp LB_6004
LB_6003:
	bts QWORD [rdi],1
LB_6004:
	mov rsi,1
	bt r12,3
	jc LB_5997
	mov rsi,0
	bt r9,0
	jc LB_5997
	jmp LB_5998
LB_5997:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5998:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6007:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6009
	pop r14
	jmp LB_6012
LB_6009:
	add rsp,8
	ret
LB_6011:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_6012:
	ret
LB_6010:
	add rsp,48
	pop r14
LB_6008:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 97
	push LB_6051
	push LB_6051
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_5827 : %_5827
 ; {>  %_315~1':_r64 %_316~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _some %_5827 ⊢ %_5828 : %_5828
 ; {>  %_315~1':_r64 %_5827~°1◂{  }:(_lst)◂(t2328'(0)) %_316~0':_r64 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5828
 ; {>  %_315~1':_r64 %_5828~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2331'(0))) %_316~0':_r64 }
; 	∎ °0◂°1◂{  }
	bt r12,1
	jc LB_6047
	mov rdi,r14
	call dlt
LB_6047:
	bt r12,0
	jc LB_6048
	mov rdi,r13
	call dlt
LB_6048:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_6049
	mov rsi,0
	bt r9,0
	jc LB_6049
	jmp LB_6050
LB_6049:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6050:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6051:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6053
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6052
LB_6053:
	add rsp,8
	ret
LB_6054:
	add rsp,0
	pop r14
LB_6052:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5804:
NS_E_RDI_5804:
NS_E_5804_ETR_TBL:
NS_E_5804_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_6082
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,37
	jnz LB_6082
	jmp LB_6083
LB_6082:
	jmp LB_6064
LB_6083:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_1677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6074
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6075
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6075:
	jmp LB_6065
LB_6074:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6069
	btr r12,1
	clc
	jmp LB_6070
LB_6069:
	bts r12,1
	stc
LB_6070:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6067
	btr r12,0
	clc
	jmp LB_6068
LB_6067:
	bts r12,0
	stc
LB_6068:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 98
	push LB_6061
	push LB_6061
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6084
	btr r12,2
	jmp LB_6085
LB_6084:
	bts r12,2
LB_6085:
	mov r13,r14
	bt r12,1
	jc LB_6086
	btr r12,0
	jmp LB_6087
LB_6086:
	bts r12,0
LB_6087:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1936 %_5829 ⊢ %_5830 : %_5830
 ; {>  %_320~1':_r64 %_319~2':_r64 %_5829~0':_stg }
; _f1936 0' ⊢ °1◂0'
; _some %_5830 ⊢ %_5831 : %_5831
 ; {>  %_320~1':_r64 %_5830~°1◂0':(_p1932)◂(_stg) %_319~2':_r64 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5831
 ; {>  %_5831~°0◂°1◂0':(_opn)◂((_p1932)◂(_stg)) %_320~1':_r64 %_319~2':_r64 }
; 	∎ °0◂°1◂0'
	bt r12,1
	jc LB_6055
	mov rdi,r14
	call dlt
LB_6055:
	bt r12,2
	jc LB_6056
	mov rdi,r8
	call dlt
LB_6056:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6059
	btr r12,3
	jmp LB_6060
LB_6059:
	bts r12,3
LB_6060:
	mov rsi,1
	bt r12,3
	jc LB_6057
	mov rsi,0
	bt r9,0
	jc LB_6057
	jmp LB_6058
LB_6057:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6058:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6061:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6063
	pop r14
	jmp LB_6066
LB_6063:
	add rsp,8
	ret
LB_6065:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_6066:
	ret
LB_6064:
	add rsp,32
	pop r14
LB_6062:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_1677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6103
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6097
LB_6103:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6098
	btr r12,0
	clc
	jmp LB_6099
LB_6098:
	bts r12,0
	stc
LB_6099:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 99
	push LB_6094
	push LB_6094
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1936 %_5832 ⊢ %_5833 : %_5833
 ; {>  %_5832~0':_stg %_324~1':_r64 %_323~2':_r64 }
; _f1936 0' ⊢ °1◂0'
; _some %_5833 ⊢ %_5834 : %_5834
 ; {>  %_324~1':_r64 %_5833~°1◂0':(_p1932)◂(_stg) %_323~2':_r64 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5834
 ; {>  %_324~1':_r64 %_323~2':_r64 %_5834~°0◂°1◂0':(_opn)◂((_p1932)◂(_stg)) }
; 	∎ °0◂°1◂0'
	bt r12,1
	jc LB_6088
	mov rdi,r14
	call dlt
LB_6088:
	bt r12,2
	jc LB_6089
	mov rdi,r8
	call dlt
LB_6089:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6092
	btr r12,3
	jmp LB_6093
LB_6092:
	bts r12,3
LB_6093:
	mov rsi,1
	bt r12,3
	jc LB_6090
	mov rsi,0
	bt r9,0
	jc LB_6090
	jmp LB_6091
LB_6090:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6091:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6094:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6096
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6095
LB_6096:
	add rsp,8
	ret
LB_6097:
	add rsp,16
	pop r14
LB_6095:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_6120
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,95
	jnz LB_6120
	jmp LB_6121
LB_6120:
	jmp LB_6112
LB_6121:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6113
	btr r12,0
	clc
	jmp LB_6114
LB_6113:
	bts r12,0
	stc
LB_6114:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 100
	push LB_6109
	push LB_6109
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _f1935 {  } ⊢ %_5835 : %_5835
 ; {>  %_328~0':_r64 %_327~1':_r64 }
; _f1935 {  } ⊢ °0◂{  }
; _some %_5835 ⊢ %_5836 : %_5836
 ; {>  %_5835~°0◂{  }:(_p1932)◂(t2345'(0)) %_328~0':_r64 %_327~1':_r64 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_5836
 ; {>  %_5836~°0◂°0◂{  }:(_opn)◂((_p1932)◂(t2348'(0))) %_328~0':_r64 %_327~1':_r64 }
; 	∎ °0◂°0◂{  }
	bt r12,0
	jc LB_6105
	mov rdi,r13
	call dlt
LB_6105:
	bt r12,1
	jc LB_6106
	mov rdi,r14
	call dlt
LB_6106:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_6107
	mov rsi,0
	bt r9,0
	jc LB_6107
	jmp LB_6108
LB_6107:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6108:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6109:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6111
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6110
LB_6111:
	add rsp,8
	ret
LB_6112:
	add rsp,16
	pop r14
LB_6110:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6122:
NS_E_RDI_6122:
NS_E_6122_ETR_TBL:
NS_E_6122_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; type_atm
	jmp LB_6209
LB_6208:
	add r14,1
LB_6209:
	cmp r14,r10
	jge LB_6210
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6208
	cmp al,10
	jz LB_6208
	cmp al,32
	jz LB_6208
LB_6210:
	push r10
	call NS_E_6125_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6211
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6201
LB_6211:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; type_app_tl
	jmp LB_6214
LB_6213:
	add r14,1
LB_6214:
	cmp r14,r10
	jge LB_6215
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6213
	cmp al,10
	jz LB_6213
	cmp al,32
	jz LB_6213
LB_6215:
	push r10
	call NS_E_6124_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6216
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6217
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6217:
	jmp LB_6201
LB_6216:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_tl
	jmp LB_6220
LB_6219:
	add r14,1
LB_6220:
	cmp r14,r10
	jge LB_6221
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6219
	cmp al,10
	jz LB_6219
	cmp al,32
	jz LB_6219
LB_6221:
	push r10
	call NS_E_6123_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6222
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6223
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6223:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6224
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6224:
	jmp LB_6201
LB_6222:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6206
	btr r12,2
	clc
	jmp LB_6207
LB_6206:
	bts r12,2
	stc
LB_6207:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6204
	btr r12,1
	clc
	jmp LB_6205
LB_6204:
	bts r12,1
	stc
LB_6205:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6202
	btr r12,0
	clc
	jmp LB_6203
LB_6202:
	bts r12,0
	stc
LB_6203:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 101
	push LB_6198
	push LB_6198
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
	mov rax,QWORD [rsp+8]
	mov r10,rax
	mov rax,QWORD [rsp+8*3]
	mov r9,rax
	bts r12,3
	bts r12,4
; _f5124 { %_6127 %_6128 } ⊢ %_6130 : %_6130
 ; {>  %_331~4':_r64 %_6128~1':(_lst)◂(_p1988) %_6127~0':_p1988 %_332~3':_r64 %_6129~2':(_opn)◂(_p1988) }
; _f5124 { 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	push 69
	push LB_6166
	call NS_E_5124
LB_6166:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_6164
	btr r12,4
	clc
	jmp LB_6165
LB_6164:
	bts r12,4
	stc
LB_6165:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_6162
	btr r12,3
	clc
	jmp LB_6163
LB_6162:
	bts r12,3
	stc
LB_6163:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_6160
	btr r12,2
	clc
	jmp LB_6161
LB_6160:
	bts r12,2
	stc
LB_6161:
	add rsp,32
MTC_LB_6167:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_6168
; _emt_mov_ptn_to_ptn:{| 101110.. |},2' ⊢ °0◂1'
; 2' ⊢ °0◂1'
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_6169
	bt QWORD [rdi],0
	jc LB_6170
	btr r12,5
	clc
	jmp LB_6171
LB_6170:
	bts r12,5
	stc
LB_6171:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_6169:
	mov r11,rdi
	mov r14,r11
	bt r12,5
	jc LB_6172
	btr r12,1
	jmp LB_6173
LB_6172:
	bts r12,1
LB_6173:
LB_6174:
	cmp r15,0
	jz LB_6175
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6174
LB_6175:
; _f2021 { %_6130 %_6131 } ⊢ %_6132 : %_6132
 ; {>  %_331~4':_r64 %_6130~0':_p1988 %_332~3':_r64 %_6131~1':_p1988 }
; _f2021 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_6132 ⊢ %_6133 : %_6133
 ; {>  %_331~4':_r64 %_6132~°1◂{ 0' 1' }:_p1988 %_332~3':_r64 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_6133
 ; {>  %_331~4':_r64 %_332~3':_r64 %_6133~°0◂°1◂{ 0' 1' }:(_opn)◂(_p1988) }
; 	∎ °0◂°1◂{ 0' 1' }
	bt r12,4
	jc LB_6176
	mov rdi,r10
	call dlt
LB_6176:
	bt r12,3
	jc LB_6177
	mov rdi,r9
	call dlt
LB_6177:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_6182
	btr r12,2
	jmp LB_6183
LB_6182:
	bts r12,2
LB_6183:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_6180
	btr QWORD [rdi],0
	jmp LB_6181
LB_6180:
	bts QWORD [rdi],0
LB_6181:
	mov r8,r14
	bt r12,1
	jc LB_6186
	btr r12,2
	jmp LB_6187
LB_6186:
	bts r12,2
LB_6187:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_6184
	btr QWORD [rdi],1
	jmp LB_6185
LB_6184:
	bts QWORD [rdi],1
LB_6185:
	mov rsi,1
	bt r12,3
	jc LB_6178
	mov rsi,0
	bt r9,0
	jc LB_6178
	jmp LB_6179
LB_6178:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6179:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_6168:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_6188
; _emt_mov_ptn_to_ptn:{| 101110.. |},2' ⊢ °1◂{  }
; 2' ⊢ °1◂{  }
	btr r12,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_6189
	bt QWORD [rdi],0
	jc LB_6190
	btr r12,1
	clc
	jmp LB_6191
LB_6190:
	bts r12,1
	stc
LB_6191:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_6189:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_6192:
	cmp r15,0
	jz LB_6193
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6192
LB_6193:
; _some %_6130 ⊢ %_6134 : %_6134
 ; {>  %_331~4':_r64 %_6130~0':_p1988 %_332~3':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_6134
 ; {>  %_6134~°0◂0':(_opn)◂(_p1988) %_331~4':_r64 %_332~3':_r64 }
; 	∎ °0◂0'
	bt r12,4
	jc LB_6194
	mov rdi,r10
	call dlt
LB_6194:
	bt r12,3
	jc LB_6195
	mov rdi,r9
	call dlt
LB_6195:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6196
	btr r12,3
	jmp LB_6197
LB_6196:
	bts r12,3
LB_6197:
	mov r8,0
	bts r12,2
	ret
MTC_LB_6188:
LB_6198:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6200
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6199
LB_6200:
	add rsp,8
	ret
LB_6201:
	add rsp,48
	pop r14
LB_6199:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6123:
NS_E_RDI_6123:
NS_E_6123_ETR_TBL:
NS_E_6123_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\134\146"
	jmp LB_6241
LB_6240:
	add r14,1
LB_6241:
	cmp r14,r10
	jge LB_6242
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6240
	cmp al,10
	jz LB_6240
	cmp al,32
	jz LB_6240
LB_6242:
	add r14,3
	cmp r14,r10
	jg LB_6245
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_6245
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,134
	jnz LB_6245
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,146
	jnz LB_6245
	jmp LB_6246
LB_6245:
	jmp LB_6235
LB_6246:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_6248
LB_6247:
	add r14,1
LB_6248:
	cmp r14,r10
	jge LB_6249
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6247
	cmp al,10
	jz LB_6247
	cmp al,32
	jz LB_6247
LB_6249:
	push r10
	call NS_E_6122_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6250
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6251
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6251:
	jmp LB_6235
LB_6250:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6238
	btr r12,1
	clc
	jmp LB_6239
LB_6238:
	bts r12,1
	stc
LB_6239:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6236
	btr r12,0
	clc
	jmp LB_6237
LB_6236:
	bts r12,0
	stc
LB_6237:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 102
	push LB_6232
	push LB_6232
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6253
	btr r12,2
	jmp LB_6254
LB_6253:
	bts r12,2
LB_6254:
	mov r13,r14
	bt r12,1
	jc LB_6255
	btr r12,0
	jmp LB_6256
LB_6255:
	bts r12,0
LB_6256:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some %_6135 ⊢ %_6136 : %_6136
 ; {>  %_335~2':_r64 %_6135~0':_p1988 %_336~1':_r64 }
; _some 0' ⊢ °0◂0'
; _some %_6136 ⊢ %_6137 : %_6137
 ; {>  %_335~2':_r64 %_6136~°0◂0':(_opn)◂(_p1988) %_336~1':_r64 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_6137
 ; {>  %_335~2':_r64 %_6137~°0◂°0◂0':(_opn)◂((_opn)◂(_p1988)) %_336~1':_r64 }
; 	∎ °0◂°0◂0'
	bt r12,2
	jc LB_6226
	mov rdi,r8
	call dlt
LB_6226:
	bt r12,1
	jc LB_6227
	mov rdi,r14
	call dlt
LB_6227:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6230
	btr r12,3
	jmp LB_6231
LB_6230:
	bts r12,3
LB_6231:
	mov rsi,1
	bt r12,3
	jc LB_6228
	mov rsi,0
	bt r9,0
	jc LB_6228
	jmp LB_6229
LB_6228:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6229:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6232:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6234
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6233
LB_6234:
	add rsp,8
	ret
LB_6235:
	add rsp,32
	pop r14
LB_6233:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 103
	push LB_6261
	push LB_6261
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _none {  } ⊢ %_6138 : %_6138
 ; {>  %_340~0':_r64 %_339~1':_r64 }
; _none {  } ⊢ °1◂{  }
; _some %_6138 ⊢ %_6139 : %_6139
 ; {>  %_340~0':_r64 %_339~1':_r64 %_6138~°1◂{  }:(_opn)◂(t2465'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_6139
 ; {>  %_6139~°0◂°1◂{  }:(_opn)◂((_opn)◂(t2468'(0))) %_340~0':_r64 %_339~1':_r64 }
; 	∎ °0◂°1◂{  }
	bt r12,0
	jc LB_6257
	mov rdi,r13
	call dlt
LB_6257:
	bt r12,1
	jc LB_6258
	mov rdi,r14
	call dlt
LB_6258:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_6259
	mov rsi,0
	bt r9,0
	jc LB_6259
	jmp LB_6260
LB_6259:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6260:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6261:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6263
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6262
LB_6263:
	add rsp,8
	ret
LB_6264:
	add rsp,0
	pop r14
LB_6262:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6124:
NS_E_RDI_6124:
NS_E_6124_ETR_TBL:
NS_E_6124_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\151\130"
	jmp LB_6288
LB_6287:
	add r14,1
LB_6288:
	cmp r14,r10
	jge LB_6289
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6287
	cmp al,10
	jz LB_6287
	cmp al,32
	jz LB_6287
LB_6289:
	add r14,3
	cmp r14,r10
	jg LB_6292
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_6292
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,151
	jnz LB_6292
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,130
	jnz LB_6292
	jmp LB_6293
LB_6292:
	jmp LB_6280
LB_6293:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_6295
LB_6294:
	add r14,1
LB_6295:
	cmp r14,r10
	jge LB_6296
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6294
	cmp al,10
	jz LB_6294
	cmp al,32
	jz LB_6294
LB_6296:
	push r10
	call NS_E_6125_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6297
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6298
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6298:
	jmp LB_6280
LB_6297:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_app_tl
	jmp LB_6301
LB_6300:
	add r14,1
LB_6301:
	cmp r14,r10
	jge LB_6302
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6300
	cmp al,10
	jz LB_6300
	cmp al,32
	jz LB_6300
LB_6302:
	push r10
	call NS_E_6124_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6303
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6304
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6304:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6305
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6305:
	jmp LB_6280
LB_6303:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6285
	btr r12,2
	clc
	jmp LB_6286
LB_6285:
	bts r12,2
	stc
LB_6286:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6283
	btr r12,1
	clc
	jmp LB_6284
LB_6283:
	bts r12,1
	stc
LB_6284:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6281
	btr r12,0
	clc
	jmp LB_6282
LB_6281:
	bts r12,0
	stc
LB_6282:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 104
	push LB_6277
	push LB_6277
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_6307
	btr r12,3
	jmp LB_6308
LB_6307:
	bts r12,3
LB_6308:
	mov r14,r8
	bt r12,2
	jc LB_6309
	btr r12,1
	jmp LB_6310
LB_6309:
	bts r12,1
LB_6310:
	mov r8,r13
	bt r12,0
	jc LB_6311
	btr r12,2
	jmp LB_6312
LB_6311:
	bts r12,2
LB_6312:
	mov r13,r9
	bt r12,3
	jc LB_6313
	btr r12,0
	jmp LB_6314
LB_6313:
	bts r12,0
LB_6314:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _cns { %_6140 %_6141 } ⊢ %_6142 : %_6142
 ; {>  %_343~3':_r64 %_344~2':_r64 %_6140~0':_p1988 %_6141~1':(_lst)◂(_p1988) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_6142 ⊢ %_6143 : %_6143
 ; {>  %_343~3':_r64 %_344~2':_r64 %_6142~°0◂{ 0' 1' }:(_lst)◂(_p1988) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_6143
 ; {>  %_343~3':_r64 %_344~2':_r64 %_6143~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p1988)) }
; 	∎ °0◂°0◂{ 0' 1' }
	bt r12,3
	jc LB_6265
	mov rdi,r9
	call dlt
LB_6265:
	bt r12,2
	jc LB_6266
	mov rdi,r8
	call dlt
LB_6266:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_6271
	btr r12,2
	jmp LB_6272
LB_6271:
	bts r12,2
LB_6272:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_6269
	btr QWORD [rdi],0
	jmp LB_6270
LB_6269:
	bts QWORD [rdi],0
LB_6270:
	mov r8,r14
	bt r12,1
	jc LB_6275
	btr r12,2
	jmp LB_6276
LB_6275:
	bts r12,2
LB_6276:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_6273
	btr QWORD [rdi],1
	jmp LB_6274
LB_6273:
	bts QWORD [rdi],1
LB_6274:
	mov rsi,1
	bt r12,3
	jc LB_6267
	mov rsi,0
	bt r9,0
	jc LB_6267
	jmp LB_6268
LB_6267:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6268:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6277:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6279
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6278
LB_6279:
	add rsp,8
	ret
LB_6280:
	add rsp,48
	pop r14
LB_6278:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 105
	push LB_6319
	push LB_6319
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_6144 : %_6144
 ; {>  %_348~0':_r64 %_347~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; _some %_6144 ⊢ %_6145 : %_6145
 ; {>  %_348~0':_r64 %_347~1':_r64 %_6144~°1◂{  }:(_lst)◂(t2478'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_6145
 ; {>  %_348~0':_r64 %_6145~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2481'(0))) %_347~1':_r64 }
; 	∎ °0◂°1◂{  }
	bt r12,0
	jc LB_6315
	mov rdi,r13
	call dlt
LB_6315:
	bt r12,1
	jc LB_6316
	mov rdi,r14
	call dlt
LB_6316:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_6317
	mov rsi,0
	bt r9,0
	jc LB_6317
	jmp LB_6318
LB_6317:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6318:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6319:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6321
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6320
LB_6321:
	add rsp,8
	ret
LB_6322:
	add rsp,0
	pop r14
LB_6320:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6125:
NS_E_RDI_6125:
NS_E_6125_ETR_TBL:
NS_E_6125_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_6345
LB_6344:
	add r14,1
LB_6345:
	cmp r14,r10
	jge LB_6346
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6344
	cmp al,10
	jz LB_6344
	cmp al,32
	jz LB_6344
LB_6346:
	add r14,1
	cmp r14,r10
	jg LB_6349
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,123
	jnz LB_6349
	jmp LB_6350
LB_6349:
	jmp LB_6337
LB_6350:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ type ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_6355:
	jmp LB_6352
LB_6351:
	add r14,1
LB_6352:
	cmp r14,r10
	jge LB_6353
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6351
	cmp al,10
	jz LB_6351
	cmp al,32
	jz LB_6351
LB_6353:
	push r10
	push rsi
	call NS_E_6122_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_6354
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_6356
	bts QWORD [rax],0
LB_6356:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_6355
LB_6354:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "}"
	jmp LB_6358
LB_6357:
	add r14,1
LB_6358:
	cmp r14,r10
	jge LB_6359
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6357
	cmp al,10
	jz LB_6357
	cmp al,32
	jz LB_6357
LB_6359:
	add r14,1
	cmp r14,r10
	jg LB_6364
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,125
	jnz LB_6364
	jmp LB_6365
LB_6364:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6361
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6361:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6362
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6362:
	jmp LB_6337
LB_6365:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6342
	btr r12,2
	clc
	jmp LB_6343
LB_6342:
	bts r12,2
	stc
LB_6343:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6340
	btr r12,1
	clc
	jmp LB_6341
LB_6340:
	bts r12,1
	stc
LB_6341:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6338
	btr r12,0
	clc
	jmp LB_6339
LB_6338:
	bts r12,0
	stc
LB_6339:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 106
	push LB_6334
	push LB_6334
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_6366
	btr r12,3
	jmp LB_6367
LB_6366:
	bts r12,3
LB_6367:
	mov r13,r14
	bt r12,1
	jc LB_6368
	btr r12,0
	jmp LB_6369
LB_6368:
	bts r12,0
LB_6369:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f975 %_6146 ⊢ %_6147 : %_6147
 ; {>  %_6146~0':(_lst)◂(_p1988) %_352~1':_r64 %_351~2':_r64 }
; _f975 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push 1
	push LB_6327
	call NS_E_975
LB_6327:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_6325
	btr r12,2
	clc
	jmp LB_6326
LB_6325:
	bts r12,2
	stc
LB_6326:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_6323
	btr r12,1
	clc
	jmp LB_6324
LB_6323:
	bts r12,1
	stc
LB_6324:
	add rsp,24
; _f2020 %_6147 ⊢ %_6148 : %_6148
 ; {>  %_6147~0':(_lst)◂(_p1988) %_352~1':_r64 %_351~2':_r64 }
; _f2020 0' ⊢ °0◂0'
; _some %_6148 ⊢ %_6149 : %_6149
 ; {>  %_6148~°0◂0':_p1988 %_352~1':_r64 %_351~2':_r64 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_6149
 ; {>  %_6149~°0◂°0◂0':(_opn)◂(_p1988) %_352~1':_r64 %_351~2':_r64 }
; 	∎ °0◂°0◂0'
	bt r12,1
	jc LB_6328
	mov rdi,r14
	call dlt
LB_6328:
	bt r12,2
	jc LB_6329
	mov rdi,r8
	call dlt
LB_6329:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6332
	btr r12,3
	jmp LB_6333
LB_6332:
	bts r12,3
LB_6333:
	mov rsi,1
	bt r12,3
	jc LB_6330
	mov rsi,0
	bt r9,0
	jc LB_6330
	jmp LB_6331
LB_6330:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6331:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6334:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6336
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6335
LB_6336:
	add rsp,8
	ret
LB_6337:
	add rsp,48
	pop r14
LB_6335:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "("
	jmp LB_6385
LB_6384:
	add r14,1
LB_6385:
	cmp r14,r10
	jge LB_6386
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6384
	cmp al,10
	jz LB_6384
	cmp al,32
	jz LB_6384
LB_6386:
	add r14,1
	cmp r14,r10
	jg LB_6389
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,40
	jnz LB_6389
	jmp LB_6390
LB_6389:
	jmp LB_6377
LB_6390:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_6392
LB_6391:
	add r14,1
LB_6392:
	cmp r14,r10
	jge LB_6393
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6391
	cmp al,10
	jz LB_6391
	cmp al,32
	jz LB_6391
LB_6393:
	push r10
	call NS_E_6122_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6394
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6395
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6395:
	jmp LB_6377
LB_6394:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ")"
	jmp LB_6398
LB_6397:
	add r14,1
LB_6398:
	cmp r14,r10
	jge LB_6399
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6397
	cmp al,10
	jz LB_6397
	cmp al,32
	jz LB_6397
LB_6399:
	add r14,1
	cmp r14,r10
	jg LB_6404
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,41
	jnz LB_6404
	jmp LB_6405
LB_6404:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6401
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6401:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6402
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6402:
	jmp LB_6377
LB_6405:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6382
	btr r12,2
	clc
	jmp LB_6383
LB_6382:
	bts r12,2
	stc
LB_6383:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6380
	btr r12,1
	clc
	jmp LB_6381
LB_6380:
	bts r12,1
	stc
LB_6381:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6378
	btr r12,0
	clc
	jmp LB_6379
LB_6378:
	bts r12,0
	stc
LB_6379:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 107
	push LB_6374
	push LB_6374
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_6406
	btr r12,3
	jmp LB_6407
LB_6406:
	bts r12,3
LB_6407:
	mov r13,r14
	bt r12,1
	jc LB_6408
	btr r12,0
	jmp LB_6409
LB_6408:
	bts r12,0
LB_6409:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some %_6150 ⊢ %_6151 : %_6151
 ; {>  %_6150~0':_p1988 %_356~1':_r64 %_355~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_6151
 ; {>  %_6151~°0◂0':(_opn)◂(_p1988) %_356~1':_r64 %_355~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_6370
	mov rdi,r14
	call dlt
LB_6370:
	bt r12,2
	jc LB_6371
	mov rdi,r8
	call dlt
LB_6371:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6372
	btr r12,3
	jmp LB_6373
LB_6372:
	bts r12,3
LB_6373:
	mov r8,0
	bts r12,2
	ret
LB_6374:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6376
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6375
LB_6376:
	add rsp,8
	ret
LB_6377:
	add rsp,48
	pop r14
LB_6375:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; var
	jmp LB_6423
LB_6422:
	add r14,1
LB_6423:
	cmp r14,r10
	jge LB_6424
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6422
	cmp al,10
	jz LB_6422
	cmp al,32
	jz LB_6422
LB_6424:
	push r10
	call NS_E_6126_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6425
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6419
LB_6425:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6420
	btr r12,0
	clc
	jmp LB_6421
LB_6420:
	bts r12,0
	stc
LB_6421:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 108
	push LB_6416
	push LB_6416
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f2024 %_6152 ⊢ %_6153 : %_6153
 ; {>  %_6152~0':_stg %_360~1':_r64 %_359~2':_r64 }
; _f2024 0' ⊢ °4◂0'
; _some %_6153 ⊢ %_6154 : %_6154
 ; {>  %_6153~°4◂0':_p1988 %_360~1':_r64 %_359~2':_r64 }
; _some °4◂0' ⊢ °0◂°4◂0'
; ∎ %_6154
 ; {>  %_360~1':_r64 %_6154~°0◂°4◂0':(_opn)◂(_p1988) %_359~2':_r64 }
; 	∎ °0◂°4◂0'
	bt r12,1
	jc LB_6410
	mov rdi,r14
	call dlt
LB_6410:
	bt r12,2
	jc LB_6411
	mov rdi,r8
	call dlt
LB_6411:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°4◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6414
	btr r12,3
	jmp LB_6415
LB_6414:
	bts r12,3
LB_6415:
	mov rsi,1
	bt r12,3
	jc LB_6412
	mov rsi,0
	bt r9,0
	jc LB_6412
	jmp LB_6413
LB_6412:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6413:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6416:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6418
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6417
LB_6418:
	add rsp,8
	ret
LB_6419:
	add rsp,16
	pop r14
LB_6417:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_6440
LB_6439:
	add r14,1
LB_6440:
	cmp r14,r10
	jge LB_6441
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6439
	cmp al,10
	jz LB_6439
	cmp al,32
	jz LB_6439
LB_6441:
	push r10
	call NS_E_4901_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6442
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6436
LB_6442:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6437
	btr r12,0
	clc
	jmp LB_6438
LB_6437:
	bts r12,0
	stc
LB_6438:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 109
	push LB_6433
	push LB_6433
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f2023 %_6155 ⊢ %_6156 : %_6156
 ; {>  %_363~2':_r64 %_364~1':_r64 %_6155~0':_p1878 }
; _f2023 0' ⊢ °3◂0'
; _some %_6156 ⊢ %_6157 : %_6157
 ; {>  %_363~2':_r64 %_364~1':_r64 %_6156~°3◂0':_p1988 }
; _some °3◂0' ⊢ °0◂°3◂0'
; ∎ %_6157
 ; {>  %_363~2':_r64 %_364~1':_r64 %_6157~°0◂°3◂0':(_opn)◂(_p1988) }
; 	∎ °0◂°3◂0'
	bt r12,2
	jc LB_6427
	mov rdi,r8
	call dlt
LB_6427:
	bt r12,1
	jc LB_6428
	mov rdi,r14
	call dlt
LB_6428:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°3◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6431
	btr r12,3
	jmp LB_6432
LB_6431:
	bts r12,3
LB_6432:
	mov rsi,1
	bt r12,3
	jc LB_6429
	mov rsi,0
	bt r9,0
	jc LB_6429
	jmp LB_6430
LB_6429:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6430:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6433:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6435
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6434
LB_6435:
	add rsp,8
	ret
LB_6436:
	add rsp,16
	pop r14
LB_6434:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6126:
NS_E_RDI_6126:
NS_E_6126_ETR_TBL:
NS_E_6126_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_1677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6459
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6451
LB_6459:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_6467
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,39
	jnz LB_6467
	jmp LB_6468
LB_6467:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6465
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6465:
	jmp LB_6451
LB_6468:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6454
	btr r12,1
	clc
	jmp LB_6455
LB_6454:
	bts r12,1
	stc
LB_6455:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6452
	btr r12,0
	clc
	jmp LB_6453
LB_6452:
	bts r12,0
	stc
LB_6453:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 110
	push LB_6448
	push LB_6448
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some %_6158 ⊢ %_6159 : %_6159
 ; {>  %_6158~0':_stg %_367~2':_r64 %_368~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_6159
 ; {>  %_367~2':_r64 %_368~1':_r64 %_6159~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
	bt r12,2
	jc LB_6444
	mov rdi,r8
	call dlt
LB_6444:
	bt r12,1
	jc LB_6445
	mov rdi,r14
	call dlt
LB_6445:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6446
	btr r12,3
	jmp LB_6447
LB_6446:
	bts r12,3
LB_6447:
	mov r8,0
	bts r12,2
	ret
LB_6448:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6450
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6449
LB_6450:
	add rsp,8
	ret
LB_6451:
	add rsp,32
	pop r14
LB_6449:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6470:
NS_E_RDI_6470:
NS_E_6470_ETR_TBL:
NS_E_6470_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\n"
	jmp LB_6580
LB_6579:
	add r14,1
LB_6580:
	cmp r14,r10
	jge LB_6581
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6579
	cmp al,32
	jz LB_6579
LB_6581:
	add r14,1
	cmp r14,r10
	jg LB_6584
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_6584
	jmp LB_6585
LB_6584:
	jmp LB_6548
LB_6585:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; nls
	jmp LB_6574
LB_6573:
	add r14,1
LB_6574:
	cmp r14,r10
	jge LB_6575
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6573
	cmp al,32
	jz LB_6573
LB_6575:
	push r10
	call NS_E_6471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6576
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6577
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6577:
	jmp LB_6549
LB_6576:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6570
	btr QWORD [rdi],1
LB_6570:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6571
	btr QWORD [rdi],0
LB_6571:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_6549:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_6548:
	add rsp,32
	pop r14
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	jmp LB_6566
LB_6565:
	add r14,1
LB_6566:
	cmp r14,r10
	jge LB_6567
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6565
	cmp al,32
	jz LB_6565
LB_6567:
	push r10
	call NS_E_904_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6568
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6550
LB_6568:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\F\\"
	jmp LB_6558
LB_6557:
	add r14,1
LB_6558:
	cmp r14,r10
	jge LB_6559
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6557
	cmp al,32
	jz LB_6557
LB_6559:
	add r14,3
	cmp r14,r10
	jg LB_6563
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,92
	jnz LB_6563
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,70
	jnz LB_6563
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,92
	jnz LB_6563
	jmp LB_6564
LB_6563:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6561
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6561:
	jmp LB_6551
LB_6564:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6554
	btr QWORD [rdi],1
LB_6554:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6555
	btr QWORD [rdi],0
LB_6555:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_6551:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_6550:
	add rsp,32
	pop r14
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_6552:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6471:
NS_E_RDI_6471:
NS_E_6471_ETR_TBL:
NS_E_6471_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\n"
	jmp LB_6608
LB_6607:
	add r14,1
LB_6608:
	cmp r14,r10
	jge LB_6609
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6607
	cmp al,32
	jz LB_6607
LB_6609:
	add r14,1
	cmp r14,r10
	jg LB_6612
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_6612
	jmp LB_6613
LB_6612:
	jmp LB_6594
LB_6613:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; nls
	jmp LB_6602
LB_6601:
	add r14,1
LB_6602:
	cmp r14,r10
	jge LB_6603
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6601
	cmp al,32
	jz LB_6601
LB_6603:
	push r10
	call NS_E_6471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6604
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6605
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6605:
	jmp LB_6595
LB_6604:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6599
	btr r12,1
	clc
	jmp LB_6600
LB_6599:
	bts r12,1
	stc
LB_6600:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6597
	btr r12,0
	clc
	jmp LB_6598
LB_6597:
	bts r12,0
	stc
LB_6598:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 111
	push LB_6591
	push LB_6591
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6614
	btr r12,2
	jmp LB_6615
LB_6614:
	bts r12,2
LB_6615:
	mov r13,r14
	bt r12,1
	jc LB_6616
	btr r12,0
	jmp LB_6617
LB_6616:
	bts r12,0
LB_6617:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f5063 {  } ⊢ %_6478 : %_6478
 ; {>  %_371~2':_r64 %_6477~0':(_p5062)◂({ }) %_372~1':_r64 }
; _f5063 {  } ⊢ °0◂{  }
; _some %_6478 ⊢ %_6479 : %_6479
 ; {>  %_371~2':_r64 %_6477~0':(_p5062)◂({ }) %_6478~°0◂{  }:(_p5062)◂({ }) %_372~1':_r64 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_6479
 ; {>  %_6479~°0◂°0◂{  }:(_opn)◂((_p5062)◂({ })) %_371~2':_r64 %_6477~0':(_p5062)◂({ }) %_372~1':_r64 }
; 	∎ °0◂°0◂{  }
	bt r12,2
	jc LB_6586
	mov rdi,r8
	call dlt
LB_6586:
	bt r12,0
	jc LB_6587
	mov rdi,r13
	call dlt
LB_6587:
	bt r12,1
	jc LB_6588
	mov rdi,r14
	call dlt
LB_6588:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_6589
	mov rsi,0
	bt r9,0
	jc LB_6589
	jmp LB_6590
LB_6589:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6590:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6591:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6593
	pop r14
	jmp LB_6596
LB_6593:
	add rsp,8
	ret
LB_6595:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_6596:
	ret
LB_6594:
	add rsp,32
	pop r14
LB_6592:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "##"
	jmp LB_6649
LB_6648:
	add r14,1
LB_6649:
	cmp r14,r10
	jge LB_6650
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6648
	cmp al,32
	jz LB_6648
LB_6650:
	add r14,2
	cmp r14,r10
	jg LB_6653
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,35
	jnz LB_6653
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,35
	jnz LB_6653
	jmp LB_6654
LB_6653:
	jmp LB_6626
LB_6654:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_res
	jmp LB_6636
LB_6635:
	add r14,1
LB_6636:
	cmp r14,r10
	jge LB_6637
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6635
	cmp al,32
	jz LB_6635
LB_6637:
	push r10
	call NS_E_6473_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6638
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6639
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6639:
	jmp LB_6627
LB_6638:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; nls
	jmp LB_6642
LB_6641:
	add r14,1
LB_6642:
	cmp r14,r10
	jge LB_6643
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6641
	cmp al,32
	jz LB_6641
LB_6643:
	push r10
	call NS_E_6471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6644
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6645
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6645:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6646
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6646:
	jmp LB_6627
LB_6644:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6633
	btr r12,2
	clc
	jmp LB_6634
LB_6633:
	bts r12,2
	stc
LB_6634:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6631
	btr r12,1
	clc
	jmp LB_6632
LB_6631:
	bts r12,1
	stc
LB_6632:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6629
	btr r12,0
	clc
	jmp LB_6630
LB_6629:
	bts r12,0
	stc
LB_6630:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 112
	push LB_6623
	push LB_6623
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } {  } 0' }
	mov r9,r13
	bt r12,0
	jc LB_6655
	btr r12,3
	jmp LB_6656
LB_6655:
	bts r12,3
LB_6656:
	mov r13,r8
	bt r12,2
	jc LB_6657
	btr r12,0
	jmp LB_6658
LB_6657:
	bts r12,0
LB_6658:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f5063 {  } ⊢ %_6482 : %_6482
 ; {>  %_375~2':_r64 %_6480~{  }:{ } %_376~1':_r64 %_6481~0':(_p5062)◂({ }) }
; _f5063 {  } ⊢ °0◂{  }
; _some %_6482 ⊢ %_6483 : %_6483
 ; {>  %_6482~°0◂{  }:(_p5062)◂({ }) %_375~2':_r64 %_6480~{  }:{ } %_376~1':_r64 %_6481~0':(_p5062)◂({ }) }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_6483
 ; {>  %_375~2':_r64 %_6480~{  }:{ } %_376~1':_r64 %_6481~0':(_p5062)◂({ }) %_6483~°0◂°0◂{  }:(_opn)◂((_p5062)◂({ })) }
; 	∎ °0◂°0◂{  }
	bt r12,2
	jc LB_6618
	mov rdi,r8
	call dlt
LB_6618:
	bt r12,1
	jc LB_6619
	mov rdi,r14
	call dlt
LB_6619:
	bt r12,0
	jc LB_6620
	mov rdi,r13
	call dlt
LB_6620:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_6621
	mov rsi,0
	bt r9,0
	jc LB_6621
	jmp LB_6622
LB_6621:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6622:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6623:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6625
	pop r14
	jmp LB_6628
LB_6625:
	add rsp,8
	ret
LB_6627:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_6628:
	ret
LB_6626:
	add rsp,48
	pop r14
LB_6624:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\\["
	jmp LB_6819
LB_6818:
	add r14,1
LB_6819:
	cmp r14,r10
	jge LB_6820
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6818
	cmp al,32
	jz LB_6818
LB_6820:
	add r14,2
	cmp r14,r10
	jg LB_6823
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,92
	jnz LB_6823
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,91
	jnz LB_6823
	jmp LB_6824
LB_6823:
	jmp LB_6809
LB_6824:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	push r10
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\n"
	jmp LB_6762
LB_6761:
	add r14,1
LB_6762:
	cmp r14,r10
	jge LB_6763
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6761
	cmp al,32
	jz LB_6761
LB_6763:
	add r14,1
	cmp r14,r10
	jg LB_6766
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_6766
	jmp LB_6767
LB_6766:
	jmp LB_6754
LB_6767:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cmt_in
	jmp LB_6769
LB_6768:
	add r14,1
LB_6769:
	cmp r14,r10
	jge LB_6770
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6768
	cmp al,32
	jz LB_6768
LB_6770:
	push r10
	call NS_E_6472_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6771
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6772
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6772:
	jmp LB_6754
LB_6771:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; nls
	jmp LB_6775
LB_6774:
	add r14,1
LB_6775:
	cmp r14,r10
	jge LB_6776
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6774
	cmp al,32
	jz LB_6774
LB_6776:
	push r10
	call NS_E_6471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6777
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6778
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6778:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6779
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6779:
	jmp LB_6754
LB_6777:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6759
	btr r12,2
	clc
	jmp LB_6760
LB_6759:
	bts r12,2
	stc
LB_6760:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6757
	btr r12,1
	clc
	jmp LB_6758
LB_6757:
	bts r12,1
	stc
LB_6758:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6755
	btr r12,0
	clc
	jmp LB_6756
LB_6755:
	bts r12,0
	stc
LB_6756:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 113
	push LB_6751
	push LB_6751
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_6781
	btr r12,3
	jmp LB_6782
LB_6781:
	bts r12,3
LB_6782:
	mov r14,r8
	bt r12,2
	jc LB_6783
	btr r12,1
	jmp LB_6784
LB_6783:
	bts r12,1
LB_6784:
	mov r8,r13
	bt r12,0
	jc LB_6785
	btr r12,2
	jmp LB_6786
LB_6785:
	bts r12,2
LB_6786:
	mov r13,r9
	bt r12,3
	jc LB_6787
	btr r12,0
	jmp LB_6788
LB_6787:
	bts r12,0
LB_6788:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
MTC_LB_6661:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_6662
; _emt_mov_ptn_to_ptn:{| 11110.. |},0' ⊢ °0◂{  }
; 0' ⊢ °0◂{  }
	btr r12,4
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_6663
	bt QWORD [rdi],0
	jc LB_6664
	btr r12,4
	clc
	jmp LB_6665
LB_6664:
	bts r12,4
	stc
LB_6665:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_6663:
	mov r10,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_6666:
	cmp r15,0
	jz LB_6667
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6666
LB_6667:
MTC_LB_6668:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_6669
; _emt_mov_ptn_to_ptn:{| 01110.. |},1' ⊢ °0◂{  }
; 1' ⊢ °0◂{  }
	btr r12,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_6670
	bt QWORD [rdi],0
	jc LB_6671
	btr r12,0
	clc
	jmp LB_6672
LB_6671:
	bts r12,0
	stc
LB_6672:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_6670:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_6673:
	cmp r15,0
	jz LB_6674
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6673
LB_6674:
; _f5063 {  } ⊢ %_6488 : %_6488
 ; {>  %_382~3':_r64 %_383~2':_r64 %_6487~{  }:{ } %_6486~{  }:{ } }
; _f5063 {  } ⊢ °0◂{  }
; _some %_6488 ⊢ %_6489 : %_6489
 ; {>  %_6488~°0◂{  }:(_p5062)◂({ }) %_382~3':_r64 %_383~2':_r64 %_6487~{  }:{ } %_6486~{  }:{ } }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_6489
 ; {>  %_6489~°0◂°0◂{  }:(_opn)◂((_p5062)◂({ })) %_382~3':_r64 %_383~2':_r64 %_6487~{  }:{ } %_6486~{  }:{ } }
; 	∎ °0◂°0◂{  }
	bt r12,3
	jc LB_6675
	mov rdi,r9
	call dlt
LB_6675:
	bt r12,2
	jc LB_6676
	mov rdi,r8
	call dlt
LB_6676:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_6677
	mov rsi,0
	bt r9,0
	jc LB_6677
	jmp LB_6678
LB_6677:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6678:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_6669:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_6679
; _emt_mov_ptn_to_ptn:{| 01110.. |},1' ⊢ °1◂0'
; 1' ⊢ °1◂0'
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_6680
	bt QWORD [rdi],0
	jc LB_6681
	btr r12,4
	clc
	jmp LB_6682
LB_6681:
	bts r12,4
	stc
LB_6682:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_6680:
	mov r10,rdi
	mov r13,r10
	bt r12,4
	jc LB_6683
	btr r12,0
	jmp LB_6684
LB_6683:
	bts r12,0
LB_6684:
LB_6685:
	cmp r15,0
	jz LB_6686
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6685
LB_6686:
; _f5065 %_6490 ⊢ %_6491 : %_6491
 ; {>  %_382~3':_r64 %_383~2':_r64 %_6486~{  }:{ } %_6490~0':(_lst)◂({ _r64 _r64 _stg }) }
; _f5065 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push 68
	push LB_6691
	call NS_E_5065
LB_6691:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_6689
	btr r12,3
	clc
	jmp LB_6690
LB_6689:
	bts r12,3
	stc
LB_6690:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_6687
	btr r12,2
	clc
	jmp LB_6688
LB_6687:
	bts r12,2
	stc
LB_6688:
	add rsp,24
; _f38 %_6491 ⊢ %_6492 : %_6492
 ; {>  %_6491~0':_stg %_382~3':_r64 %_383~2':_r64 %_6486~{  }:{ } }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push -1
	push LB_6696
	call NS_E_38
LB_6696:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_6694
	btr r12,3
	clc
	jmp LB_6695
LB_6694:
	bts r12,3
	stc
LB_6695:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_6692
	btr r12,2
	clc
	jmp LB_6693
LB_6692:
	bts r12,2
	stc
LB_6693:
	add rsp,24
	jmp err
MTC_LB_6679:
MTC_LB_6662:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_6697
; _emt_mov_ptn_to_ptn:{| 11110.. |},0' ⊢ °1◂4'
; 0' ⊢ °1◂4'
	btr r12,5
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_6698
	bt QWORD [rdi],0
	jc LB_6699
	btr r12,5
	clc
	jmp LB_6700
LB_6699:
	bts r12,5
	stc
LB_6700:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_6698:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_6701
	btr r12,4
	jmp LB_6702
LB_6701:
	bts r12,4
LB_6702:
LB_6703:
	cmp r15,0
	jz LB_6704
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6703
LB_6704:
MTC_LB_6705:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_6706
; _emt_mov_ptn_to_ptn:{| 011110.. |},1' ⊢ °0◂{  }
; 1' ⊢ °0◂{  }
	btr r12,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_6707
	bt QWORD [rdi],0
	jc LB_6708
	btr r12,0
	clc
	jmp LB_6709
LB_6708:
	bts r12,0
	stc
LB_6709:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_6707:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_6710:
	cmp r15,0
	jz LB_6711
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6710
LB_6711:
; _f5065 %_6493 ⊢ %_6495 : %_6495
 ; {>  %_6493~4':(_lst)◂({ _r64 _r64 _stg }) %_382~3':_r64 %_6494~{  }:{ } %_383~2':_r64 }
; _f5065 4' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_6716
	btr r12,0
	jmp LB_6717
LB_6716:
	bts r12,0
LB_6717:
	push 68
	push LB_6718
	call NS_E_5065
LB_6718:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_6714
	btr r12,3
	clc
	jmp LB_6715
LB_6714:
	bts r12,3
	stc
LB_6715:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_6712
	btr r12,2
	clc
	jmp LB_6713
LB_6712:
	bts r12,2
	stc
LB_6713:
	add rsp,24
; _f38 %_6495 ⊢ %_6496 : %_6496
 ; {>  %_382~3':_r64 %_6494~{  }:{ } %_6495~0':_stg %_383~2':_r64 }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push -1
	push LB_6723
	call NS_E_38
LB_6723:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_6721
	btr r12,3
	clc
	jmp LB_6722
LB_6721:
	bts r12,3
	stc
LB_6722:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_6719
	btr r12,2
	clc
	jmp LB_6720
LB_6719:
	bts r12,2
	stc
LB_6720:
	add rsp,24
	jmp err
MTC_LB_6706:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_6724
; _emt_mov_ptn_to_ptn:{| 011110.. |},1' ⊢ °1◂0'
; 1' ⊢ °1◂0'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_6725
	bt QWORD [rdi],0
	jc LB_6726
	btr r12,5
	clc
	jmp LB_6727
LB_6726:
	bts r12,5
	stc
LB_6727:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_6725:
	mov r11,rdi
	mov r13,r11
	bt r12,5
	jc LB_6728
	btr r12,0
	jmp LB_6729
LB_6728:
	bts r12,0
LB_6729:
LB_6730:
	cmp r15,0
	jz LB_6731
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6730
LB_6731:
; _f981 { %_6493 %_6497 } ⊢ %_6498 : %_6498
 ; {>  %_6493~4':(_lst)◂({ _r64 _r64 _stg }) %_382~3':_r64 %_6497~0':(_lst)◂({ _r64 _r64 _stg }) %_383~2':_r64 }
; _f981 { 4' 0' } ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 4' 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_6736
	btr r12,1
	jmp LB_6737
LB_6736:
	bts r12,1
LB_6737:
	mov r13,r10
	bt r12,4
	jc LB_6738
	btr r12,0
	jmp LB_6739
LB_6738:
	bts r12,0
LB_6739:
	push 2
	push LB_6740
	call NS_E_981
LB_6740:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_6734
	btr r12,3
	clc
	jmp LB_6735
LB_6734:
	bts r12,3
	stc
LB_6735:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_6732
	btr r12,2
	clc
	jmp LB_6733
LB_6732:
	bts r12,2
	stc
LB_6733:
	add rsp,24
; _f5065 %_6498 ⊢ %_6499 : %_6499
 ; {>  %_6498~0':(_lst)◂({ _r64 _r64 _stg }) %_382~3':_r64 %_383~2':_r64 }
; _f5065 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push 68
	push LB_6745
	call NS_E_5065
LB_6745:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_6743
	btr r12,3
	clc
	jmp LB_6744
LB_6743:
	bts r12,3
	stc
LB_6744:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_6741
	btr r12,2
	clc
	jmp LB_6742
LB_6741:
	bts r12,2
	stc
LB_6742:
	add rsp,24
; _f38 %_6499 ⊢ %_6500 : %_6500
 ; {>  %_382~3':_r64 %_6499~0':_stg %_383~2':_r64 }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push -1
	push LB_6750
	call NS_E_38
LB_6750:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_6748
	btr r12,3
	clc
	jmp LB_6749
LB_6748:
	bts r12,3
	stc
LB_6749:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_6746
	btr r12,2
	clc
	jmp LB_6747
LB_6746:
	bts r12,2
	stc
LB_6747:
	add rsp,24
	jmp err
MTC_LB_6724:
MTC_LB_6697:
LB_6751:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6753
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6752
LB_6753:
	add rsp,8
	jmp LB_6659
LB_6754:
	add rsp,48
	pop r14
LB_6752:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 114
	push LB_6798
	push LB_6798
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; » _^ ..
	xor rax,rax
	add rax,8
	sub rsp,124
	mov rdi,rsp
	push rax
	push r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdx,r13
	xor rax,rax
	mov rsi,fmt_d
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call sprintf
	mov rsp,QWORD [rsp_tmp]
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	pop rsi
	mov r9,rsp
	mov r10,rax
	add rax,rsi
	add rax,1
	sub rsp,124
	mov rdi,rsp
	push rax
	push r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdx,r14
	xor rax,rax
	mov rsi,fmt_d
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call sprintf
	mov rsp,QWORD [rsp_tmp]
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	pop rsi
	mov r11,rsp
	mov rcx,rax
	add rax,rsi
	add rax,2
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; "nls_err "
	mov rsi,0x_20_72_72_65_5f_73_6c_6e
	mov QWORD [rdi+8*0],rsi
	add rdi,8
; 0'
	push rcx
	mov rsi,r9
	mov rcx,r10
	cld
	rep movsb
	pop rcx
; "-"
	mov rsi,0x_2d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r11
	mov rcx,rcx
	cld
	rep movsb
	pop rcx
; ":\n"
	mov rsi,0x_3a
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
	add rsp,248
; _f38 %_6503 ⊢ %_6504 : %_6504
 ; {>  %_6503~2':_stg %_6501~0':_r64 %_6502~1':_r64 }
; _f38 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_6793
	btr r12,0
	jmp LB_6794
LB_6793:
	bts r12,0
LB_6794:
	push -1
	push LB_6797
	call NS_E_38
LB_6797:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_6795
	btr r12,2
	jmp LB_6796
LB_6795:
	bts r12,2
LB_6796:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_6791
	btr r12,1
	clc
	jmp LB_6792
LB_6791:
	bts r12,1
	stc
LB_6792:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_6789
	btr r12,0
	clc
	jmp LB_6790
LB_6789:
	bts r12,0
	stc
LB_6790:
	add rsp,24
	jmp err
LB_6798:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6800
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6799
LB_6800:
	add rsp,8
	jmp LB_6659
LB_6801:
	add rsp,0
	pop r14
LB_6799:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	jmp LB_6659
LB_6659:
	pop r10
	cmp r8,0
	jz LB_6660
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6816
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6816:
	jmp LB_6809
LB_6660:
	mov rdi,r13
	mov rsi,r14
	mov r14,r9
	bt r12,3
	jc LB_6814
	btr r12,1
	clc
	jmp LB_6815
LB_6814:
	bts r12,1
	stc
LB_6815:
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6812
	btr r12,0
	clc
	jmp LB_6813
LB_6812:
	bts r12,0
	stc
LB_6813:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 115
	push LB_6806
	push LB_6806
; _emt_mov_ptn_to_ptn:{| 110.. |},{ { 0' } 1' } ⊢ { { {  } } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6825
	btr r12,2
	jmp LB_6826
LB_6825:
	bts r12,2
LB_6826:
	mov r13,r14
	bt r12,1
	jc LB_6827
	btr r12,0
	jmp LB_6828
LB_6827:
	bts r12,0
LB_6828:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some %_6505 ⊢ %_6506 : %_6506
 ; {>  %_391~1':_r64 %_6505~0':(_p5062)◂({ }) %_390~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_6506
 ; {>  %_391~1':_r64 %_6506~°0◂0':(_opn)◂((_p5062)◂({ })) %_390~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_6802
	mov rdi,r14
	call dlt
LB_6802:
	bt r12,2
	jc LB_6803
	mov rdi,r8
	call dlt
LB_6803:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6804
	btr r12,3
	jmp LB_6805
LB_6804:
	bts r12,3
LB_6805:
	mov r8,0
	bts r12,2
	ret
LB_6806:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6808
	pop r14
	jmp LB_6811
LB_6808:
	add rsp,8
	ret
LB_6810:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_6811:
	ret
LB_6809:
	add rsp,16
	pop r14
LB_6807:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 116
	push LB_6833
	push LB_6833
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _f5063 {  } ⊢ %_6507 : %_6507
 ; {>  %_394~1':_r64 %_395~0':_r64 }
; _f5063 {  } ⊢ °0◂{  }
; _some %_6507 ⊢ %_6508 : %_6508
 ; {>  %_394~1':_r64 %_395~0':_r64 %_6507~°0◂{  }:(_p5062)◂({ }) }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_6508
 ; {>  %_394~1':_r64 %_395~0':_r64 %_6508~°0◂°0◂{  }:(_opn)◂((_p5062)◂({ })) }
; 	∎ °0◂°0◂{  }
	bt r12,1
	jc LB_6829
	mov rdi,r14
	call dlt
LB_6829:
	bt r12,0
	jc LB_6830
	mov rdi,r13
	call dlt
LB_6830:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_6831
	mov rsi,0
	bt r9,0
	jc LB_6831
	jmp LB_6832
LB_6831:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6832:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6833:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6835
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6834
LB_6835:
	add rsp,8
	ret
LB_6836:
	add rsp,0
	pop r14
LB_6834:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6472:
NS_E_RDI_6472:
NS_E_6472_ETR_TBL:
NS_E_6472_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\\["
	jmp LB_6996
LB_6995:
	add r14,1
LB_6996:
	cmp r14,r10
	jge LB_6997
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6995
	cmp al,32
	jz LB_6995
LB_6997:
	add r14,2
	cmp r14,r10
	jg LB_7000
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,92
	jnz LB_7000
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,91
	jnz LB_7000
	jmp LB_7001
LB_7000:
	jmp LB_6986
LB_7001:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	push r10
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\n"
	jmp LB_6926
LB_6925:
	add r14,1
LB_6926:
	cmp r14,r10
	jge LB_6927
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6925
	cmp al,32
	jz LB_6925
LB_6927:
	add r14,1
	cmp r14,r10
	jg LB_6930
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_6930
	jmp LB_6931
LB_6930:
	jmp LB_6918
LB_6931:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cmt_in
	jmp LB_6933
LB_6932:
	add r14,1
LB_6933:
	cmp r14,r10
	jge LB_6934
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6932
	cmp al,32
	jz LB_6932
LB_6934:
	push r10
	call NS_E_6472_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6935
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6936
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6936:
	jmp LB_6918
LB_6935:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; cmt_in
	jmp LB_6939
LB_6938:
	add r14,1
LB_6939:
	cmp r14,r10
	jge LB_6940
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6938
	cmp al,32
	jz LB_6938
LB_6940:
	push r10
	call NS_E_6472_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6941
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6942
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6942:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6943
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6943:
	jmp LB_6918
LB_6941:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6923
	btr r12,2
	clc
	jmp LB_6924
LB_6923:
	bts r12,2
	stc
LB_6924:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6921
	btr r12,1
	clc
	jmp LB_6922
LB_6921:
	bts r12,1
	stc
LB_6922:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6919
	btr r12,0
	clc
	jmp LB_6920
LB_6919:
	bts r12,0
	stc
LB_6920:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 117
	push LB_6915
	push LB_6915
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_6945
	btr r12,3
	jmp LB_6946
LB_6945:
	bts r12,3
LB_6946:
	mov r14,r8
	bt r12,2
	jc LB_6947
	btr r12,1
	jmp LB_6948
LB_6947:
	bts r12,1
LB_6948:
	mov r8,r13
	bt r12,0
	jc LB_6949
	btr r12,2
	jmp LB_6950
LB_6949:
	bts r12,2
LB_6950:
	mov r13,r9
	bt r12,3
	jc LB_6951
	btr r12,0
	jmp LB_6952
LB_6951:
	bts r12,0
LB_6952:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
MTC_LB_6839:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_6840
; _emt_mov_ptn_to_ptn:{| 11110.. |},0' ⊢ °0◂{  }
; 0' ⊢ °0◂{  }
	btr r12,4
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_6841
	bt QWORD [rdi],0
	jc LB_6842
	btr r12,4
	clc
	jmp LB_6843
LB_6842:
	bts r12,4
	stc
LB_6843:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_6841:
	mov r10,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_6844:
	cmp r15,0
	jz LB_6845
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6844
LB_6845:
MTC_LB_6846:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_6847
; _emt_mov_ptn_to_ptn:{| 01110.. |},1' ⊢ °0◂{  }
; 1' ⊢ °0◂{  }
	btr r12,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_6848
	bt QWORD [rdi],0
	jc LB_6849
	btr r12,0
	clc
	jmp LB_6850
LB_6849:
	bts r12,0
	stc
LB_6850:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_6848:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_6851:
	cmp r15,0
	jz LB_6852
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6851
LB_6852:
; _f5063 {  } ⊢ %_6513 : %_6513
 ; {>  %_6512~{  }:{ } %_6511~{  }:{ } %_398~3':_r64 %_399~2':_r64 }
; _f5063 {  } ⊢ °0◂{  }
; _some %_6513 ⊢ %_6514 : %_6514
 ; {>  %_6512~{  }:{ } %_6511~{  }:{ } %_6513~°0◂{  }:(_p5062)◂({ }) %_398~3':_r64 %_399~2':_r64 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_6514
 ; {>  %_6514~°0◂°0◂{  }:(_opn)◂((_p5062)◂({ })) %_6512~{  }:{ } %_6511~{  }:{ } %_398~3':_r64 %_399~2':_r64 }
; 	∎ °0◂°0◂{  }
	bt r12,3
	jc LB_6853
	mov rdi,r9
	call dlt
LB_6853:
	bt r12,2
	jc LB_6854
	mov rdi,r8
	call dlt
LB_6854:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_6855
	mov rsi,0
	bt r9,0
	jc LB_6855
	jmp LB_6856
LB_6855:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6856:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_6847:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_6857
; _emt_mov_ptn_to_ptn:{| 01110.. |},1' ⊢ °1◂0'
; 1' ⊢ °1◂0'
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_6858
	bt QWORD [rdi],0
	jc LB_6859
	btr r12,4
	clc
	jmp LB_6860
LB_6859:
	bts r12,4
	stc
LB_6860:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_6858:
	mov r10,rdi
	mov r13,r10
	bt r12,4
	jc LB_6861
	btr r12,0
	jmp LB_6862
LB_6861:
	bts r12,0
LB_6862:
LB_6863:
	cmp r15,0
	jz LB_6864
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6863
LB_6864:
; _f5064 %_6515 ⊢ %_6516 : %_6516
 ; {>  %_6515~0':(_lst)◂({ _r64 _r64 _stg }) %_6511~{  }:{ } %_398~3':_r64 %_399~2':_r64 }
; _f5064 0' ⊢ °1◂0'
; _some %_6516 ⊢ %_6517 : %_6517
 ; {>  %_6516~°1◂0':(_p5062)◂(t2676'(1)) %_6511~{  }:{ } %_398~3':_r64 %_399~2':_r64 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_6517
 ; {>  %_6517~°0◂°1◂0':(_opn)◂((_p5062)◂(t2679'(1))) %_6511~{  }:{ } %_398~3':_r64 %_399~2':_r64 }
; 	∎ °0◂°1◂0'
	bt r12,3
	jc LB_6865
	mov rdi,r9
	call dlt
LB_6865:
	bt r12,2
	jc LB_6866
	mov rdi,r8
	call dlt
LB_6866:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6869
	btr r12,3
	jmp LB_6870
LB_6869:
	bts r12,3
LB_6870:
	mov rsi,1
	bt r12,3
	jc LB_6867
	mov rsi,0
	bt r9,0
	jc LB_6867
	jmp LB_6868
LB_6867:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6868:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_6857:
MTC_LB_6840:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_6871
; _emt_mov_ptn_to_ptn:{| 11110.. |},0' ⊢ °1◂4'
; 0' ⊢ °1◂4'
	btr r12,5
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_6872
	bt QWORD [rdi],0
	jc LB_6873
	btr r12,5
	clc
	jmp LB_6874
LB_6873:
	bts r12,5
	stc
LB_6874:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_6872:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_6875
	btr r12,4
	jmp LB_6876
LB_6875:
	bts r12,4
LB_6876:
LB_6877:
	cmp r15,0
	jz LB_6878
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6877
LB_6878:
MTC_LB_6879:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_6880
; _emt_mov_ptn_to_ptn:{| 011110.. |},1' ⊢ °0◂{  }
; 1' ⊢ °0◂{  }
	btr r12,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_6881
	bt QWORD [rdi],0
	jc LB_6882
	btr r12,0
	clc
	jmp LB_6883
LB_6882:
	bts r12,0
	stc
LB_6883:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_6881:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_6884:
	cmp r15,0
	jz LB_6885
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6884
LB_6885:
; _f5064 %_6518 ⊢ %_6520 : %_6520
 ; {>  %_6519~{  }:{ } %_398~3':_r64 %_399~2':_r64 %_6518~4':(_lst)◂({ _r64 _r64 _stg }) }
; _f5064 4' ⊢ °1◂4'
; _some %_6520 ⊢ %_6521 : %_6521
 ; {>  %_6520~°1◂4':(_p5062)◂(t2690'(1)) %_6519~{  }:{ } %_398~3':_r64 %_399~2':_r64 }
; _some °1◂4' ⊢ °0◂°1◂4'
; ∎ %_6521
 ; {>  %_6521~°0◂°1◂4':(_opn)◂((_p5062)◂(t2693'(1))) %_6519~{  }:{ } %_398~3':_r64 %_399~2':_r64 }
; 	∎ °0◂°1◂4'
	bt r12,3
	jc LB_6886
	mov rdi,r9
	call dlt
LB_6886:
	bt r12,2
	jc LB_6887
	mov rdi,r8
	call dlt
LB_6887:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂°1◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_6890
	btr r12,3
	jmp LB_6891
LB_6890:
	bts r12,3
LB_6891:
	mov rsi,1
	bt r12,3
	jc LB_6888
	mov rsi,0
	bt r9,0
	jc LB_6888
	jmp LB_6889
LB_6888:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6889:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_6880:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_6892
; _emt_mov_ptn_to_ptn:{| 011110.. |},1' ⊢ °1◂0'
; 1' ⊢ °1◂0'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_6893
	bt QWORD [rdi],0
	jc LB_6894
	btr r12,5
	clc
	jmp LB_6895
LB_6894:
	bts r12,5
	stc
LB_6895:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_6893:
	mov r11,rdi
	mov r13,r11
	bt r12,5
	jc LB_6896
	btr r12,0
	jmp LB_6897
LB_6896:
	bts r12,0
LB_6897:
LB_6898:
	cmp r15,0
	jz LB_6899
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6898
LB_6899:
; _f981 { %_6518 %_6522 } ⊢ %_6523 : %_6523
 ; {>  %_6522~0':(_lst)◂({ _r64 _r64 _stg }) %_398~3':_r64 %_399~2':_r64 %_6518~4':(_lst)◂({ _r64 _r64 _stg }) }
; _f981 { 4' 0' } ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 4' 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_6904
	btr r12,1
	jmp LB_6905
LB_6904:
	bts r12,1
LB_6905:
	mov r13,r10
	bt r12,4
	jc LB_6906
	btr r12,0
	jmp LB_6907
LB_6906:
	bts r12,0
LB_6907:
	push 2
	push LB_6908
	call NS_E_981
LB_6908:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_6902
	btr r12,3
	clc
	jmp LB_6903
LB_6902:
	bts r12,3
	stc
LB_6903:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_6900
	btr r12,2
	clc
	jmp LB_6901
LB_6900:
	bts r12,2
	stc
LB_6901:
	add rsp,24
; _f5064 %_6523 ⊢ %_6524 : %_6524
 ; {>  %_398~3':_r64 %_399~2':_r64 %_6523~0':(_lst)◂({ _r64 _r64 _stg }) }
; _f5064 0' ⊢ °1◂0'
; _some %_6524 ⊢ %_6525 : %_6525
 ; {>  %_398~3':_r64 %_399~2':_r64 %_6524~°1◂0':(_p5062)◂(t2698'(1)) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_6525
 ; {>  %_6525~°0◂°1◂0':(_opn)◂((_p5062)◂(t2701'(1))) %_398~3':_r64 %_399~2':_r64 }
; 	∎ °0◂°1◂0'
	bt r12,3
	jc LB_6909
	mov rdi,r9
	call dlt
LB_6909:
	bt r12,2
	jc LB_6910
	mov rdi,r8
	call dlt
LB_6910:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6913
	btr r12,3
	jmp LB_6914
LB_6913:
	bts r12,3
LB_6914:
	mov rsi,1
	bt r12,3
	jc LB_6911
	mov rsi,0
	bt r9,0
	jc LB_6911
	jmp LB_6912
LB_6911:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6912:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_6892:
MTC_LB_6871:
LB_6915:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6917
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6916
LB_6917:
	add rsp,8
	jmp LB_6837
LB_6918:
	add rsp,48
	pop r14
LB_6916:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 118
	push LB_6975
	push LB_6975
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_6526 : %_6526
 ; {>  %_402~1':_r64 %_403~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; 	» "blk_cmt 0" _ ⊢ 2' : %_6527
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_74_6d_63_5f_6b_6c_62
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r8,rdi
	btr r12,2
; _cns { { %_403 %_402 %_6527 } %_6526 } ⊢ %_6528 : %_6528
 ; {>  %_402~1':_r64 %_403~0':_r64 %_6526~°1◂{  }:(_lst)◂(t2709'(1)) %_6527~2':_stg }
; _cns { { 0' 1' 2' } °1◂{  } } ⊢ °0◂{ { 0' 1' 2' } °1◂{  } }
; _f5064 %_6528 ⊢ %_6529 : %_6529
 ; {>  %_6528~°0◂{ { 0' 1' 2' } °1◂{  } }:(_lst)◂({ _r64 _r64 _stg }) }
; _f5064 °0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _some %_6529 ⊢ %_6530 : %_6530
 ; {>  %_6529~°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_p5062)◂(t2715'(1)) }
; _some °1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; ∎ %_6530
 ; {>  %_6530~°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_opn)◂((_p5062)◂(t2718'(1))) }
; 	∎ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_6961
	btr r12,5
	jmp LB_6962
LB_6961:
	bts r12,5
LB_6962:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_6959
	btr QWORD [rdi],0
	jmp LB_6960
LB_6959:
	bts QWORD [rdi],0
LB_6960:
	mov r11,r14
	bt r12,1
	jc LB_6965
	btr r12,5
	jmp LB_6966
LB_6965:
	bts r12,5
LB_6966:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_6963
	btr QWORD [rdi],1
	jmp LB_6964
LB_6963:
	bts QWORD [rdi],1
LB_6964:
	mov r11,r8
	bt r12,2
	jc LB_6969
	btr r12,5
	jmp LB_6970
LB_6969:
	bts r12,5
LB_6970:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_6967
	btr QWORD [rdi],2
	jmp LB_6968
LB_6967:
	bts QWORD [rdi],2
LB_6968:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_6957
	btr QWORD [rdi],0
	jmp LB_6958
LB_6957:
	bts QWORD [rdi],0
LB_6958:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rsi,1
	bt r12,4
	jc LB_6973
	mov rsi,0
	bt r10,0
	jc LB_6973
	jmp LB_6974
LB_6973:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_6974:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_6971
	btr QWORD [rdi],1
	jmp LB_6972
LB_6971:
	bts QWORD [rdi],1
LB_6972:
	mov rsi,1
	bt r12,3
	jc LB_6955
	mov rsi,0
	bt r9,0
	jc LB_6955
	jmp LB_6956
LB_6955:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6956:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_6953
	mov rsi,0
	bt r9,0
	jc LB_6953
	jmp LB_6954
LB_6953:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6954:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6975:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6977
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6976
LB_6977:
	add rsp,8
	jmp LB_6837
LB_6978:
	add rsp,0
	pop r14
LB_6976:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	jmp LB_6837
LB_6837:
	pop r10
	cmp r8,0
	jz LB_6838
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6993
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6993:
	jmp LB_6986
LB_6838:
	mov rdi,r13
	mov rsi,r14
	mov r14,r9
	bt r12,3
	jc LB_6991
	btr r12,1
	clc
	jmp LB_6992
LB_6991:
	bts r12,1
	stc
LB_6992:
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6989
	btr r12,0
	clc
	jmp LB_6990
LB_6989:
	bts r12,0
	stc
LB_6990:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 119
	push LB_6983
	push LB_6983
; _emt_mov_ptn_to_ptn:{| 110.. |},{ { 0' } 1' } ⊢ { { {  } } 0' }
	mov r8,r13
	bt r12,0
	jc LB_7002
	btr r12,2
	jmp LB_7003
LB_7002:
	bts r12,2
LB_7003:
	mov r13,r14
	bt r12,1
	jc LB_7004
	btr r12,0
	jmp LB_7005
LB_7004:
	bts r12,0
LB_7005:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some %_6531 ⊢ %_6532 : %_6532
 ; {>  %_406~1':_r64 %_405~2':_r64 %_6531~0':(_p5062)◂({ }) }
; _some 0' ⊢ °0◂0'
; ∎ %_6532
 ; {>  %_6532~°0◂0':(_opn)◂((_p5062)◂({ })) %_406~1':_r64 %_405~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_6979
	mov rdi,r14
	call dlt
LB_6979:
	bt r12,2
	jc LB_6980
	mov rdi,r8
	call dlt
LB_6980:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6981
	btr r12,3
	jmp LB_6982
LB_6981:
	bts r12,3
LB_6982:
	mov r8,0
	bts r12,2
	ret
LB_6983:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6985
	pop r14
	jmp LB_6988
LB_6985:
	add rsp,8
	ret
LB_6987:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_6988:
	ret
LB_6986:
	add rsp,16
	pop r14
LB_6984:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\\]"
	jmp LB_7029
LB_7028:
	add r14,1
LB_7029:
	cmp r14,r10
	jge LB_7030
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7028
	cmp al,32
	jz LB_7028
LB_7030:
	add r14,2
	cmp r14,r10
	jg LB_7033
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,92
	jnz LB_7033
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,93
	jnz LB_7033
	jmp LB_7034
LB_7033:
	jmp LB_7013
LB_7034:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_7021
LB_7020:
	add r14,1
LB_7021:
	cmp r14,r10
	jge LB_7022
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7020
	cmp al,32
	jz LB_7020
LB_7022:
	add r14,1
	cmp r14,r10
	jg LB_7026
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_7026
	jmp LB_7027
LB_7026:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7024
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7024:
	jmp LB_7014
LB_7027:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7018
	btr r12,1
	clc
	jmp LB_7019
LB_7018:
	bts r12,1
	stc
LB_7019:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7016
	btr r12,0
	clc
	jmp LB_7017
LB_7016:
	bts r12,0
	stc
LB_7017:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 120
	push LB_7010
	push LB_7010
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _f5063 {  } ⊢ %_6533 : %_6533
 ; {>  %_409~1':_r64 %_410~0':_r64 }
; _f5063 {  } ⊢ °0◂{  }
; _some %_6533 ⊢ %_6534 : %_6534
 ; {>  %_409~1':_r64 %_6533~°0◂{  }:(_p5062)◂({ }) %_410~0':_r64 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_6534
 ; {>  %_6534~°0◂°0◂{  }:(_opn)◂((_p5062)◂({ })) %_409~1':_r64 %_410~0':_r64 }
; 	∎ °0◂°0◂{  }
	bt r12,1
	jc LB_7006
	mov rdi,r14
	call dlt
LB_7006:
	bt r12,0
	jc LB_7007
	mov rdi,r13
	call dlt
LB_7007:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_7008
	mov rsi,0
	bt r9,0
	jc LB_7008
	jmp LB_7009
LB_7008:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7009:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7010:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7012
	pop r14
	jmp LB_7015
LB_7012:
	add rsp,8
	ret
LB_7014:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_7015:
	ret
LB_7013:
	add rsp,32
	pop r14
LB_7011:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line_res
	jmp LB_7048
LB_7047:
	add r14,1
LB_7048:
	cmp r14,r10
	jge LB_7049
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7047
	cmp al,32
	jz LB_7047
LB_7049:
	push r10
	call NS_E_6473_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7050
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7042
LB_7050:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt_in
	jmp LB_7053
LB_7052:
	add r14,1
LB_7053:
	cmp r14,r10
	jge LB_7054
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7052
	cmp al,32
	jz LB_7052
LB_7054:
	push r10
	call NS_E_6472_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7055
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7056
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7056:
	jmp LB_7042
LB_7055:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7045
	btr r12,1
	clc
	jmp LB_7046
LB_7045:
	bts r12,1
	stc
LB_7046:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7043
	btr r12,0
	clc
	jmp LB_7044
LB_7043:
	bts r12,0
	stc
LB_7044:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 121
	push LB_7039
	push LB_7039
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_7058
	btr r12,2
	jmp LB_7059
LB_7058:
	bts r12,2
LB_7059:
	mov r13,r14
	bt r12,1
	jc LB_7060
	btr r12,0
	jmp LB_7061
LB_7060:
	bts r12,0
LB_7061:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some %_6536 ⊢ %_6537 : %_6537
 ; {>  %_413~2':_r64 %_414~1':_r64 %_6536~0':(_p5062)◂({ }) %_6535~{  }:{ } }
; _some 0' ⊢ °0◂0'
; ∎ %_6537
 ; {>  %_6537~°0◂0':(_opn)◂((_p5062)◂({ })) %_413~2':_r64 %_414~1':_r64 %_6535~{  }:{ } }
; 	∎ °0◂0'
	bt r12,2
	jc LB_7035
	mov rdi,r8
	call dlt
LB_7035:
	bt r12,1
	jc LB_7036
	mov rdi,r14
	call dlt
LB_7036:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7037
	btr r12,3
	jmp LB_7038
LB_7037:
	bts r12,3
LB_7038:
	mov r8,0
	bts r12,2
	ret
LB_7039:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7041
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7040
LB_7041:
	add rsp,8
	ret
LB_7042:
	add rsp,32
	pop r14
LB_7040:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 122
	push LB_7084
	push LB_7084
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_6538 : %_6538
 ; {>  %_417~1':_r64 %_418~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; 	» "blk_cmt 1" _ ⊢ 2' : %_6539
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_74_6d_63_5f_6b_6c_62
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_31
	mov QWORD [rdi+8*1+8*1],rax
	mov r8,rdi
	btr r12,2
; _cns { { %_418 %_417 %_6539 } %_6538 } ⊢ %_6540 : %_6540
 ; {>  %_6538~°1◂{  }:(_lst)◂(t2733'(0)) %_6539~2':_stg %_417~1':_r64 %_418~0':_r64 }
; _cns { { 0' 1' 2' } °1◂{  } } ⊢ °0◂{ { 0' 1' 2' } °1◂{  } }
; _f5064 %_6540 ⊢ %_6541 : %_6541
 ; {>  %_6540~°0◂{ { 0' 1' 2' } °1◂{  } }:(_lst)◂({ _r64 _r64 _stg }) }
; _f5064 °0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _some %_6541 ⊢ %_6542 : %_6542
 ; {>  %_6541~°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_p5062)◂(t2739'(0)) }
; _some °1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; ∎ %_6542
 ; {>  %_6542~°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_opn)◂((_p5062)◂(t2742'(0))) }
; 	∎ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_7070
	btr r12,5
	jmp LB_7071
LB_7070:
	bts r12,5
LB_7071:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_7068
	btr QWORD [rdi],0
	jmp LB_7069
LB_7068:
	bts QWORD [rdi],0
LB_7069:
	mov r11,r14
	bt r12,1
	jc LB_7074
	btr r12,5
	jmp LB_7075
LB_7074:
	bts r12,5
LB_7075:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_7072
	btr QWORD [rdi],1
	jmp LB_7073
LB_7072:
	bts QWORD [rdi],1
LB_7073:
	mov r11,r8
	bt r12,2
	jc LB_7078
	btr r12,5
	jmp LB_7079
LB_7078:
	bts r12,5
LB_7079:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_7076
	btr QWORD [rdi],2
	jmp LB_7077
LB_7076:
	bts QWORD [rdi],2
LB_7077:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_7066
	btr QWORD [rdi],0
	jmp LB_7067
LB_7066:
	bts QWORD [rdi],0
LB_7067:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rsi,1
	bt r12,4
	jc LB_7082
	mov rsi,0
	bt r10,0
	jc LB_7082
	jmp LB_7083
LB_7082:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_7083:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_7080
	btr QWORD [rdi],1
	jmp LB_7081
LB_7080:
	bts QWORD [rdi],1
LB_7081:
	mov rsi,1
	bt r12,3
	jc LB_7064
	mov rsi,0
	bt r9,0
	jc LB_7064
	jmp LB_7065
LB_7064:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7065:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_7062
	mov rsi,0
	bt r9,0
	jc LB_7062
	jmp LB_7063
LB_7062:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7063:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7084:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7086
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7085
LB_7086:
	add rsp,8
	ret
LB_7087:
	add rsp,0
	pop r14
LB_7085:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6473:
NS_E_RDI_6473:
NS_E_6473_ETR_TBL:
NS_E_6473_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	jmp LB_7097
LB_7096:
	add r14,1
LB_7097:
	cmp r14,r10
	jge LB_7098
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7096
	cmp al,32
	jz LB_7096
LB_7098:
	add r14,1
	cmp r14,r10
	jg LB_7101
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_7101
	jmp LB_7102
LB_7101:
	jmp LB_7093
LB_7102:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7094
	btr r12,0
	clc
	jmp LB_7095
LB_7094:
	bts r12,0
	stc
LB_7095:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 123
	push LB_7090
	push LB_7090
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some {  } ⊢ %_6543 : %_6543
 ; {>  %_421~1':_r64 %_422~0':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_6543
 ; {>  %_6543~°0◂{  }:(_opn)◂({ }) %_421~1':_r64 %_422~0':_r64 }
; 	∎ °0◂{  }
	bt r12,1
	jc LB_7088
	mov rdi,r14
	call dlt
LB_7088:
	bt r12,0
	jc LB_7089
	mov rdi,r13
	call dlt
LB_7089:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,0
	bts r12,2
	ret
LB_7090:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7092
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7091
LB_7092:
	add rsp,8
	ret
LB_7093:
	add rsp,16
	pop r14
LB_7091:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	jmp LB_7115
LB_7114:
	add r14,1
LB_7115:
	cmp r14,r10
	jge LB_7116
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7114
	cmp al,32
	jz LB_7114
LB_7116:
	push r10
	call NS_E_904_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7117
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7109
LB_7117:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line_res
	jmp LB_7120
LB_7119:
	add r14,1
LB_7120:
	cmp r14,r10
	jge LB_7121
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7119
	cmp al,32
	jz LB_7119
LB_7121:
	push r10
	call NS_E_6473_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7122
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7123
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7123:
	jmp LB_7109
LB_7122:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7112
	btr r12,1
	clc
	jmp LB_7113
LB_7112:
	bts r12,1
	stc
LB_7113:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7110
	btr r12,0
	clc
	jmp LB_7111
LB_7110:
	bts r12,0
	stc
LB_7111:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 124
	push LB_7106
	push LB_7106
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some {  } ⊢ %_6546 : %_6546
 ; {>  %_426~1':_r64 %_6544~0':_r64 %_425~2':_r64 %_6545~{  }:{ } }
; _some {  } ⊢ °0◂{  }
; ∎ %_6546
 ; {>  %_426~1':_r64 %_6544~0':_r64 %_425~2':_r64 %_6546~°0◂{  }:(_opn)◂({ }) %_6545~{  }:{ } }
; 	∎ °0◂{  }
	bt r12,1
	jc LB_7103
	mov rdi,r14
	call dlt
LB_7103:
	bt r12,0
	jc LB_7104
	mov rdi,r13
	call dlt
LB_7104:
	bt r12,2
	jc LB_7105
	mov rdi,r8
	call dlt
LB_7105:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,0
	bts r12,2
	ret
LB_7106:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7108
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7107
LB_7108:
	add rsp,8
	ret
LB_7109:
	add rsp,32
	pop r14
LB_7107:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 125
	push LB_7127
	push LB_7127
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some {  } ⊢ %_6547 : %_6547
 ; {>  %_430~0':_r64 %_429~1':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_6547
 ; {>  %_430~0':_r64 %_6547~°0◂{  }:(_opn)◂({ }) %_429~1':_r64 }
; 	∎ °0◂{  }
	bt r12,0
	jc LB_7125
	mov rdi,r13
	call dlt
LB_7125:
	bt r12,1
	jc LB_7126
	mov rdi,r14
	call dlt
LB_7126:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,0
	bts r12,2
	ret
LB_7127:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7129
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7128
LB_7129:
	add rsp,8
	ret
LB_7130:
	add rsp,0
	pop r14
LB_7128:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7131:
NS_E_RDI_7131:
NS_E_7131_ETR_TBL:
NS_E_7131_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; nls
	jmp LB_7756
LB_7755:
	add r14,1
LB_7756:
	cmp r14,r10
	jge LB_7757
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7755
	cmp al,10
	jz LB_7755
	cmp al,32
	jz LB_7755
LB_7757:
	push r10
	call NS_E_6471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7758
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7748
LB_7758:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; glb_etr
	jmp LB_7761
LB_7760:
	add r14,1
LB_7761:
	cmp r14,r10
	jge LB_7762
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7760
	cmp al,10
	jz LB_7760
	cmp al,32
	jz LB_7760
LB_7762:
	push r10
	call NS_E_7132_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7763
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7764
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7764:
	jmp LB_7748
LB_7763:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; file
	jmp LB_7767
LB_7766:
	add r14,1
LB_7767:
	cmp r14,r10
	jge LB_7768
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7766
	cmp al,10
	jz LB_7766
	cmp al,32
	jz LB_7766
LB_7768:
	push r10
	call NS_E_7131_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7769
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7770
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7770:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7771
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7771:
	jmp LB_7748
LB_7769:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7753
	btr r12,2
	clc
	jmp LB_7754
LB_7753:
	bts r12,2
	stc
LB_7754:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7751
	btr r12,1
	clc
	jmp LB_7752
LB_7751:
	bts r12,1
	stc
LB_7752:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7749
	btr r12,0
	clc
	jmp LB_7750
LB_7749:
	bts r12,0
	stc
LB_7750:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 126
	push LB_7745
	push LB_7745
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
	mov rax,QWORD [rsp+8]
	mov r10,rax
	mov rax,QWORD [rsp+8*3]
	mov r9,rax
	bts r12,3
	bts r12,4
MTC_LB_7643:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_7644
; _emt_mov_ptn_to_ptn:{| 111110.. |},2' ⊢ °0◂5'
; 2' ⊢ °0◂5'
	btr r12,6
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_7645
	bt QWORD [rdi],0
	jc LB_7646
	btr r12,6
	clc
	jmp LB_7647
LB_7646:
	bts r12,6
	stc
LB_7647:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_7645:
	mov rcx,rdi
	mov r11,rcx
	bt r12,6
	jc LB_7648
	btr r12,5
	jmp LB_7649
LB_7648:
	bts r12,5
LB_7649:
LB_7650:
	cmp r15,0
	jz LB_7651
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_7650
LB_7651:
MTC_LB_7652:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_7653
; _emt_mov_ptn_to_ptn:{| 1101110.. |},1' ⊢ °0◂2'
; 1' ⊢ °0◂2'
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_7654
	bt QWORD [rdi],0
	jc LB_7655
	btr r12,6
	clc
	jmp LB_7656
LB_7655:
	bts r12,6
	stc
LB_7656:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_7654:
	mov rcx,rdi
	mov r8,rcx
	bt r12,6
	jc LB_7657
	btr r12,2
	jmp LB_7658
LB_7657:
	bts r12,2
LB_7658:
LB_7659:
	cmp r15,0
	jz LB_7660
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_7659
LB_7660:
; _cns { %_7180 %_7179 } ⊢ %_7181 : %_7181
 ; {>  %_7179~5':(_lst)◂(_p1976) %_434~3':_r64 %_7180~2':_p1976 %_433~4':_r64 %_7176~0':(_p5062)◂({ }) }
; _cns { 2' 5' } ⊢ °0◂{ 2' 5' }
; _f5063 %_7181 ⊢ %_7182 : %_7182
 ; {>  %_434~3':_r64 %_7181~°0◂{ 2' 5' }:(_lst)◂(_p1976) %_433~4':_r64 %_7176~0':(_p5062)◂({ }) }
; _f5063 °0◂{ 2' 5' } ⊢ °0◂°0◂{ 2' 5' }
; _some %_7182 ⊢ %_7183 : %_7183
 ; {>  %_7182~°0◂°0◂{ 2' 5' }:(_p5062)◂((_lst)◂(_p1976)) %_434~3':_r64 %_433~4':_r64 %_7176~0':(_p5062)◂({ }) }
; _some °0◂°0◂{ 2' 5' } ⊢ °0◂°0◂°0◂{ 2' 5' }
; ∎ %_7183
 ; {>  %_434~3':_r64 %_7183~°0◂°0◂°0◂{ 2' 5' }:(_opn)◂((_p5062)◂((_lst)◂(_p1976))) %_433~4':_r64 %_7176~0':(_p5062)◂({ }) }
; 	∎ °0◂°0◂°0◂{ 2' 5' }
	bt r12,3
	jc LB_7661
	mov rdi,r9
	call dlt
LB_7661:
	bt r12,4
	jc LB_7662
	mov rdi,r10
	call dlt
LB_7662:
	bt r12,0
	jc LB_7663
	mov rdi,r13
	call dlt
LB_7663:
; _emt_mov_ptn_to_ptn:{| 0010010.. |},°0◂°0◂°0◂{ 2' 5' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r8
	bt r12,2
	jc LB_7670
	btr r12,0
	jmp LB_7671
LB_7670:
	bts r12,0
LB_7671:
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_7668
	btr QWORD [rdi],0
	jmp LB_7669
LB_7668:
	bts QWORD [rdi],0
LB_7669:
	mov r13,r11
	bt r12,5
	jc LB_7674
	btr r12,0
	jmp LB_7675
LB_7674:
	bts r12,0
LB_7675:
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_7672
	btr QWORD [rdi],1
	jmp LB_7673
LB_7672:
	bts QWORD [rdi],1
LB_7673:
	mov rsi,1
	bt r12,3
	jc LB_7666
	mov rsi,0
	bt r9,0
	jc LB_7666
	jmp LB_7667
LB_7666:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7667:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_7664
	mov rsi,0
	bt r9,0
	jc LB_7664
	jmp LB_7665
LB_7664:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7665:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_7653:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_7676
; _emt_mov_ptn_to_ptn:{| 1101110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_7677
	bt QWORD [rdi],0
	jc LB_7678
	btr r12,6
	clc
	jmp LB_7679
LB_7678:
	bts r12,6
	stc
LB_7679:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_7677:
	mov rcx,rdi
	mov r8,rcx
	bt r12,6
	jc LB_7680
	btr r12,2
	jmp LB_7681
LB_7680:
	bts r12,2
LB_7681:
LB_7682:
	cmp r15,0
	jz LB_7683
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_7682
LB_7683:
; _f5064 %_7184 ⊢ %_7185 : %_7185
 ; {>  %_7179~5':(_lst)◂(_p1976) %_434~3':_r64 %_433~4':_r64 %_7184~2':(_lst)◂({ _r64 _r64 _stg }) %_7176~0':(_p5062)◂({ }) }
; _f5064 2' ⊢ °1◂2'
; _some %_7185 ⊢ %_7186 : %_7186
 ; {>  %_7179~5':(_lst)◂(_p1976) %_434~3':_r64 %_7185~°1◂2':(_p5062)◂(t2968'(0)) %_433~4':_r64 %_7176~0':(_p5062)◂({ }) }
; _some °1◂2' ⊢ °0◂°1◂2'
; ∎ %_7186
 ; {>  %_7179~5':(_lst)◂(_p1976) %_434~3':_r64 %_7186~°0◂°1◂2':(_opn)◂((_p5062)◂(t2971'(0))) %_433~4':_r64 %_7176~0':(_p5062)◂({ }) }
; 	∎ °0◂°1◂2'
	bt r12,5
	jc LB_7684
	mov rdi,r11
	call dlt
LB_7684:
	bt r12,3
	jc LB_7685
	mov rdi,r9
	call dlt
LB_7685:
	bt r12,4
	jc LB_7686
	mov rdi,r10
	call dlt
LB_7686:
	bt r12,0
	jc LB_7687
	mov rdi,r13
	call dlt
LB_7687:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂°1◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_7690
	btr r12,3
	jmp LB_7691
LB_7690:
	bts r12,3
LB_7691:
	mov rsi,1
	bt r12,3
	jc LB_7688
	mov rsi,0
	bt r9,0
	jc LB_7688
	jmp LB_7689
LB_7688:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7689:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_7676:
MTC_LB_7644:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_7692
; _emt_mov_ptn_to_ptn:{| 111110.. |},2' ⊢ °1◂5'
; 2' ⊢ °1◂5'
	btr r12,6
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_7693
	bt QWORD [rdi],0
	jc LB_7694
	btr r12,6
	clc
	jmp LB_7695
LB_7694:
	bts r12,6
	stc
LB_7695:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_7693:
	mov rcx,rdi
	mov r11,rcx
	bt r12,6
	jc LB_7696
	btr r12,5
	jmp LB_7697
LB_7696:
	bts r12,5
LB_7697:
LB_7698:
	cmp r15,0
	jz LB_7699
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_7698
LB_7699:
MTC_LB_7700:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_7701
; _emt_mov_ptn_to_ptn:{| 1101110.. |},1' ⊢ °0◂2'
; 1' ⊢ °0◂2'
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_7702
	bt QWORD [rdi],0
	jc LB_7703
	btr r12,6
	clc
	jmp LB_7704
LB_7703:
	bts r12,6
	stc
LB_7704:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_7702:
	mov rcx,rdi
	mov r8,rcx
	bt r12,6
	jc LB_7705
	btr r12,2
	jmp LB_7706
LB_7705:
	bts r12,2
LB_7706:
LB_7707:
	cmp r15,0
	jz LB_7708
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_7707
LB_7708:
; _f5064 %_7187 ⊢ %_7189 : %_7189
 ; {>  %_7188~2':_p1976 %_434~3':_r64 %_7187~5':(_lst)◂({ _r64 _r64 _stg }) %_433~4':_r64 %_7176~0':(_p5062)◂({ }) }
; _f5064 5' ⊢ °1◂5'
; _some %_7189 ⊢ %_7190 : %_7190
 ; {>  %_7188~2':_p1976 %_434~3':_r64 %_7189~°1◂5':(_p5062)◂(t2982'(0)) %_433~4':_r64 %_7176~0':(_p5062)◂({ }) }
; _some °1◂5' ⊢ °0◂°1◂5'
; ∎ %_7190
 ; {>  %_7188~2':_p1976 %_434~3':_r64 %_7190~°0◂°1◂5':(_opn)◂((_p5062)◂(t2985'(0))) %_433~4':_r64 %_7176~0':(_p5062)◂({ }) }
; 	∎ °0◂°1◂5'
	bt r12,2
	jc LB_7709
	mov rdi,r8
	call dlt
LB_7709:
	bt r12,3
	jc LB_7710
	mov rdi,r9
	call dlt
LB_7710:
	bt r12,4
	jc LB_7711
	mov rdi,r10
	call dlt
LB_7711:
	bt r12,0
	jc LB_7712
	mov rdi,r13
	call dlt
LB_7712:
; _emt_mov_ptn_to_ptn:{| 0000010.. |},°0◂°1◂5' ⊢ 2'◂3'
	mov r9,r11
	bt r12,5
	jc LB_7715
	btr r12,3
	jmp LB_7716
LB_7715:
	bts r12,3
LB_7716:
	mov rsi,1
	bt r12,3
	jc LB_7713
	mov rsi,0
	bt r9,0
	jc LB_7713
	jmp LB_7714
LB_7713:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7714:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_7701:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_7717
; _emt_mov_ptn_to_ptn:{| 1101110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_7718
	bt QWORD [rdi],0
	jc LB_7719
	btr r12,6
	clc
	jmp LB_7720
LB_7719:
	bts r12,6
	stc
LB_7720:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_7718:
	mov rcx,rdi
	mov r8,rcx
	bt r12,6
	jc LB_7721
	btr r12,2
	jmp LB_7722
LB_7721:
	bts r12,2
LB_7722:
LB_7723:
	cmp r15,0
	jz LB_7724
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_7723
LB_7724:
; _f981 { %_7191 %_7187 } ⊢ %_7192 : %_7192
 ; {>  %_434~3':_r64 %_7187~5':(_lst)◂({ _r64 _r64 _stg }) %_7191~2':(_lst)◂({ _r64 _r64 _stg }) %_433~4':_r64 %_7176~0':(_p5062)◂({ }) }
; _f981 { 2' 5' } ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010010.. |},{ 2' 5' } ⊢ { 0' 1' }
	mov r13,r8
	bt r12,2
	jc LB_7731
	btr r12,0
	jmp LB_7732
LB_7731:
	bts r12,0
LB_7732:
	mov r14,r11
	bt r12,5
	jc LB_7733
	btr r12,1
	jmp LB_7734
LB_7733:
	bts r12,1
LB_7734:
	push 2
	push LB_7737
	call NS_E_981
LB_7737:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_7735
	btr r12,1
	jmp LB_7736
LB_7735:
	bts r12,1
LB_7736:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_7729
	btr r12,4
	clc
	jmp LB_7730
LB_7729:
	bts r12,4
	stc
LB_7730:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_7727
	btr r12,3
	clc
	jmp LB_7728
LB_7727:
	bts r12,3
	stc
LB_7728:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_7725
	btr r12,0
	clc
	jmp LB_7726
LB_7725:
	bts r12,0
	stc
LB_7726:
	add rsp,32
; _f5064 %_7192 ⊢ %_7193 : %_7193
 ; {>  %_434~3':_r64 %_7192~1':(_lst)◂({ _r64 _r64 _stg }) %_433~4':_r64 %_7176~0':(_p5062)◂({ }) }
; _f5064 1' ⊢ °1◂1'
; _some %_7193 ⊢ %_7194 : %_7194
 ; {>  %_434~3':_r64 %_7193~°1◂1':(_p5062)◂(t2990'(0)) %_433~4':_r64 %_7176~0':(_p5062)◂({ }) }
; _some °1◂1' ⊢ °0◂°1◂1'
; ∎ %_7194
 ; {>  %_434~3':_r64 %_433~4':_r64 %_7194~°0◂°1◂1':(_opn)◂((_p5062)◂(t2993'(0))) %_7176~0':(_p5062)◂({ }) }
; 	∎ °0◂°1◂1'
	bt r12,3
	jc LB_7738
	mov rdi,r9
	call dlt
LB_7738:
	bt r12,4
	jc LB_7739
	mov rdi,r10
	call dlt
LB_7739:
	bt r12,0
	jc LB_7740
	mov rdi,r13
	call dlt
LB_7740:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂°1◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_7743
	btr r12,3
	jmp LB_7744
LB_7743:
	bts r12,3
LB_7744:
	mov rsi,1
	bt r12,3
	jc LB_7741
	mov rsi,0
	bt r9,0
	jc LB_7741
	jmp LB_7742
LB_7741:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7742:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_7717:
MTC_LB_7692:
LB_7745:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7747
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7746
LB_7747:
	add rsp,8
	ret
LB_7748:
	add rsp,48
	pop r14
LB_7746:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; nls
	jmp LB_7787
LB_7786:
	add r14,1
LB_7787:
	cmp r14,r10
	jge LB_7788
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7786
	cmp al,10
	jz LB_7786
	cmp al,32
	jz LB_7786
LB_7788:
	push r10
	call NS_E_6471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7789
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7783
LB_7789:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7784
	btr r12,0
	clc
	jmp LB_7785
LB_7784:
	bts r12,0
	stc
LB_7785:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 127
	push LB_7780
	push LB_7780
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_7196 : %_7196
 ; {>  %_437~2':_r64 %_438~1':_r64 %_7195~0':(_p5062)◂({ }) }
; _nil {  } ⊢ °1◂{  }
; _f5063 %_7196 ⊢ %_7197 : %_7197
 ; {>  %_437~2':_r64 %_7196~°1◂{  }:(_lst)◂(t3002'(0)) %_438~1':_r64 %_7195~0':(_p5062)◂({ }) }
; _f5063 °1◂{  } ⊢ °0◂°1◂{  }
; _some %_7197 ⊢ %_7198 : %_7198
 ; {>  %_437~2':_r64 %_7197~°0◂°1◂{  }:(_p5062)◂((_lst)◂(t3005'(0))) %_438~1':_r64 %_7195~0':(_p5062)◂({ }) }
; _some °0◂°1◂{  } ⊢ °0◂°0◂°1◂{  }
; ∎ %_7198
 ; {>  %_437~2':_r64 %_7198~°0◂°0◂°1◂{  }:(_opn)◂((_p5062)◂((_lst)◂(t3008'(0)))) %_438~1':_r64 %_7195~0':(_p5062)◂({ }) }
; 	∎ °0◂°0◂°1◂{  }
	bt r12,2
	jc LB_7773
	mov rdi,r8
	call dlt
LB_7773:
	bt r12,1
	jc LB_7774
	mov rdi,r14
	call dlt
LB_7774:
	bt r12,0
	jc LB_7775
	mov rdi,r13
	call dlt
LB_7775:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_7778
	mov rsi,0
	bt r9,0
	jc LB_7778
	jmp LB_7779
LB_7778:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7779:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_7776
	mov rsi,0
	bt r9,0
	jc LB_7776
	jmp LB_7777
LB_7776:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7777:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7780:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7782
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7781
LB_7782:
	add rsp,8
	ret
LB_7783:
	add rsp,16
	pop r14
LB_7781:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7132:
NS_E_RDI_7132:
NS_E_7132_ETR_TBL:
NS_E_7132_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\194\167\194\167+s8"
	jmp LB_7909
LB_7908:
	add r14,1
LB_7909:
	cmp r14,r10
	jge LB_7910
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7908
	cmp al,10
	jz LB_7908
	cmp al,32
	jz LB_7908
LB_7910:
	add r14,7
	cmp r14,r10
	jg LB_7913
	movzx rax,BYTE [r13+r14+8*1+0-7]
	cmp al,194
	jnz LB_7913
	movzx rax,BYTE [r13+r14+8*1+1-7]
	cmp al,167
	jnz LB_7913
	movzx rax,BYTE [r13+r14+8*1+2-7]
	cmp al,194
	jnz LB_7913
	movzx rax,BYTE [r13+r14+8*1+3-7]
	cmp al,167
	jnz LB_7913
	movzx rax,BYTE [r13+r14+8*1+4-7]
	cmp al,43
	jnz LB_7913
	movzx rax,BYTE [r13+r14+8*1+5-7]
	cmp al,115
	jnz LB_7913
	movzx rax,BYTE [r13+r14+8*1+6-7]
	cmp al,56
	jnz LB_7913
	jmp LB_7914
LB_7913:
	jmp LB_7899
LB_7914:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	push r10
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_etr
	jmp LB_7837
LB_7836:
	add r14,1
LB_7837:
	cmp r14,r10
	jge LB_7838
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7836
	cmp al,10
	jz LB_7836
	cmp al,32
	jz LB_7836
LB_7838:
	push r10
	call NS_E_7163_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7839
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7831
LB_7839:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ grm_etr ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_7845:
	jmp LB_7842
LB_7841:
	add r14,1
LB_7842:
	cmp r14,r10
	jge LB_7843
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7841
	cmp al,10
	jz LB_7841
	cmp al,32
	jz LB_7841
LB_7843:
	push r10
	push rsi
	call NS_E_7163_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_7844
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_7846
	bts QWORD [rax],0
LB_7846:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_7845
LB_7844:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7834
	btr r12,1
	clc
	jmp LB_7835
LB_7834:
	bts r12,1
	stc
LB_7835:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7832
	btr r12,0
	clc
	jmp LB_7833
LB_7832:
	bts r12,0
	stc
LB_7833:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 128
	push LB_7828
	push LB_7828
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { { 0' 1' } 2' }
	mov r8,r14
	bt r12,1
	jc LB_7847
	btr r12,2
	jmp LB_7848
LB_7847:
	bts r12,2
LB_7848:
	mov r9,r13
	bt r12,0
	jc LB_7849
	btr r12,3
	jmp LB_7850
LB_7849:
	bts r12,3
LB_7850:
; 3' ⊢ { 0' 1' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_7853
	btr r12,4
	clc
	jmp LB_7854
LB_7853:
	bts r12,4
	stc
LB_7854:
	mov r13,r10
	bt r12,4
	jc LB_7851
	btr r12,0
	jmp LB_7852
LB_7851:
	bts r12,0
LB_7852:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_7857
	btr r12,4
	clc
	jmp LB_7858
LB_7857:
	bts r12,4
	stc
LB_7858:
	mov r14,r10
	bt r12,4
	jc LB_7855
	btr r12,1
	jmp LB_7856
LB_7855:
	bts r12,1
LB_7856:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r10,rax
	mov rax,QWORD [rsp+8*3]
	mov r9,rax
	bts r12,3
	bts r12,4
; _f975 %_7200 ⊢ %_7201 : %_7201
 ; {>  %_7199~{ 0' 1' }:{ _stg _p1980 } %_442~3':_r64 %_441~4':_r64 %_7200~2':(_lst)◂({ _stg _p1980 }) }
; _f975 2' ⊢ 2'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_7801
	btr r12,0
	jmp LB_7802
LB_7801:
	bts r12,0
LB_7802:
	push 1
	push LB_7805
	call NS_E_975
LB_7805:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_7803
	btr r12,2
	jmp LB_7804
LB_7803:
	bts r12,2
LB_7804:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_7799
	btr r12,4
	clc
	jmp LB_7800
LB_7799:
	bts r12,4
	stc
LB_7800:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_7797
	btr r12,3
	clc
	jmp LB_7798
LB_7797:
	bts r12,3
	stc
LB_7798:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_7795
	btr r12,1
	clc
	jmp LB_7796
LB_7795:
	bts r12,1
	stc
LB_7796:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_7793
	btr r12,0
	clc
	jmp LB_7794
LB_7793:
	bts r12,0
	stc
LB_7794:
	add rsp,40
; _cns { %_7199 %_7201 } ⊢ %_7202 : %_7202
 ; {>  %_7199~{ 0' 1' }:{ _stg _p1980 } %_442~3':_r64 %_441~4':_r64 %_7201~2':(_lst)◂({ _stg _p1980 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f1990 %_7202 ⊢ %_7203 : %_7203
 ; {>  %_442~3':_r64 %_441~4':_r64 %_7202~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p1980 }) }
; _f1990 °0◂{ { 0' 1' } 2' } ⊢ °1◂°0◂{ { 0' 1' } 2' }
; _f5063 %_7203 ⊢ %_7204 : %_7204
 ; {>  %_442~3':_r64 %_441~4':_r64 %_7203~°1◂°0◂{ { 0' 1' } 2' }:_p1976 }
; _f5063 °1◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°1◂°0◂{ { 0' 1' } 2' }
; _some %_7204 ⊢ %_7205 : %_7205
 ; {>  %_7204~°0◂°1◂°0◂{ { 0' 1' } 2' }:(_p5062)◂(_p1976) %_442~3':_r64 %_441~4':_r64 }
; _some °0◂°1◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂°1◂°0◂{ { 0' 1' } 2' }
; ∎ %_7205
 ; {>  %_7205~°0◂°0◂°1◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_p5062)◂(_p1976)) %_442~3':_r64 %_441~4':_r64 }
; 	∎ °0◂°0◂°1◂°0◂{ { 0' 1' } 2' }
	bt r12,3
	jc LB_7806
	mov rdi,r9
	call dlt
LB_7806:
	bt r12,4
	jc LB_7807
	mov rdi,r10
	call dlt
LB_7807:
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂°1◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_7818
	btr r12,5
	jmp LB_7819
LB_7818:
	bts r12,5
LB_7819:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_7816
	btr QWORD [rdi],0
	jmp LB_7817
LB_7816:
	bts QWORD [rdi],0
LB_7817:
	mov r11,r14
	bt r12,1
	jc LB_7822
	btr r12,5
	jmp LB_7823
LB_7822:
	bts r12,5
LB_7823:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_7820
	btr QWORD [rdi],1
	jmp LB_7821
LB_7820:
	bts QWORD [rdi],1
LB_7821:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_7814
	btr QWORD [rdi],0
	jmp LB_7815
LB_7814:
	bts QWORD [rdi],0
LB_7815:
	mov r10,r8
	bt r12,2
	jc LB_7826
	btr r12,4
	jmp LB_7827
LB_7826:
	bts r12,4
LB_7827:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_7824
	btr QWORD [rdi],1
	jmp LB_7825
LB_7824:
	bts QWORD [rdi],1
LB_7825:
	mov rsi,1
	bt r12,3
	jc LB_7812
	mov rsi,0
	bt r9,0
	jc LB_7812
	jmp LB_7813
LB_7812:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7813:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_7810
	mov rsi,0
	bt r9,0
	jc LB_7810
	jmp LB_7811
LB_7810:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7811:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_7808
	mov rsi,0
	bt r9,0
	jc LB_7808
	jmp LB_7809
LB_7808:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7809:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7828:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7830
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7829
LB_7830:
	add rsp,8
	jmp LB_7791
LB_7831:
	add rsp,32
	pop r14
LB_7829:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; glb_etr_res
	jmp LB_7888
LB_7887:
	add r14,1
LB_7888:
	cmp r14,r10
	jge LB_7889
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7887
	cmp al,10
	jz LB_7887
	cmp al,32
	jz LB_7887
LB_7889:
	push r10
	call NS_E_7133_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7890
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7884
LB_7890:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7885
	btr r12,0
	clc
	jmp LB_7886
LB_7885:
	bts r12,0
	stc
LB_7886:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 129
	push LB_7881
	push LB_7881
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_7207 : %_7207
 ; {>  %_7206~{  }:{ } %_446~0':_r64 %_445~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; 	» "grb_etr 1" _ ⊢ 2' : %_7208
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_62_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_31
	mov QWORD [rdi+8*1+8*1],rax
	mov r8,rdi
	btr r12,2
; _cns { { %_446 %_445 %_7208 } %_7207 } ⊢ %_7209 : %_7209
 ; {>  %_7207~°1◂{  }:(_lst)◂(t3025'(1)) %_7206~{  }:{ } %_7208~2':_stg %_446~0':_r64 %_445~1':_r64 }
; _cns { { 0' 1' 2' } °1◂{  } } ⊢ °0◂{ { 0' 1' 2' } °1◂{  } }
; _f5064 %_7209 ⊢ %_7210 : %_7210
 ; {>  %_7206~{  }:{ } %_7209~°0◂{ { 0' 1' 2' } °1◂{  } }:(_lst)◂({ _r64 _r64 _stg }) }
; _f5064 °0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _some %_7210 ⊢ %_7211 : %_7211
 ; {>  %_7206~{  }:{ } %_7210~°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_p5062)◂(t3031'(1)) }
; _some °1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; ∎ %_7211
 ; {>  %_7211~°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_opn)◂((_p5062)◂(t3034'(1))) %_7206~{  }:{ } }
; 	∎ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_7867
	btr r12,5
	jmp LB_7868
LB_7867:
	bts r12,5
LB_7868:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_7865
	btr QWORD [rdi],0
	jmp LB_7866
LB_7865:
	bts QWORD [rdi],0
LB_7866:
	mov r11,r14
	bt r12,1
	jc LB_7871
	btr r12,5
	jmp LB_7872
LB_7871:
	bts r12,5
LB_7872:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_7869
	btr QWORD [rdi],1
	jmp LB_7870
LB_7869:
	bts QWORD [rdi],1
LB_7870:
	mov r11,r8
	bt r12,2
	jc LB_7875
	btr r12,5
	jmp LB_7876
LB_7875:
	bts r12,5
LB_7876:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_7873
	btr QWORD [rdi],2
	jmp LB_7874
LB_7873:
	bts QWORD [rdi],2
LB_7874:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_7863
	btr QWORD [rdi],0
	jmp LB_7864
LB_7863:
	bts QWORD [rdi],0
LB_7864:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rsi,1
	bt r12,4
	jc LB_7879
	mov rsi,0
	bt r10,0
	jc LB_7879
	jmp LB_7880
LB_7879:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_7880:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_7877
	btr QWORD [rdi],1
	jmp LB_7878
LB_7877:
	bts QWORD [rdi],1
LB_7878:
	mov rsi,1
	bt r12,3
	jc LB_7861
	mov rsi,0
	bt r9,0
	jc LB_7861
	jmp LB_7862
LB_7861:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7862:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_7859
	mov rsi,0
	bt r9,0
	jc LB_7859
	jmp LB_7860
LB_7859:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7860:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7881:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7883
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7882
LB_7883:
	add rsp,8
	jmp LB_7791
LB_7884:
	add rsp,16
	pop r14
LB_7882:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	jmp LB_7791
LB_7791:
	pop r10
	cmp r8,0
	jz LB_7792
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7906
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7906:
	jmp LB_7899
LB_7792:
	mov rdi,r13
	mov rsi,r14
	mov r14,r9
	bt r12,3
	jc LB_7904
	btr r12,1
	clc
	jmp LB_7905
LB_7904:
	bts r12,1
	stc
LB_7905:
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7902
	btr r12,0
	clc
	jmp LB_7903
LB_7902:
	bts r12,0
	stc
LB_7903:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 130
	push LB_7896
	push LB_7896
; _emt_mov_ptn_to_ptn:{| 110.. |},{ { 0' } 1' } ⊢ { { {  } } 0' }
	mov r8,r13
	bt r12,0
	jc LB_7915
	btr r12,2
	jmp LB_7916
LB_7915:
	bts r12,2
LB_7916:
	mov r13,r14
	bt r12,1
	jc LB_7917
	btr r12,0
	jmp LB_7918
LB_7917:
	bts r12,0
LB_7918:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some %_7212 ⊢ %_7213 : %_7213
 ; {>  %_448~2':_r64 %_7212~0':(_p5062)◂(_p1976) %_449~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_7213
 ; {>  %_448~2':_r64 %_7213~°0◂0':(_opn)◂((_p5062)◂(_p1976)) %_449~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_7892
	mov rdi,r8
	call dlt
LB_7892:
	bt r12,1
	jc LB_7893
	mov rdi,r14
	call dlt
LB_7893:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7894
	btr r12,3
	jmp LB_7895
LB_7894:
	bts r12,3
LB_7895:
	mov r8,0
	bts r12,2
	ret
LB_7896:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7898
	pop r14
	jmp LB_7901
LB_7898:
	add rsp,8
	ret
LB_7900:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_7901:
	ret
LB_7899:
	add rsp,16
	pop r14
LB_7897:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; nls
	jmp LB_8032
LB_8031:
	add r14,1
LB_8032:
	cmp r14,r10
	jge LB_8033
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8031
	cmp al,10
	jz LB_8031
	cmp al,32
	jz LB_8031
LB_8033:
	push r10
	call NS_E_6471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8034
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8019
LB_8034:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\194\167\194\167"
	jmp LB_8037
LB_8036:
	add r14,1
LB_8037:
	cmp r14,r10
	jge LB_8038
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8036
	cmp al,10
	jz LB_8036
	cmp al,32
	jz LB_8036
LB_8038:
	add r14,4
	cmp r14,r10
	jg LB_8042
	movzx rax,BYTE [r13+r14+8*1+0-4]
	cmp al,194
	jnz LB_8042
	movzx rax,BYTE [r13+r14+8*1+1-4]
	cmp al,167
	jnz LB_8042
	movzx rax,BYTE [r13+r14+8*1+2-4]
	cmp al,194
	jnz LB_8042
	movzx rax,BYTE [r13+r14+8*1+3-4]
	cmp al,167
	jnz LB_8042
	jmp LB_8043
LB_8042:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8040
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8040:
	jmp LB_8019
LB_8043:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	push r10
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	jmp LB_7968
LB_7967:
	add r14,1
LB_7968:
	cmp r14,r10
	jge LB_7969
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7967
	cmp al,10
	jz LB_7967
	cmp al,32
	jz LB_7967
LB_7969:
	push r10
	call NS_E_1677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7970
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7962
LB_7970:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_etr_def
	jmp LB_7973
LB_7972:
	add r14,1
LB_7973:
	cmp r14,r10
	jge LB_7974
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7972
	cmp al,10
	jz LB_7972
	cmp al,32
	jz LB_7972
LB_7974:
	push r10
	call NS_E_7136_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7975
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7976
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7976:
	jmp LB_7962
LB_7975:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7965
	btr r12,1
	clc
	jmp LB_7966
LB_7965:
	bts r12,1
	stc
LB_7966:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7963
	btr r12,0
	clc
	jmp LB_7964
LB_7963:
	bts r12,0
	stc
LB_7964:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 131
	push LB_7959
	push LB_7959
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
MTC_LB_7921:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_7922
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °0◂4'
; 1' ⊢ °0◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_7923
	bt QWORD [rdi],0
	jc LB_7924
	btr r12,5
	clc
	jmp LB_7925
LB_7924:
	bts r12,5
	stc
LB_7925:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_7923:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_7926
	btr r12,4
	jmp LB_7927
LB_7926:
	bts r12,4
LB_7927:
LB_7928:
	cmp r15,0
	jz LB_7929
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_7928
LB_7929:
; _f1989 { %_7214 %_7216 } ⊢ %_7217 : %_7217
 ; {>  %_7214~0':_stg %_7216~4':_p1977 %_452~3':_r64 %_453~2':_r64 }
; _f1989 { 0' 4' } ⊢ °0◂{ 0' 4' }
; _f5063 %_7217 ⊢ %_7218 : %_7218
 ; {>  %_7217~°0◂{ 0' 4' }:_p1976 %_452~3':_r64 %_453~2':_r64 }
; _f5063 °0◂{ 0' 4' } ⊢ °0◂°0◂{ 0' 4' }
; _some %_7218 ⊢ %_7219 : %_7219
 ; {>  %_7218~°0◂°0◂{ 0' 4' }:(_p5062)◂(_p1976) %_452~3':_r64 %_453~2':_r64 }
; _some °0◂°0◂{ 0' 4' } ⊢ °0◂°0◂°0◂{ 0' 4' }
; ∎ %_7219
 ; {>  %_452~3':_r64 %_453~2':_r64 %_7219~°0◂°0◂°0◂{ 0' 4' }:(_opn)◂((_p5062)◂(_p1976)) }
; 	∎ °0◂°0◂°0◂{ 0' 4' }
	bt r12,3
	jc LB_7930
	mov rdi,r9
	call dlt
LB_7930:
	bt r12,2
	jc LB_7931
	mov rdi,r8
	call dlt
LB_7931:
; _emt_mov_ptn_to_ptn:{| 100010.. |},°0◂°0◂°0◂{ 0' 4' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_7938
	btr r12,1
	jmp LB_7939
LB_7938:
	bts r12,1
LB_7939:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_7936
	btr QWORD [rdi],0
	jmp LB_7937
LB_7936:
	bts QWORD [rdi],0
LB_7937:
	mov r14,r10
	bt r12,4
	jc LB_7942
	btr r12,1
	jmp LB_7943
LB_7942:
	bts r12,1
LB_7943:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_7940
	btr QWORD [rdi],1
	jmp LB_7941
LB_7940:
	bts QWORD [rdi],1
LB_7941:
	mov rsi,1
	bt r12,3
	jc LB_7934
	mov rsi,0
	bt r9,0
	jc LB_7934
	jmp LB_7935
LB_7934:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7935:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_7932
	mov rsi,0
	bt r9,0
	jc LB_7932
	jmp LB_7933
LB_7932:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7933:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_7922:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_7944
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °1◂4'
; 1' ⊢ °1◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_7945
	bt QWORD [rdi],0
	jc LB_7946
	btr r12,5
	clc
	jmp LB_7947
LB_7946:
	bts r12,5
	stc
LB_7947:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_7945:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_7948
	btr r12,4
	jmp LB_7949
LB_7948:
	bts r12,4
LB_7949:
LB_7950:
	cmp r15,0
	jz LB_7951
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_7950
LB_7951:
; _f5064 %_7220 ⊢ %_7221 : %_7221
 ; {>  %_7214~0':_stg %_452~3':_r64 %_453~2':_r64 %_7220~4':(_lst)◂({ _r64 _r64 _stg }) }
; _f5064 4' ⊢ °1◂4'
; _some %_7221 ⊢ %_7222 : %_7222
 ; {>  %_7221~°1◂4':(_p5062)◂(t3055'(1)) %_7214~0':_stg %_452~3':_r64 %_453~2':_r64 }
; _some °1◂4' ⊢ °0◂°1◂4'
; ∎ %_7222
 ; {>  %_7214~0':_stg %_452~3':_r64 %_453~2':_r64 %_7222~°0◂°1◂4':(_opn)◂((_p5062)◂(t3058'(1))) }
; 	∎ °0◂°1◂4'
	bt r12,0
	jc LB_7952
	mov rdi,r13
	call dlt
LB_7952:
	bt r12,3
	jc LB_7953
	mov rdi,r9
	call dlt
LB_7953:
	bt r12,2
	jc LB_7954
	mov rdi,r8
	call dlt
LB_7954:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂°1◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_7957
	btr r12,3
	jmp LB_7958
LB_7957:
	bts r12,3
LB_7958:
	mov rsi,1
	bt r12,3
	jc LB_7955
	mov rsi,0
	bt r9,0
	jc LB_7955
	jmp LB_7956
LB_7955:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7956:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_7944:
LB_7959:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7961
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7960
LB_7961:
	add rsp,8
	jmp LB_7919
LB_7962:
	add rsp,32
	pop r14
LB_7960:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; mdl_etr_res
	jmp LB_8007
LB_8006:
	add r14,1
LB_8007:
	cmp r14,r10
	jge LB_8008
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8006
	cmp al,10
	jz LB_8006
	cmp al,32
	jz LB_8006
LB_8008:
	push r10
	call NS_E_7134_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8009
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8003
LB_8009:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8004
	btr r12,0
	clc
	jmp LB_8005
LB_8004:
	bts r12,0
	stc
LB_8005:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 132
	push LB_8000
	push LB_8000
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_7224 : %_7224
 ; {>  %_7223~{  }:{ } %_456~1':_r64 %_457~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; 	» "glb_etr 0.1" _ ⊢ 2' : %_7225
	mov rdi,11
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_62_6c_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_31_2e_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r8,rdi
	btr r12,2
; _cns { { %_457 %_456 %_7225 } %_7224 } ⊢ %_7226 : %_7226
 ; {>  %_7225~2':_stg %_7223~{  }:{ } %_456~1':_r64 %_7224~°1◂{  }:(_lst)◂(t3064'(1)) %_457~0':_r64 }
; _cns { { 0' 1' 2' } °1◂{  } } ⊢ °0◂{ { 0' 1' 2' } °1◂{  } }
; _f5064 %_7226 ⊢ %_7227 : %_7227
 ; {>  %_7226~°0◂{ { 0' 1' 2' } °1◂{  } }:(_lst)◂({ _r64 _r64 _stg }) %_7223~{  }:{ } }
; _f5064 °0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _some %_7227 ⊢ %_7228 : %_7228
 ; {>  %_7227~°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_p5062)◂(t3070'(1)) %_7223~{  }:{ } }
; _some °1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; ∎ %_7228
 ; {>  %_7223~{  }:{ } %_7228~°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_opn)◂((_p5062)◂(t3073'(1))) }
; 	∎ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_7986
	btr r12,5
	jmp LB_7987
LB_7986:
	bts r12,5
LB_7987:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_7984
	btr QWORD [rdi],0
	jmp LB_7985
LB_7984:
	bts QWORD [rdi],0
LB_7985:
	mov r11,r14
	bt r12,1
	jc LB_7990
	btr r12,5
	jmp LB_7991
LB_7990:
	bts r12,5
LB_7991:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_7988
	btr QWORD [rdi],1
	jmp LB_7989
LB_7988:
	bts QWORD [rdi],1
LB_7989:
	mov r11,r8
	bt r12,2
	jc LB_7994
	btr r12,5
	jmp LB_7995
LB_7994:
	bts r12,5
LB_7995:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_7992
	btr QWORD [rdi],2
	jmp LB_7993
LB_7992:
	bts QWORD [rdi],2
LB_7993:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_7982
	btr QWORD [rdi],0
	jmp LB_7983
LB_7982:
	bts QWORD [rdi],0
LB_7983:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rsi,1
	bt r12,4
	jc LB_7998
	mov rsi,0
	bt r10,0
	jc LB_7998
	jmp LB_7999
LB_7998:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_7999:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_7996
	btr QWORD [rdi],1
	jmp LB_7997
LB_7996:
	bts QWORD [rdi],1
LB_7997:
	mov rsi,1
	bt r12,3
	jc LB_7980
	mov rsi,0
	bt r9,0
	jc LB_7980
	jmp LB_7981
LB_7980:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7981:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_7978
	mov rsi,0
	bt r9,0
	jc LB_7978
	jmp LB_7979
LB_7978:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7979:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8000:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8002
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8001
LB_8002:
	add rsp,8
	jmp LB_7919
LB_8003:
	add rsp,16
	pop r14
LB_8001:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	jmp LB_7919
LB_7919:
	pop r10
	cmp r8,0
	jz LB_7920
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8028
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8028:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8029
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8029:
	jmp LB_8019
LB_7920:
	mov rdi,r13
	mov rsi,r14
	mov r8,r9
	bt r12,3
	jc LB_8026
	btr r12,2
	clc
	jmp LB_8027
LB_8026:
	bts r12,2
	stc
LB_8027:
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8024
	btr r12,1
	clc
	jmp LB_8025
LB_8024:
	bts r12,1
	stc
LB_8025:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8022
	btr r12,0
	clc
	jmp LB_8023
LB_8022:
	bts r12,0
	stc
LB_8023:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 133
	push LB_8016
	push LB_8016
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ { 0' 1' } 2' } ⊢ { { 0' {  } } 1' }
	mov r9,r14
	bt r12,1
	jc LB_8044
	btr r12,3
	jmp LB_8045
LB_8044:
	bts r12,3
LB_8045:
	mov r14,r8
	bt r12,2
	jc LB_8046
	btr r12,1
	jmp LB_8047
LB_8046:
	bts r12,1
LB_8047:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _some %_7229 ⊢ %_7231 : %_7231
 ; {>  %_7230~0':(_p5062)◂({ }) %_460~2':_r64 %_7229~1':(_p5062)◂(_p1976) %_459~3':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_7231
 ; {>  %_7231~°0◂1':(_opn)◂((_p5062)◂(_p1976)) %_7230~0':(_p5062)◂({ }) %_460~2':_r64 %_459~3':_r64 }
; 	∎ °0◂1'
	bt r12,0
	jc LB_8011
	mov rdi,r13
	call dlt
LB_8011:
	bt r12,2
	jc LB_8012
	mov rdi,r8
	call dlt
LB_8012:
	bt r12,3
	jc LB_8013
	mov rdi,r9
	call dlt
LB_8013:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_8014
	btr r12,3
	jmp LB_8015
LB_8014:
	bts r12,3
LB_8015:
	mov r8,0
	bts r12,2
	ret
LB_8016:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8018
	pop r14
	jmp LB_8021
LB_8018:
	add rsp,8
	ret
LB_8020:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_8021:
	ret
LB_8019:
	add rsp,32
	pop r14
LB_8017:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\194\167"
	jmp LB_8117
LB_8116:
	add r14,1
LB_8117:
	cmp r14,r10
	jge LB_8118
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8116
	cmp al,10
	jz LB_8116
	cmp al,32
	jz LB_8116
LB_8118:
	add r14,2
	cmp r14,r10
	jg LB_8121
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,194
	jnz LB_8121
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,167
	jnz LB_8121
	jmp LB_8122
LB_8121:
	jmp LB_8107
LB_8122:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	push r10
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; lc_etr_body
	jmp LB_8063
LB_8062:
	add r14,1
LB_8063:
	cmp r14,r10
	jge LB_8064
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8062
	cmp al,10
	jz LB_8062
	cmp al,32
	jz LB_8062
LB_8064:
	push r10
	call NS_E_7144_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8065
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8059
LB_8065:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8060
	btr r12,0
	clc
	jmp LB_8061
LB_8060:
	bts r12,0
	stc
LB_8061:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 134
	push LB_8056
	push LB_8056
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f5063 %_7232 ⊢ %_7233 : %_7233
 ; {>  %_463~2':_r64 %_7232~0':_p1976 %_464~1':_r64 }
; _f5063 0' ⊢ °0◂0'
; _some %_7233 ⊢ %_7234 : %_7234
 ; {>  %_463~2':_r64 %_7233~°0◂0':(_p5062)◂(_p1976) %_464~1':_r64 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_7234
 ; {>  %_463~2':_r64 %_464~1':_r64 %_7234~°0◂°0◂0':(_opn)◂((_p5062)◂(_p1976)) }
; 	∎ °0◂°0◂0'
	bt r12,2
	jc LB_8050
	mov rdi,r8
	call dlt
LB_8050:
	bt r12,1
	jc LB_8051
	mov rdi,r14
	call dlt
LB_8051:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8054
	btr r12,3
	jmp LB_8055
LB_8054:
	bts r12,3
LB_8055:
	mov rsi,1
	bt r12,3
	jc LB_8052
	mov rsi,0
	bt r9,0
	jc LB_8052
	jmp LB_8053
LB_8052:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8053:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8056:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8058
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8057
LB_8058:
	add rsp,8
	jmp LB_8048
LB_8059:
	add rsp,16
	pop r14
LB_8057:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; glb_etr_res
	jmp LB_8096
LB_8095:
	add r14,1
LB_8096:
	cmp r14,r10
	jge LB_8097
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8095
	cmp al,10
	jz LB_8095
	cmp al,32
	jz LB_8095
LB_8097:
	push r10
	call NS_E_7133_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8098
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8092
LB_8098:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8093
	btr r12,0
	clc
	jmp LB_8094
LB_8093:
	bts r12,0
	stc
LB_8094:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 135
	push LB_8089
	push LB_8089
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_7236 : %_7236
 ; {>  %_468~0':_r64 %_7235~{  }:{ } %_467~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; 	» "glb_etr 3" _ ⊢ 2' : %_7237
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_62_6c_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_33
	mov QWORD [rdi+8*1+8*1],rax
	mov r8,rdi
	btr r12,2
; _cns { { %_468 %_467 %_7237 } %_7236 } ⊢ %_7238 : %_7238
 ; {>  %_468~0':_r64 %_7235~{  }:{ } %_7236~°1◂{  }:(_lst)◂(t3088'(1)) %_7237~2':_stg %_467~1':_r64 }
; _cns { { 0' 1' 2' } °1◂{  } } ⊢ °0◂{ { 0' 1' 2' } °1◂{  } }
; _f5064 %_7238 ⊢ %_7239 : %_7239
 ; {>  %_7235~{  }:{ } %_7238~°0◂{ { 0' 1' 2' } °1◂{  } }:(_lst)◂({ _r64 _r64 _stg }) }
; _f5064 °0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _some %_7239 ⊢ %_7240 : %_7240
 ; {>  %_7235~{  }:{ } %_7239~°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_p5062)◂(t3094'(1)) }
; _some °1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; ∎ %_7240
 ; {>  %_7235~{  }:{ } %_7240~°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_opn)◂((_p5062)◂(t3097'(1))) }
; 	∎ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_8075
	btr r12,5
	jmp LB_8076
LB_8075:
	bts r12,5
LB_8076:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_8073
	btr QWORD [rdi],0
	jmp LB_8074
LB_8073:
	bts QWORD [rdi],0
LB_8074:
	mov r11,r14
	bt r12,1
	jc LB_8079
	btr r12,5
	jmp LB_8080
LB_8079:
	bts r12,5
LB_8080:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_8077
	btr QWORD [rdi],1
	jmp LB_8078
LB_8077:
	bts QWORD [rdi],1
LB_8078:
	mov r11,r8
	bt r12,2
	jc LB_8083
	btr r12,5
	jmp LB_8084
LB_8083:
	bts r12,5
LB_8084:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_8081
	btr QWORD [rdi],2
	jmp LB_8082
LB_8081:
	bts QWORD [rdi],2
LB_8082:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_8071
	btr QWORD [rdi],0
	jmp LB_8072
LB_8071:
	bts QWORD [rdi],0
LB_8072:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rsi,1
	bt r12,4
	jc LB_8087
	mov rsi,0
	bt r10,0
	jc LB_8087
	jmp LB_8088
LB_8087:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_8088:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_8085
	btr QWORD [rdi],1
	jmp LB_8086
LB_8085:
	bts QWORD [rdi],1
LB_8086:
	mov rsi,1
	bt r12,3
	jc LB_8069
	mov rsi,0
	bt r9,0
	jc LB_8069
	jmp LB_8070
LB_8069:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8070:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_8067
	mov rsi,0
	bt r9,0
	jc LB_8067
	jmp LB_8068
LB_8067:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8068:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8089:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8091
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8090
LB_8091:
	add rsp,8
	jmp LB_8048
LB_8092:
	add rsp,16
	pop r14
LB_8090:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	jmp LB_8048
LB_8048:
	pop r10
	cmp r8,0
	jz LB_8049
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8114
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8114:
	jmp LB_8107
LB_8049:
	mov rdi,r13
	mov rsi,r14
	mov r14,r9
	bt r12,3
	jc LB_8112
	btr r12,1
	clc
	jmp LB_8113
LB_8112:
	bts r12,1
	stc
LB_8113:
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8110
	btr r12,0
	clc
	jmp LB_8111
LB_8110:
	bts r12,0
	stc
LB_8111:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 136
	push LB_8104
	push LB_8104
; _emt_mov_ptn_to_ptn:{| 110.. |},{ { 0' } 1' } ⊢ { { {  } } 0' }
	mov r8,r13
	bt r12,0
	jc LB_8123
	btr r12,2
	jmp LB_8124
LB_8123:
	bts r12,2
LB_8124:
	mov r13,r14
	bt r12,1
	jc LB_8125
	btr r12,0
	jmp LB_8126
LB_8125:
	bts r12,0
LB_8126:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some %_7241 ⊢ %_7242 : %_7242
 ; {>  %_7241~0':(_p5062)◂(_p1976) %_471~1':_r64 %_470~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_7242
 ; {>  %_471~1':_r64 %_470~2':_r64 %_7242~°0◂0':(_opn)◂((_p5062)◂(_p1976)) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_8100
	mov rdi,r14
	call dlt
LB_8100:
	bt r12,2
	jc LB_8101
	mov rdi,r8
	call dlt
LB_8101:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8102
	btr r12,3
	jmp LB_8103
LB_8102:
	bts r12,3
LB_8103:
	mov r8,0
	bts r12,2
	ret
LB_8104:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8106
	pop r14
	jmp LB_8109
LB_8106:
	add rsp,8
	ret
LB_8108:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_8109:
	ret
LB_8107:
	add rsp,16
	pop r14
LB_8105:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\194\182"
	jmp LB_8196
LB_8195:
	add r14,1
LB_8196:
	cmp r14,r10
	jge LB_8197
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8195
	cmp al,10
	jz LB_8195
	cmp al,32
	jz LB_8195
LB_8197:
	add r14,2
	cmp r14,r10
	jg LB_8200
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,194
	jnz LB_8200
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,182
	jnz LB_8200
	jmp LB_8201
LB_8200:
	jmp LB_8186
LB_8201:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	push r10
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dt_etr
	jmp LB_8142
LB_8141:
	add r14,1
LB_8142:
	cmp r14,r10
	jge LB_8143
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8141
	cmp al,10
	jz LB_8141
	cmp al,32
	jz LB_8141
LB_8143:
	push r10
	call NS_E_7138_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8144
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8138
LB_8144:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8139
	btr r12,0
	clc
	jmp LB_8140
LB_8139:
	bts r12,0
	stc
LB_8140:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 137
	push LB_8135
	push LB_8135
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f5063 %_7243 ⊢ %_7244 : %_7244
 ; {>  %_475~1':_r64 %_7243~0':_p1976 %_474~2':_r64 }
; _f5063 0' ⊢ °0◂0'
; _some %_7244 ⊢ %_7245 : %_7245
 ; {>  %_7244~°0◂0':(_p5062)◂(_p1976) %_475~1':_r64 %_474~2':_r64 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_7245
 ; {>  %_7245~°0◂°0◂0':(_opn)◂((_p5062)◂(_p1976)) %_475~1':_r64 %_474~2':_r64 }
; 	∎ °0◂°0◂0'
	bt r12,1
	jc LB_8129
	mov rdi,r14
	call dlt
LB_8129:
	bt r12,2
	jc LB_8130
	mov rdi,r8
	call dlt
LB_8130:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8133
	btr r12,3
	jmp LB_8134
LB_8133:
	bts r12,3
LB_8134:
	mov rsi,1
	bt r12,3
	jc LB_8131
	mov rsi,0
	bt r9,0
	jc LB_8131
	jmp LB_8132
LB_8131:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8132:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8135:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8137
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8136
LB_8137:
	add rsp,8
	jmp LB_8127
LB_8138:
	add rsp,16
	pop r14
LB_8136:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; glb_etr_res
	jmp LB_8175
LB_8174:
	add r14,1
LB_8175:
	cmp r14,r10
	jge LB_8176
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8174
	cmp al,10
	jz LB_8174
	cmp al,32
	jz LB_8174
LB_8176:
	push r10
	call NS_E_7133_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8177
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8171
LB_8177:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8172
	btr r12,0
	clc
	jmp LB_8173
LB_8172:
	bts r12,0
	stc
LB_8173:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 138
	push LB_8168
	push LB_8168
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_7247 : %_7247
 ; {>  %_479~0':_r64 %_478~1':_r64 %_7246~{  }:{ } }
; _nil {  } ⊢ °1◂{  }
; 	» "glb_etr 4" _ ⊢ 2' : %_7248
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_62_6c_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_34
	mov QWORD [rdi+8*1+8*1],rax
	mov r8,rdi
	btr r12,2
; _cns { { %_479 %_478 %_7248 } %_7247 } ⊢ %_7249 : %_7249
 ; {>  %_7247~°1◂{  }:(_lst)◂(t3111'(1)) %_479~0':_r64 %_478~1':_r64 %_7248~2':_stg %_7246~{  }:{ } }
; _cns { { 0' 1' 2' } °1◂{  } } ⊢ °0◂{ { 0' 1' 2' } °1◂{  } }
; _f5064 %_7249 ⊢ %_7250 : %_7250
 ; {>  %_7249~°0◂{ { 0' 1' 2' } °1◂{  } }:(_lst)◂({ _r64 _r64 _stg }) %_7246~{  }:{ } }
; _f5064 °0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _some %_7250 ⊢ %_7251 : %_7251
 ; {>  %_7250~°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_p5062)◂(t3117'(1)) %_7246~{  }:{ } }
; _some °1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; ∎ %_7251
 ; {>  %_7251~°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_opn)◂((_p5062)◂(t3120'(1))) %_7246~{  }:{ } }
; 	∎ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_8154
	btr r12,5
	jmp LB_8155
LB_8154:
	bts r12,5
LB_8155:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_8152
	btr QWORD [rdi],0
	jmp LB_8153
LB_8152:
	bts QWORD [rdi],0
LB_8153:
	mov r11,r14
	bt r12,1
	jc LB_8158
	btr r12,5
	jmp LB_8159
LB_8158:
	bts r12,5
LB_8159:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_8156
	btr QWORD [rdi],1
	jmp LB_8157
LB_8156:
	bts QWORD [rdi],1
LB_8157:
	mov r11,r8
	bt r12,2
	jc LB_8162
	btr r12,5
	jmp LB_8163
LB_8162:
	bts r12,5
LB_8163:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_8160
	btr QWORD [rdi],2
	jmp LB_8161
LB_8160:
	bts QWORD [rdi],2
LB_8161:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_8150
	btr QWORD [rdi],0
	jmp LB_8151
LB_8150:
	bts QWORD [rdi],0
LB_8151:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rsi,1
	bt r12,4
	jc LB_8166
	mov rsi,0
	bt r10,0
	jc LB_8166
	jmp LB_8167
LB_8166:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_8167:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_8164
	btr QWORD [rdi],1
	jmp LB_8165
LB_8164:
	bts QWORD [rdi],1
LB_8165:
	mov rsi,1
	bt r12,3
	jc LB_8148
	mov rsi,0
	bt r9,0
	jc LB_8148
	jmp LB_8149
LB_8148:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8149:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_8146
	mov rsi,0
	bt r9,0
	jc LB_8146
	jmp LB_8147
LB_8146:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8147:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8168:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8170
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8169
LB_8170:
	add rsp,8
	jmp LB_8127
LB_8171:
	add rsp,16
	pop r14
LB_8169:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	jmp LB_8127
LB_8127:
	pop r10
	cmp r8,0
	jz LB_8128
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8193
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8193:
	jmp LB_8186
LB_8128:
	mov rdi,r13
	mov rsi,r14
	mov r14,r9
	bt r12,3
	jc LB_8191
	btr r12,1
	clc
	jmp LB_8192
LB_8191:
	bts r12,1
	stc
LB_8192:
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8189
	btr r12,0
	clc
	jmp LB_8190
LB_8189:
	bts r12,0
	stc
LB_8190:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 139
	push LB_8183
	push LB_8183
; _emt_mov_ptn_to_ptn:{| 110.. |},{ { 0' } 1' } ⊢ { { {  } } 0' }
	mov r8,r13
	bt r12,0
	jc LB_8202
	btr r12,2
	jmp LB_8203
LB_8202:
	bts r12,2
LB_8203:
	mov r13,r14
	bt r12,1
	jc LB_8204
	btr r12,0
	jmp LB_8205
LB_8204:
	bts r12,0
LB_8205:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some %_7252 ⊢ %_7253 : %_7253
 ; {>  %_482~1':_r64 %_7252~0':(_p5062)◂(_p1976) %_481~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_7253
 ; {>  %_482~1':_r64 %_7253~°0◂0':(_opn)◂((_p5062)◂(_p1976)) %_481~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_8179
	mov rdi,r14
	call dlt
LB_8179:
	bt r12,2
	jc LB_8180
	mov rdi,r8
	call dlt
LB_8180:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8181
	btr r12,3
	jmp LB_8182
LB_8181:
	bts r12,3
LB_8182:
	mov r8,0
	bts r12,2
	ret
LB_8183:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8185
	pop r14
	jmp LB_8188
LB_8185:
	add rsp,8
	ret
LB_8187:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_8188:
	ret
LB_8186:
	add rsp,16
	pop r14
LB_8184:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7133:
NS_E_RDI_7133:
NS_E_7133_ETR_TBL:
NS_E_7133_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; glb_etr_res_ch
	jmp LB_8217
LB_8216:
	add r14,1
LB_8217:
	cmp r14,r10
	jge LB_8218
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8216
	cmp al,10
	jz LB_8216
	cmp al,32
	jz LB_8216
LB_8218:
	push r10
	call NS_E_7135_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8219
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8211
LB_8219:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; glb_etr_res
	jmp LB_8222
LB_8221:
	add r14,1
LB_8222:
	cmp r14,r10
	jge LB_8223
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8221
	cmp al,10
	jz LB_8221
	cmp al,32
	jz LB_8221
LB_8223:
	push r10
	call NS_E_7133_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8224
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8225
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8225:
	jmp LB_8211
LB_8224:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8214
	btr r12,1
	clc
	jmp LB_8215
LB_8214:
	bts r12,1
	stc
LB_8215:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8212
	btr r12,0
	clc
	jmp LB_8213
LB_8212:
	bts r12,0
	stc
LB_8213:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 140
	push LB_8208
	push LB_8208
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some {  } ⊢ %_7256 : %_7256
 ; {>  %_486~0':_r64 %_7255~{  }:{ } %_485~1':_r64 %_7254~{  }:{ } }
; _some {  } ⊢ °0◂{  }
; ∎ %_7256
 ; {>  %_486~0':_r64 %_7255~{  }:{ } %_7256~°0◂{  }:(_opn)◂({ }) %_485~1':_r64 %_7254~{  }:{ } }
; 	∎ °0◂{  }
	bt r12,0
	jc LB_8206
	mov rdi,r13
	call dlt
LB_8206:
	bt r12,1
	jc LB_8207
	mov rdi,r14
	call dlt
LB_8207:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,0
	bts r12,2
	ret
LB_8208:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8210
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8209
LB_8210:
	add rsp,8
	ret
LB_8211:
	add rsp,32
	pop r14
LB_8209:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 141
	push LB_8229
	push LB_8229
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some {  } ⊢ %_7257 : %_7257
 ; {>  %_489~1':_r64 %_490~0':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_7257
 ; {>  %_7257~°0◂{  }:(_opn)◂({ }) %_489~1':_r64 %_490~0':_r64 }
; 	∎ °0◂{  }
	bt r12,1
	jc LB_8227
	mov rdi,r14
	call dlt
LB_8227:
	bt r12,0
	jc LB_8228
	mov rdi,r13
	call dlt
LB_8228:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,0
	bts r12,2
	ret
LB_8229:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8231
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8230
LB_8231:
	add rsp,8
	ret
LB_8232:
	add rsp,0
	pop r14
LB_8230:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7134:
NS_E_RDI_7134:
NS_E_7134_ETR_TBL:
NS_E_7134_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_8242
LB_8241:
	add r14,1
LB_8242:
	cmp r14,r10
	jge LB_8243
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8241
	cmp al,10
	jz LB_8241
	cmp al,32
	jz LB_8241
LB_8243:
	add r14,6
	cmp r14,r10
	jg LB_8246
	movzx rax,BYTE [r13+r14+8*1+0-6]
	cmp al,226
	jnz LB_8246
	movzx rax,BYTE [r13+r14+8*1+1-6]
	cmp al,136
	jnz LB_8246
	movzx rax,BYTE [r13+r14+8*1+2-6]
	cmp al,142
	jnz LB_8246
	movzx rax,BYTE [r13+r14+8*1+3-6]
	cmp al,226
	jnz LB_8246
	movzx rax,BYTE [r13+r14+8*1+4-6]
	cmp al,136
	jnz LB_8246
	movzx rax,BYTE [r13+r14+8*1+5-6]
	cmp al,142
	jnz LB_8246
	jmp LB_8247
LB_8246:
	jmp LB_8238
LB_8247:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8239
	btr r12,0
	clc
	jmp LB_8240
LB_8239:
	bts r12,0
	stc
LB_8240:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 142
	push LB_8235
	push LB_8235
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some {  } ⊢ %_7258 : %_7258
 ; {>  %_494~0':_r64 %_493~1':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_7258
 ; {>  %_494~0':_r64 %_7258~°0◂{  }:(_opn)◂({ }) %_493~1':_r64 }
; 	∎ °0◂{  }
	bt r12,0
	jc LB_8233
	mov rdi,r13
	call dlt
LB_8233:
	bt r12,1
	jc LB_8234
	mov rdi,r14
	call dlt
LB_8234:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,0
	bts r12,2
	ret
LB_8235:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8237
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8236
LB_8237:
	add rsp,8
	ret
LB_8238:
	add rsp,16
	pop r14
LB_8236:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\194\167\194\167"
	jmp LB_8332
LB_8331:
	add r14,1
LB_8332:
	cmp r14,r10
	jge LB_8333
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8331
	cmp al,10
	jz LB_8331
	cmp al,32
	jz LB_8331
LB_8333:
	add r14,4
	cmp r14,r10
	jg LB_8336
	movzx rax,BYTE [r13+r14+8*1+0-4]
	cmp al,194
	jnz LB_8336
	movzx rax,BYTE [r13+r14+8*1+1-4]
	cmp al,167
	jnz LB_8336
	movzx rax,BYTE [r13+r14+8*1+2-4]
	cmp al,194
	jnz LB_8336
	movzx rax,BYTE [r13+r14+8*1+3-4]
	cmp al,167
	jnz LB_8336
	jmp LB_8337
LB_8336:
	jmp LB_8324
LB_8337:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	push r10
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; word
	jmp LB_8267
LB_8266:
	add r14,1
LB_8267:
	cmp r14,r10
	jge LB_8268
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8266
	cmp al,10
	jz LB_8266
	cmp al,32
	jz LB_8266
LB_8268:
	push r10
	call NS_E_1677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8269
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8257
LB_8269:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_8272
LB_8271:
	add r14,1
LB_8272:
	cmp r14,r10
	jge LB_8273
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8271
	cmp al,10
	jz LB_8271
	cmp al,32
	jz LB_8271
LB_8273:
	add r14,1
	cmp r14,r10
	jg LB_8277
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,61
	jnz LB_8277
	jmp LB_8278
LB_8277:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8275
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8275:
	jmp LB_8257
LB_8278:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_8280
LB_8279:
	add r14,1
LB_8280:
	cmp r14,r10
	jge LB_8281
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8279
	cmp al,10
	jz LB_8279
	cmp al,32
	jz LB_8279
LB_8281:
	push r10
	call NS_E_4901_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8282
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8283
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8283:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8284
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8284:
	jmp LB_8257
LB_8282:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; mdl_etr_res
	jmp LB_8287
LB_8286:
	add r14,1
LB_8287:
	cmp r14,r10
	jge LB_8288
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8286
	cmp al,10
	jz LB_8286
	cmp al,32
	jz LB_8286
LB_8288:
	push r10
	call NS_E_7134_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8289
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8290
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8290:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8291
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8291:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8292
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8292:
	jmp LB_8257
LB_8289:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_8264
	btr r12,3
	clc
	jmp LB_8265
LB_8264:
	bts r12,3
	stc
LB_8265:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8262
	btr r12,2
	clc
	jmp LB_8263
LB_8262:
	bts r12,2
	stc
LB_8263:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8260
	btr r12,1
	clc
	jmp LB_8261
LB_8260:
	bts r12,1
	stc
LB_8261:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8258
	btr r12,0
	clc
	jmp LB_8259
LB_8258:
	bts r12,0
	stc
LB_8259:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push 143
	push LB_8254
	push LB_8254
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' {  } }
	mov r10,r14
	bt r12,1
	jc LB_8294
	btr r12,4
	jmp LB_8295
LB_8294:
	bts r12,4
LB_8295:
	mov r14,r8
	bt r12,2
	jc LB_8296
	btr r12,1
	jmp LB_8297
LB_8296:
	bts r12,1
LB_8297:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _some {  } ⊢ %_7262 : %_7262
 ; {>  %_497~3':_r64 %_7260~1':_p1878 %_7261~{  }:{ } %_498~2':_r64 %_7259~0':_stg }
; _some {  } ⊢ °0◂{  }
; ∎ %_7262
 ; {>  %_497~3':_r64 %_7262~°0◂{  }:(_opn)◂({ }) %_7260~1':_p1878 %_7261~{  }:{ } %_498~2':_r64 %_7259~0':_stg }
; 	∎ °0◂{  }
	bt r12,3
	jc LB_8250
	mov rdi,r9
	call dlt
LB_8250:
	bt r12,1
	jc LB_8251
	mov rdi,r14
	call dlt
LB_8251:
	bt r12,2
	jc LB_8252
	mov rdi,r8
	call dlt
LB_8252:
	bt r12,0
	jc LB_8253
	mov rdi,r13
	call dlt
LB_8253:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,0
	bts r12,2
	ret
LB_8254:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8256
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8255
LB_8256:
	add rsp,8
	jmp LB_8248
LB_8257:
	add rsp,64
	pop r14
LB_8255:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; mdl_etr_res
	jmp LB_8309
LB_8308:
	add r14,1
LB_8309:
	cmp r14,r10
	jge LB_8310
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8308
	cmp al,10
	jz LB_8308
	cmp al,32
	jz LB_8308
LB_8310:
	push r10
	call NS_E_7134_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8311
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8303
LB_8311:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_etr_res
	jmp LB_8314
LB_8313:
	add r14,1
LB_8314:
	cmp r14,r10
	jge LB_8315
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8313
	cmp al,10
	jz LB_8313
	cmp al,32
	jz LB_8313
LB_8315:
	push r10
	call NS_E_7134_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8316
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8317
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8317:
	jmp LB_8303
LB_8316:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8306
	btr r12,1
	clc
	jmp LB_8307
LB_8306:
	bts r12,1
	stc
LB_8307:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8304
	btr r12,0
	clc
	jmp LB_8305
LB_8304:
	bts r12,0
	stc
LB_8305:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 144
	push LB_8300
	push LB_8300
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some {  } ⊢ %_7265 : %_7265
 ; {>  %_7264~{  }:{ } %_501~1':_r64 %_7263~{  }:{ } %_502~0':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_7265
 ; {>  %_7264~{  }:{ } %_501~1':_r64 %_7265~°0◂{  }:(_opn)◂({ }) %_7263~{  }:{ } %_502~0':_r64 }
; 	∎ °0◂{  }
	bt r12,1
	jc LB_8298
	mov rdi,r14
	call dlt
LB_8298:
	bt r12,0
	jc LB_8299
	mov rdi,r13
	call dlt
LB_8299:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,0
	bts r12,2
	ret
LB_8300:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8302
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8301
LB_8302:
	add rsp,8
	jmp LB_8248
LB_8303:
	add rsp,32
	pop r14
LB_8301:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	jmp LB_8248
LB_8248:
	pop r10
	cmp r8,0
	jz LB_8249
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8329
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8329:
	jmp LB_8324
LB_8249:
	mov rdi,r13
	mov rsi,r14
	mov r14,r9
	bt r12,3
	jc LB_8327
	btr r12,1
	clc
	jmp LB_8328
LB_8327:
	bts r12,1
	stc
LB_8328:
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8325
	btr r12,0
	clc
	jmp LB_8326
LB_8325:
	bts r12,0
	stc
LB_8326:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 145
	push LB_8321
	push LB_8321
; _emt_mov_ptn_to_ptn:{| 110.. |},{ { 0' } 1' } ⊢ { { {  } } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some {  } ⊢ %_7267 : %_7267
 ; {>  %_504~1':_r64 %_7266~{  }:{ } %_505~0':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_7267
 ; {>  %_504~1':_r64 %_7266~{  }:{ } %_7267~°0◂{  }:(_opn)◂({ }) %_505~0':_r64 }
; 	∎ °0◂{  }
	bt r12,1
	jc LB_8319
	mov rdi,r14
	call dlt
LB_8319:
	bt r12,0
	jc LB_8320
	mov rdi,r13
	call dlt
LB_8320:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,0
	bts r12,2
	ret
LB_8321:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8323
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8322
LB_8323:
	add rsp,8
	ret
LB_8324:
	add rsp,16
	pop r14
LB_8322:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	jmp LB_8350
LB_8349:
	add r14,1
LB_8350:
	cmp r14,r10
	jge LB_8351
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8349
	cmp al,10
	jz LB_8349
	cmp al,32
	jz LB_8349
LB_8351:
	push r10
	call NS_E_904_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8352
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8344
LB_8352:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_etr_res
	jmp LB_8355
LB_8354:
	add r14,1
LB_8355:
	cmp r14,r10
	jge LB_8356
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8354
	cmp al,10
	jz LB_8354
	cmp al,32
	jz LB_8354
LB_8356:
	push r10
	call NS_E_7134_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8357
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8358
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8358:
	jmp LB_8344
LB_8357:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8347
	btr r12,1
	clc
	jmp LB_8348
LB_8347:
	bts r12,1
	stc
LB_8348:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8345
	btr r12,0
	clc
	jmp LB_8346
LB_8345:
	bts r12,0
	stc
LB_8346:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 146
	push LB_8341
	push LB_8341
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some {  } ⊢ %_7270 : %_7270
 ; {>  %_7268~0':_r64 %_509~1':_r64 %_7269~{  }:{ } %_508~2':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_7270
 ; {>  %_7268~0':_r64 %_509~1':_r64 %_7270~°0◂{  }:(_opn)◂({ }) %_7269~{  }:{ } %_508~2':_r64 }
; 	∎ °0◂{  }
	bt r12,0
	jc LB_8338
	mov rdi,r13
	call dlt
LB_8338:
	bt r12,1
	jc LB_8339
	mov rdi,r14
	call dlt
LB_8339:
	bt r12,2
	jc LB_8340
	mov rdi,r8
	call dlt
LB_8340:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,0
	bts r12,2
	ret
LB_8341:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8343
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8342
LB_8343:
	add rsp,8
	ret
LB_8344:
	add rsp,32
	pop r14
LB_8342:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 147
	push LB_8362
	push LB_8362
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some {  } ⊢ %_7271 : %_7271
 ; {>  %_513~0':_r64 %_512~1':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_7271
 ; {>  %_7271~°0◂{  }:(_opn)◂({ }) %_513~0':_r64 %_512~1':_r64 }
; 	∎ °0◂{  }
	bt r12,0
	jc LB_8360
	mov rdi,r13
	call dlt
LB_8360:
	bt r12,1
	jc LB_8361
	mov rdi,r14
	call dlt
LB_8361:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,0
	bts r12,2
	ret
LB_8362:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8364
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8363
LB_8364:
	add rsp,8
	ret
LB_8365:
	add rsp,0
	pop r14
LB_8363:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7135:
NS_E_RDI_7135:
NS_E_7135_ETR_TBL:
NS_E_7135_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167\194\167+s8"
	jmp LB_8385
LB_8384:
	add r14,1
LB_8385:
	cmp r14,r10
	jge LB_8386
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8384
	cmp al,10
	jz LB_8384
	cmp al,32
	jz LB_8384
LB_8386:
	add r14,7
	cmp r14,r10
	jg LB_8389
	movzx rax,BYTE [r13+r14+8*1+0-7]
	cmp al,194
	jnz LB_8389
	movzx rax,BYTE [r13+r14+8*1+1-7]
	cmp al,167
	jnz LB_8389
	movzx rax,BYTE [r13+r14+8*1+2-7]
	cmp al,194
	jnz LB_8389
	movzx rax,BYTE [r13+r14+8*1+3-7]
	cmp al,167
	jnz LB_8389
	movzx rax,BYTE [r13+r14+8*1+4-7]
	cmp al,43
	jnz LB_8389
	movzx rax,BYTE [r13+r14+8*1+5-7]
	cmp al,115
	jnz LB_8389
	movzx rax,BYTE [r13+r14+8*1+6-7]
	cmp al,56
	jnz LB_8389
	jmp LB_8390
LB_8389:
	jmp LB_8369
LB_8390:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\\F\\"
	jmp LB_8377
LB_8376:
	add r14,1
LB_8377:
	cmp r14,r10
	jge LB_8378
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8376
	cmp al,10
	jz LB_8376
	cmp al,32
	jz LB_8376
LB_8378:
	add r14,3
	cmp r14,r10
	jg LB_8382
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,92
	jnz LB_8382
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,70
	jnz LB_8382
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,92
	jnz LB_8382
	jmp LB_8383
LB_8382:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8380
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8380:
	jmp LB_8370
LB_8383:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8374
	btr r12,1
	clc
	jmp LB_8375
LB_8374:
	bts r12,1
	stc
LB_8375:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8372
	btr r12,0
	clc
	jmp LB_8373
LB_8372:
	bts r12,0
	stc
LB_8373:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 148
	push LB_8366
	push LB_8366
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
	jmp err
LB_8366:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8368
	pop r14
	jmp LB_8371
LB_8368:
	add rsp,8
	ret
LB_8370:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_8371:
	ret
LB_8369:
	add rsp,32
	pop r14
LB_8367:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167\194\167"
	jmp LB_8410
LB_8409:
	add r14,1
LB_8410:
	cmp r14,r10
	jge LB_8411
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8409
	cmp al,10
	jz LB_8409
	cmp al,32
	jz LB_8409
LB_8411:
	add r14,4
	cmp r14,r10
	jg LB_8414
	movzx rax,BYTE [r13+r14+8*1+0-4]
	cmp al,194
	jnz LB_8414
	movzx rax,BYTE [r13+r14+8*1+1-4]
	cmp al,167
	jnz LB_8414
	movzx rax,BYTE [r13+r14+8*1+2-4]
	cmp al,194
	jnz LB_8414
	movzx rax,BYTE [r13+r14+8*1+3-4]
	cmp al,167
	jnz LB_8414
	jmp LB_8415
LB_8414:
	jmp LB_8394
LB_8415:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\\F\\"
	jmp LB_8402
LB_8401:
	add r14,1
LB_8402:
	cmp r14,r10
	jge LB_8403
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8401
	cmp al,10
	jz LB_8401
	cmp al,32
	jz LB_8401
LB_8403:
	add r14,3
	cmp r14,r10
	jg LB_8407
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,92
	jnz LB_8407
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,70
	jnz LB_8407
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,92
	jnz LB_8407
	jmp LB_8408
LB_8407:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8405
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8405:
	jmp LB_8395
LB_8408:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8399
	btr r12,1
	clc
	jmp LB_8400
LB_8399:
	bts r12,1
	stc
LB_8400:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8397
	btr r12,0
	clc
	jmp LB_8398
LB_8397:
	bts r12,0
	stc
LB_8398:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 149
	push LB_8391
	push LB_8391
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
	jmp err
LB_8391:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8393
	pop r14
	jmp LB_8396
LB_8393:
	add rsp,8
	ret
LB_8395:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_8396:
	ret
LB_8394:
	add rsp,32
	pop r14
LB_8392:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167"
	jmp LB_8435
LB_8434:
	add r14,1
LB_8435:
	cmp r14,r10
	jge LB_8436
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8434
	cmp al,10
	jz LB_8434
	cmp al,32
	jz LB_8434
LB_8436:
	add r14,2
	cmp r14,r10
	jg LB_8439
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,194
	jnz LB_8439
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,167
	jnz LB_8439
	jmp LB_8440
LB_8439:
	jmp LB_8419
LB_8440:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\\F\\"
	jmp LB_8427
LB_8426:
	add r14,1
LB_8427:
	cmp r14,r10
	jge LB_8428
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8426
	cmp al,10
	jz LB_8426
	cmp al,32
	jz LB_8426
LB_8428:
	add r14,3
	cmp r14,r10
	jg LB_8432
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,92
	jnz LB_8432
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,70
	jnz LB_8432
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,92
	jnz LB_8432
	jmp LB_8433
LB_8432:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8430
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8430:
	jmp LB_8420
LB_8433:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8424
	btr r12,1
	clc
	jmp LB_8425
LB_8424:
	bts r12,1
	stc
LB_8425:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8422
	btr r12,0
	clc
	jmp LB_8423
LB_8422:
	bts r12,0
	stc
LB_8423:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 150
	push LB_8416
	push LB_8416
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
	jmp err
LB_8416:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8418
	pop r14
	jmp LB_8421
LB_8418:
	add rsp,8
	ret
LB_8420:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_8421:
	ret
LB_8419:
	add rsp,32
	pop r14
LB_8417:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\182"
	jmp LB_8460
LB_8459:
	add r14,1
LB_8460:
	cmp r14,r10
	jge LB_8461
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8459
	cmp al,10
	jz LB_8459
	cmp al,32
	jz LB_8459
LB_8461:
	add r14,2
	cmp r14,r10
	jg LB_8464
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,194
	jnz LB_8464
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,182
	jnz LB_8464
	jmp LB_8465
LB_8464:
	jmp LB_8444
LB_8465:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\\F\\"
	jmp LB_8452
LB_8451:
	add r14,1
LB_8452:
	cmp r14,r10
	jge LB_8453
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8451
	cmp al,10
	jz LB_8451
	cmp al,32
	jz LB_8451
LB_8453:
	add r14,3
	cmp r14,r10
	jg LB_8457
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,92
	jnz LB_8457
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,70
	jnz LB_8457
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,92
	jnz LB_8457
	jmp LB_8458
LB_8457:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8455
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8455:
	jmp LB_8445
LB_8458:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8449
	btr r12,1
	clc
	jmp LB_8450
LB_8449:
	bts r12,1
	stc
LB_8450:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8447
	btr r12,0
	clc
	jmp LB_8448
LB_8447:
	bts r12,0
	stc
LB_8448:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 151
	push LB_8441
	push LB_8441
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
	jmp err
LB_8441:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8443
	pop r14
	jmp LB_8446
LB_8443:
	add rsp,8
	ret
LB_8445:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_8446:
	ret
LB_8444:
	add rsp,32
	pop r14
LB_8442:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\136\142\226\136\142"
	jmp LB_8485
LB_8484:
	add r14,1
LB_8485:
	cmp r14,r10
	jge LB_8486
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8484
	cmp al,10
	jz LB_8484
	cmp al,32
	jz LB_8484
LB_8486:
	add r14,6
	cmp r14,r10
	jg LB_8489
	movzx rax,BYTE [r13+r14+8*1+0-6]
	cmp al,226
	jnz LB_8489
	movzx rax,BYTE [r13+r14+8*1+1-6]
	cmp al,136
	jnz LB_8489
	movzx rax,BYTE [r13+r14+8*1+2-6]
	cmp al,142
	jnz LB_8489
	movzx rax,BYTE [r13+r14+8*1+3-6]
	cmp al,226
	jnz LB_8489
	movzx rax,BYTE [r13+r14+8*1+4-6]
	cmp al,136
	jnz LB_8489
	movzx rax,BYTE [r13+r14+8*1+5-6]
	cmp al,142
	jnz LB_8489
	jmp LB_8490
LB_8489:
	jmp LB_8469
LB_8490:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\\F\\"
	jmp LB_8477
LB_8476:
	add r14,1
LB_8477:
	cmp r14,r10
	jge LB_8478
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8476
	cmp al,10
	jz LB_8476
	cmp al,32
	jz LB_8476
LB_8478:
	add r14,3
	cmp r14,r10
	jg LB_8482
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,92
	jnz LB_8482
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,70
	jnz LB_8482
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,92
	jnz LB_8482
	jmp LB_8483
LB_8482:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8480
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8480:
	jmp LB_8470
LB_8483:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8474
	btr r12,1
	clc
	jmp LB_8475
LB_8474:
	bts r12,1
	stc
LB_8475:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8472
	btr r12,0
	clc
	jmp LB_8473
LB_8472:
	bts r12,0
	stc
LB_8473:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 152
	push LB_8466
	push LB_8466
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
	jmp err
LB_8466:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8468
	pop r14
	jmp LB_8471
LB_8468:
	add rsp,8
	ret
LB_8470:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_8471:
	ret
LB_8469:
	add rsp,32
	pop r14
LB_8467:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	jmp LB_8501
LB_8500:
	add r14,1
LB_8501:
	cmp r14,r10
	jge LB_8502
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8500
	cmp al,10
	jz LB_8500
	cmp al,32
	jz LB_8500
LB_8502:
	push r10
	call NS_E_904_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8503
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8497
LB_8503:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8498
	btr r12,0
	clc
	jmp LB_8499
LB_8498:
	bts r12,0
	stc
LB_8499:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 153
	push LB_8494
	push LB_8494
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some {  } ⊢ %_7273 : %_7273
 ; {>  %_541~2':_r64 %_542~1':_r64 %_7272~0':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_7273
 ; {>  %_541~2':_r64 %_542~1':_r64 %_7273~°0◂{  }:(_opn)◂({ }) %_7272~0':_r64 }
; 	∎ °0◂{  }
	bt r12,2
	jc LB_8491
	mov rdi,r8
	call dlt
LB_8491:
	bt r12,1
	jc LB_8492
	mov rdi,r14
	call dlt
LB_8492:
	bt r12,0
	jc LB_8493
	mov rdi,r13
	call dlt
LB_8493:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,0
	bts r12,2
	ret
LB_8494:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8496
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8495
LB_8496:
	add rsp,8
	ret
LB_8497:
	add rsp,16
	pop r14
LB_8495:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7136:
NS_E_RDI_7136:
NS_E_7136_ETR_TBL:
NS_E_7136_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "="
	jmp LB_8540
LB_8539:
	add r14,1
LB_8540:
	cmp r14,r10
	jge LB_8541
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8539
	cmp al,10
	jz LB_8539
	cmp al,32
	jz LB_8539
LB_8541:
	add r14,1
	cmp r14,r10
	jg LB_8544
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,61
	jnz LB_8544
	jmp LB_8545
LB_8544:
	jmp LB_8517
LB_8545:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_8527
LB_8526:
	add r14,1
LB_8527:
	cmp r14,r10
	jge LB_8528
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8526
	cmp al,10
	jz LB_8526
	cmp al,32
	jz LB_8526
LB_8528:
	push r10
	call NS_E_4901_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8529
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8530
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8530:
	jmp LB_8518
LB_8529:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; nls
	jmp LB_8533
LB_8532:
	add r14,1
LB_8533:
	cmp r14,r10
	jge LB_8534
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8532
	cmp al,10
	jz LB_8532
	cmp al,32
	jz LB_8532
LB_8534:
	push r10
	call NS_E_6471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8535
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8536
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8536:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8537
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8537:
	jmp LB_8518
LB_8535:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8524
	btr r12,2
	clc
	jmp LB_8525
LB_8524:
	bts r12,2
	stc
LB_8525:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8522
	btr r12,1
	clc
	jmp LB_8523
LB_8522:
	bts r12,1
	stc
LB_8523:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8520
	btr r12,0
	clc
	jmp LB_8521
LB_8520:
	bts r12,0
	stc
LB_8521:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 154
	push LB_8514
	push LB_8514
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_8546
	btr r12,3
	jmp LB_8547
LB_8546:
	bts r12,3
LB_8547:
	mov r14,r8
	bt r12,2
	jc LB_8548
	btr r12,1
	jmp LB_8549
LB_8548:
	bts r12,1
LB_8549:
	mov r8,r13
	bt r12,0
	jc LB_8550
	btr r12,2
	jmp LB_8551
LB_8550:
	bts r12,2
LB_8551:
	mov r13,r9
	bt r12,3
	jc LB_8552
	btr r12,0
	jmp LB_8553
LB_8552:
	bts r12,0
LB_8553:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _f1996 %_7274 ⊢ %_7276 : %_7276
 ; {>  %_546~2':_r64 %_545~3':_r64 %_7275~1':(_p5062)◂({ }) %_7274~0':_p1878 }
; _f1996 0' ⊢ °1◂0'
; _f5063 %_7276 ⊢ %_7277 : %_7277
 ; {>  %_546~2':_r64 %_545~3':_r64 %_7275~1':(_p5062)◂({ }) %_7276~°1◂0':_p1977 }
; _f5063 °1◂0' ⊢ °0◂°1◂0'
; _some %_7277 ⊢ %_7278 : %_7278
 ; {>  %_546~2':_r64 %_545~3':_r64 %_7275~1':(_p5062)◂({ }) %_7277~°0◂°1◂0':(_p5062)◂(_p1977) }
; _some °0◂°1◂0' ⊢ °0◂°0◂°1◂0'
; ∎ %_7278
 ; {>  %_546~2':_r64 %_545~3':_r64 %_7278~°0◂°0◂°1◂0':(_opn)◂((_p5062)◂(_p1977)) %_7275~1':(_p5062)◂({ }) }
; 	∎ °0◂°0◂°1◂0'
	bt r12,2
	jc LB_8505
	mov rdi,r8
	call dlt
LB_8505:
	bt r12,3
	jc LB_8506
	mov rdi,r9
	call dlt
LB_8506:
	bt r12,1
	jc LB_8507
	mov rdi,r14
	call dlt
LB_8507:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8512
	btr r12,3
	jmp LB_8513
LB_8512:
	bts r12,3
LB_8513:
	mov rsi,1
	bt r12,3
	jc LB_8510
	mov rsi,0
	bt r9,0
	jc LB_8510
	jmp LB_8511
LB_8510:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8511:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_8508
	mov rsi,0
	bt r9,0
	jc LB_8508
	jmp LB_8509
LB_8508:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8509:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8514:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8516
	pop r14
	jmp LB_8519
LB_8516:
	add rsp,8
	ret
LB_8518:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_8519:
	ret
LB_8517:
	add rsp,48
	pop r14
LB_8515:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; nls
	jmp LB_8596
LB_8595:
	add r14,1
LB_8596:
	cmp r14,r10
	jge LB_8597
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8595
	cmp al,10
	jz LB_8595
	cmp al,32
	jz LB_8595
LB_8597:
	push r10
	call NS_E_6471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8598
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8590
LB_8598:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_8601
LB_8600:
	add r14,1
LB_8601:
	cmp r14,r10
	jge LB_8602
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8600
	cmp al,10
	jz LB_8600
	cmp al,32
	jz LB_8600
LB_8602:
	push r10
	call NS_E_7137_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8603
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8604
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8604:
	jmp LB_8590
LB_8603:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8593
	btr r12,1
	clc
	jmp LB_8594
LB_8593:
	bts r12,1
	stc
LB_8594:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8591
	btr r12,0
	clc
	jmp LB_8592
LB_8591:
	bts r12,0
	stc
LB_8592:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 155
	push LB_8587
	push LB_8587
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
MTC_LB_8554:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_8555
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °0◂4'
; 1' ⊢ °0◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_8556
	bt QWORD [rdi],0
	jc LB_8557
	btr r12,5
	clc
	jmp LB_8558
LB_8557:
	bts r12,5
	stc
LB_8558:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_8556:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_8559
	btr r12,4
	jmp LB_8560
LB_8559:
	bts r12,4
LB_8560:
LB_8561:
	cmp r15,0
	jz LB_8562
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_8561
LB_8562:
; _f1995 %_7281 ⊢ %_7282 : %_7282
 ; {>  %_7281~4':(_lst)◂(_p1976) %_7279~0':(_p5062)◂({ }) %_549~3':_r64 %_550~2':_r64 }
; _f1995 4' ⊢ °0◂4'
; _f5063 %_7282 ⊢ %_7283 : %_7283
 ; {>  %_7279~0':(_p5062)◂({ }) %_549~3':_r64 %_7282~°0◂4':_p1977 %_550~2':_r64 }
; _f5063 °0◂4' ⊢ °0◂°0◂4'
; _some %_7283 ⊢ %_7284 : %_7284
 ; {>  %_7279~0':(_p5062)◂({ }) %_549~3':_r64 %_7283~°0◂°0◂4':(_p5062)◂(_p1977) %_550~2':_r64 }
; _some °0◂°0◂4' ⊢ °0◂°0◂°0◂4'
; ∎ %_7284
 ; {>  %_7284~°0◂°0◂°0◂4':(_opn)◂((_p5062)◂(_p1977)) %_7279~0':(_p5062)◂({ }) %_549~3':_r64 %_550~2':_r64 }
; 	∎ °0◂°0◂°0◂4'
	bt r12,0
	jc LB_8563
	mov rdi,r13
	call dlt
LB_8563:
	bt r12,3
	jc LB_8564
	mov rdi,r9
	call dlt
LB_8564:
	bt r12,2
	jc LB_8565
	mov rdi,r8
	call dlt
LB_8565:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂°0◂°0◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_8570
	btr r12,3
	jmp LB_8571
LB_8570:
	bts r12,3
LB_8571:
	mov rsi,1
	bt r12,3
	jc LB_8568
	mov rsi,0
	bt r9,0
	jc LB_8568
	jmp LB_8569
LB_8568:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8569:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_8566
	mov rsi,0
	bt r9,0
	jc LB_8566
	jmp LB_8567
LB_8566:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8567:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_8555:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_8572
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °1◂4'
; 1' ⊢ °1◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_8573
	bt QWORD [rdi],0
	jc LB_8574
	btr r12,5
	clc
	jmp LB_8575
LB_8574:
	bts r12,5
	stc
LB_8575:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_8573:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_8576
	btr r12,4
	jmp LB_8577
LB_8576:
	bts r12,4
LB_8577:
LB_8578:
	cmp r15,0
	jz LB_8579
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_8578
LB_8579:
; _f5064 %_7285 ⊢ %_7286 : %_7286
 ; {>  %_7279~0':(_p5062)◂({ }) %_7285~4':(_lst)◂({ _r64 _r64 _stg }) %_549~3':_r64 %_550~2':_r64 }
; _f5064 4' ⊢ °1◂4'
; _some %_7286 ⊢ %_7287 : %_7287
 ; {>  %_7286~°1◂4':(_p5062)◂(t3187'(0)) %_7279~0':(_p5062)◂({ }) %_549~3':_r64 %_550~2':_r64 }
; _some °1◂4' ⊢ °0◂°1◂4'
; ∎ %_7287
 ; {>  %_7287~°0◂°1◂4':(_opn)◂((_p5062)◂(t3190'(0))) %_7279~0':(_p5062)◂({ }) %_549~3':_r64 %_550~2':_r64 }
; 	∎ °0◂°1◂4'
	bt r12,0
	jc LB_8580
	mov rdi,r13
	call dlt
LB_8580:
	bt r12,3
	jc LB_8581
	mov rdi,r9
	call dlt
LB_8581:
	bt r12,2
	jc LB_8582
	mov rdi,r8
	call dlt
LB_8582:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂°1◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_8585
	btr r12,3
	jmp LB_8586
LB_8585:
	bts r12,3
LB_8586:
	mov rsi,1
	bt r12,3
	jc LB_8583
	mov rsi,0
	bt r9,0
	jc LB_8583
	jmp LB_8584
LB_8583:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8584:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_8572:
LB_8587:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8589
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8588
LB_8589:
	add rsp,8
	ret
LB_8590:
	add rsp,32
	pop r14
LB_8588:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7137:
NS_E_RDI_7137:
NS_E_7137_ETR_TBL:
NS_E_7137_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; nls
	jmp LB_8625
LB_8624:
	add r14,1
LB_8625:
	cmp r14,r10
	jge LB_8626
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8624
	cmp al,10
	jz LB_8624
	cmp al,32
	jz LB_8624
LB_8626:
	push r10
	call NS_E_6471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8627
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8617
LB_8627:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\136\142\226\136\142"
	jmp LB_8630
LB_8629:
	add r14,1
LB_8630:
	cmp r14,r10
	jge LB_8631
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8629
	cmp al,10
	jz LB_8629
	cmp al,32
	jz LB_8629
LB_8631:
	add r14,6
	cmp r14,r10
	jg LB_8635
	movzx rax,BYTE [r13+r14+8*1+0-6]
	cmp al,226
	jnz LB_8635
	movzx rax,BYTE [r13+r14+8*1+1-6]
	cmp al,136
	jnz LB_8635
	movzx rax,BYTE [r13+r14+8*1+2-6]
	cmp al,142
	jnz LB_8635
	movzx rax,BYTE [r13+r14+8*1+3-6]
	cmp al,226
	jnz LB_8635
	movzx rax,BYTE [r13+r14+8*1+4-6]
	cmp al,136
	jnz LB_8635
	movzx rax,BYTE [r13+r14+8*1+5-6]
	cmp al,142
	jnz LB_8635
	jmp LB_8636
LB_8635:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8633
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8633:
	jmp LB_8617
LB_8636:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; nls
	jmp LB_8638
LB_8637:
	add r14,1
LB_8638:
	cmp r14,r10
	jge LB_8639
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8637
	cmp al,10
	jz LB_8637
	cmp al,32
	jz LB_8637
LB_8639:
	push r10
	call NS_E_6471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8640
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8641
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8641:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8642
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8642:
	jmp LB_8617
LB_8640:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8622
	btr r12,2
	clc
	jmp LB_8623
LB_8622:
	bts r12,2
	stc
LB_8623:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8620
	btr r12,1
	clc
	jmp LB_8621
LB_8620:
	bts r12,1
	stc
LB_8621:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8618
	btr r12,0
	clc
	jmp LB_8619
LB_8618:
	bts r12,0
	stc
LB_8619:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 156
	push LB_8614
	push LB_8614
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_8644
	btr r12,3
	jmp LB_8645
LB_8644:
	bts r12,3
LB_8645:
	mov r14,r8
	bt r12,2
	jc LB_8646
	btr r12,1
	jmp LB_8647
LB_8646:
	bts r12,1
LB_8647:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _nil {  } ⊢ %_7290 : %_7290
 ; {>  %_553~3':_r64 %_7289~1':(_p5062)◂({ }) %_7288~0':(_p5062)◂({ }) %_554~2':_r64 }
; _nil {  } ⊢ °1◂{  }
; _f5063 %_7290 ⊢ %_7291 : %_7291
 ; {>  %_553~3':_r64 %_7289~1':(_p5062)◂({ }) %_7290~°1◂{  }:(_lst)◂(t3197'(0)) %_7288~0':(_p5062)◂({ }) %_554~2':_r64 }
; _f5063 °1◂{  } ⊢ °0◂°1◂{  }
; _some %_7291 ⊢ %_7292 : %_7292
 ; {>  %_553~3':_r64 %_7289~1':(_p5062)◂({ }) %_7291~°0◂°1◂{  }:(_p5062)◂((_lst)◂(t3200'(0))) %_7288~0':(_p5062)◂({ }) %_554~2':_r64 }
; _some °0◂°1◂{  } ⊢ °0◂°0◂°1◂{  }
; ∎ %_7292
 ; {>  %_553~3':_r64 %_7289~1':(_p5062)◂({ }) %_7292~°0◂°0◂°1◂{  }:(_opn)◂((_p5062)◂((_lst)◂(t3203'(0)))) %_7288~0':(_p5062)◂({ }) %_554~2':_r64 }
; 	∎ °0◂°0◂°1◂{  }
	bt r12,3
	jc LB_8606
	mov rdi,r9
	call dlt
LB_8606:
	bt r12,1
	jc LB_8607
	mov rdi,r14
	call dlt
LB_8607:
	bt r12,0
	jc LB_8608
	mov rdi,r13
	call dlt
LB_8608:
	bt r12,2
	jc LB_8609
	mov rdi,r8
	call dlt
LB_8609:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_8612
	mov rsi,0
	bt r9,0
	jc LB_8612
	jmp LB_8613
LB_8612:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8613:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_8610
	mov rsi,0
	bt r9,0
	jc LB_8610
	jmp LB_8611
LB_8610:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8611:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8614:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8616
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8615
LB_8616:
	add rsp,8
	ret
LB_8617:
	add rsp,48
	pop r14
LB_8615:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; nls
	jmp LB_8761
LB_8760:
	add r14,1
LB_8761:
	cmp r14,r10
	jge LB_8762
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8760
	cmp al,10
	jz LB_8760
	cmp al,32
	jz LB_8760
LB_8762:
	push r10
	call NS_E_6471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8763
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8753
LB_8763:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; glb_etr
	jmp LB_8766
LB_8765:
	add r14,1
LB_8766:
	cmp r14,r10
	jge LB_8767
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8765
	cmp al,10
	jz LB_8765
	cmp al,32
	jz LB_8765
LB_8767:
	push r10
	call NS_E_7132_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8768
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8769
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8769:
	jmp LB_8753
LB_8768:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mdl_glb_etr
	jmp LB_8772
LB_8771:
	add r14,1
LB_8772:
	cmp r14,r10
	jge LB_8773
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8771
	cmp al,10
	jz LB_8771
	cmp al,32
	jz LB_8771
LB_8773:
	push r10
	call NS_E_7137_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8774
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8775
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8775:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8776
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8776:
	jmp LB_8753
LB_8774:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8758
	btr r12,2
	clc
	jmp LB_8759
LB_8758:
	bts r12,2
	stc
LB_8759:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8756
	btr r12,1
	clc
	jmp LB_8757
LB_8756:
	bts r12,1
	stc
LB_8757:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8754
	btr r12,0
	clc
	jmp LB_8755
LB_8754:
	bts r12,0
	stc
LB_8755:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 157
	push LB_8750
	push LB_8750
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
	mov rax,QWORD [rsp+8]
	mov r10,rax
	mov rax,QWORD [rsp+8*3]
	mov r9,rax
	bts r12,3
	bts r12,4
MTC_LB_8648:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_8649
; _emt_mov_ptn_to_ptn:{| 111110.. |},2' ⊢ °0◂5'
; 2' ⊢ °0◂5'
	btr r12,6
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_8650
	bt QWORD [rdi],0
	jc LB_8651
	btr r12,6
	clc
	jmp LB_8652
LB_8651:
	bts r12,6
	stc
LB_8652:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_8650:
	mov rcx,rdi
	mov r11,rcx
	bt r12,6
	jc LB_8653
	btr r12,5
	jmp LB_8654
LB_8653:
	bts r12,5
LB_8654:
LB_8655:
	cmp r15,0
	jz LB_8656
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_8655
LB_8656:
MTC_LB_8657:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_8658
; _emt_mov_ptn_to_ptn:{| 1101110.. |},1' ⊢ °0◂2'
; 1' ⊢ °0◂2'
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_8659
	bt QWORD [rdi],0
	jc LB_8660
	btr r12,6
	clc
	jmp LB_8661
LB_8660:
	bts r12,6
	stc
LB_8661:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_8659:
	mov rcx,rdi
	mov r8,rcx
	bt r12,6
	jc LB_8662
	btr r12,2
	jmp LB_8663
LB_8662:
	bts r12,2
LB_8663:
LB_8664:
	cmp r15,0
	jz LB_8665
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_8664
LB_8665:
; _cns { %_7297 %_7296 } ⊢ %_7298 : %_7298
 ; {>  %_7297~2':_p1976 %_7293~0':(_p5062)◂({ }) %_558~3':_r64 %_557~4':_r64 %_7296~5':(_lst)◂(_p1976) }
; _cns { 2' 5' } ⊢ °0◂{ 2' 5' }
; _f5063 %_7298 ⊢ %_7299 : %_7299
 ; {>  %_7293~0':(_p5062)◂({ }) %_558~3':_r64 %_557~4':_r64 %_7298~°0◂{ 2' 5' }:(_lst)◂(_p1976) }
; _f5063 °0◂{ 2' 5' } ⊢ °0◂°0◂{ 2' 5' }
; _some %_7299 ⊢ %_7300 : %_7300
 ; {>  %_7293~0':(_p5062)◂({ }) %_558~3':_r64 %_557~4':_r64 %_7299~°0◂°0◂{ 2' 5' }:(_p5062)◂((_lst)◂(_p1976)) }
; _some °0◂°0◂{ 2' 5' } ⊢ °0◂°0◂°0◂{ 2' 5' }
; ∎ %_7300
 ; {>  %_7293~0':(_p5062)◂({ }) %_558~3':_r64 %_557~4':_r64 %_7300~°0◂°0◂°0◂{ 2' 5' }:(_opn)◂((_p5062)◂((_lst)◂(_p1976))) }
; 	∎ °0◂°0◂°0◂{ 2' 5' }
	bt r12,0
	jc LB_8666
	mov rdi,r13
	call dlt
LB_8666:
	bt r12,3
	jc LB_8667
	mov rdi,r9
	call dlt
LB_8667:
	bt r12,4
	jc LB_8668
	mov rdi,r10
	call dlt
LB_8668:
; _emt_mov_ptn_to_ptn:{| 0010010.. |},°0◂°0◂°0◂{ 2' 5' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r8
	bt r12,2
	jc LB_8675
	btr r12,0
	jmp LB_8676
LB_8675:
	bts r12,0
LB_8676:
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_8673
	btr QWORD [rdi],0
	jmp LB_8674
LB_8673:
	bts QWORD [rdi],0
LB_8674:
	mov r13,r11
	bt r12,5
	jc LB_8679
	btr r12,0
	jmp LB_8680
LB_8679:
	bts r12,0
LB_8680:
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_8677
	btr QWORD [rdi],1
	jmp LB_8678
LB_8677:
	bts QWORD [rdi],1
LB_8678:
	mov rsi,1
	bt r12,3
	jc LB_8671
	mov rsi,0
	bt r9,0
	jc LB_8671
	jmp LB_8672
LB_8671:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8672:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_8669
	mov rsi,0
	bt r9,0
	jc LB_8669
	jmp LB_8670
LB_8669:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8670:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_8658:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_8681
; _emt_mov_ptn_to_ptn:{| 1101110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_8682
	bt QWORD [rdi],0
	jc LB_8683
	btr r12,6
	clc
	jmp LB_8684
LB_8683:
	bts r12,6
	stc
LB_8684:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_8682:
	mov rcx,rdi
	mov r8,rcx
	bt r12,6
	jc LB_8685
	btr r12,2
	jmp LB_8686
LB_8685:
	bts r12,2
LB_8686:
LB_8687:
	cmp r15,0
	jz LB_8688
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_8687
LB_8688:
; _f5064 %_7301 ⊢ %_7302 : %_7302
 ; {>  %_7293~0':(_p5062)◂({ }) %_558~3':_r64 %_557~4':_r64 %_7296~5':(_lst)◂(_p1976) %_7301~2':(_lst)◂({ _r64 _r64 _stg }) }
; _f5064 2' ⊢ °1◂2'
; _some %_7302 ⊢ %_7303 : %_7303
 ; {>  %_7293~0':(_p5062)◂({ }) %_558~3':_r64 %_557~4':_r64 %_7296~5':(_lst)◂(_p1976) %_7302~°1◂2':(_p5062)◂(t3228'(0)) }
; _some °1◂2' ⊢ °0◂°1◂2'
; ∎ %_7303
 ; {>  %_7293~0':(_p5062)◂({ }) %_558~3':_r64 %_557~4':_r64 %_7296~5':(_lst)◂(_p1976) %_7303~°0◂°1◂2':(_opn)◂((_p5062)◂(t3231'(0))) }
; 	∎ °0◂°1◂2'
	bt r12,0
	jc LB_8689
	mov rdi,r13
	call dlt
LB_8689:
	bt r12,3
	jc LB_8690
	mov rdi,r9
	call dlt
LB_8690:
	bt r12,4
	jc LB_8691
	mov rdi,r10
	call dlt
LB_8691:
	bt r12,5
	jc LB_8692
	mov rdi,r11
	call dlt
LB_8692:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂°1◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_8695
	btr r12,3
	jmp LB_8696
LB_8695:
	bts r12,3
LB_8696:
	mov rsi,1
	bt r12,3
	jc LB_8693
	mov rsi,0
	bt r9,0
	jc LB_8693
	jmp LB_8694
LB_8693:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8694:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_8681:
MTC_LB_8649:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_8697
; _emt_mov_ptn_to_ptn:{| 111110.. |},2' ⊢ °1◂5'
; 2' ⊢ °1◂5'
	btr r12,6
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_8698
	bt QWORD [rdi],0
	jc LB_8699
	btr r12,6
	clc
	jmp LB_8700
LB_8699:
	bts r12,6
	stc
LB_8700:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_8698:
	mov rcx,rdi
	mov r11,rcx
	bt r12,6
	jc LB_8701
	btr r12,5
	jmp LB_8702
LB_8701:
	bts r12,5
LB_8702:
LB_8703:
	cmp r15,0
	jz LB_8704
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_8703
LB_8704:
MTC_LB_8705:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_8706
; _emt_mov_ptn_to_ptn:{| 1101110.. |},1' ⊢ °0◂2'
; 1' ⊢ °0◂2'
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_8707
	bt QWORD [rdi],0
	jc LB_8708
	btr r12,6
	clc
	jmp LB_8709
LB_8708:
	bts r12,6
	stc
LB_8709:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_8707:
	mov rcx,rdi
	mov r8,rcx
	bt r12,6
	jc LB_8710
	btr r12,2
	jmp LB_8711
LB_8710:
	bts r12,2
LB_8711:
LB_8712:
	cmp r15,0
	jz LB_8713
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_8712
LB_8713:
; _f5064 %_7304 ⊢ %_7306 : %_7306
 ; {>  %_7293~0':(_p5062)◂({ }) %_558~3':_r64 %_557~4':_r64 %_7305~2':_p1976 %_7304~5':(_lst)◂({ _r64 _r64 _stg }) }
; _f5064 5' ⊢ °1◂5'
; _some %_7306 ⊢ %_7307 : %_7307
 ; {>  %_7293~0':(_p5062)◂({ }) %_558~3':_r64 %_557~4':_r64 %_7305~2':_p1976 %_7306~°1◂5':(_p5062)◂(t3242'(0)) }
; _some °1◂5' ⊢ °0◂°1◂5'
; ∎ %_7307
 ; {>  %_7293~0':(_p5062)◂({ }) %_558~3':_r64 %_7307~°0◂°1◂5':(_opn)◂((_p5062)◂(t3245'(0))) %_557~4':_r64 %_7305~2':_p1976 }
; 	∎ °0◂°1◂5'
	bt r12,0
	jc LB_8714
	mov rdi,r13
	call dlt
LB_8714:
	bt r12,3
	jc LB_8715
	mov rdi,r9
	call dlt
LB_8715:
	bt r12,4
	jc LB_8716
	mov rdi,r10
	call dlt
LB_8716:
	bt r12,2
	jc LB_8717
	mov rdi,r8
	call dlt
LB_8717:
; _emt_mov_ptn_to_ptn:{| 0000010.. |},°0◂°1◂5' ⊢ 2'◂3'
	mov r9,r11
	bt r12,5
	jc LB_8720
	btr r12,3
	jmp LB_8721
LB_8720:
	bts r12,3
LB_8721:
	mov rsi,1
	bt r12,3
	jc LB_8718
	mov rsi,0
	bt r9,0
	jc LB_8718
	jmp LB_8719
LB_8718:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8719:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_8706:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_8722
; _emt_mov_ptn_to_ptn:{| 1101110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_8723
	bt QWORD [rdi],0
	jc LB_8724
	btr r12,6
	clc
	jmp LB_8725
LB_8724:
	bts r12,6
	stc
LB_8725:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_8723:
	mov rcx,rdi
	mov r8,rcx
	bt r12,6
	jc LB_8726
	btr r12,2
	jmp LB_8727
LB_8726:
	bts r12,2
LB_8727:
LB_8728:
	cmp r15,0
	jz LB_8729
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_8728
LB_8729:
; _f981 { %_7308 %_7304 } ⊢ %_7309 : %_7309
 ; {>  %_7293~0':(_p5062)◂({ }) %_558~3':_r64 %_557~4':_r64 %_7308~2':(_lst)◂({ _r64 _r64 _stg }) %_7304~5':(_lst)◂({ _r64 _r64 _stg }) }
; _f981 { 2' 5' } ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010010.. |},{ 2' 5' } ⊢ { 0' 1' }
	mov r13,r8
	bt r12,2
	jc LB_8736
	btr r12,0
	jmp LB_8737
LB_8736:
	bts r12,0
LB_8737:
	mov r14,r11
	bt r12,5
	jc LB_8738
	btr r12,1
	jmp LB_8739
LB_8738:
	bts r12,1
LB_8739:
	push 2
	push LB_8742
	call NS_E_981
LB_8742:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_8740
	btr r12,1
	jmp LB_8741
LB_8740:
	bts r12,1
LB_8741:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_8734
	btr r12,4
	clc
	jmp LB_8735
LB_8734:
	bts r12,4
	stc
LB_8735:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_8732
	btr r12,3
	clc
	jmp LB_8733
LB_8732:
	bts r12,3
	stc
LB_8733:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_8730
	btr r12,0
	clc
	jmp LB_8731
LB_8730:
	bts r12,0
	stc
LB_8731:
	add rsp,32
; _f5064 %_7309 ⊢ %_7310 : %_7310
 ; {>  %_7293~0':(_p5062)◂({ }) %_558~3':_r64 %_557~4':_r64 %_7309~1':(_lst)◂({ _r64 _r64 _stg }) }
; _f5064 1' ⊢ °1◂1'
; _some %_7310 ⊢ %_7311 : %_7311
 ; {>  %_7293~0':(_p5062)◂({ }) %_558~3':_r64 %_557~4':_r64 %_7310~°1◂1':(_p5062)◂(t3250'(0)) }
; _some °1◂1' ⊢ °0◂°1◂1'
; ∎ %_7311
 ; {>  %_7293~0':(_p5062)◂({ }) %_558~3':_r64 %_557~4':_r64 %_7311~°0◂°1◂1':(_opn)◂((_p5062)◂(t3253'(0))) }
; 	∎ °0◂°1◂1'
	bt r12,0
	jc LB_8743
	mov rdi,r13
	call dlt
LB_8743:
	bt r12,3
	jc LB_8744
	mov rdi,r9
	call dlt
LB_8744:
	bt r12,4
	jc LB_8745
	mov rdi,r10
	call dlt
LB_8745:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂°1◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_8748
	btr r12,3
	jmp LB_8749
LB_8748:
	bts r12,3
LB_8749:
	mov rsi,1
	bt r12,3
	jc LB_8746
	mov rsi,0
	bt r9,0
	jc LB_8746
	jmp LB_8747
LB_8746:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8747:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_8722:
MTC_LB_8697:
LB_8750:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8752
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8751
LB_8752:
	add rsp,8
	ret
LB_8753:
	add rsp,48
	pop r14
LB_8751:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; mdl_etr_res
	push r10
	call NS_E_7134_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8809
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8803
LB_8809:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8804
	btr r12,0
	clc
	jmp LB_8805
LB_8804:
	bts r12,0
	stc
LB_8805:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 158
	push LB_8800
	push LB_8800
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_7313 : %_7313
 ; {>  %_561~1':_r64 %_7312~{  }:{ } %_562~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; 	» "glb_etr 4" _ ⊢ 2' : %_7314
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_62_6c_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_34
	mov QWORD [rdi+8*1+8*1],rax
	mov r8,rdi
	btr r12,2
; _cns { { %_562 %_561 %_7314 } %_7313 } ⊢ %_7315 : %_7315
 ; {>  %_7313~°1◂{  }:(_lst)◂(t3262'(0)) %_561~1':_r64 %_7312~{  }:{ } %_7314~2':_stg %_562~0':_r64 }
; _cns { { 0' 1' 2' } °1◂{  } } ⊢ °0◂{ { 0' 1' 2' } °1◂{  } }
; _f5064 %_7315 ⊢ %_7316 : %_7316
 ; {>  %_7315~°0◂{ { 0' 1' 2' } °1◂{  } }:(_lst)◂({ _r64 _r64 _stg }) %_7312~{  }:{ } }
; _f5064 °0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _some %_7316 ⊢ %_7317 : %_7317
 ; {>  %_7316~°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_p5062)◂(t3268'(0)) %_7312~{  }:{ } }
; _some °1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; ∎ %_7317
 ; {>  %_7312~{  }:{ } %_7317~°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_opn)◂((_p5062)◂(t3271'(0))) }
; 	∎ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_8786
	btr r12,5
	jmp LB_8787
LB_8786:
	bts r12,5
LB_8787:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_8784
	btr QWORD [rdi],0
	jmp LB_8785
LB_8784:
	bts QWORD [rdi],0
LB_8785:
	mov r11,r14
	bt r12,1
	jc LB_8790
	btr r12,5
	jmp LB_8791
LB_8790:
	bts r12,5
LB_8791:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_8788
	btr QWORD [rdi],1
	jmp LB_8789
LB_8788:
	bts QWORD [rdi],1
LB_8789:
	mov r11,r8
	bt r12,2
	jc LB_8794
	btr r12,5
	jmp LB_8795
LB_8794:
	bts r12,5
LB_8795:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_8792
	btr QWORD [rdi],2
	jmp LB_8793
LB_8792:
	bts QWORD [rdi],2
LB_8793:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_8782
	btr QWORD [rdi],0
	jmp LB_8783
LB_8782:
	bts QWORD [rdi],0
LB_8783:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rsi,1
	bt r12,4
	jc LB_8798
	mov rsi,0
	bt r10,0
	jc LB_8798
	jmp LB_8799
LB_8798:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_8799:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_8796
	btr QWORD [rdi],1
	jmp LB_8797
LB_8796:
	bts QWORD [rdi],1
LB_8797:
	mov rsi,1
	bt r12,3
	jc LB_8780
	mov rsi,0
	bt r9,0
	jc LB_8780
	jmp LB_8781
LB_8780:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8781:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_8778
	mov rsi,0
	bt r9,0
	jc LB_8778
	jmp LB_8779
LB_8778:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8779:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8800:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8802
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8801
LB_8802:
	add rsp,8
	ret
LB_8803:
	add rsp,16
	pop r14
LB_8801:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7138:
NS_E_RDI_7138:
NS_E_7138_ETR_TBL:
NS_E_7138_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_8869
LB_8868:
	add r14,1
LB_8869:
	cmp r14,r10
	jge LB_8870
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8868
	cmp al,10
	jz LB_8868
	cmp al,32
	jz LB_8868
LB_8870:
	add r14,1
	cmp r14,r10
	jg LB_8873
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,64
	jnz LB_8873
	jmp LB_8874
LB_8873:
	jmp LB_8834
LB_8874:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_8846
LB_8845:
	add r14,1
LB_8846:
	cmp r14,r10
	jge LB_8847
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8845
	cmp al,10
	jz LB_8845
	cmp al,32
	jz LB_8845
LB_8847:
	add r14,1
	cmp r14,r10
	jg LB_8851
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,46
	jnz LB_8851
	jmp LB_8852
LB_8851:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8849
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8849:
	jmp LB_8835
LB_8852:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_8854
LB_8853:
	add r14,1
LB_8854:
	cmp r14,r10
	jge LB_8855
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8853
	cmp al,10
	jz LB_8853
	cmp al,32
	jz LB_8853
LB_8855:
	push r10
	call NS_E_7139_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8856
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8857
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8857:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8858
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8858:
	jmp LB_8835
LB_8856:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_8861
LB_8860:
	add r14,1
LB_8861:
	cmp r14,r10
	jge LB_8862
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8860
	cmp al,10
	jz LB_8860
	cmp al,32
	jz LB_8860
LB_8862:
	push r10
	call NS_E_7142_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8863
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8864
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8864:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8865
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8865:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8866
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8866:
	jmp LB_8835
LB_8863:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_8843
	btr r12,3
	clc
	jmp LB_8844
LB_8843:
	bts r12,3
	stc
LB_8844:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8841
	btr r12,2
	clc
	jmp LB_8842
LB_8841:
	bts r12,2
	stc
LB_8842:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8839
	btr r12,1
	clc
	jmp LB_8840
LB_8839:
	bts r12,1
	stc
LB_8840:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8837
	btr r12,0
	clc
	jmp LB_8838
LB_8837:
	bts r12,0
	stc
LB_8838:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push 159
	push LB_8831
	push LB_8831
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_8875
	btr r12,4
	jmp LB_8876
LB_8875:
	bts r12,4
LB_8876:
	mov r8,r9
	bt r12,3
	jc LB_8877
	btr r12,2
	jmp LB_8878
LB_8877:
	bts r12,2
LB_8878:
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_8881
	btr r12,3
	clc
	jmp LB_8882
LB_8881:
	bts r12,3
	stc
LB_8882:
	mov r13,r9
	bt r12,3
	jc LB_8879
	btr r12,0
	jmp LB_8880
LB_8879:
	bts r12,0
LB_8880:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_8885
	btr r12,3
	clc
	jmp LB_8886
LB_8885:
	bts r12,3
	stc
LB_8886:
	mov r14,r9
	bt r12,3
	jc LB_8883
	btr r12,1
	jmp LB_8884
LB_8883:
	bts r12,1
LB_8884:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r10,rax
	mov rax,QWORD [rsp+8*3]
	mov r9,rax
	bts r12,3
	bts r12,4
; _cns { %_7318 %_7319 } ⊢ %_7320 : %_7320
 ; {>  %_7318~{ 0' 1' }:{ _stg _p1979 } %_566~3':_r64 %_7319~2':(_lst)◂({ _stg _p1979 }) %_565~4':_r64 }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f1994 %_7320 ⊢ %_7321 : %_7321
 ; {>  %_566~3':_r64 %_7320~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p1979 }) %_565~4':_r64 }
; _f1994 °0◂{ { 0' 1' } 2' } ⊢ °5◂°0◂{ { 0' 1' } 2' }
; _some %_7321 ⊢ %_7322 : %_7322
 ; {>  %_7321~°5◂°0◂{ { 0' 1' } 2' }:_p1976 %_566~3':_r64 %_565~4':_r64 }
; _some °5◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°5◂°0◂{ { 0' 1' } 2' }
; ∎ %_7322
 ; {>  %_7322~°0◂°5◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p1976) %_566~3':_r64 %_565~4':_r64 }
; 	∎ °0◂°5◂°0◂{ { 0' 1' } 2' }
	bt r12,3
	jc LB_8811
	mov rdi,r9
	call dlt
LB_8811:
	bt r12,4
	jc LB_8812
	mov rdi,r10
	call dlt
LB_8812:
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°5◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_8821
	btr r12,5
	jmp LB_8822
LB_8821:
	bts r12,5
LB_8822:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_8819
	btr QWORD [rdi],0
	jmp LB_8820
LB_8819:
	bts QWORD [rdi],0
LB_8820:
	mov r11,r14
	bt r12,1
	jc LB_8825
	btr r12,5
	jmp LB_8826
LB_8825:
	bts r12,5
LB_8826:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_8823
	btr QWORD [rdi],1
	jmp LB_8824
LB_8823:
	bts QWORD [rdi],1
LB_8824:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_8817
	btr QWORD [rdi],0
	jmp LB_8818
LB_8817:
	bts QWORD [rdi],0
LB_8818:
	mov r10,r8
	bt r12,2
	jc LB_8829
	btr r12,4
	jmp LB_8830
LB_8829:
	bts r12,4
LB_8830:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_8827
	btr QWORD [rdi],1
	jmp LB_8828
LB_8827:
	bts QWORD [rdi],1
LB_8828:
	mov rsi,1
	bt r12,3
	jc LB_8815
	mov rsi,0
	bt r9,0
	jc LB_8815
	jmp LB_8816
LB_8815:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8816:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_8813
	mov rsi,0
	bt r9,0
	jc LB_8813
	jmp LB_8814
LB_8813:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8814:
	mov rax,0x0500_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8831:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8833
	pop r14
	jmp LB_8836
LB_8833:
	add rsp,8
	ret
LB_8835:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_8836:
	ret
LB_8834:
	add rsp,64
	pop r14
LB_8832:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_8906
LB_8905:
	add r14,1
LB_8906:
	cmp r14,r10
	jge LB_8907
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8905
	cmp al,10
	jz LB_8905
	cmp al,32
	jz LB_8905
LB_8907:
	push r10
	call NS_E_7139_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8908
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8902
LB_8908:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8903
	btr r12,0
	clc
	jmp LB_8904
LB_8903:
	bts r12,0
	stc
LB_8904:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 160
	push LB_8899
	push LB_8899
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_8910
	btr r12,2
	jmp LB_8911
LB_8910:
	bts r12,2
LB_8911:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_8914
	btr r12,3
	clc
	jmp LB_8915
LB_8914:
	bts r12,3
	stc
LB_8915:
	mov r13,r9
	bt r12,3
	jc LB_8912
	btr r12,0
	jmp LB_8913
LB_8912:
	bts r12,0
LB_8913:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_8918
	btr r12,3
	clc
	jmp LB_8919
LB_8918:
	bts r12,3
	stc
LB_8919:
	mov r14,r9
	bt r12,3
	jc LB_8916
	btr r12,1
	jmp LB_8917
LB_8916:
	bts r12,1
LB_8917:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _f1993 %_7323 ⊢ %_7324 : %_7324
 ; {>  %_570~2':_r64 %_7323~{ 0' 1' }:{ _stg _p1979 } %_569~3':_r64 }
; _f1993 { 0' 1' } ⊢ °4◂{ 0' 1' }
; _some %_7324 ⊢ %_7325 : %_7325
 ; {>  %_7324~°4◂{ 0' 1' }:_p1976 %_570~2':_r64 %_569~3':_r64 }
; _some °4◂{ 0' 1' } ⊢ °0◂°4◂{ 0' 1' }
; ∎ %_7325
 ; {>  %_7325~°0◂°4◂{ 0' 1' }:(_opn)◂(_p1976) %_570~2':_r64 %_569~3':_r64 }
; 	∎ °0◂°4◂{ 0' 1' }
	bt r12,2
	jc LB_8887
	mov rdi,r8
	call dlt
LB_8887:
	bt r12,3
	jc LB_8888
	mov rdi,r9
	call dlt
LB_8888:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°4◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_8893
	btr r12,2
	jmp LB_8894
LB_8893:
	bts r12,2
LB_8894:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_8891
	btr QWORD [rdi],0
	jmp LB_8892
LB_8891:
	bts QWORD [rdi],0
LB_8892:
	mov r8,r14
	bt r12,1
	jc LB_8897
	btr r12,2
	jmp LB_8898
LB_8897:
	bts r12,2
LB_8898:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_8895
	btr QWORD [rdi],1
	jmp LB_8896
LB_8895:
	bts QWORD [rdi],1
LB_8896:
	mov rsi,1
	bt r12,3
	jc LB_8889
	mov rsi,0
	bt r9,0
	jc LB_8889
	jmp LB_8890
LB_8889:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8890:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8899:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8901
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8900
LB_8901:
	add rsp,8
	ret
LB_8902:
	add rsp,16
	pop r14
LB_8900:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 161
	push LB_8932
	push LB_8932
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; 	» "dt_etr 0" _ ⊢ 2' : %_7326
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_30_20_72_74_65_5f_74_64
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r8,rdi
	btr r12,2
; _f38 %_7326 ⊢ %_7327 : %_7327
 ; {>  %_573~1':_r64 %_574~0':_r64 %_7326~2':_stg }
; _f38 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_8924
	btr r12,0
	jmp LB_8925
LB_8924:
	bts r12,0
LB_8925:
	push -1
	push LB_8928
	call NS_E_38
LB_8928:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_8926
	btr r12,2
	jmp LB_8927
LB_8926:
	bts r12,2
LB_8927:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_8922
	btr r12,1
	clc
	jmp LB_8923
LB_8922:
	bts r12,1
	stc
LB_8923:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_8920
	btr r12,0
	clc
	jmp LB_8921
LB_8920:
	bts r12,0
	stc
LB_8921:
	add rsp,24
; _none {  } ⊢ %_7328 : %_7328
 ; {>  %_573~1':_r64 %_574~0':_r64 %_7327~2':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_7328
 ; {>  %_573~1':_r64 %_574~0':_r64 %_7328~°1◂{  }:(_opn)◂(t3289'(0)) %_7327~2':_stg }
; 	∎ °1◂{  }
	bt r12,1
	jc LB_8929
	mov rdi,r14
	call dlt
LB_8929:
	bt r12,0
	jc LB_8930
	mov rdi,r13
	call dlt
LB_8930:
	bt r12,2
	jc LB_8931
	mov rdi,r8
	call dlt
LB_8931:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_8932:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8934
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8933
LB_8934:
	add rsp,8
	ret
LB_8935:
	add rsp,0
	pop r14
LB_8933:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7139:
NS_E_RDI_7139:
NS_E_7139_ETR_TBL:
NS_E_7139_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; word
	jmp LB_8972
LB_8971:
	add r14,1
LB_8972:
	cmp r14,r10
	jge LB_8973
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8971
	cmp al,10
	jz LB_8971
	cmp al,32
	jz LB_8971
LB_8973:
	push r10
	call NS_E_1677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8974
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8952
LB_8974:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_8977
LB_8976:
	add r14,1
LB_8977:
	cmp r14,r10
	jge LB_8978
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8976
	cmp al,10
	jz LB_8976
	cmp al,32
	jz LB_8976
LB_8978:
	push r10
	call NS_E_7141_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8979
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8980
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8980:
	jmp LB_8952
LB_8979:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_8983
LB_8982:
	add r14,1
LB_8983:
	cmp r14,r10
	jge LB_8984
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8982
	cmp al,10
	jz LB_8982
	cmp al,32
	jz LB_8982
LB_8984:
	add r14,1
	cmp r14,r10
	jg LB_8989
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,61
	jnz LB_8989
	jmp LB_8990
LB_8989:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8986
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8986:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8987
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8987:
	jmp LB_8952
LB_8990:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_8964
LB_8963:
	add r14,1
LB_8964:
	cmp r14,r10
	jge LB_8965
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8963
	cmp al,10
	jz LB_8963
	cmp al,32
	jz LB_8963
LB_8965:
	push r10
	call NS_E_6122_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8966
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8967
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8967:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8968
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8968:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8969
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8969:
	jmp LB_8953
LB_8966:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_8961
	btr r12,3
	clc
	jmp LB_8962
LB_8961:
	bts r12,3
	stc
LB_8962:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8959
	btr r12,2
	clc
	jmp LB_8960
LB_8959:
	bts r12,2
	stc
LB_8960:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8957
	btr r12,1
	clc
	jmp LB_8958
LB_8957:
	bts r12,1
	stc
LB_8958:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8955
	btr r12,0
	clc
	jmp LB_8956
LB_8955:
	bts r12,0
	stc
LB_8956:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push 162
	push LB_8949
	push LB_8949
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_8991
	btr r12,4
	jmp LB_8992
LB_8991:
	bts r12,4
LB_8992:
	mov r8,r9
	bt r12,3
	jc LB_8993
	btr r12,2
	jmp LB_8994
LB_8993:
	bts r12,2
LB_8994:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r10,rax
	mov rax,QWORD [rsp+8*3]
	mov r9,rax
	bts r12,3
	bts r12,4
; _f2001 %_7331 ⊢ %_7332 : %_7332
 ; {>  %_7331~2':_p1988 %_578~3':_r64 %_7329~0':_stg %_7330~1':_p7140 %_577~4':_r64 }
; _f2001 2' ⊢ °1◂2'
; _some { %_7329 %_7332 } ⊢ %_7333 : %_7333
 ; {>  %_7332~°1◂2':_p1979 %_578~3':_r64 %_7329~0':_stg %_7330~1':_p7140 %_577~4':_r64 }
; _some { 0' °1◂2' } ⊢ °0◂{ 0' °1◂2' }
; ∎ %_7333
 ; {>  %_578~3':_r64 %_7333~°0◂{ 0' °1◂2' }:(_opn)◂({ _stg _p1979 }) %_7330~1':_p7140 %_577~4':_r64 }
; 	∎ °0◂{ 0' °1◂2' }
	bt r12,3
	jc LB_8936
	mov rdi,r9
	call dlt
LB_8936:
	bt r12,1
	jc LB_8937
	mov rdi,r14
	call dlt
LB_8937:
	bt r12,4
	jc LB_8938
	mov rdi,r10
	call dlt
LB_8938:
; _emt_mov_ptn_to_ptn:{| 1010.. |},°0◂{ 0' °1◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_8941
	btr r12,1
	jmp LB_8942
LB_8941:
	bts r12,1
LB_8942:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_8939
	btr QWORD [rdi],0
	jmp LB_8940
LB_8939:
	bts QWORD [rdi],0
LB_8940:
	mov r14,r8
	bt r12,2
	jc LB_8947
	btr r12,1
	jmp LB_8948
LB_8947:
	bts r12,1
LB_8948:
	mov rsi,1
	bt r12,1
	jc LB_8945
	mov rsi,0
	bt r14,0
	jc LB_8945
	jmp LB_8946
LB_8945:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_8946:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_8943
	btr QWORD [rdi],1
	jmp LB_8944
LB_8943:
	bts QWORD [rdi],1
LB_8944:
	mov r8,0
	bts r12,2
	ret
LB_8949:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8951
	pop r14
	jmp LB_8954
LB_8951:
	add rsp,8
	ret
LB_8953:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_8954:
	ret
LB_8952:
	add rsp,64
	pop r14
LB_8950:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,128
; word
	jmp LB_9046
LB_9045:
	add r14,1
LB_9046:
	cmp r14,r10
	jge LB_9047
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9045
	cmp al,10
	jz LB_9045
	cmp al,32
	jz LB_9045
LB_9047:
	push r10
	call NS_E_1677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9048
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9028
LB_9048:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_9051
LB_9050:
	add r14,1
LB_9051:
	cmp r14,r10
	jge LB_9052
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9050
	cmp al,10
	jz LB_9050
	cmp al,32
	jz LB_9050
LB_9052:
	push r10
	call NS_E_7141_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9053
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9054
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9054:
	jmp LB_9028
LB_9053:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; nls
	jmp LB_9057
LB_9056:
	add r14,1
LB_9057:
	cmp r14,r10
	jge LB_9058
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9056
	cmp al,10
	jz LB_9056
	cmp al,32
	jz LB_9056
LB_9058:
	push r10
	call NS_E_6471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9059
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9060
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9060:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9061
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9061:
	jmp LB_9028
LB_9059:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\136\144"
	jmp LB_9064
LB_9063:
	add r14,1
LB_9064:
	cmp r14,r10
	jge LB_9065
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9063
	cmp al,10
	jz LB_9063
	cmp al,32
	jz LB_9063
LB_9065:
	add r14,3
	cmp r14,r10
	jg LB_9071
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_9071
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,136
	jnz LB_9071
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,144
	jnz LB_9071
	jmp LB_9072
LB_9071:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9067
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9067:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9068
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9068:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9069
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9069:
	jmp LB_9028
LB_9072:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; word
	jmp LB_9074
LB_9073:
	add r14,1
LB_9074:
	cmp r14,r10
	jge LB_9075
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9073
	cmp al,10
	jz LB_9073
	cmp al,32
	jz LB_9073
LB_9075:
	push r10
	call NS_E_1677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9076
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_9077
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_9077:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9078
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9078:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9079
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9079:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9080
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9080:
	jmp LB_9028
LB_9076:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; ":"
	jmp LB_9083
LB_9082:
	add r14,1
LB_9083:
	cmp r14,r10
	jge LB_9084
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9082
	cmp al,10
	jz LB_9082
	cmp al,32
	jz LB_9082
LB_9084:
	add r14,1
	cmp r14,r10
	jg LB_9092
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,58
	jnz LB_9092
	jmp LB_9093
LB_9092:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_9086
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_9086:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_9087
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_9087:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9088
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9088:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9089
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9089:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9090
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9090:
	jmp LB_9028
LB_9093:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rax
; type
	jmp LB_9095
LB_9094:
	add r14,1
LB_9095:
	cmp r14,r10
	jge LB_9096
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9094
	cmp al,10
	jz LB_9094
	cmp al,32
	jz LB_9094
LB_9096:
	push r10
	call NS_E_6122_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9097
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_9098
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_9098:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_9099
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_9099:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_9100
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_9100:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9101
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9101:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9102
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9102:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9103
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9103:
	jmp LB_9028
LB_9097:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*6],rax
	mov QWORD [rsp+8*1+16*6],r9
; dt_etr_coprd
	jmp LB_9106
LB_9105:
	add r14,1
LB_9106:
	cmp r14,r10
	jge LB_9107
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9105
	cmp al,10
	jz LB_9105
	cmp al,32
	jz LB_9105
LB_9107:
	push r10
	call NS_E_7143_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9108
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*6]
	bt rsi,0
	jc LB_9109
	mov rdi,QWORD [rsp+16*6+8*1]
	call dlt
LB_9109:
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_9110
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_9110:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_9111
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_9111:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_9112
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_9112:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9113
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9113:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9114
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9114:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9115
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9115:
	jmp LB_9028
LB_9108:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*7],rax
	mov QWORD [rsp+8*1+16*7],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*7]
	bt rax,0
	jc LB_9043
	btr r12,7
	clc
	jmp LB_9044
LB_9043:
	bts r12,7
	stc
LB_9044:
	mov rax,QWORD [rsp+16*7+8*1]
	mov rdx,rax
	mov rax,QWORD [rsp+16*6]
	bt rax,0
	jc LB_9041
	btr r12,6
	clc
	jmp LB_9042
LB_9041:
	bts r12,6
	stc
LB_9042:
	mov rax,QWORD [rsp+16*6+8*1]
	mov rcx,rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_9039
	btr r12,5
	clc
	jmp LB_9040
LB_9039:
	bts r12,5
	stc
LB_9040:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_9037
	btr r12,4
	clc
	jmp LB_9038
LB_9037:
	bts r12,4
	stc
LB_9038:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_9035
	btr r12,3
	clc
	jmp LB_9036
LB_9035:
	bts r12,3
	stc
LB_9036:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9033
	btr r12,2
	clc
	jmp LB_9034
LB_9033:
	bts r12,2
	stc
LB_9034:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9031
	btr r12,1
	clc
	jmp LB_9032
LB_9031:
	bts r12,1
	stc
LB_9032:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9029
	btr r12,0
	clc
	jmp LB_9030
LB_9029:
	bts r12,0
	stc
LB_9030:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,128
	push rdi
	push rsi
	push 163
	push LB_9025
	push LB_9025
; _emt_mov_ptn_to_ptn:{| 111111110.. |},{ 0' 1' 2' 3' 4' 5' 6' 7' } ⊢ { 0' 1' 2' {  } 3' {  } 4' 5' }
	mov rdi,r11
	mov QWORD [st_vct+8*8],rdi
	bt r12,5
	jc LB_9117
	btr r12,8
	jmp LB_9118
LB_9117:
	bts r12,8
LB_9118:
	mov r11,rdx
	bt r12,7
	jc LB_9119
	btr r12,5
	jmp LB_9120
LB_9119:
	bts r12,5
LB_9120:
	mov rdx,r10
	bt r12,4
	jc LB_9121
	btr r12,7
	jmp LB_9122
LB_9121:
	bts r12,7
LB_9122:
	mov r10,rcx
	bt r12,6
	jc LB_9123
	btr r12,4
	jmp LB_9124
LB_9123:
	bts r12,4
LB_9124:
	mov rcx,r9
	bt r12,3
	jc LB_9125
	btr r12,6
	jmp LB_9126
LB_9125:
	bts r12,6
LB_9126:
	mov r9,rdx
	bt r12,7
	jc LB_9127
	btr r12,3
	jmp LB_9128
LB_9127:
	bts r12,3
LB_9128:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 8' ⊢ {  }
	mov rdi,QWORD [st_vct+8*8]
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov rdx,rax
	mov rax,QWORD [rsp+8*3]
	mov rcx,rax
	bts r12,6
	bts r12,7
; _cns { { %_7337 %_7338 } %_7339 } ⊢ %_7340 : %_7340
 ; {>  %_7335~1':_p7140 %_7338~4':_p1988 %_7337~3':_stg %_7334~0':_stg %_581~7':_r64 %_7339~5':(_lst)◂({ _stg _p1988 }) %_7336~2':(_p5062)◂({ }) %_582~6':_r64 }
; _cns { { 3' 4' } 5' } ⊢ °0◂{ { 3' 4' } 5' }
; _f2000 %_7340 ⊢ %_7341 : %_7341
 ; {>  %_7335~1':_p7140 %_7334~0':_stg %_581~7':_r64 %_7336~2':(_p5062)◂({ }) %_582~6':_r64 %_7340~°0◂{ { 3' 4' } 5' }:(_lst)◂({ _stg _p1988 }) }
; _f2000 °0◂{ { 3' 4' } 5' } ⊢ °0◂°0◂{ { 3' 4' } 5' }
; _some { %_7334 %_7341 } ⊢ %_7342 : %_7342
 ; {>  %_7335~1':_p7140 %_7334~0':_stg %_581~7':_r64 %_7336~2':(_p5062)◂({ }) %_582~6':_r64 %_7341~°0◂°0◂{ { 3' 4' } 5' }:_p1979 }
; _some { 0' °0◂°0◂{ { 3' 4' } 5' } } ⊢ °0◂{ 0' °0◂°0◂{ { 3' 4' } 5' } }
; ∎ %_7342
 ; {>  %_7335~1':_p7140 %_581~7':_r64 %_7336~2':(_p5062)◂({ }) %_7342~°0◂{ 0' °0◂°0◂{ { 3' 4' } 5' } }:(_opn)◂({ _stg _p1979 }) %_582~6':_r64 }
; 	∎ °0◂{ 0' °0◂°0◂{ { 3' 4' } 5' } }
	bt r12,1
	jc LB_8995
	mov rdi,r14
	call dlt
LB_8995:
	bt r12,7
	jc LB_8996
	mov rdi,rdx
	call dlt
LB_8996:
	bt r12,2
	jc LB_8997
	mov rdi,r8
	call dlt
LB_8997:
	bt r12,6
	jc LB_8998
	mov rdi,rcx
	call dlt
LB_8998:
; _emt_mov_ptn_to_ptn:{| 1001110.. |},°0◂{ 0' °0◂°0◂{ { 3' 4' } 5' } } ⊢ 2'◂3'
	mov r14,r9
	bt r12,3
	jc LB_8999
	btr r12,1
	jmp LB_9000
LB_8999:
	bts r12,1
LB_9000:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_9003
	btr r12,2
	jmp LB_9004
LB_9003:
	bts r12,2
LB_9004:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_9001
	btr QWORD [rdi],0
	jmp LB_9002
LB_9001:
	bts QWORD [rdi],0
LB_9002:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rcx,r14
	bt r12,1
	jc LB_9015
	btr r12,6
	jmp LB_9016
LB_9015:
	bts r12,6
LB_9016:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_9013
	btr QWORD [rdi],0
	jmp LB_9014
LB_9013:
	bts QWORD [rdi],0
LB_9014:
	mov rcx,r10
	bt r12,4
	jc LB_9019
	btr r12,6
	jmp LB_9020
LB_9019:
	bts r12,6
LB_9020:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_9017
	btr QWORD [rdi],1
	jmp LB_9018
LB_9017:
	bts QWORD [rdi],1
LB_9018:
	mov rdi,r8
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_9011
	btr QWORD [rdi],0
	jmp LB_9012
LB_9011:
	bts QWORD [rdi],0
LB_9012:
	mov r13,r11
	bt r12,5
	jc LB_9023
	btr r12,0
	jmp LB_9024
LB_9023:
	bts r12,0
LB_9024:
	mov rdi,r8
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_9021
	btr QWORD [rdi],1
	jmp LB_9022
LB_9021:
	bts QWORD [rdi],1
LB_9022:
	mov rsi,1
	bt r12,2
	jc LB_9009
	mov rsi,0
	bt r8,0
	jc LB_9009
	jmp LB_9010
LB_9009:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9010:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_9007
	mov rsi,0
	bt r8,0
	jc LB_9007
	jmp LB_9008
LB_9007:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_9008:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_9005
	btr QWORD [rdi],1
	jmp LB_9006
LB_9005:
	bts QWORD [rdi],1
LB_9006:
	mov r8,0
	bts r12,2
	ret
LB_9025:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9027
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9026
LB_9027:
	add rsp,8
	ret
LB_9028:
	add rsp,128
	pop r14
LB_9026:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7141:
NS_E_RDI_7141:
NS_E_7141_ETR_TBL:
NS_E_7141_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\151\130"
	jmp LB_9143
LB_9142:
	add r14,1
LB_9143:
	cmp r14,r10
	jge LB_9144
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9142
	cmp al,10
	jz LB_9142
	cmp al,32
	jz LB_9142
LB_9144:
	add r14,3
	cmp r14,r10
	jg LB_9147
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_9147
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,151
	jnz LB_9147
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,130
	jnz LB_9147
	jmp LB_9148
LB_9147:
	jmp LB_9129
LB_9148:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; var
	jmp LB_9137
LB_9136:
	add r14,1
LB_9137:
	cmp r14,r10
	jge LB_9138
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9136
	cmp al,10
	jz LB_9136
	cmp al,32
	jz LB_9136
LB_9138:
	push r10
	call NS_E_6126_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9139
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9140
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9140:
	jmp LB_9130
LB_9139:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9133
	btr QWORD [rdi],1
LB_9133:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9134
	btr QWORD [rdi],0
LB_9134:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_9130:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_9129:
	add rsp,32
	pop r14
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_9131:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7142:
NS_E_RDI_7142:
NS_E_7142_ETR_TBL:
NS_E_7142_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; nls
	jmp LB_9213
LB_9212:
	add r14,1
LB_9213:
	cmp r14,r10
	jge LB_9214
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9212
	cmp al,10
	jz LB_9212
	cmp al,32
	jz LB_9212
LB_9214:
	push r10
	call NS_E_6471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9215
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9173
LB_9215:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "@"
	jmp LB_9218
LB_9217:
	add r14,1
LB_9218:
	cmp r14,r10
	jge LB_9219
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9217
	cmp al,10
	jz LB_9217
	cmp al,32
	jz LB_9217
LB_9219:
	add r14,1
	cmp r14,r10
	jg LB_9223
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,64
	jnz LB_9223
	jmp LB_9224
LB_9223:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9221
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9221:
	jmp LB_9173
LB_9224:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "."
	jmp LB_9187
LB_9186:
	add r14,1
LB_9187:
	cmp r14,r10
	jge LB_9188
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9186
	cmp al,10
	jz LB_9186
	cmp al,32
	jz LB_9186
LB_9188:
	add r14,1
	cmp r14,r10
	jg LB_9193
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,46
	jnz LB_9193
	jmp LB_9194
LB_9193:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9190
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9190:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9191
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9191:
	jmp LB_9174
LB_9194:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dt_etr_body
	jmp LB_9196
LB_9195:
	add r14,1
LB_9196:
	cmp r14,r10
	jge LB_9197
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9195
	cmp al,10
	jz LB_9195
	cmp al,32
	jz LB_9195
LB_9197:
	push r10
	call NS_E_7139_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9198
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9199
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9199:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9200
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9200:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9201
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9201:
	jmp LB_9174
LB_9198:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; qlq_dt_etr
	jmp LB_9204
LB_9203:
	add r14,1
LB_9204:
	cmp r14,r10
	jge LB_9205
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9203
	cmp al,10
	jz LB_9203
	cmp al,32
	jz LB_9203
LB_9205:
	push r10
	call NS_E_7142_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9206
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_9207
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_9207:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9208
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9208:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9209
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9209:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9210
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9210:
	jmp LB_9174
LB_9206:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_9184
	btr r12,4
	clc
	jmp LB_9185
LB_9184:
	bts r12,4
	stc
LB_9185:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_9182
	btr r12,3
	clc
	jmp LB_9183
LB_9182:
	bts r12,3
	stc
LB_9183:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9180
	btr r12,2
	clc
	jmp LB_9181
LB_9180:
	bts r12,2
	stc
LB_9181:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9178
	btr r12,1
	clc
	jmp LB_9179
LB_9178:
	bts r12,1
	stc
LB_9179:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9176
	btr r12,0
	clc
	jmp LB_9177
LB_9176:
	bts r12,0
	stc
LB_9177:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push 164
	push LB_9170
	push LB_9170
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' {  } {  } { 1' 2' } 3' }
	mov r11,r9
	bt r12,3
	jc LB_9225
	btr r12,5
	jmp LB_9226
LB_9225:
	bts r12,5
LB_9226:
	mov r9,r10
	bt r12,4
	jc LB_9227
	btr r12,3
	jmp LB_9228
LB_9227:
	bts r12,3
LB_9228:
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ { 1' 2' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_9231
	btr r12,4
	clc
	jmp LB_9232
LB_9231:
	bts r12,4
	stc
LB_9232:
	mov r14,r10
	bt r12,4
	jc LB_9229
	btr r12,1
	jmp LB_9230
LB_9229:
	bts r12,1
LB_9230:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_9235
	btr r12,4
	clc
	jmp LB_9236
LB_9235:
	bts r12,4
	stc
LB_9236:
	mov r8,r10
	bt r12,4
	jc LB_9233
	btr r12,2
	jmp LB_9234
LB_9233:
	bts r12,2
LB_9234:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r11,rax
	mov rax,QWORD [rsp+8*3]
	mov r10,rax
	bts r12,4
	bts r12,5
; _cns { %_7346 %_7347 } ⊢ %_7348 : %_7348
 ; {>  %_7347~3':(_lst)◂({ _stg _p1979 }) %_586~4':_r64 %_7346~{ 1' 2' }:{ _stg _p1979 } %_585~5':_r64 %_7345~0':(_p5062)◂({ }) }
; _cns { { 1' 2' } 3' } ⊢ °0◂{ { 1' 2' } 3' }
; _some %_7348 ⊢ %_7349 : %_7349
 ; {>  %_7348~°0◂{ { 1' 2' } 3' }:(_lst)◂({ _stg _p1979 }) %_586~4':_r64 %_585~5':_r64 %_7345~0':(_p5062)◂({ }) }
; _some °0◂{ { 1' 2' } 3' } ⊢ °0◂°0◂{ { 1' 2' } 3' }
; ∎ %_7349
 ; {>  %_7349~°0◂°0◂{ { 1' 2' } 3' }:(_opn)◂((_lst)◂({ _stg _p1979 })) %_586~4':_r64 %_585~5':_r64 %_7345~0':(_p5062)◂({ }) }
; 	∎ °0◂°0◂{ { 1' 2' } 3' }
	bt r12,4
	jc LB_9149
	mov rdi,r10
	call dlt
LB_9149:
	bt r12,5
	jc LB_9150
	mov rdi,r11
	call dlt
LB_9150:
	bt r12,0
	jc LB_9151
	mov rdi,r13
	call dlt
LB_9151:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂°0◂{ { 1' 2' } 3' } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_9152
	btr r12,0
	jmp LB_9153
LB_9152:
	bts r12,0
LB_9153:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r14
	bt r12,1
	jc LB_9160
	btr r12,5
	jmp LB_9161
LB_9160:
	bts r12,5
LB_9161:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_9158
	btr QWORD [rdi],0
	jmp LB_9159
LB_9158:
	bts QWORD [rdi],0
LB_9159:
	mov r11,r8
	bt r12,2
	jc LB_9164
	btr r12,5
	jmp LB_9165
LB_9164:
	bts r12,5
LB_9165:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_9162
	btr QWORD [rdi],1
	jmp LB_9163
LB_9162:
	bts QWORD [rdi],1
LB_9163:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_9156
	btr QWORD [rdi],0
	jmp LB_9157
LB_9156:
	bts QWORD [rdi],0
LB_9157:
	mov r10,r13
	bt r12,0
	jc LB_9168
	btr r12,4
	jmp LB_9169
LB_9168:
	bts r12,4
LB_9169:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_9166
	btr QWORD [rdi],1
	jmp LB_9167
LB_9166:
	bts QWORD [rdi],1
LB_9167:
	mov rsi,1
	bt r12,3
	jc LB_9154
	mov rsi,0
	bt r9,0
	jc LB_9154
	jmp LB_9155
LB_9154:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9155:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9170:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9172
	pop r14
	jmp LB_9175
LB_9172:
	add rsp,8
	ret
LB_9174:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_9175:
	ret
LB_9173:
	add rsp,80
	pop r14
LB_9171:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 165
	push LB_9241
	push LB_9241
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_7350 : %_7350
 ; {>  %_589~1':_r64 %_590~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _some %_7350 ⊢ %_7351 : %_7351
 ; {>  %_589~1':_r64 %_590~0':_r64 %_7350~°1◂{  }:(_lst)◂(t3317'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_7351
 ; {>  %_589~1':_r64 %_7351~°0◂°1◂{  }:(_opn)◂((_lst)◂(t3320'(0))) %_590~0':_r64 }
; 	∎ °0◂°1◂{  }
	bt r12,1
	jc LB_9237
	mov rdi,r14
	call dlt
LB_9237:
	bt r12,0
	jc LB_9238
	mov rdi,r13
	call dlt
LB_9238:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_9239
	mov rsi,0
	bt r9,0
	jc LB_9239
	jmp LB_9240
LB_9239:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9240:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9241:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9243
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9242
LB_9243:
	add rsp,8
	ret
LB_9244:
	add rsp,0
	pop r14
LB_9242:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7143:
NS_E_RDI_7143:
NS_E_7143_ETR_TBL:
NS_E_7143_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; nls
	jmp LB_9321
LB_9320:
	add r14,1
LB_9321:
	cmp r14,r10
	jge LB_9322
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9320
	cmp al,10
	jz LB_9320
	cmp al,32
	jz LB_9320
LB_9322:
	push r10
	call NS_E_6471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9323
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9269
LB_9323:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\136\144"
	jmp LB_9326
LB_9325:
	add r14,1
LB_9326:
	cmp r14,r10
	jge LB_9327
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9325
	cmp al,10
	jz LB_9325
	cmp al,32
	jz LB_9325
LB_9327:
	add r14,3
	cmp r14,r10
	jg LB_9331
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_9331
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,136
	jnz LB_9331
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,144
	jnz LB_9331
	jmp LB_9332
LB_9331:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9329
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9329:
	jmp LB_9269
LB_9332:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_9285
LB_9284:
	add r14,1
LB_9285:
	cmp r14,r10
	jge LB_9286
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9284
	cmp al,10
	jz LB_9284
	cmp al,32
	jz LB_9284
LB_9286:
	push r10
	call NS_E_1677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9287
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9288
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9288:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9289
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9289:
	jmp LB_9270
LB_9287:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; ":"
	jmp LB_9292
LB_9291:
	add r14,1
LB_9292:
	cmp r14,r10
	jge LB_9293
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9291
	cmp al,10
	jz LB_9291
	cmp al,32
	jz LB_9291
LB_9293:
	add r14,1
	cmp r14,r10
	jg LB_9299
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,58
	jnz LB_9299
	jmp LB_9300
LB_9299:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9295
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9295:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9296
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9296:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9297
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9297:
	jmp LB_9270
LB_9300:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; type
	jmp LB_9302
LB_9301:
	add r14,1
LB_9302:
	cmp r14,r10
	jge LB_9303
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9301
	cmp al,10
	jz LB_9301
	cmp al,32
	jz LB_9301
LB_9303:
	push r10
	call NS_E_6122_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9304
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_9305
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_9305:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9306
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9306:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9307
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9307:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9308
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9308:
	jmp LB_9270
LB_9304:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; dt_etr_coprd
	jmp LB_9311
LB_9310:
	add r14,1
LB_9311:
	cmp r14,r10
	jge LB_9312
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9310
	cmp al,10
	jz LB_9310
	cmp al,32
	jz LB_9310
LB_9312:
	push r10
	call NS_E_7143_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9313
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_9314
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_9314:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_9315
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_9315:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9316
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9316:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9317
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9317:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9318
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9318:
	jmp LB_9270
LB_9313:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_9282
	btr r12,5
	clc
	jmp LB_9283
LB_9282:
	bts r12,5
	stc
LB_9283:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_9280
	btr r12,4
	clc
	jmp LB_9281
LB_9280:
	bts r12,4
	stc
LB_9281:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_9278
	btr r12,3
	clc
	jmp LB_9279
LB_9278:
	bts r12,3
	stc
LB_9279:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9276
	btr r12,2
	clc
	jmp LB_9277
LB_9276:
	bts r12,2
	stc
LB_9277:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9274
	btr r12,1
	clc
	jmp LB_9275
LB_9274:
	bts r12,1
	stc
LB_9275:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9272
	btr r12,0
	clc
	jmp LB_9273
LB_9272:
	bts r12,0
	stc
LB_9273:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push 166
	push LB_9266
	push LB_9266
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_9333
	btr r12,6
	jmp LB_9334
LB_9333:
	bts r12,6
LB_9334:
	mov r9,r11
	bt r12,5
	jc LB_9335
	btr r12,3
	jmp LB_9336
LB_9335:
	bts r12,3
LB_9336:
	mov r11,r8
	bt r12,2
	jc LB_9337
	btr r12,5
	jmp LB_9338
LB_9337:
	bts r12,5
LB_9338:
	mov r8,r10
	bt r12,4
	jc LB_9339
	btr r12,2
	jmp LB_9340
LB_9339:
	bts r12,2
LB_9340:
	mov r10,r14
	bt r12,1
	jc LB_9341
	btr r12,4
	jmp LB_9342
LB_9341:
	bts r12,4
LB_9342:
	mov r14,r11
	bt r12,5
	jc LB_9343
	btr r12,1
	jmp LB_9344
LB_9343:
	bts r12,1
LB_9344:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r11,rax
	mov rax,QWORD [rsp+8*3]
	mov r10,rax
	bts r12,4
	bts r12,5
; _cns { { %_7353 %_7354 } %_7355 } ⊢ %_7356 : %_7356
 ; {>  %_594~4':_r64 %_593~5':_r64 %_7353~1':_stg %_7354~2':_p1988 %_7352~0':(_p5062)◂({ }) %_7355~3':(_lst)◂({ _stg _p1988 }) }
; _cns { { 1' 2' } 3' } ⊢ °0◂{ { 1' 2' } 3' }
; _some %_7356 ⊢ %_7357 : %_7357
 ; {>  %_594~4':_r64 %_593~5':_r64 %_7352~0':(_p5062)◂({ }) %_7356~°0◂{ { 1' 2' } 3' }:(_lst)◂({ _stg _p1988 }) }
; _some °0◂{ { 1' 2' } 3' } ⊢ °0◂°0◂{ { 1' 2' } 3' }
; ∎ %_7357
 ; {>  %_7357~°0◂°0◂{ { 1' 2' } 3' }:(_opn)◂((_lst)◂({ _stg _p1988 })) %_594~4':_r64 %_593~5':_r64 %_7352~0':(_p5062)◂({ }) }
; 	∎ °0◂°0◂{ { 1' 2' } 3' }
	bt r12,4
	jc LB_9245
	mov rdi,r10
	call dlt
LB_9245:
	bt r12,5
	jc LB_9246
	mov rdi,r11
	call dlt
LB_9246:
	bt r12,0
	jc LB_9247
	mov rdi,r13
	call dlt
LB_9247:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂°0◂{ { 1' 2' } 3' } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_9248
	btr r12,0
	jmp LB_9249
LB_9248:
	bts r12,0
LB_9249:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r14
	bt r12,1
	jc LB_9256
	btr r12,5
	jmp LB_9257
LB_9256:
	bts r12,5
LB_9257:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_9254
	btr QWORD [rdi],0
	jmp LB_9255
LB_9254:
	bts QWORD [rdi],0
LB_9255:
	mov r11,r8
	bt r12,2
	jc LB_9260
	btr r12,5
	jmp LB_9261
LB_9260:
	bts r12,5
LB_9261:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_9258
	btr QWORD [rdi],1
	jmp LB_9259
LB_9258:
	bts QWORD [rdi],1
LB_9259:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_9252
	btr QWORD [rdi],0
	jmp LB_9253
LB_9252:
	bts QWORD [rdi],0
LB_9253:
	mov r10,r13
	bt r12,0
	jc LB_9264
	btr r12,4
	jmp LB_9265
LB_9264:
	bts r12,4
LB_9265:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_9262
	btr QWORD [rdi],1
	jmp LB_9263
LB_9262:
	bts QWORD [rdi],1
LB_9263:
	mov rsi,1
	bt r12,3
	jc LB_9250
	mov rsi,0
	bt r9,0
	jc LB_9250
	jmp LB_9251
LB_9250:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9251:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9266:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9268
	pop r14
	jmp LB_9271
LB_9268:
	add rsp,8
	ret
LB_9270:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_9271:
	ret
LB_9269:
	add rsp,96
	pop r14
LB_9267:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 167
	push LB_9349
	push LB_9349
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_7358 : %_7358
 ; {>  %_598~0':_r64 %_597~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; _some %_7358 ⊢ %_7359 : %_7359
 ; {>  %_7358~°1◂{  }:(_lst)◂(t3332'(0)) %_598~0':_r64 %_597~1':_r64 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_7359
 ; {>  %_598~0':_r64 %_597~1':_r64 %_7359~°0◂°1◂{  }:(_opn)◂((_lst)◂(t3335'(0))) }
; 	∎ °0◂°1◂{  }
	bt r12,0
	jc LB_9345
	mov rdi,r13
	call dlt
LB_9345:
	bt r12,1
	jc LB_9346
	mov rdi,r14
	call dlt
LB_9346:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_9347
	mov rsi,0
	bt r9,0
	jc LB_9347
	jmp LB_9348
LB_9347:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9348:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9349:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9351
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9350
LB_9351:
	add rsp,8
	ret
LB_9352:
	add rsp,0
	pop r14
LB_9350:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7144:
NS_E_RDI_7144:
NS_E_7144_ETR_TBL:
NS_E_7144_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,112
; nls
	jmp LB_9460
LB_9459:
	add r14,1
LB_9460:
	cmp r14,r10
	jge LB_9461
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9459
	cmp al,10
	jz LB_9459
	cmp al,32
	jz LB_9459
LB_9461:
	push r10
	call NS_E_6471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9462
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9400
LB_9462:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "@"
	jmp LB_9465
LB_9464:
	add r14,1
LB_9465:
	cmp r14,r10
	jge LB_9466
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9464
	cmp al,10
	jz LB_9464
	cmp al,32
	jz LB_9464
LB_9466:
	add r14,1
	cmp r14,r10
	jg LB_9470
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,64
	jnz LB_9470
	jmp LB_9471
LB_9470:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9468
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9468:
	jmp LB_9400
LB_9471:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "."
	jmp LB_9418
LB_9417:
	add r14,1
LB_9418:
	cmp r14,r10
	jge LB_9419
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9417
	cmp al,10
	jz LB_9417
	cmp al,32
	jz LB_9417
LB_9419:
	add r14,1
	cmp r14,r10
	jg LB_9424
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,46
	jnz LB_9424
	jmp LB_9425
LB_9424:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9421
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9421:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9422
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9422:
	jmp LB_9401
LB_9425:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; word
	jmp LB_9427
LB_9426:
	add r14,1
LB_9427:
	cmp r14,r10
	jge LB_9428
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9426
	cmp al,10
	jz LB_9426
	cmp al,32
	jz LB_9426
LB_9428:
	push r10
	call NS_E_1677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9429
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9430
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9430:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9431
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9431:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9432
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9432:
	jmp LB_9401
LB_9429:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_ptn
	jmp LB_9435
LB_9434:
	add r14,1
LB_9435:
	cmp r14,r10
	jge LB_9436
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9434
	cmp al,10
	jz LB_9434
	cmp al,32
	jz LB_9434
LB_9436:
	push r10
	call NS_E_5800_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9437
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_9438
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_9438:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9439
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9439:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9440
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9440:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9441
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9441:
	jmp LB_9401
LB_9437:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lc_code
	jmp LB_9444
LB_9443:
	add r14,1
LB_9444:
	cmp r14,r10
	jge LB_9445
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9443
	cmp al,10
	jz LB_9443
	cmp al,32
	jz LB_9443
LB_9445:
	push r10
	call NS_E_7147_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9446
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_9447
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_9447:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_9448
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_9448:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9449
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9449:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9450
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9450:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9451
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9451:
	jmp LB_9401
LB_9446:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
; ⟦ qlq_etr ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_9457:
	jmp LB_9454
LB_9453:
	add r14,1
LB_9454:
	cmp r14,r10
	jge LB_9455
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9453
	cmp al,10
	jz LB_9453
	cmp al,32
	jz LB_9453
LB_9455:
	push r10
	push rsi
	call NS_E_7145_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_9456
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_9458
	bts QWORD [rax],0
LB_9458:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_9457
LB_9456:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*6],0
	mov QWORD [rsp+8*1+16*6],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*6]
	bt rax,0
	jc LB_9415
	btr r12,6
	clc
	jmp LB_9416
LB_9415:
	bts r12,6
	stc
LB_9416:
	mov rax,QWORD [rsp+16*6+8*1]
	mov rcx,rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_9413
	btr r12,5
	clc
	jmp LB_9414
LB_9413:
	bts r12,5
	stc
LB_9414:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_9411
	btr r12,4
	clc
	jmp LB_9412
LB_9411:
	bts r12,4
	stc
LB_9412:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_9409
	btr r12,3
	clc
	jmp LB_9410
LB_9409:
	bts r12,3
	stc
LB_9410:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9407
	btr r12,2
	clc
	jmp LB_9408
LB_9407:
	bts r12,2
	stc
LB_9408:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9405
	btr r12,1
	clc
	jmp LB_9406
LB_9405:
	bts r12,1
	stc
LB_9406:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9403
	btr r12,0
	clc
	jmp LB_9404
LB_9403:
	bts r12,0
	stc
LB_9404:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,112
	push rdi
	push rsi
	push 168
	push LB_9397
	push LB_9397
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' 4' 5' 6' } ⊢ { 0' {  } {  } 1' 2' 3' 4' }
	mov rdx,r10
	bt r12,4
	jc LB_9472
	btr r12,7
	jmp LB_9473
LB_9472:
	bts r12,7
LB_9473:
	mov r10,rcx
	bt r12,6
	jc LB_9474
	btr r12,4
	jmp LB_9475
LB_9474:
	bts r12,4
LB_9475:
	mov rcx,r9
	bt r12,3
	jc LB_9476
	btr r12,6
	jmp LB_9477
LB_9476:
	bts r12,6
LB_9477:
	mov r9,r11
	bt r12,5
	jc LB_9478
	btr r12,3
	jmp LB_9479
LB_9478:
	bts r12,3
LB_9479:
	mov r11,r8
	bt r12,2
	jc LB_9480
	btr r12,5
	jmp LB_9481
LB_9480:
	bts r12,5
LB_9481:
	mov r8,rdx
	bt r12,7
	jc LB_9482
	btr r12,2
	jmp LB_9483
LB_9482:
	bts r12,2
LB_9483:
	mov rdx,r14
	bt r12,1
	jc LB_9484
	btr r12,7
	jmp LB_9485
LB_9484:
	bts r12,7
LB_9485:
	mov r14,rcx
	bt r12,6
	jc LB_9486
	btr r12,1
	jmp LB_9487
LB_9486:
	bts r12,1
LB_9487:
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov rcx,rax
	mov rax,QWORD [rsp+8*3]
	mov r11,rax
	bts r12,5
	bts r12,6
; _f975 %_7364 ⊢ %_7365 : %_7365
 ; {>  %_7363~3':(_p1942)◂(_stg) %_7362~2':(_p1924)◂((_p1932)◂(_stg)) %_602~5':_r64 %_601~6':_r64 %_7364~4':(_lst)◂({ _stg (_p1924)◂((_p1932)◂(_stg)) (_p1942)◂(_stg) }) %_7361~1':_stg %_7360~0':(_p5062)◂({ }) }
; _f975 4' ⊢ 4'
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r11
	mov QWORD [rsp+8+8*5],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_9365
	btr r12,0
	jmp LB_9366
LB_9365:
	bts r12,0
LB_9366:
	push 1
	push LB_9369
	call NS_E_975
LB_9369:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_9367
	btr r12,4
	jmp LB_9368
LB_9367:
	bts r12,4
LB_9368:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*5]
	bt QWORD rax,6
	jc LB_9363
	btr r12,6
	clc
	jmp LB_9364
LB_9363:
	bts r12,6
	stc
LB_9364:
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD rax,5
	jc LB_9361
	btr r12,5
	clc
	jmp LB_9362
LB_9361:
	bts r12,5
	stc
LB_9362:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9359
	btr r12,3
	clc
	jmp LB_9360
LB_9359:
	bts r12,3
	stc
LB_9360:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9357
	btr r12,2
	clc
	jmp LB_9358
LB_9357:
	bts r12,2
	stc
LB_9358:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9355
	btr r12,1
	clc
	jmp LB_9356
LB_9355:
	bts r12,1
	stc
LB_9356:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9353
	btr r12,0
	clc
	jmp LB_9354
LB_9353:
	bts r12,0
	stc
LB_9354:
	add rsp,56
; _cns { { %_7361 %_7362 %_7363 } %_7365 } ⊢ %_7366 : %_7366
 ; {>  %_7363~3':(_p1942)◂(_stg) %_7362~2':(_p1924)◂((_p1932)◂(_stg)) %_602~5':_r64 %_601~6':_r64 %_7361~1':_stg %_7360~0':(_p5062)◂({ }) %_7365~4':(_lst)◂({ _stg (_p1924)◂((_p1932)◂(_stg)) (_p1942)◂(_stg) }) }
; _cns { { 1' 2' 3' } 4' } ⊢ °0◂{ { 1' 2' 3' } 4' }
; _f1992 %_7366 ⊢ %_7367 : %_7367
 ; {>  %_602~5':_r64 %_601~6':_r64 %_7366~°0◂{ { 1' 2' 3' } 4' }:(_lst)◂({ _stg (_p1924)◂((_p1932)◂(_stg)) (_p1942)◂(_stg) }) %_7360~0':(_p5062)◂({ }) }
; _f1992 °0◂{ { 1' 2' 3' } 4' } ⊢ °3◂°0◂{ { 1' 2' 3' } 4' }
; _some %_7367 ⊢ %_7368 : %_7368
 ; {>  %_602~5':_r64 %_601~6':_r64 %_7367~°3◂°0◂{ { 1' 2' 3' } 4' }:_p1976 %_7360~0':(_p5062)◂({ }) }
; _some °3◂°0◂{ { 1' 2' 3' } 4' } ⊢ °0◂°3◂°0◂{ { 1' 2' 3' } 4' }
; ∎ %_7368
 ; {>  %_602~5':_r64 %_601~6':_r64 %_7360~0':(_p5062)◂({ }) %_7368~°0◂°3◂°0◂{ { 1' 2' 3' } 4' }:(_opn)◂(_p1976) }
; 	∎ °0◂°3◂°0◂{ { 1' 2' 3' } 4' }
	bt r12,5
	jc LB_9370
	mov rdi,r11
	call dlt
LB_9370:
	bt r12,6
	jc LB_9371
	mov rdi,rcx
	call dlt
LB_9371:
	bt r12,0
	jc LB_9372
	mov rdi,r13
	call dlt
LB_9372:
; _emt_mov_ptn_to_ptn:{| 011110.. |},°0◂°3◂°0◂{ { 1' 2' 3' } 4' } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_9373
	btr r12,0
	jmp LB_9374
LB_9373:
	bts r12,0
LB_9374:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r14
	bt r12,1
	jc LB_9383
	btr r12,6
	jmp LB_9384
LB_9383:
	bts r12,6
LB_9384:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_9381
	btr QWORD [rdi],0
	jmp LB_9382
LB_9381:
	bts QWORD [rdi],0
LB_9382:
	mov rcx,r8
	bt r12,2
	jc LB_9387
	btr r12,6
	jmp LB_9388
LB_9387:
	bts r12,6
LB_9388:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_9385
	btr QWORD [rdi],1
	jmp LB_9386
LB_9385:
	bts QWORD [rdi],1
LB_9386:
	mov rcx,r13
	bt r12,0
	jc LB_9391
	btr r12,6
	jmp LB_9392
LB_9391:
	bts r12,6
LB_9392:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_9389
	btr QWORD [rdi],2
	jmp LB_9390
LB_9389:
	bts QWORD [rdi],2
LB_9390:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_9379
	btr QWORD [rdi],0
	jmp LB_9380
LB_9379:
	bts QWORD [rdi],0
LB_9380:
	mov r11,r10
	bt r12,4
	jc LB_9395
	btr r12,5
	jmp LB_9396
LB_9395:
	bts r12,5
LB_9396:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_9393
	btr QWORD [rdi],1
	jmp LB_9394
LB_9393:
	bts QWORD [rdi],1
LB_9394:
	mov rsi,1
	bt r12,3
	jc LB_9377
	mov rsi,0
	bt r9,0
	jc LB_9377
	jmp LB_9378
LB_9377:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9378:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_9375
	mov rsi,0
	bt r9,0
	jc LB_9375
	jmp LB_9376
LB_9375:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9376:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9397:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9399
	pop r14
	jmp LB_9402
LB_9399:
	add rsp,8
	ret
LB_9401:
	add rsp,112
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_9402:
	ret
LB_9400:
	add rsp,112
	pop r14
LB_9398:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	jmp LB_9509
LB_9508:
	add r14,1
LB_9509:
	cmp r14,r10
	jge LB_9510
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9508
	cmp al,10
	jz LB_9508
	cmp al,32
	jz LB_9508
LB_9510:
	push r10
	call NS_E_1677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9511
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9503
LB_9511:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_etr_def
	jmp LB_9514
LB_9513:
	add r14,1
LB_9514:
	cmp r14,r10
	jge LB_9515
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9513
	cmp al,10
	jz LB_9513
	cmp al,32
	jz LB_9513
LB_9515:
	push r10
	call NS_E_7146_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9516
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9517
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9517:
	jmp LB_9503
LB_9516:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9506
	btr r12,1
	clc
	jmp LB_9507
LB_9506:
	bts r12,1
	stc
LB_9507:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9504
	btr r12,0
	clc
	jmp LB_9505
LB_9504:
	bts r12,0
	stc
LB_9505:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 169
	push LB_9500
	push LB_9500
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _f1991 { %_7369 %_7370 } ⊢ %_7371 : %_7371
 ; {>  %_605~3':_r64 %_7370~1':_p1978 %_606~2':_r64 %_7369~0':_stg }
; _f1991 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_7371 ⊢ %_7372 : %_7372
 ; {>  %_605~3':_r64 %_606~2':_r64 %_7371~°2◂{ 0' 1' }:_p1976 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_7372
 ; {>  %_605~3':_r64 %_7372~°0◂°2◂{ 0' 1' }:(_opn)◂(_p1976) %_606~2':_r64 }
; 	∎ °0◂°2◂{ 0' 1' }
	bt r12,3
	jc LB_9488
	mov rdi,r9
	call dlt
LB_9488:
	bt r12,2
	jc LB_9489
	mov rdi,r8
	call dlt
LB_9489:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_9494
	btr r12,2
	jmp LB_9495
LB_9494:
	bts r12,2
LB_9495:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_9492
	btr QWORD [rdi],0
	jmp LB_9493
LB_9492:
	bts QWORD [rdi],0
LB_9493:
	mov r8,r14
	bt r12,1
	jc LB_9498
	btr r12,2
	jmp LB_9499
LB_9498:
	bts r12,2
LB_9499:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_9496
	btr QWORD [rdi],1
	jmp LB_9497
LB_9496:
	bts QWORD [rdi],1
LB_9497:
	mov rsi,1
	bt r12,3
	jc LB_9490
	mov rsi,0
	bt r9,0
	jc LB_9490
	jmp LB_9491
LB_9490:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9491:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9500:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9502
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9501
LB_9502:
	add rsp,8
	ret
LB_9503:
	add rsp,32
	pop r14
LB_9501:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 170
	push LB_9531
	push LB_9531
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; 	» "lc_etr_body 0" _ ⊢ 2' : %_7373
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_62_5f_72_74_65_5f_63_6c
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_79_64_6f
	mov QWORD [rdi+8*1+8*1],rax
	mov r8,rdi
	btr r12,2
; _f38 %_7373 ⊢ %_7374 : %_7374
 ; {>  %_610~0':_r64 %_7373~2':_stg %_609~1':_r64 }
; _f38 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_9523
	btr r12,0
	jmp LB_9524
LB_9523:
	bts r12,0
LB_9524:
	push -1
	push LB_9527
	call NS_E_38
LB_9527:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_9525
	btr r12,2
	jmp LB_9526
LB_9525:
	bts r12,2
LB_9526:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9521
	btr r12,1
	clc
	jmp LB_9522
LB_9521:
	bts r12,1
	stc
LB_9522:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9519
	btr r12,0
	clc
	jmp LB_9520
LB_9519:
	bts r12,0
	stc
LB_9520:
	add rsp,24
; _none {  } ⊢ %_7375 : %_7375
 ; {>  %_610~0':_r64 %_7374~2':_stg %_609~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_7375
 ; {>  %_610~0':_r64 %_7375~°1◂{  }:(_opn)◂(t3363'(0)) %_7374~2':_stg %_609~1':_r64 }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_9528
	mov rdi,r13
	call dlt
LB_9528:
	bt r12,2
	jc LB_9529
	mov rdi,r8
	call dlt
LB_9529:
	bt r12,1
	jc LB_9530
	mov rdi,r14
	call dlt
LB_9530:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_9531:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9533
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9532
LB_9533:
	add rsp,8
	ret
LB_9534:
	add rsp,0
	pop r14
LB_9532:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7145:
NS_E_RDI_7145:
NS_E_7145_ETR_TBL:
NS_E_7145_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; nls
	jmp LB_9569
LB_9568:
	add r14,1
LB_9569:
	cmp r14,r10
	jge LB_9570
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9568
	cmp al,10
	jz LB_9568
	cmp al,32
	jz LB_9568
LB_9570:
	push r10
	call NS_E_6471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9571
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9555
LB_9571:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "@"
	jmp LB_9574
LB_9573:
	add r14,1
LB_9574:
	cmp r14,r10
	jge LB_9575
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9573
	cmp al,10
	jz LB_9573
	cmp al,32
	jz LB_9573
LB_9575:
	add r14,1
	cmp r14,r10
	jg LB_9579
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,64
	jnz LB_9579
	jmp LB_9580
LB_9579:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9577
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9577:
	jmp LB_9555
LB_9580:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "."
	jmp LB_9582
LB_9581:
	add r14,1
LB_9582:
	cmp r14,r10
	jge LB_9583
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9581
	cmp al,10
	jz LB_9581
	cmp al,32
	jz LB_9581
LB_9583:
	add r14,1
	cmp r14,r10
	jg LB_9588
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,46
	jnz LB_9588
	jmp LB_9589
LB_9588:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9585
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9585:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9586
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9586:
	jmp LB_9555
LB_9589:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; word
	jmp LB_9591
LB_9590:
	add r14,1
LB_9591:
	cmp r14,r10
	jge LB_9592
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9590
	cmp al,10
	jz LB_9590
	cmp al,32
	jz LB_9590
LB_9592:
	push r10
	call NS_E_1677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9593
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9594
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9594:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9595
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9595:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9596
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9596:
	jmp LB_9555
LB_9593:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_ptn
	jmp LB_9599
LB_9598:
	add r14,1
LB_9599:
	cmp r14,r10
	jge LB_9600
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9598
	cmp al,10
	jz LB_9598
	cmp al,32
	jz LB_9598
LB_9600:
	push r10
	call NS_E_5800_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9601
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_9602
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_9602:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9603
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9603:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9604
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9604:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9605
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9605:
	jmp LB_9555
LB_9601:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lc_code
	jmp LB_9608
LB_9607:
	add r14,1
LB_9608:
	cmp r14,r10
	jge LB_9609
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9607
	cmp al,10
	jz LB_9607
	cmp al,32
	jz LB_9607
LB_9609:
	push r10
	call NS_E_7147_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9610
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_9611
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_9611:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_9612
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_9612:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9613
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9613:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9614
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9614:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9615
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9615:
	jmp LB_9555
LB_9610:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_9566
	btr r12,5
	clc
	jmp LB_9567
LB_9566:
	bts r12,5
	stc
LB_9567:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_9564
	btr r12,4
	clc
	jmp LB_9565
LB_9564:
	bts r12,4
	stc
LB_9565:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_9562
	btr r12,3
	clc
	jmp LB_9563
LB_9562:
	bts r12,3
	stc
LB_9563:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9560
	btr r12,2
	clc
	jmp LB_9561
LB_9560:
	bts r12,2
	stc
LB_9561:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9558
	btr r12,1
	clc
	jmp LB_9559
LB_9558:
	bts r12,1
	stc
LB_9559:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9556
	btr r12,0
	clc
	jmp LB_9557
LB_9556:
	bts r12,0
	stc
LB_9557:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push 171
	push LB_9552
	push LB_9552
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } {  } 1' 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_9617
	btr r12,6
	jmp LB_9618
LB_9617:
	bts r12,6
LB_9618:
	mov r9,r11
	bt r12,5
	jc LB_9619
	btr r12,3
	jmp LB_9620
LB_9619:
	bts r12,3
LB_9620:
	mov r11,r8
	bt r12,2
	jc LB_9621
	btr r12,5
	jmp LB_9622
LB_9621:
	bts r12,5
LB_9622:
	mov r8,r10
	bt r12,4
	jc LB_9623
	btr r12,2
	jmp LB_9624
LB_9623:
	bts r12,2
LB_9624:
	mov r10,r14
	bt r12,1
	jc LB_9625
	btr r12,4
	jmp LB_9626
LB_9625:
	bts r12,4
LB_9626:
	mov r14,rcx
	bt r12,6
	jc LB_9627
	btr r12,1
	jmp LB_9628
LB_9627:
	bts r12,1
LB_9628:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r11,rax
	mov rax,QWORD [rsp+8*3]
	mov r10,rax
	bts r12,4
	bts r12,5
; _some { %_7377 %_7378 %_7379 } ⊢ %_7380 : %_7380
 ; {>  %_613~5':_r64 %_7377~1':_stg %_7379~3':(_p1942)◂(_stg) %_7378~2':(_p1924)◂((_p1932)◂(_stg)) %_7376~0':(_p5062)◂({ }) %_614~4':_r64 }
; _some { 1' 2' 3' } ⊢ °0◂{ 1' 2' 3' }
; ∎ %_7380
 ; {>  %_7380~°0◂{ 1' 2' 3' }:(_opn)◂({ _stg (_p1924)◂((_p1932)◂(_stg)) (_p1942)◂(_stg) }) %_613~5':_r64 %_7376~0':(_p5062)◂({ }) %_614~4':_r64 }
; 	∎ °0◂{ 1' 2' 3' }
	bt r12,5
	jc LB_9535
	mov rdi,r11
	call dlt
LB_9535:
	bt r12,0
	jc LB_9536
	mov rdi,r13
	call dlt
LB_9536:
	bt r12,4
	jc LB_9537
	mov rdi,r10
	call dlt
LB_9537:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' 2' 3' } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_9538
	btr r12,0
	jmp LB_9539
LB_9538:
	bts r12,0
LB_9539:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_9542
	btr r12,4
	jmp LB_9543
LB_9542:
	bts r12,4
LB_9543:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_9540
	btr QWORD [rdi],0
	jmp LB_9541
LB_9540:
	bts QWORD [rdi],0
LB_9541:
	mov r10,r8
	bt r12,2
	jc LB_9546
	btr r12,4
	jmp LB_9547
LB_9546:
	bts r12,4
LB_9547:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_9544
	btr QWORD [rdi],1
	jmp LB_9545
LB_9544:
	bts QWORD [rdi],1
LB_9545:
	mov r10,r13
	bt r12,0
	jc LB_9550
	btr r12,4
	jmp LB_9551
LB_9550:
	bts r12,4
LB_9551:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_9548
	btr QWORD [rdi],2
	jmp LB_9549
LB_9548:
	bts QWORD [rdi],2
LB_9549:
	mov r8,0
	bts r12,2
	ret
LB_9552:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9554
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9553
LB_9554:
	add rsp,8
	ret
LB_9555:
	add rsp,96
	pop r14
LB_9553:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7146:
NS_E_RDI_7146:
NS_E_7146_ETR_TBL:
NS_E_7146_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "="
	jmp LB_9652
LB_9651:
	add r14,1
LB_9652:
	cmp r14,r10
	jge LB_9653
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9651
	cmp al,10
	jz LB_9651
	cmp al,32
	jz LB_9651
LB_9653:
	add r14,1
	cmp r14,r10
	jg LB_9656
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,61
	jnz LB_9656
	jmp LB_9657
LB_9656:
	jmp LB_9638
LB_9657:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_9646
LB_9645:
	add r14,1
LB_9646:
	cmp r14,r10
	jge LB_9647
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9645
	cmp al,10
	jz LB_9645
	cmp al,32
	jz LB_9645
LB_9647:
	push r10
	call NS_E_4972_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9648
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9649
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9649:
	jmp LB_9639
LB_9648:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9643
	btr r12,1
	clc
	jmp LB_9644
LB_9643:
	bts r12,1
	stc
LB_9644:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9641
	btr r12,0
	clc
	jmp LB_9642
LB_9641:
	bts r12,0
	stc
LB_9642:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 172
	push LB_9635
	push LB_9635
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_9658
	btr r12,2
	jmp LB_9659
LB_9658:
	bts r12,2
LB_9659:
	mov r13,r14
	bt r12,1
	jc LB_9660
	btr r12,0
	jmp LB_9661
LB_9660:
	bts r12,0
LB_9661:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1998 %_7381 ⊢ %_7382 : %_7382
 ; {>  %_618~1':_r64 %_7381~0':_p1927 %_617~2':_r64 }
; _f1998 0' ⊢ °1◂0'
; _some %_7382 ⊢ %_7383 : %_7383
 ; {>  %_618~1':_r64 %_7382~°1◂0':_p1978 %_617~2':_r64 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_7383
 ; {>  %_618~1':_r64 %_617~2':_r64 %_7383~°0◂°1◂0':(_opn)◂(_p1978) }
; 	∎ °0◂°1◂0'
	bt r12,1
	jc LB_9629
	mov rdi,r14
	call dlt
LB_9629:
	bt r12,2
	jc LB_9630
	mov rdi,r8
	call dlt
LB_9630:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9633
	btr r12,3
	jmp LB_9634
LB_9633:
	bts r12,3
LB_9634:
	mov rsi,1
	bt r12,3
	jc LB_9631
	mov rsi,0
	bt r9,0
	jc LB_9631
	jmp LB_9632
LB_9631:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9632:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9635:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9637
	pop r14
	jmp LB_9640
LB_9637:
	add rsp,8
	ret
LB_9639:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_9640:
	ret
LB_9638:
	add rsp,32
	pop r14
LB_9636:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_9685
LB_9684:
	add r14,1
LB_9685:
	cmp r14,r10
	jge LB_9686
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9684
	cmp al,10
	jz LB_9684
	cmp al,32
	jz LB_9684
LB_9686:
	add r14,2
	cmp r14,r10
	jg LB_9689
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,194
	jnz LB_9689
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,171
	jnz LB_9689
	jmp LB_9690
LB_9689:
	jmp LB_9671
LB_9690:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_9679
LB_9678:
	add r14,1
LB_9679:
	cmp r14,r10
	jge LB_9680
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9678
	cmp al,10
	jz LB_9678
	cmp al,32
	jz LB_9678
LB_9680:
	push r10
	call NS_E_7147_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9681
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9682
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9682:
	jmp LB_9672
LB_9681:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9676
	btr r12,1
	clc
	jmp LB_9677
LB_9676:
	bts r12,1
	stc
LB_9677:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9674
	btr r12,0
	clc
	jmp LB_9675
LB_9674:
	bts r12,0
	stc
LB_9675:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 173
	push LB_9668
	push LB_9668
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_9691
	btr r12,2
	jmp LB_9692
LB_9691:
	bts r12,2
LB_9692:
	mov r13,r14
	bt r12,1
	jc LB_9693
	btr r12,0
	jmp LB_9694
LB_9693:
	bts r12,0
LB_9694:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1999 %_7384 ⊢ %_7385 : %_7385
 ; {>  %_622~1':_r64 %_621~2':_r64 %_7384~0':(_p1942)◂(_stg) }
; _f1999 0' ⊢ °2◂0'
; _some %_7385 ⊢ %_7386 : %_7386
 ; {>  %_622~1':_r64 %_621~2':_r64 %_7385~°2◂0':_p1978 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_7386
 ; {>  %_622~1':_r64 %_621~2':_r64 %_7386~°0◂°2◂0':(_opn)◂(_p1978) }
; 	∎ °0◂°2◂0'
	bt r12,1
	jc LB_9662
	mov rdi,r14
	call dlt
LB_9662:
	bt r12,2
	jc LB_9663
	mov rdi,r8
	call dlt
LB_9663:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9666
	btr r12,3
	jmp LB_9667
LB_9666:
	bts r12,3
LB_9667:
	mov rsi,1
	bt r12,3
	jc LB_9664
	mov rsi,0
	bt r9,0
	jc LB_9664
	jmp LB_9665
LB_9664:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9665:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9668:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9670
	pop r14
	jmp LB_9673
LB_9670:
	add rsp,8
	ret
LB_9672:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_9673:
	ret
LB_9671:
	add rsp,32
	pop r14
LB_9669:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_9716
LB_9715:
	add r14,1
LB_9716:
	cmp r14,r10
	jge LB_9717
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9715
	cmp al,10
	jz LB_9715
	cmp al,32
	jz LB_9715
LB_9717:
	push r10
	call NS_E_5800_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9718
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9710
LB_9718:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_9721
LB_9720:
	add r14,1
LB_9721:
	cmp r14,r10
	jge LB_9722
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9720
	cmp al,10
	jz LB_9720
	cmp al,32
	jz LB_9720
LB_9722:
	push r10
	call NS_E_7147_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9723
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9724
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9724:
	jmp LB_9710
LB_9723:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9713
	btr r12,1
	clc
	jmp LB_9714
LB_9713:
	bts r12,1
	stc
LB_9714:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9711
	btr r12,0
	clc
	jmp LB_9712
LB_9711:
	bts r12,0
	stc
LB_9712:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 174
	push LB_9707
	push LB_9707
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _f1997 { %_7387 %_7388 } ⊢ %_7389 : %_7389
 ; {>  %_626~2':_r64 %_7387~0':(_p1924)◂((_p1932)◂(_stg)) %_7388~1':(_p1942)◂(_stg) %_625~3':_r64 }
; _f1997 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_7389 ⊢ %_7390 : %_7390
 ; {>  %_626~2':_r64 %_7389~°0◂{ 0' 1' }:_p1978 %_625~3':_r64 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_7390
 ; {>  %_626~2':_r64 %_625~3':_r64 %_7390~°0◂°0◂{ 0' 1' }:(_opn)◂(_p1978) }
; 	∎ °0◂°0◂{ 0' 1' }
	bt r12,2
	jc LB_9695
	mov rdi,r8
	call dlt
LB_9695:
	bt r12,3
	jc LB_9696
	mov rdi,r9
	call dlt
LB_9696:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_9701
	btr r12,2
	jmp LB_9702
LB_9701:
	bts r12,2
LB_9702:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_9699
	btr QWORD [rdi],0
	jmp LB_9700
LB_9699:
	bts QWORD [rdi],0
LB_9700:
	mov r8,r14
	bt r12,1
	jc LB_9705
	btr r12,2
	jmp LB_9706
LB_9705:
	bts r12,2
LB_9706:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_9703
	btr QWORD [rdi],1
	jmp LB_9704
LB_9703:
	bts QWORD [rdi],1
LB_9704:
	mov rsi,1
	bt r12,3
	jc LB_9697
	mov rsi,0
	bt r9,0
	jc LB_9697
	jmp LB_9698
LB_9697:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9698:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9707:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9709
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9708
LB_9709:
	add rsp,8
	ret
LB_9710:
	add rsp,32
	pop r14
LB_9708:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7147:
NS_E_RDI_7147:
NS_E_7147_ETR_TBL:
NS_E_7147_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; nls
	jmp LB_9740
LB_9739:
	add r14,1
LB_9740:
	cmp r14,r10
	jge LB_9741
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9739
	cmp al,10
	jz LB_9739
	cmp al,32
	jz LB_9739
LB_9741:
	push r10
	call NS_E_6471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9742
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9734
LB_9742:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\136\142|"
	jmp LB_9745
LB_9744:
	add r14,1
LB_9745:
	cmp r14,r10
	jge LB_9746
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9744
	cmp al,10
	jz LB_9744
	cmp al,32
	jz LB_9744
LB_9746:
	add r14,4
	cmp r14,r10
	jg LB_9750
	movzx rax,BYTE [r13+r14+8*1+0-4]
	cmp al,226
	jnz LB_9750
	movzx rax,BYTE [r13+r14+8*1+1-4]
	cmp al,136
	jnz LB_9750
	movzx rax,BYTE [r13+r14+8*1+2-4]
	cmp al,142
	jnz LB_9750
	movzx rax,BYTE [r13+r14+8*1+3-4]
	cmp al,124
	jnz LB_9750
	jmp LB_9751
LB_9750:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9748
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9748:
	jmp LB_9734
LB_9751:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9737
	btr r12,1
	clc
	jmp LB_9738
LB_9737:
	bts r12,1
	stc
LB_9738:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9735
	btr r12,0
	clc
	jmp LB_9736
LB_9735:
	bts r12,0
	stc
LB_9736:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 175
	push LB_9731
	push LB_9731
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1954 {  } ⊢ %_7392 : %_7392
 ; {>  %_629~2':_r64 %_630~1':_r64 %_7391~0':(_p5062)◂({ }) }
; _f1954 {  } ⊢ °4◂{  }
; _some %_7392 ⊢ %_7393 : %_7393
 ; {>  %_629~2':_r64 %_630~1':_r64 %_7392~°4◂{  }:(_p1942)◂(t3391'(0)) %_7391~0':(_p5062)◂({ }) }
; _some °4◂{  } ⊢ °0◂°4◂{  }
; ∎ %_7393
 ; {>  %_629~2':_r64 %_630~1':_r64 %_7393~°0◂°4◂{  }:(_opn)◂((_p1942)◂(t3394'(0))) %_7391~0':(_p5062)◂({ }) }
; 	∎ °0◂°4◂{  }
	bt r12,2
	jc LB_9726
	mov rdi,r8
	call dlt
LB_9726:
	bt r12,1
	jc LB_9727
	mov rdi,r14
	call dlt
LB_9727:
	bt r12,0
	jc LB_9728
	mov rdi,r13
	call dlt
LB_9728:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°4◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_9729
	mov rsi,0
	bt r9,0
	jc LB_9729
	jmp LB_9730
LB_9729:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9730:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9731:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9733
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9732
LB_9733:
	add rsp,8
	ret
LB_9734:
	add rsp,32
	pop r14
LB_9732:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; nls
	jmp LB_9779
LB_9778:
	add r14,1
LB_9779:
	cmp r14,r10
	jge LB_9780
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9778
	cmp al,10
	jz LB_9778
	cmp al,32
	jz LB_9778
LB_9780:
	push r10
	call NS_E_6471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9781
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9762
LB_9781:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\136\142"
	jmp LB_9784
LB_9783:
	add r14,1
LB_9784:
	cmp r14,r10
	jge LB_9785
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9783
	cmp al,10
	jz LB_9783
	cmp al,32
	jz LB_9783
LB_9785:
	add r14,3
	cmp r14,r10
	jg LB_9789
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_9789
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,136
	jnz LB_9789
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,142
	jnz LB_9789
	jmp LB_9790
LB_9789:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9787
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9787:
	jmp LB_9762
LB_9790:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; src_ptn
	jmp LB_9772
LB_9771:
	add r14,1
LB_9772:
	cmp r14,r10
	jge LB_9773
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9771
	cmp al,10
	jz LB_9771
	cmp al,32
	jz LB_9771
LB_9773:
	push r10
	call NS_E_5519_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9774
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9775
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9775:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9776
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9776:
	jmp LB_9763
LB_9774:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9769
	btr r12,2
	clc
	jmp LB_9770
LB_9769:
	bts r12,2
	stc
LB_9770:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9767
	btr r12,1
	clc
	jmp LB_9768
LB_9767:
	bts r12,1
	stc
LB_9768:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9765
	btr r12,0
	clc
	jmp LB_9766
LB_9765:
	bts r12,0
	stc
LB_9766:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 176
	push LB_9759
	push LB_9759
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_9791
	btr r12,3
	jmp LB_9792
LB_9791:
	bts r12,3
LB_9792:
	mov r14,r8
	bt r12,2
	jc LB_9793
	btr r12,1
	jmp LB_9794
LB_9793:
	bts r12,1
LB_9794:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _f1953 %_7395 ⊢ %_7396 : %_7396
 ; {>  %_7395~1':(_p1924)◂((_p1931)◂(_stg)) %_7394~0':(_p5062)◂({ }) %_633~3':_r64 %_634~2':_r64 }
; _f1953 1' ⊢ °3◂1'
; _some %_7396 ⊢ %_7397 : %_7397
 ; {>  %_7396~°3◂1':(_p1942)◂(_stg) %_7394~0':(_p5062)◂({ }) %_633~3':_r64 %_634~2':_r64 }
; _some °3◂1' ⊢ °0◂°3◂1'
; ∎ %_7397
 ; {>  %_7394~0':(_p5062)◂({ }) %_633~3':_r64 %_7397~°0◂°3◂1':(_opn)◂((_p1942)◂(_stg)) %_634~2':_r64 }
; 	∎ °0◂°3◂1'
	bt r12,0
	jc LB_9752
	mov rdi,r13
	call dlt
LB_9752:
	bt r12,3
	jc LB_9753
	mov rdi,r9
	call dlt
LB_9753:
	bt r12,2
	jc LB_9754
	mov rdi,r8
	call dlt
LB_9754:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂°3◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_9757
	btr r12,3
	jmp LB_9758
LB_9757:
	bts r12,3
LB_9758:
	mov rsi,1
	bt r12,3
	jc LB_9755
	mov rsi,0
	bt r9,0
	jc LB_9755
	jmp LB_9756
LB_9755:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9756:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9759:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9761
	pop r14
	jmp LB_9764
LB_9761:
	add rsp,8
	ret
LB_9763:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_9764:
	ret
LB_9762:
	add rsp,48
	pop r14
LB_9760:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_9808
LB_9807:
	add r14,1
LB_9808:
	cmp r14,r10
	jge LB_9809
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9807
	cmp al,10
	jz LB_9807
	cmp al,32
	jz LB_9807
LB_9809:
	push r10
	call NS_E_7157_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9810
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9804
LB_9810:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9805
	btr r12,0
	clc
	jmp LB_9806
LB_9805:
	bts r12,0
	stc
LB_9806:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 177
	push LB_9801
	push LB_9801
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1951 %_7398 ⊢ %_7399 : %_7399
 ; {>  %_638~1':_r64 %_7398~0':(_p926)◂({ (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_637~2':_r64 }
; _f1951 0' ⊢ °1◂0'
; _some %_7399 ⊢ %_7400 : %_7400
 ; {>  %_638~1':_r64 %_7399~°1◂0':(_p1942)◂(_stg) %_637~2':_r64 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_7400
 ; {>  %_638~1':_r64 %_637~2':_r64 %_7400~°0◂°1◂0':(_opn)◂((_p1942)◂(_stg)) }
; 	∎ °0◂°1◂0'
	bt r12,1
	jc LB_9795
	mov rdi,r14
	call dlt
LB_9795:
	bt r12,2
	jc LB_9796
	mov rdi,r8
	call dlt
LB_9796:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9799
	btr r12,3
	jmp LB_9800
LB_9799:
	bts r12,3
LB_9800:
	mov rsi,1
	bt r12,3
	jc LB_9797
	mov rsi,0
	bt r9,0
	jc LB_9797
	jmp LB_9798
LB_9797:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9798:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9801:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9803
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9802
LB_9803:
	add rsp,8
	ret
LB_9804:
	add rsp,16
	pop r14
LB_9802:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; nls
	jmp LB_9868
LB_9867:
	add r14,1
LB_9868:
	cmp r14,r10
	jge LB_9869
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9867
	cmp al,10
	jz LB_9867
	cmp al,32
	jz LB_9867
LB_9869:
	push r10
	call NS_E_6471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9870
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9828
LB_9870:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "$"
	jmp LB_9873
LB_9872:
	add r14,1
LB_9873:
	cmp r14,r10
	jge LB_9874
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9872
	cmp al,10
	jz LB_9872
	cmp al,32
	jz LB_9872
LB_9874:
	add r14,1
	cmp r14,r10
	jg LB_9878
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,36
	jnz LB_9878
	jmp LB_9879
LB_9878:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9876
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9876:
	jmp LB_9828
LB_9879:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; src_ptn
	jmp LB_9842
LB_9841:
	add r14,1
LB_9842:
	cmp r14,r10
	jge LB_9843
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9841
	cmp al,10
	jz LB_9841
	cmp al,32
	jz LB_9841
LB_9843:
	push r10
	call NS_E_5519_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9844
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9845
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9845:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9846
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9846:
	jmp LB_9829
LB_9844:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\138\162"
	jmp LB_9849
LB_9848:
	add r14,1
LB_9849:
	cmp r14,r10
	jge LB_9850
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9848
	cmp al,10
	jz LB_9848
	cmp al,32
	jz LB_9848
LB_9850:
	add r14,3
	cmp r14,r10
	jg LB_9856
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_9856
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,138
	jnz LB_9856
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,162
	jnz LB_9856
	jmp LB_9857
LB_9856:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9852
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9852:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9853
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9853:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9854
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9854:
	jmp LB_9829
LB_9857:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; id_line
	jmp LB_9859
LB_9858:
	add r14,1
LB_9859:
	cmp r14,r10
	jge LB_9860
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9858
	cmp al,10
	jz LB_9858
	cmp al,32
	jz LB_9858
LB_9860:
	push r10
	call NS_E_7148_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9861
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_9862
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_9862:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_9863
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_9863:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9864
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9864:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9865
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9865:
	jmp LB_9829
LB_9861:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_9839
	btr r12,4
	clc
	jmp LB_9840
LB_9839:
	bts r12,4
	stc
LB_9840:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_9837
	btr r12,3
	clc
	jmp LB_9838
LB_9837:
	bts r12,3
	stc
LB_9838:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9835
	btr r12,2
	clc
	jmp LB_9836
LB_9835:
	bts r12,2
	stc
LB_9836:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9833
	btr r12,1
	clc
	jmp LB_9834
LB_9833:
	bts r12,1
	stc
LB_9834:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9831
	btr r12,0
	clc
	jmp LB_9832
LB_9831:
	bts r12,0
	stc
LB_9832:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push 178
	push LB_9825
	push LB_9825
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' {  } 1' {  } 2' }
	mov r11,r8
	bt r12,2
	jc LB_9880
	btr r12,5
	jmp LB_9881
LB_9880:
	bts r12,5
LB_9881:
	mov r8,r10
	bt r12,4
	jc LB_9882
	btr r12,2
	jmp LB_9883
LB_9882:
	bts r12,2
LB_9883:
	mov r10,r14
	bt r12,1
	jc LB_9884
	btr r12,4
	jmp LB_9885
LB_9884:
	bts r12,4
LB_9885:
	mov r14,r11
	bt r12,5
	jc LB_9886
	btr r12,1
	jmp LB_9887
LB_9886:
	bts r12,1
LB_9887:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r10,rax
	mov rax,QWORD [rsp+8*3]
	mov r9,rax
	bts r12,3
	bts r12,4
; _f1952 { %_7402 %_7403 } ⊢ %_7404 : %_7404
 ; {>  %_7402~1':(_p1924)◂((_p1931)◂(_stg)) %_7403~2':(_p1943)◂(_stg) %_642~3':_r64 %_7401~0':(_p5062)◂({ }) %_641~4':_r64 }
; _f1952 { 1' 2' } ⊢ °2◂{ 1' 2' }
; _some %_7404 ⊢ %_7405 : %_7405
 ; {>  %_642~3':_r64 %_7401~0':(_p5062)◂({ }) %_641~4':_r64 %_7404~°2◂{ 1' 2' }:(_p1942)◂(_stg) }
; _some °2◂{ 1' 2' } ⊢ °0◂°2◂{ 1' 2' }
; ∎ %_7405
 ; {>  %_7405~°0◂°2◂{ 1' 2' }:(_opn)◂((_p1942)◂(_stg)) %_642~3':_r64 %_7401~0':(_p5062)◂({ }) %_641~4':_r64 }
; 	∎ °0◂°2◂{ 1' 2' }
	bt r12,3
	jc LB_9812
	mov rdi,r9
	call dlt
LB_9812:
	bt r12,0
	jc LB_9813
	mov rdi,r13
	call dlt
LB_9813:
	bt r12,4
	jc LB_9814
	mov rdi,r10
	call dlt
LB_9814:
; _emt_mov_ptn_to_ptn:{| 0110.. |},°0◂°2◂{ 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_9819
	btr r12,0
	jmp LB_9820
LB_9819:
	bts r12,0
LB_9820:
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_9817
	btr QWORD [rdi],0
	jmp LB_9818
LB_9817:
	bts QWORD [rdi],0
LB_9818:
	mov r13,r8
	bt r12,2
	jc LB_9823
	btr r12,0
	jmp LB_9824
LB_9823:
	bts r12,0
LB_9824:
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_9821
	btr QWORD [rdi],1
	jmp LB_9822
LB_9821:
	bts QWORD [rdi],1
LB_9822:
	mov rsi,1
	bt r12,3
	jc LB_9815
	mov rsi,0
	bt r9,0
	jc LB_9815
	jmp LB_9816
LB_9815:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9816:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9825:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9827
	pop r14
	jmp LB_9830
LB_9827:
	add rsp,8
	ret
LB_9829:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_9830:
	ret
LB_9828:
	add rsp,80
	pop r14
LB_9826:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; nls
	jmp LB_9912
LB_9911:
	add r14,1
LB_9912:
	cmp r14,r10
	jge LB_9913
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9911
	cmp al,10
	jz LB_9911
	cmp al,32
	jz LB_9911
LB_9913:
	push r10
	call NS_E_6471_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9914
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9904
LB_9914:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_line
	jmp LB_9917
LB_9916:
	add r14,1
LB_9917:
	cmp r14,r10
	jge LB_9918
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9916
	cmp al,10
	jz LB_9916
	cmp al,32
	jz LB_9916
LB_9918:
	push r10
	call NS_E_7149_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9919
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9920
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9920:
	jmp LB_9904
LB_9919:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_9923
LB_9922:
	add r14,1
LB_9923:
	cmp r14,r10
	jge LB_9924
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9922
	cmp al,10
	jz LB_9922
	cmp al,32
	jz LB_9922
LB_9924:
	push r10
	call NS_E_7147_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9925
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9926
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9926:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9927
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9927:
	jmp LB_9904
LB_9925:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9909
	btr r12,2
	clc
	jmp LB_9910
LB_9909:
	bts r12,2
	stc
LB_9910:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9907
	btr r12,1
	clc
	jmp LB_9908
LB_9907:
	bts r12,1
	stc
LB_9908:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9905
	btr r12,0
	clc
	jmp LB_9906
LB_9905:
	bts r12,0
	stc
LB_9906:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 179
	push LB_9901
	push LB_9901
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
	mov rax,QWORD [rsp+8]
	mov r10,rax
	mov rax,QWORD [rsp+8*3]
	mov r9,rax
	bts r12,3
	bts r12,4
; _f1950 { %_7407 %_7408 } ⊢ %_7409 : %_7409
 ; {>  %_645~4':_r64 %_7407~1':(_p1944)◂(_stg) %_7406~0':(_p5062)◂({ }) %_646~3':_r64 %_7408~2':(_p1942)◂(_stg) }
; _f1950 { 1' 2' } ⊢ °0◂{ 1' 2' }
; _some %_7409 ⊢ %_7410 : %_7410
 ; {>  %_645~4':_r64 %_7409~°0◂{ 1' 2' }:(_p1942)◂(_stg) %_7406~0':(_p5062)◂({ }) %_646~3':_r64 }
; _some °0◂{ 1' 2' } ⊢ °0◂°0◂{ 1' 2' }
; ∎ %_7410
 ; {>  %_645~4':_r64 %_7406~0':(_p5062)◂({ }) %_7410~°0◂°0◂{ 1' 2' }:(_opn)◂((_p1942)◂(_stg)) %_646~3':_r64 }
; 	∎ °0◂°0◂{ 1' 2' }
	bt r12,4
	jc LB_9888
	mov rdi,r10
	call dlt
LB_9888:
	bt r12,0
	jc LB_9889
	mov rdi,r13
	call dlt
LB_9889:
	bt r12,3
	jc LB_9890
	mov rdi,r9
	call dlt
LB_9890:
; _emt_mov_ptn_to_ptn:{| 0110.. |},°0◂°0◂{ 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_9895
	btr r12,0
	jmp LB_9896
LB_9895:
	bts r12,0
LB_9896:
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_9893
	btr QWORD [rdi],0
	jmp LB_9894
LB_9893:
	bts QWORD [rdi],0
LB_9894:
	mov r13,r8
	bt r12,2
	jc LB_9899
	btr r12,0
	jmp LB_9900
LB_9899:
	bts r12,0
LB_9900:
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_9897
	btr QWORD [rdi],1
	jmp LB_9898
LB_9897:
	bts QWORD [rdi],1
LB_9898:
	mov rsi,1
	bt r12,3
	jc LB_9891
	mov rsi,0
	bt r9,0
	jc LB_9891
	jmp LB_9892
LB_9891:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9892:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9901:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9903
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9902
LB_9903:
	add rsp,8
	ret
LB_9904:
	add rsp,48
	pop r14
LB_9902:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7148:
NS_E_RDI_7148:
NS_E_7148_ETR_TBL:
NS_E_7148_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; lc_id_mtc
	jmp LB_9942
LB_9941:
	add r14,1
LB_9942:
	cmp r14,r10
	jge LB_9943
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9941
	cmp al,10
	jz LB_9941
	cmp al,32
	jz LB_9941
LB_9943:
	push r10
	call NS_E_7158_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9944
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9938
LB_9944:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9939
	btr r12,0
	clc
	jmp LB_9940
LB_9939:
	bts r12,0
	stc
LB_9940:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 180
	push LB_9935
	push LB_9935
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1955 %_7411 ⊢ %_7412 : %_7412
 ; {>  %_7411~0':(_p926)◂({ (_p1924)◂((_p1937)◂(_stg)) (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_649~2':_r64 %_650~1':_r64 }
; _f1955 0' ⊢ °0◂0'
; _some %_7412 ⊢ %_7413 : %_7413
 ; {>  %_7412~°0◂0':(_p1943)◂(_stg) %_649~2':_r64 %_650~1':_r64 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_7413
 ; {>  %_649~2':_r64 %_7413~°0◂°0◂0':(_opn)◂((_p1943)◂(_stg)) %_650~1':_r64 }
; 	∎ °0◂°0◂0'
	bt r12,2
	jc LB_9929
	mov rdi,r8
	call dlt
LB_9929:
	bt r12,1
	jc LB_9930
	mov rdi,r14
	call dlt
LB_9930:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9933
	btr r12,3
	jmp LB_9934
LB_9933:
	bts r12,3
LB_9934:
	mov rsi,1
	bt r12,3
	jc LB_9931
	mov rsi,0
	bt r9,0
	jc LB_9931
	jmp LB_9932
LB_9931:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9932:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9935:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9937
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9936
LB_9937:
	add rsp,8
	ret
LB_9938:
	add rsp,16
	pop r14
LB_9936:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; dst_ptn
	jmp LB_9977
LB_9976:
	add r14,1
LB_9977:
	cmp r14,r10
	jge LB_9978
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9976
	cmp al,10
	jz LB_9976
	cmp al,32
	jz LB_9976
LB_9978:
	push r10
	call NS_E_5800_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9979
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9969
LB_9979:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dst_ptn_tl
	jmp LB_9982
LB_9981:
	add r14,1
LB_9982:
	cmp r14,r10
	jge LB_9983
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9981
	cmp al,10
	jz LB_9981
	cmp al,32
	jz LB_9981
LB_9983:
	push r10
	call NS_E_5802_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9984
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9985
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9985:
	jmp LB_9969
LB_9984:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_9988
LB_9987:
	add r14,1
LB_9988:
	cmp r14,r10
	jge LB_9989
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9987
	cmp al,10
	jz LB_9987
	cmp al,32
	jz LB_9987
LB_9989:
	push r10
	call NS_E_7147_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9990
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_9991
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_9991:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9992
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9992:
	jmp LB_9969
LB_9990:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_9974
	btr r12,2
	clc
	jmp LB_9975
LB_9974:
	bts r12,2
	stc
LB_9975:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9972
	btr r12,1
	clc
	jmp LB_9973
LB_9972:
	bts r12,1
	stc
LB_9973:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9970
	btr r12,0
	clc
	jmp LB_9971
LB_9970:
	bts r12,0
	stc
LB_9971:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 181
	push LB_9966
	push LB_9966
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
	mov rax,QWORD [rsp+8]
	mov r10,rax
	mov rax,QWORD [rsp+8*3]
	mov r9,rax
	bts r12,3
	bts r12,4
; _cns { %_7414 %_7415 } ⊢ %_7417 : %_7417
 ; {>  %_7416~2':(_p1942)◂(_stg) %_7414~0':(_p1924)◂((_p1932)◂(_stg)) %_653~4':_r64 %_7415~1':(_lst)◂((_p1924)◂((_p1932)◂(_stg))) %_654~3':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f1956 { %_7417 %_7416 } ⊢ %_7418 : %_7418
 ; {>  %_7417~°0◂{ 0' 1' }:(_lst)◂((_p1924)◂((_p1932)◂(_stg))) %_7416~2':(_p1942)◂(_stg) %_653~4':_r64 %_654~3':_r64 }
; _f1956 { °0◂{ 0' 1' } 2' } ⊢ °1◂{ °0◂{ 0' 1' } 2' }
; _some %_7418 ⊢ %_7419 : %_7419
 ; {>  %_653~4':_r64 %_7418~°1◂{ °0◂{ 0' 1' } 2' }:(_p1943)◂(_stg) %_654~3':_r64 }
; _some °1◂{ °0◂{ 0' 1' } 2' } ⊢ °0◂°1◂{ °0◂{ 0' 1' } 2' }
; ∎ %_7419
 ; {>  %_7419~°0◂°1◂{ °0◂{ 0' 1' } 2' }:(_opn)◂((_p1943)◂(_stg)) %_653~4':_r64 %_654~3':_r64 }
; 	∎ °0◂°1◂{ °0◂{ 0' 1' } 2' }
	bt r12,4
	jc LB_9946
	mov rdi,r10
	call dlt
LB_9946:
	bt r12,3
	jc LB_9947
	mov rdi,r9
	call dlt
LB_9947:
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂{ °0◂{ 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_9956
	btr r12,5
	jmp LB_9957
LB_9956:
	bts r12,5
LB_9957:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_9954
	btr QWORD [rdi],0
	jmp LB_9955
LB_9954:
	bts QWORD [rdi],0
LB_9955:
	mov r11,r14
	bt r12,1
	jc LB_9960
	btr r12,5
	jmp LB_9961
LB_9960:
	bts r12,5
LB_9961:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_9958
	btr QWORD [rdi],1
	jmp LB_9959
LB_9958:
	bts QWORD [rdi],1
LB_9959:
	mov rsi,1
	bt r12,4
	jc LB_9952
	mov rsi,0
	bt r10,0
	jc LB_9952
	jmp LB_9953
LB_9952:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_9953:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_9950
	btr QWORD [rdi],0
	jmp LB_9951
LB_9950:
	bts QWORD [rdi],0
LB_9951:
	mov r10,r8
	bt r12,2
	jc LB_9964
	btr r12,4
	jmp LB_9965
LB_9964:
	bts r12,4
LB_9965:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_9962
	btr QWORD [rdi],1
	jmp LB_9963
LB_9962:
	bts QWORD [rdi],1
LB_9963:
	mov rsi,1
	bt r12,3
	jc LB_9948
	mov rsi,0
	bt r9,0
	jc LB_9948
	jmp LB_9949
LB_9948:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9949:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9966:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9968
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9967
LB_9968:
	add rsp,8
	ret
LB_9969:
	add rsp,48
	pop r14
LB_9967:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7149:
NS_E_RDI_7149:
NS_E_7149_ETR_TBL:
NS_E_7149_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; "\226\151\130"
	jmp LB_10073
LB_10072:
	add r14,1
LB_10073:
	cmp r14,r10
	jge LB_10074
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10072
	cmp al,10
	jz LB_10072
	cmp al,32
	jz LB_10072
LB_10074:
	add r14,3
	cmp r14,r10
	jg LB_10077
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_10077
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,151
	jnz LB_10077
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,130
	jnz LB_10077
	jmp LB_10078
LB_10077:
	jmp LB_10013
LB_10078:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src
	jmp LB_10029
LB_10028:
	add r14,1
LB_10029:
	cmp r14,r10
	jge LB_10030
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10028
	cmp al,10
	jz LB_10028
	cmp al,32
	jz LB_10028
LB_10030:
	push r10
	call NS_E_5522_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10031
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10032
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10032:
	jmp LB_10014
LB_10031:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ","
	jmp LB_10035
LB_10034:
	add r14,1
LB_10035:
	cmp r14,r10
	jge LB_10036
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10034
	cmp al,10
	jz LB_10034
	cmp al,32
	jz LB_10034
LB_10036:
	add r14,1
	cmp r14,r10
	jg LB_10041
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,44
	jnz LB_10041
	jmp LB_10042
LB_10041:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10038
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10038:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10039
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10039:
	jmp LB_10014
LB_10042:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; src_ptn
	jmp LB_10044
LB_10043:
	add r14,1
LB_10044:
	cmp r14,r10
	jge LB_10045
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10043
	cmp al,10
	jz LB_10043
	cmp al,32
	jz LB_10043
LB_10045:
	push r10
	call NS_E_5519_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10046
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_10047
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_10047:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10048
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10048:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10049
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10049:
	jmp LB_10014
LB_10046:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; "\226\138\162"
	jmp LB_10052
LB_10051:
	add r14,1
LB_10052:
	cmp r14,r10
	jge LB_10053
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10051
	cmp al,10
	jz LB_10051
	cmp al,32
	jz LB_10051
LB_10053:
	add r14,3
	cmp r14,r10
	jg LB_10060
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_10060
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,138
	jnz LB_10060
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,162
	jnz LB_10060
	jmp LB_10061
LB_10060:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_10055
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_10055:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_10056
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_10056:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10057
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10057:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10058
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10058:
	jmp LB_10014
LB_10061:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; dst_ptn
	jmp LB_10063
LB_10062:
	add r14,1
LB_10063:
	cmp r14,r10
	jge LB_10064
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10062
	cmp al,10
	jz LB_10062
	cmp al,32
	jz LB_10062
LB_10064:
	push r10
	call NS_E_5800_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10065
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_10066
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_10066:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_10067
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_10067:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_10068
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_10068:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10069
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10069:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10070
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10070:
	jmp LB_10014
LB_10065:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_10026
	btr r12,5
	clc
	jmp LB_10027
LB_10026:
	bts r12,5
	stc
LB_10027:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_10024
	btr r12,4
	clc
	jmp LB_10025
LB_10024:
	bts r12,4
	stc
LB_10025:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_10022
	btr r12,3
	clc
	jmp LB_10023
LB_10022:
	bts r12,3
	stc
LB_10023:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_10020
	btr r12,2
	clc
	jmp LB_10021
LB_10020:
	bts r12,2
	stc
LB_10021:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10018
	btr r12,1
	clc
	jmp LB_10019
LB_10018:
	bts r12,1
	stc
LB_10019:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10016
	btr r12,0
	clc
	jmp LB_10017
LB_10016:
	bts r12,0
	stc
LB_10017:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push 182
	push LB_10010
	push LB_10010
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } 0' {  } 1' {  } 2' }
	mov rcx,r8
	bt r12,2
	jc LB_10079
	btr r12,6
	jmp LB_10080
LB_10079:
	bts r12,6
LB_10080:
	mov r8,r11
	bt r12,5
	jc LB_10081
	btr r12,2
	jmp LB_10082
LB_10081:
	bts r12,2
LB_10082:
	mov r11,r14
	bt r12,1
	jc LB_10083
	btr r12,5
	jmp LB_10084
LB_10083:
	bts r12,5
LB_10084:
	mov r14,r9
	bt r12,3
	jc LB_10085
	btr r12,1
	jmp LB_10086
LB_10085:
	bts r12,1
LB_10086:
	mov r9,r13
	bt r12,0
	jc LB_10087
	btr r12,3
	jmp LB_10088
LB_10087:
	bts r12,3
LB_10088:
	mov r13,r11
	bt r12,5
	jc LB_10089
	btr r12,0
	jmp LB_10090
LB_10089:
	bts r12,0
LB_10090:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r10,rax
	mov rax,QWORD [rsp+8*3]
	mov r9,rax
	bts r12,3
	bts r12,4
; _f1958 { %_7420 %_7421 %_7422 } ⊢ %_7423 : %_7423
 ; {>  %_658~3':_r64 %_7421~1':(_p1924)◂((_p1931)◂(_stg)) %_7422~2':(_p1924)◂((_p1932)◂(_stg)) %_657~4':_r64 %_7420~0':(_p1931)◂(_stg) }
; _f1958 { 0' 1' 2' } ⊢ °1◂{ 0' 1' 2' }
; _some %_7423 ⊢ %_7424 : %_7424
 ; {>  %_658~3':_r64 %_7423~°1◂{ 0' 1' 2' }:(_p1944)◂(_stg) %_657~4':_r64 }
; _some °1◂{ 0' 1' 2' } ⊢ °0◂°1◂{ 0' 1' 2' }
; ∎ %_7424
 ; {>  %_658~3':_r64 %_657~4':_r64 %_7424~°0◂°1◂{ 0' 1' 2' }:(_opn)◂((_p1944)◂(_stg)) }
; 	∎ °0◂°1◂{ 0' 1' 2' }
	bt r12,3
	jc LB_9994
	mov rdi,r9
	call dlt
LB_9994:
	bt r12,4
	jc LB_9995
	mov rdi,r10
	call dlt
LB_9995:
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_10000
	btr r12,4
	jmp LB_10001
LB_10000:
	bts r12,4
LB_10001:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_9998
	btr QWORD [rdi],0
	jmp LB_9999
LB_9998:
	bts QWORD [rdi],0
LB_9999:
	mov r10,r14
	bt r12,1
	jc LB_10004
	btr r12,4
	jmp LB_10005
LB_10004:
	bts r12,4
LB_10005:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_10002
	btr QWORD [rdi],1
	jmp LB_10003
LB_10002:
	bts QWORD [rdi],1
LB_10003:
	mov r10,r8
	bt r12,2
	jc LB_10008
	btr r12,4
	jmp LB_10009
LB_10008:
	bts r12,4
LB_10009:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_10006
	btr QWORD [rdi],2
	jmp LB_10007
LB_10006:
	bts QWORD [rdi],2
LB_10007:
	mov rsi,1
	bt r12,3
	jc LB_9996
	mov rsi,0
	bt r9,0
	jc LB_9996
	jmp LB_9997
LB_9996:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9997:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10010:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10012
	pop r14
	jmp LB_10015
LB_10012:
	add rsp,8
	ret
LB_10014:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_10015:
	ret
LB_10013:
	add rsp,96
	pop r14
LB_10011:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\187"
	jmp LB_10112
LB_10111:
	add r14,1
LB_10112:
	cmp r14,r10
	jge LB_10113
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10111
	cmp al,10
	jz LB_10111
	cmp al,32
	jz LB_10111
LB_10113:
	add r14,2
	cmp r14,r10
	jg LB_10116
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,194
	jnz LB_10116
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,187
	jnz LB_10116
	jmp LB_10117
LB_10116:
	jmp LB_10098
LB_10117:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_line
	jmp LB_10106
LB_10105:
	add r14,1
LB_10106:
	cmp r14,r10
	jge LB_10107
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10105
	cmp al,10
	jz LB_10105
	cmp al,32
	jz LB_10105
LB_10107:
	push r10
	call NS_E_7150_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10108
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10109
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10109:
	jmp LB_10099
LB_10108:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10103
	btr r12,1
	clc
	jmp LB_10104
LB_10103:
	bts r12,1
	stc
LB_10104:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10101
	btr r12,0
	clc
	jmp LB_10102
LB_10101:
	bts r12,0
	stc
LB_10102:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 183
	push LB_10095
	push LB_10095
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_10118
	btr r12,2
	jmp LB_10119
LB_10118:
	bts r12,2
LB_10119:
	mov r13,r14
	bt r12,1
	jc LB_10120
	btr r12,0
	jmp LB_10121
LB_10120:
	bts r12,0
LB_10121:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some %_7425 ⊢ %_7426 : %_7426
 ; {>  %_661~2':_r64 %_662~1':_r64 %_7425~0':(_p1944)◂(_stg) }
; _some 0' ⊢ °0◂0'
; ∎ %_7426
 ; {>  %_661~2':_r64 %_662~1':_r64 %_7426~°0◂0':(_opn)◂((_p1944)◂(_stg)) }
; 	∎ °0◂0'
	bt r12,2
	jc LB_10091
	mov rdi,r8
	call dlt
LB_10091:
	bt r12,1
	jc LB_10092
	mov rdi,r14
	call dlt
LB_10092:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_10093
	btr r12,3
	jmp LB_10094
LB_10093:
	bts r12,3
LB_10094:
	mov r8,0
	bts r12,2
	ret
LB_10095:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10097
	pop r14
	jmp LB_10100
LB_10097:
	add rsp,8
	ret
LB_10099:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_10100:
	ret
LB_10098:
	add rsp,32
	pop r14
LB_10096:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; name
	jmp LB_10151
LB_10150:
	add r14,1
LB_10151:
	cmp r14,r10
	jge LB_10152
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10150
	cmp al,10
	jz LB_10150
	cmp al,32
	jz LB_10150
LB_10152:
	push r10
	call NS_E_4901_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10153
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10141
LB_10153:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn
	jmp LB_10156
LB_10155:
	add r14,1
LB_10156:
	cmp r14,r10
	jge LB_10157
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10155
	cmp al,10
	jz LB_10155
	cmp al,32
	jz LB_10155
LB_10157:
	push r10
	call NS_E_5519_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10158
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10159
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10159:
	jmp LB_10141
LB_10158:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_10162
LB_10161:
	add r14,1
LB_10162:
	cmp r14,r10
	jge LB_10163
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10161
	cmp al,10
	jz LB_10161
	cmp al,32
	jz LB_10161
LB_10163:
	add r14,3
	cmp r14,r10
	jg LB_10168
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_10168
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,138
	jnz LB_10168
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,162
	jnz LB_10168
	jmp LB_10169
LB_10168:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10165
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10165:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10166
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10166:
	jmp LB_10141
LB_10169:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_10171
LB_10170:
	add r14,1
LB_10171:
	cmp r14,r10
	jge LB_10172
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10170
	cmp al,10
	jz LB_10170
	cmp al,32
	jz LB_10170
LB_10172:
	push r10
	call NS_E_5800_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10173
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_10174
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_10174:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10175
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10175:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10176
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10176:
	jmp LB_10141
LB_10173:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_10148
	btr r12,3
	clc
	jmp LB_10149
LB_10148:
	bts r12,3
	stc
LB_10149:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_10146
	btr r12,2
	clc
	jmp LB_10147
LB_10146:
	bts r12,2
	stc
LB_10147:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10144
	btr r12,1
	clc
	jmp LB_10145
LB_10144:
	bts r12,1
	stc
LB_10145:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10142
	btr r12,0
	clc
	jmp LB_10143
LB_10142:
	bts r12,0
	stc
LB_10143:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push 184
	push LB_10138
	push LB_10138
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_10178
	btr r12,4
	jmp LB_10179
LB_10178:
	bts r12,4
LB_10179:
	mov r8,r9
	bt r12,3
	jc LB_10180
	btr r12,2
	jmp LB_10181
LB_10180:
	bts r12,2
LB_10181:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r10,rax
	mov rax,QWORD [rsp+8*3]
	mov r9,rax
	bts r12,3
	bts r12,4
; _f1957 { %_7427 %_7428 %_7429 } ⊢ %_7430 : %_7430
 ; {>  %_7429~2':(_p1924)◂((_p1932)◂(_stg)) %_665~4':_r64 %_666~3':_r64 %_7427~0':_p1878 %_7428~1':(_p1924)◂((_p1931)◂(_stg)) }
; _f1957 { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; _some %_7430 ⊢ %_7431 : %_7431
 ; {>  %_665~4':_r64 %_666~3':_r64 %_7430~°0◂{ 0' 1' 2' }:(_p1944)◂(_stg) }
; _some °0◂{ 0' 1' 2' } ⊢ °0◂°0◂{ 0' 1' 2' }
; ∎ %_7431
 ; {>  %_7431~°0◂°0◂{ 0' 1' 2' }:(_opn)◂((_p1944)◂(_stg)) %_665~4':_r64 %_666~3':_r64 }
; 	∎ °0◂°0◂{ 0' 1' 2' }
	bt r12,4
	jc LB_10122
	mov rdi,r10
	call dlt
LB_10122:
	bt r12,3
	jc LB_10123
	mov rdi,r9
	call dlt
LB_10123:
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_10128
	btr r12,4
	jmp LB_10129
LB_10128:
	bts r12,4
LB_10129:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_10126
	btr QWORD [rdi],0
	jmp LB_10127
LB_10126:
	bts QWORD [rdi],0
LB_10127:
	mov r10,r14
	bt r12,1
	jc LB_10132
	btr r12,4
	jmp LB_10133
LB_10132:
	bts r12,4
LB_10133:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_10130
	btr QWORD [rdi],1
	jmp LB_10131
LB_10130:
	bts QWORD [rdi],1
LB_10131:
	mov r10,r8
	bt r12,2
	jc LB_10136
	btr r12,4
	jmp LB_10137
LB_10136:
	bts r12,4
LB_10137:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_10134
	btr QWORD [rdi],2
	jmp LB_10135
LB_10134:
	bts QWORD [rdi],2
LB_10135:
	mov rsi,1
	bt r12,3
	jc LB_10124
	mov rsi,0
	bt r9,0
	jc LB_10124
	jmp LB_10125
LB_10124:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10125:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10138:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10140
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10139
LB_10140:
	add rsp,8
	ret
LB_10141:
	add rsp,64
	pop r14
LB_10139:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7150:
NS_E_RDI_7150:
NS_E_7150_ETR_TBL:
NS_E_7150_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "_^"
	jmp LB_10235
LB_10234:
	add r14,1
LB_10235:
	cmp r14,r10
	jge LB_10236
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10234
	cmp al,10
	jz LB_10234
	cmp al,32
	jz LB_10234
LB_10236:
	add r14,2
	cmp r14,r10
	jg LB_10239
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,95
	jnz LB_10239
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,94
	jnz LB_10239
	jmp LB_10240
LB_10239:
	jmp LB_10201
LB_10240:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_s8_sd
	jmp LB_10213
LB_10212:
	add r14,1
LB_10213:
	cmp r14,r10
	jge LB_10214
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10212
	cmp al,10
	jz LB_10212
	cmp al,32
	jz LB_10212
LB_10214:
	push r10
	call NS_E_7151_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10215
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10216
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10216:
	jmp LB_10202
LB_10215:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ s8_ptn ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_10222:
	jmp LB_10219
LB_10218:
	add r14,1
LB_10219:
	cmp r14,r10
	jge LB_10220
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10218
	cmp al,10
	jz LB_10218
	cmp al,32
	jz LB_10218
LB_10220:
	push r10
	push rsi
	call NS_E_7152_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_10221
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_10223
	bts QWORD [rax],0
LB_10223:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_10222
LB_10221:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; "//"
	jmp LB_10225
LB_10224:
	add r14,1
LB_10225:
	cmp r14,r10
	jge LB_10226
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10224
	cmp al,10
	jz LB_10224
	cmp al,32
	jz LB_10224
LB_10226:
	add r14,2
	cmp r14,r10
	jg LB_10232
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,47
	jnz LB_10232
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,47
	jnz LB_10232
	jmp LB_10233
LB_10232:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_10228
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_10228:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10229
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10229:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10230
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10230:
	jmp LB_10202
LB_10233:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_10210
	btr r12,3
	clc
	jmp LB_10211
LB_10210:
	bts r12,3
	stc
LB_10211:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_10208
	btr r12,2
	clc
	jmp LB_10209
LB_10208:
	bts r12,2
	stc
LB_10209:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10206
	btr r12,1
	clc
	jmp LB_10207
LB_10206:
	bts r12,1
	stc
LB_10207:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10204
	btr r12,0
	clc
	jmp LB_10205
LB_10204:
	bts r12,0
	stc
LB_10205:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push 185
	push LB_10198
	push LB_10198
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } { 0' 1' } 2' {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov r9,r14
	bt r12,1
	jc LB_10241
	btr r12,3
	jmp LB_10242
LB_10241:
	bts r12,3
LB_10242:
; 3' ⊢ { 0' 1' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_10245
	btr r12,4
	clc
	jmp LB_10246
LB_10245:
	bts r12,4
	stc
LB_10246:
	mov r13,r10
	bt r12,4
	jc LB_10243
	btr r12,0
	jmp LB_10244
LB_10243:
	bts r12,0
LB_10244:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_10249
	btr r12,4
	clc
	jmp LB_10250
LB_10249:
	bts r12,4
	stc
LB_10250:
	mov r14,r10
	bt r12,4
	jc LB_10247
	btr r12,1
	jmp LB_10248
LB_10247:
	bts r12,1
LB_10248:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r10,rax
	mov rax,QWORD [rsp+8*3]
	mov r9,rax
	bts r12,3
	bts r12,4
; _f1960 { %_7434 %_7432 %_7433 } ⊢ %_7435 : %_7435
 ; {>  %_7434~2':(_lst)◂(_p1948) %_7432~0':(_lst)◂((_p1931)◂(_stg)) %_669~4':_r64 %_7433~1':(_lst)◂((_p1932)◂(_stg)) %_670~3':_r64 }
; _f1960 { 2' 0' 1' } ⊢ °3◂{ 2' 0' 1' }
; _some %_7435 ⊢ %_7436 : %_7436
 ; {>  %_7435~°3◂{ 2' 0' 1' }:(_p1944)◂(_stg) %_669~4':_r64 %_670~3':_r64 }
; _some °3◂{ 2' 0' 1' } ⊢ °0◂°3◂{ 2' 0' 1' }
; ∎ %_7436
 ; {>  %_7436~°0◂°3◂{ 2' 0' 1' }:(_opn)◂((_p1944)◂(_stg)) %_669~4':_r64 %_670~3':_r64 }
; 	∎ °0◂°3◂{ 2' 0' 1' }
	bt r12,4
	jc LB_10182
	mov rdi,r10
	call dlt
LB_10182:
	bt r12,3
	jc LB_10183
	mov rdi,r9
	call dlt
LB_10183:
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°3◂{ 2' 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r8
	bt r12,2
	jc LB_10188
	btr r12,4
	jmp LB_10189
LB_10188:
	bts r12,4
LB_10189:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_10186
	btr QWORD [rdi],0
	jmp LB_10187
LB_10186:
	bts QWORD [rdi],0
LB_10187:
	mov r10,r13
	bt r12,0
	jc LB_10192
	btr r12,4
	jmp LB_10193
LB_10192:
	bts r12,4
LB_10193:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_10190
	btr QWORD [rdi],1
	jmp LB_10191
LB_10190:
	bts QWORD [rdi],1
LB_10191:
	mov r10,r14
	bt r12,1
	jc LB_10196
	btr r12,4
	jmp LB_10197
LB_10196:
	bts r12,4
LB_10197:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_10194
	btr QWORD [rdi],2
	jmp LB_10195
LB_10194:
	bts QWORD [rdi],2
LB_10195:
	mov rsi,1
	bt r12,3
	jc LB_10184
	mov rsi,0
	bt r9,0
	jc LB_10184
	jmp LB_10185
LB_10184:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10185:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10198:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10200
	pop r14
	jmp LB_10203
LB_10200:
	add rsp,8
	ret
LB_10202:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_10203:
	ret
LB_10201:
	add rsp,64
	pop r14
LB_10199:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; cst
	jmp LB_10282
LB_10281:
	add r14,1
LB_10282:
	cmp r14,r10
	jge LB_10283
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10281
	cmp al,10
	jz LB_10281
	cmp al,32
	jz LB_10281
LB_10283:
	push r10
	call NS_E_4972_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10284
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10272
LB_10284:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_10287
LB_10286:
	add r14,1
LB_10287:
	cmp r14,r10
	jge LB_10288
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10286
	cmp al,10
	jz LB_10286
	cmp al,32
	jz LB_10286
LB_10288:
	add r14,1
	cmp r14,r10
	jg LB_10292
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,95
	jnz LB_10292
	jmp LB_10293
LB_10292:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10290
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10290:
	jmp LB_10272
LB_10293:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_10295
LB_10294:
	add r14,1
LB_10295:
	cmp r14,r10
	jge LB_10296
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10294
	cmp al,10
	jz LB_10294
	cmp al,32
	jz LB_10294
LB_10296:
	add r14,3
	cmp r14,r10
	jg LB_10301
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_10301
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,138
	jnz LB_10301
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,162
	jnz LB_10301
	jmp LB_10302
LB_10301:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10298
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10298:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10299
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10299:
	jmp LB_10272
LB_10302:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_10304
LB_10303:
	add r14,1
LB_10304:
	cmp r14,r10
	jge LB_10305
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10303
	cmp al,10
	jz LB_10303
	cmp al,32
	jz LB_10303
LB_10305:
	push r10
	call NS_E_5800_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10306
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_10307
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_10307:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10308
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10308:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10309
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10309:
	jmp LB_10272
LB_10306:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_10279
	btr r12,3
	clc
	jmp LB_10280
LB_10279:
	bts r12,3
	stc
LB_10280:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_10277
	btr r12,2
	clc
	jmp LB_10278
LB_10277:
	bts r12,2
	stc
LB_10278:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10275
	btr r12,1
	clc
	jmp LB_10276
LB_10275:
	bts r12,1
	stc
LB_10276:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10273
	btr r12,0
	clc
	jmp LB_10274
LB_10273:
	bts r12,0
	stc
LB_10274:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push 186
	push LB_10269
	push LB_10269
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } {  } 1' }
	mov r10,r14
	bt r12,1
	jc LB_10311
	btr r12,4
	jmp LB_10312
LB_10311:
	bts r12,4
LB_10312:
	mov r14,r9
	bt r12,3
	jc LB_10313
	btr r12,1
	jmp LB_10314
LB_10313:
	bts r12,1
LB_10314:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _nil {  } ⊢ %_7439 : %_7439
 ; {>  %_674~2':_r64 %_7437~0':_p1927 %_673~3':_r64 %_7438~1':(_p1924)◂((_p1932)◂(_stg)) }
; _nil {  } ⊢ °1◂{  }
; _f1925 %_7439 ⊢ %_7440 : %_7440
 ; {>  %_674~2':_r64 %_7437~0':_p1927 %_673~3':_r64 %_7439~°1◂{  }:(_lst)◂(t3497'(0)) %_7438~1':(_p1924)◂((_p1932)◂(_stg)) }
; _f1925 °1◂{  } ⊢ °0◂°1◂{  }
; _f1959 { %_7437 %_7440 %_7438 } ⊢ %_7441 : %_7441
 ; {>  %_7440~°0◂°1◂{  }:(_p1924)◂(t3499'(0)) %_674~2':_r64 %_7437~0':_p1927 %_673~3':_r64 %_7438~1':(_p1924)◂((_p1932)◂(_stg)) }
; _f1959 { 0' °0◂°1◂{  } 1' } ⊢ °2◂{ 0' °0◂°1◂{  } 1' }
; _some %_7441 ⊢ %_7442 : %_7442
 ; {>  %_7441~°2◂{ 0' °0◂°1◂{  } 1' }:(_p1944)◂(_stg) %_674~2':_r64 %_673~3':_r64 }
; _some °2◂{ 0' °0◂°1◂{  } 1' } ⊢ °0◂°2◂{ 0' °0◂°1◂{  } 1' }
; ∎ %_7442
 ; {>  %_7442~°0◂°2◂{ 0' °0◂°1◂{  } 1' }:(_opn)◂((_p1944)◂(_stg)) %_674~2':_r64 %_673~3':_r64 }
; 	∎ °0◂°2◂{ 0' °0◂°1◂{  } 1' }
	bt r12,2
	jc LB_10251
	mov rdi,r8
	call dlt
LB_10251:
	bt r12,3
	jc LB_10252
	mov rdi,r9
	call dlt
LB_10252:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' °0◂°1◂{  } 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_10257
	btr r12,2
	jmp LB_10258
LB_10257:
	bts r12,2
LB_10258:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_10255
	btr QWORD [rdi],0
	jmp LB_10256
LB_10255:
	bts QWORD [rdi],0
LB_10256:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_10263
	mov rsi,0
	bt r8,0
	jc LB_10263
	jmp LB_10264
LB_10263:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_10264:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_10261
	mov rsi,0
	bt r8,0
	jc LB_10261
	jmp LB_10262
LB_10261:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_10262:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_10259
	btr QWORD [rdi],1
	jmp LB_10260
LB_10259:
	bts QWORD [rdi],1
LB_10260:
	mov r8,r14
	bt r12,1
	jc LB_10267
	btr r12,2
	jmp LB_10268
LB_10267:
	bts r12,2
LB_10268:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,2
	jc LB_10265
	btr QWORD [rdi],2
	jmp LB_10266
LB_10265:
	bts QWORD [rdi],2
LB_10266:
	mov rsi,1
	bt r12,3
	jc LB_10253
	mov rsi,0
	bt r9,0
	jc LB_10253
	jmp LB_10254
LB_10253:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10254:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10269:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10271
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10270
LB_10271:
	add rsp,8
	ret
LB_10272:
	add rsp,64
	pop r14
LB_10270:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7151:
NS_E_RDI_7151:
NS_E_7151_ETR_TBL:
NS_E_7151_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; wc
	jmp LB_10361
LB_10360:
	add r14,1
LB_10361:
	cmp r14,r10
	jge LB_10362
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10360
	cmp al,10
	jz LB_10360
	cmp al,32
	jz LB_10360
LB_10362:
	push r10
	call NS_E_4793_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10363
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10336
LB_10363:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_10346
LB_10345:
	add r14,1
LB_10346:
	cmp r14,r10
	jge LB_10347
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10345
	cmp al,10
	jz LB_10345
	cmp al,32
	jz LB_10345
LB_10347:
	add r14,3
	cmp r14,r10
	jg LB_10351
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_10351
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,138
	jnz LB_10351
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,162
	jnz LB_10351
	jmp LB_10352
LB_10351:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10349
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10349:
	jmp LB_10337
LB_10352:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst
	jmp LB_10354
LB_10353:
	add r14,1
LB_10354:
	cmp r14,r10
	jge LB_10355
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10353
	cmp al,10
	jz LB_10353
	cmp al,32
	jz LB_10353
LB_10355:
	push r10
	call NS_E_5804_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10356
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10357
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10357:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10358
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10358:
	jmp LB_10337
LB_10356:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_10343
	btr r12,2
	clc
	jmp LB_10344
LB_10343:
	bts r12,2
	stc
LB_10344:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10341
	btr r12,1
	clc
	jmp LB_10342
LB_10341:
	bts r12,1
	stc
LB_10342:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10339
	btr r12,0
	clc
	jmp LB_10340
LB_10339:
	bts r12,0
	stc
LB_10340:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 187
	push LB_10333
	push LB_10333
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } {  } 0' }
	mov r9,r13
	bt r12,0
	jc LB_10365
	btr r12,3
	jmp LB_10366
LB_10365:
	bts r12,3
LB_10366:
	mov r13,r8
	bt r12,2
	jc LB_10367
	btr r12,0
	jmp LB_10368
LB_10367:
	bts r12,0
LB_10368:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _nil {  } ⊢ %_7445 : %_7445
 ; {>  %_678~1':_r64 %_7444~0':(_p1932)◂(_stg) %_7443~{  }:{ } %_677~2':_r64 }
; _nil {  } ⊢ °1◂{  }
; _nil {  } ⊢ %_7446 : %_7446
 ; {>  %_678~1':_r64 %_7444~0':(_p1932)◂(_stg) %_7445~°1◂{  }:(_lst)◂(t3517'(0)) %_7443~{  }:{ } %_677~2':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_7444 %_7446 } ⊢ %_7447 : %_7447
 ; {>  %_678~1':_r64 %_7446~°1◂{  }:(_lst)◂(t3519'(0)) %_7444~0':(_p1932)◂(_stg) %_7445~°1◂{  }:(_lst)◂(t3517'(0)) %_7443~{  }:{ } %_677~2':_r64 }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _some { %_7445 %_7447 } ⊢ %_7448 : %_7448
 ; {>  %_678~1':_r64 %_7447~°0◂{ 0' °1◂{  } }:(_lst)◂((_p1932)◂(_stg)) %_7445~°1◂{  }:(_lst)◂(t3517'(0)) %_7443~{  }:{ } %_677~2':_r64 }
; _some { °1◂{  } °0◂{ 0' °1◂{  } } } ⊢ °0◂{ °1◂{  } °0◂{ 0' °1◂{  } } }
; ∎ %_7448
 ; {>  %_678~1':_r64 %_7443~{  }:{ } %_7448~°0◂{ °1◂{  } °0◂{ 0' °1◂{  } } }:(_opn)◂({ (_lst)◂(t3525'(0)) (_lst)◂((_p1932)◂(_stg)) }) %_677~2':_r64 }
; 	∎ °0◂{ °1◂{  } °0◂{ 0' °1◂{  } } }
	bt r12,1
	jc LB_10315
	mov rdi,r14
	call dlt
LB_10315:
	bt r12,2
	jc LB_10316
	mov rdi,r8
	call dlt
LB_10316:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °1◂{  } °0◂{ 0' °1◂{  } } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_10319
	mov rsi,0
	bt r14,0
	jc LB_10319
	jmp LB_10320
LB_10319:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_10320:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_10317
	btr QWORD [rdi],0
	jmp LB_10318
LB_10317:
	bts QWORD [rdi],0
LB_10318:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r8,r13
	bt r12,0
	jc LB_10327
	btr r12,2
	jmp LB_10328
LB_10327:
	bts r12,2
LB_10328:
	mov rdi,r14
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_10325
	btr QWORD [rdi],0
	jmp LB_10326
LB_10325:
	bts QWORD [rdi],0
LB_10326:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_10331
	mov rsi,0
	bt r8,0
	jc LB_10331
	jmp LB_10332
LB_10331:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_10332:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r14
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_10329
	btr QWORD [rdi],1
	jmp LB_10330
LB_10329:
	bts QWORD [rdi],1
LB_10330:
	mov rsi,1
	bt r12,1
	jc LB_10323
	mov rsi,0
	bt r14,0
	jc LB_10323
	jmp LB_10324
LB_10323:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_10324:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_10321
	btr QWORD [rdi],1
	jmp LB_10322
LB_10321:
	bts QWORD [rdi],1
LB_10322:
	mov r8,0
	bts r12,2
	ret
LB_10333:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10335
	pop r14
	jmp LB_10338
LB_10335:
	add rsp,8
	ret
LB_10337:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_10338:
	ret
LB_10336:
	add rsp,48
	pop r14
LB_10334:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; src
	jmp LB_10412
LB_10411:
	add r14,1
LB_10412:
	cmp r14,r10
	jge LB_10413
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10411
	cmp al,10
	jz LB_10411
	cmp al,32
	jz LB_10411
LB_10413:
	push r10
	call NS_E_5522_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10414
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10400
LB_10414:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_tl
	jmp LB_10417
LB_10416:
	add r14,1
LB_10417:
	cmp r14,r10
	jge LB_10418
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10416
	cmp al,10
	jz LB_10416
	cmp al,32
	jz LB_10416
LB_10418:
	push r10
	call NS_E_5521_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10419
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10420
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10420:
	jmp LB_10400
LB_10419:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_10423
LB_10422:
	add r14,1
LB_10423:
	cmp r14,r10
	jge LB_10424
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10422
	cmp al,10
	jz LB_10422
	cmp al,32
	jz LB_10422
LB_10424:
	add r14,3
	cmp r14,r10
	jg LB_10429
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_10429
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,138
	jnz LB_10429
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,162
	jnz LB_10429
	jmp LB_10430
LB_10429:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10426
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10426:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10427
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10427:
	jmp LB_10400
LB_10430:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst
	jmp LB_10432
LB_10431:
	add r14,1
LB_10432:
	cmp r14,r10
	jge LB_10433
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10431
	cmp al,10
	jz LB_10431
	cmp al,32
	jz LB_10431
LB_10433:
	push r10
	call NS_E_5804_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10434
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_10435
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_10435:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10436
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10436:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10437
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10437:
	jmp LB_10400
LB_10434:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_tl
	jmp LB_10440
LB_10439:
	add r14,1
LB_10440:
	cmp r14,r10
	jge LB_10441
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10439
	cmp al,10
	jz LB_10439
	cmp al,32
	jz LB_10439
LB_10441:
	push r10
	call NS_E_5803_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10442
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_10443
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_10443:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_10444
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_10444:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10445
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10445:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10446
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10446:
	jmp LB_10400
LB_10442:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_10409
	btr r12,4
	clc
	jmp LB_10410
LB_10409:
	bts r12,4
	stc
LB_10410:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_10407
	btr r12,3
	clc
	jmp LB_10408
LB_10407:
	bts r12,3
	stc
LB_10408:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_10405
	btr r12,2
	clc
	jmp LB_10406
LB_10405:
	bts r12,2
	stc
LB_10406:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10403
	btr r12,1
	clc
	jmp LB_10404
LB_10403:
	bts r12,1
	stc
LB_10404:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10401
	btr r12,0
	clc
	jmp LB_10402
LB_10401:
	bts r12,0
	stc
LB_10402:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push 188
	push LB_10397
	push LB_10397
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' {  } 2' 3' }
	mov r11,r9
	bt r12,3
	jc LB_10448
	btr r12,5
	jmp LB_10449
LB_10448:
	bts r12,5
LB_10449:
	mov r9,r10
	bt r12,4
	jc LB_10450
	btr r12,3
	jmp LB_10451
LB_10450:
	bts r12,3
LB_10451:
	mov r10,r8
	bt r12,2
	jc LB_10452
	btr r12,4
	jmp LB_10453
LB_10452:
	bts r12,4
LB_10453:
	mov r8,r11
	bt r12,5
	jc LB_10454
	btr r12,2
	jmp LB_10455
LB_10454:
	bts r12,2
LB_10455:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r11,rax
	mov rax,QWORD [rsp+8*3]
	mov r10,rax
	bts r12,4
	bts r12,5
; _cns { %_7449 %_7450 } ⊢ %_7453 : %_7453
 ; {>  %_681~5':_r64 %_7450~1':(_lst)◂((_p1931)◂(_stg)) %_7451~2':(_p1932)◂(_stg) %_682~4':_r64 %_7449~0':(_p1931)◂(_stg) %_7452~3':(_lst)◂((_p1932)◂(_stg)) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _cns { %_7451 %_7452 } ⊢ %_7454 : %_7454
 ; {>  %_681~5':_r64 %_7451~2':(_p1932)◂(_stg) %_682~4':_r64 %_7452~3':(_lst)◂((_p1932)◂(_stg)) %_7453~°0◂{ 0' 1' }:(_lst)◂((_p1931)◂(_stg)) }
; _cns { 2' 3' } ⊢ °0◂{ 2' 3' }
; _some { %_7453 %_7454 } ⊢ %_7455 : %_7455
 ; {>  %_681~5':_r64 %_682~4':_r64 %_7454~°0◂{ 2' 3' }:(_lst)◂((_p1932)◂(_stg)) %_7453~°0◂{ 0' 1' }:(_lst)◂((_p1931)◂(_stg)) }
; _some { °0◂{ 0' 1' } °0◂{ 2' 3' } } ⊢ °0◂{ °0◂{ 0' 1' } °0◂{ 2' 3' } }
; ∎ %_7455
 ; {>  %_681~5':_r64 %_7455~°0◂{ °0◂{ 0' 1' } °0◂{ 2' 3' } }:(_opn)◂({ (_lst)◂((_p1931)◂(_stg)) (_lst)◂((_p1932)◂(_stg)) }) %_682~4':_r64 }
; 	∎ °0◂{ °0◂{ 0' 1' } °0◂{ 2' 3' } }
	bt r12,5
	jc LB_10369
	mov rdi,r11
	call dlt
LB_10369:
	bt r12,4
	jc LB_10370
	mov rdi,r10
	call dlt
LB_10370:
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂{ °0◂{ 0' 1' } °0◂{ 2' 3' } } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_10371
	btr r12,4
	jmp LB_10372
LB_10371:
	bts r12,4
LB_10372:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_10379
	btr r12,6
	jmp LB_10380
LB_10379:
	bts r12,6
LB_10380:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_10377
	btr QWORD [rdi],0
	jmp LB_10378
LB_10377:
	bts QWORD [rdi],0
LB_10378:
	mov rcx,r14
	bt r12,1
	jc LB_10383
	btr r12,6
	jmp LB_10384
LB_10383:
	bts r12,6
LB_10384:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_10381
	btr QWORD [rdi],1
	jmp LB_10382
LB_10381:
	bts QWORD [rdi],1
LB_10382:
	mov rsi,1
	bt r12,5
	jc LB_10375
	mov rsi,0
	bt r11,0
	jc LB_10375
	jmp LB_10376
LB_10375:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_10376:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_10373
	btr QWORD [rdi],0
	jmp LB_10374
LB_10373:
	bts QWORD [rdi],0
LB_10374:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov r13,r8
	bt r12,2
	jc LB_10391
	btr r12,0
	jmp LB_10392
LB_10391:
	bts r12,0
LB_10392:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_10389
	btr QWORD [rdi],0
	jmp LB_10390
LB_10389:
	bts QWORD [rdi],0
LB_10390:
	mov r13,r10
	bt r12,4
	jc LB_10395
	btr r12,0
	jmp LB_10396
LB_10395:
	bts r12,0
LB_10396:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_10393
	btr QWORD [rdi],1
	jmp LB_10394
LB_10393:
	bts QWORD [rdi],1
LB_10394:
	mov rsi,1
	bt r12,5
	jc LB_10387
	mov rsi,0
	bt r11,0
	jc LB_10387
	jmp LB_10388
LB_10387:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_10388:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_10385
	btr QWORD [rdi],1
	jmp LB_10386
LB_10385:
	bts QWORD [rdi],1
LB_10386:
	mov r8,0
	bts r12,2
	ret
LB_10397:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10399
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10398
LB_10399:
	add rsp,8
	ret
LB_10400:
	add rsp,80
	pop r14
LB_10398:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7152:
NS_E_RDI_7152:
NS_E_7152_ETR_TBL:
NS_E_7152_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; var_idx
	jmp LB_10488
LB_10487:
	add r14,1
LB_10488:
	cmp r14,r10
	jge LB_10489
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10487
	cmp al,10
	jz LB_10487
	cmp al,32
	jz LB_10487
LB_10489:
	push r10
	call NS_E_7153_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10490
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10471
LB_10490:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "*"
	jmp LB_10493
LB_10492:
	add r14,1
LB_10493:
	cmp r14,r10
	jge LB_10494
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10492
	cmp al,10
	jz LB_10492
	cmp al,32
	jz LB_10492
LB_10494:
	add r14,1
	cmp r14,r10
	jg LB_10498
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,42
	jnz LB_10498
	jmp LB_10499
LB_10498:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10496
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10496:
	jmp LB_10471
LB_10499:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; stg_ltr
	jmp LB_10481
LB_10480:
	add r14,1
LB_10481:
	cmp r14,r10
	jge LB_10482
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10480
	cmp al,10
	jz LB_10480
	cmp al,32
	jz LB_10480
LB_10482:
	push r10
	call NS_E_1245_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10483
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10484
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10484:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10485
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10485:
	jmp LB_10472
LB_10483:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_10478
	btr r12,2
	clc
	jmp LB_10479
LB_10478:
	bts r12,2
	stc
LB_10479:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10476
	btr r12,1
	clc
	jmp LB_10477
LB_10476:
	bts r12,1
	stc
LB_10477:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10474
	btr r12,0
	clc
	jmp LB_10475
LB_10474:
	bts r12,0
	stc
LB_10475:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 189
	push LB_10468
	push LB_10468
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_10500
	btr r12,3
	jmp LB_10501
LB_10500:
	bts r12,3
LB_10501:
	mov r14,r8
	bt r12,2
	jc LB_10502
	btr r12,1
	jmp LB_10503
LB_10502:
	bts r12,1
LB_10503:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _f1971 { %_7456 %_7457 } ⊢ %_7458 : %_7458
 ; {>  %_686~2':_r64 %_7456~0':_r64 %_685~3':_r64 %_7457~1':_stg }
; _f1971 { 0' 1' } ⊢ °3◂{ 0' 1' }
; _some %_7458 ⊢ %_7459 : %_7459
 ; {>  %_686~2':_r64 %_7458~°3◂{ 0' 1' }:_p1948 %_685~3':_r64 }
; _some °3◂{ 0' 1' } ⊢ °0◂°3◂{ 0' 1' }
; ∎ %_7459
 ; {>  %_686~2':_r64 %_7459~°0◂°3◂{ 0' 1' }:(_opn)◂(_p1948) %_685~3':_r64 }
; 	∎ °0◂°3◂{ 0' 1' }
	bt r12,2
	jc LB_10456
	mov rdi,r8
	call dlt
LB_10456:
	bt r12,3
	jc LB_10457
	mov rdi,r9
	call dlt
LB_10457:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°3◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_10462
	btr r12,2
	jmp LB_10463
LB_10462:
	bts r12,2
LB_10463:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_10460
	btr QWORD [rdi],0
	jmp LB_10461
LB_10460:
	bts QWORD [rdi],0
LB_10461:
	mov r8,r14
	bt r12,1
	jc LB_10466
	btr r12,2
	jmp LB_10467
LB_10466:
	bts r12,2
LB_10467:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_10464
	btr QWORD [rdi],1
	jmp LB_10465
LB_10464:
	bts QWORD [rdi],1
LB_10465:
	mov rsi,1
	bt r12,3
	jc LB_10458
	mov rsi,0
	bt r9,0
	jc LB_10458
	jmp LB_10459
LB_10458:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10459:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10468:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10470
	pop r14
	jmp LB_10473
LB_10470:
	add rsp,8
	ret
LB_10472:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_10473:
	ret
LB_10471:
	add rsp,48
	pop r14
LB_10469:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_10517
LB_10516:
	add r14,1
LB_10517:
	cmp r14,r10
	jge LB_10518
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10516
	cmp al,10
	jz LB_10516
	cmp al,32
	jz LB_10516
LB_10518:
	push r10
	call NS_E_7155_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10519
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10513
LB_10519:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10514
	btr r12,0
	clc
	jmp LB_10515
LB_10514:
	bts r12,0
	stc
LB_10515:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 190
	push LB_10510
	push LB_10510
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1968 %_7460 ⊢ %_7461 : %_7461
 ; {>  %_7460~0':_stg %_689~2':_r64 %_690~1':_r64 }
; _f1968 0' ⊢ °0◂0'
; _some %_7461 ⊢ %_7462 : %_7462
 ; {>  %_689~2':_r64 %_7461~°0◂0':_p1948 %_690~1':_r64 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_7462
 ; {>  %_689~2':_r64 %_7462~°0◂°0◂0':(_opn)◂(_p1948) %_690~1':_r64 }
; 	∎ °0◂°0◂0'
	bt r12,2
	jc LB_10504
	mov rdi,r8
	call dlt
LB_10504:
	bt r12,1
	jc LB_10505
	mov rdi,r14
	call dlt
LB_10505:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_10508
	btr r12,3
	jmp LB_10509
LB_10508:
	bts r12,3
LB_10509:
	mov rsi,1
	bt r12,3
	jc LB_10506
	mov rsi,0
	bt r9,0
	jc LB_10506
	jmp LB_10507
LB_10506:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10507:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10510:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10512
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10511
LB_10512:
	add rsp,8
	ret
LB_10513:
	add rsp,16
	pop r14
LB_10511:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_10534
LB_10533:
	add r14,1
LB_10534:
	cmp r14,r10
	jge LB_10535
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10533
	cmp al,10
	jz LB_10533
	cmp al,32
	jz LB_10533
LB_10535:
	push r10
	call NS_E_1245_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10536
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10530
LB_10536:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10531
	btr r12,0
	clc
	jmp LB_10532
LB_10531:
	bts r12,0
	stc
LB_10532:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 191
	push LB_10527
	push LB_10527
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1968 %_7463 ⊢ %_7464 : %_7464
 ; {>  %_694~1':_r64 %_693~2':_r64 %_7463~0':_stg }
; _f1968 0' ⊢ °0◂0'
; _some %_7464 ⊢ %_7465 : %_7465
 ; {>  %_694~1':_r64 %_7464~°0◂0':_p1948 %_693~2':_r64 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_7465
 ; {>  %_7465~°0◂°0◂0':(_opn)◂(_p1948) %_694~1':_r64 %_693~2':_r64 }
; 	∎ °0◂°0◂0'
	bt r12,1
	jc LB_10521
	mov rdi,r14
	call dlt
LB_10521:
	bt r12,2
	jc LB_10522
	mov rdi,r8
	call dlt
LB_10522:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_10525
	btr r12,3
	jmp LB_10526
LB_10525:
	bts r12,3
LB_10526:
	mov rsi,1
	bt r12,3
	jc LB_10523
	mov rsi,0
	bt r9,0
	jc LB_10523
	jmp LB_10524
LB_10523:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10524:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10527:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10529
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10528
LB_10529:
	add rsp,8
	ret
LB_10530:
	add rsp,16
	pop r14
LB_10528:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_10551
LB_10550:
	add r14,1
LB_10551:
	cmp r14,r10
	jge LB_10552
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10550
	cmp al,10
	jz LB_10550
	cmp al,32
	jz LB_10550
LB_10552:
	push r10
	call NS_E_4901_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10553
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10547
LB_10553:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10548
	btr r12,0
	clc
	jmp LB_10549
LB_10548:
	bts r12,0
	stc
LB_10549:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 192
	push LB_10544
	push LB_10544
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1969 %_7466 ⊢ %_7467 : %_7467
 ; {>  %_7466~0':_p1878 %_698~1':_r64 %_697~2':_r64 }
; _f1969 0' ⊢ °1◂0'
; _some %_7467 ⊢ %_7468 : %_7468
 ; {>  %_7467~°1◂0':_p1948 %_698~1':_r64 %_697~2':_r64 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_7468
 ; {>  %_698~1':_r64 %_7468~°0◂°1◂0':(_opn)◂(_p1948) %_697~2':_r64 }
; 	∎ °0◂°1◂0'
	bt r12,1
	jc LB_10538
	mov rdi,r14
	call dlt
LB_10538:
	bt r12,2
	jc LB_10539
	mov rdi,r8
	call dlt
LB_10539:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_10542
	btr r12,3
	jmp LB_10543
LB_10542:
	bts r12,3
LB_10543:
	mov rsi,1
	bt r12,3
	jc LB_10540
	mov rsi,0
	bt r9,0
	jc LB_10540
	jmp LB_10541
LB_10540:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10541:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10544:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10546
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10545
LB_10546:
	add rsp,8
	ret
LB_10547:
	add rsp,16
	pop r14
LB_10545:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_fmt
	jmp LB_10574
LB_10573:
	add r14,1
LB_10574:
	cmp r14,r10
	jge LB_10575
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10573
	cmp al,10
	jz LB_10573
	cmp al,32
	jz LB_10573
LB_10575:
	push r10
	call NS_E_7154_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10576
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10570
LB_10576:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10571
	btr r12,0
	clc
	jmp LB_10572
LB_10571:
	bts r12,0
	stc
LB_10572:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 193
	push LB_10567
	push LB_10567
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_10578
	btr r12,2
	jmp LB_10579
LB_10578:
	bts r12,2
LB_10579:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_10582
	btr r12,3
	clc
	jmp LB_10583
LB_10582:
	bts r12,3
	stc
LB_10583:
	mov r13,r9
	bt r12,3
	jc LB_10580
	btr r12,0
	jmp LB_10581
LB_10580:
	bts r12,0
LB_10581:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_10586
	btr r12,3
	clc
	jmp LB_10587
LB_10586:
	bts r12,3
	stc
LB_10587:
	mov r14,r9
	bt r12,3
	jc LB_10584
	btr r12,1
	jmp LB_10585
LB_10584:
	bts r12,1
LB_10585:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _f1970 %_7469 ⊢ %_7470 : %_7470
 ; {>  %_701~3':_r64 %_702~2':_r64 %_7469~{ 0' 1' }:{ _p1949 _r64 } }
; _f1970 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_7470 ⊢ %_7471 : %_7471
 ; {>  %_701~3':_r64 %_7470~°2◂{ 0' 1' }:_p1948 %_702~2':_r64 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_7471
 ; {>  %_701~3':_r64 %_7471~°0◂°2◂{ 0' 1' }:(_opn)◂(_p1948) %_702~2':_r64 }
; 	∎ °0◂°2◂{ 0' 1' }
	bt r12,3
	jc LB_10555
	mov rdi,r9
	call dlt
LB_10555:
	bt r12,2
	jc LB_10556
	mov rdi,r8
	call dlt
LB_10556:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_10561
	btr r12,2
	jmp LB_10562
LB_10561:
	bts r12,2
LB_10562:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_10559
	btr QWORD [rdi],0
	jmp LB_10560
LB_10559:
	bts QWORD [rdi],0
LB_10560:
	mov r8,r14
	bt r12,1
	jc LB_10565
	btr r12,2
	jmp LB_10566
LB_10565:
	bts r12,2
LB_10566:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_10563
	btr QWORD [rdi],1
	jmp LB_10564
LB_10563:
	bts QWORD [rdi],1
LB_10564:
	mov rsi,1
	bt r12,3
	jc LB_10557
	mov rsi,0
	bt r9,0
	jc LB_10557
	jmp LB_10558
LB_10557:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10558:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10567:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10569
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10568
LB_10569:
	add rsp,8
	ret
LB_10570:
	add rsp,16
	pop r14
LB_10568:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7153:
NS_E_RDI_7153:
NS_E_7153_ETR_TBL:
NS_E_7153_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_906_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10603
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10595
LB_10603:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_10611
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,39
	jnz LB_10611
	jmp LB_10612
LB_10611:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10609
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10609:
	jmp LB_10595
LB_10612:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10598
	btr r12,1
	clc
	jmp LB_10599
LB_10598:
	bts r12,1
	stc
LB_10599:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10596
	btr r12,0
	clc
	jmp LB_10597
LB_10596:
	bts r12,0
	stc
LB_10597:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 194
	push LB_10592
	push LB_10592
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some %_7472 ⊢ %_7473 : %_7473
 ; {>  %_7472~0':_r64 %_706~1':_r64 %_705~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_7473
 ; {>  %_706~1':_r64 %_7473~°0◂0':(_opn)◂(_r64) %_705~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_10588
	mov rdi,r14
	call dlt
LB_10588:
	bt r12,2
	jc LB_10589
	mov rdi,r8
	call dlt
LB_10589:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_10590
	btr r12,3
	jmp LB_10591
LB_10590:
	bts r12,3
LB_10591:
	mov r8,0
	bts r12,2
	ret
LB_10592:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10594
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10593
LB_10594:
	add rsp,8
	ret
LB_10595:
	add rsp,32
	pop r14
LB_10593:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7154:
NS_E_RDI_7154:
NS_E_7154_ETR_TBL:
NS_E_7154_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_906_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10634
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10626
LB_10634:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "d'"
	add r14,2
	cmp r14,r10
	jg LB_10642
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,100
	jnz LB_10642
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,39
	jnz LB_10642
	jmp LB_10643
LB_10642:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10640
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10640:
	jmp LB_10626
LB_10643:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10629
	btr r12,1
	clc
	jmp LB_10630
LB_10629:
	bts r12,1
	stc
LB_10630:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10627
	btr r12,0
	clc
	jmp LB_10628
LB_10627:
	bts r12,0
	stc
LB_10628:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 195
	push LB_10623
	push LB_10623
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1973 {  } ⊢ %_7475 : %_7475
 ; {>  %_710~1':_r64 %_709~2':_r64 %_7474~0':_r64 }
; _f1973 {  } ⊢ °1◂{  }
; _some { %_7475 %_7474 } ⊢ %_7476 : %_7476
 ; {>  %_710~1':_r64 %_709~2':_r64 %_7474~0':_r64 %_7475~°1◂{  }:_p1949 }
; _some { °1◂{  } 0' } ⊢ °0◂{ °1◂{  } 0' }
; ∎ %_7476
 ; {>  %_710~1':_r64 %_709~2':_r64 %_7476~°0◂{ °1◂{  } 0' }:(_opn)◂({ _p1949 _r64 }) }
; 	∎ °0◂{ °1◂{  } 0' }
	bt r12,1
	jc LB_10613
	mov rdi,r14
	call dlt
LB_10613:
	bt r12,2
	jc LB_10614
	mov rdi,r8
	call dlt
LB_10614:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °1◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_10617
	mov rsi,0
	bt r14,0
	jc LB_10617
	jmp LB_10618
LB_10617:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_10618:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_10615
	btr QWORD [rdi],0
	jmp LB_10616
LB_10615:
	bts QWORD [rdi],0
LB_10616:
	mov r14,r13
	bt r12,0
	jc LB_10621
	btr r12,1
	jmp LB_10622
LB_10621:
	bts r12,1
LB_10622:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_10619
	btr QWORD [rdi],1
	jmp LB_10620
LB_10619:
	bts QWORD [rdi],1
LB_10620:
	mov r8,0
	bts r12,2
	ret
LB_10623:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10625
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10624
LB_10625:
	add rsp,8
	ret
LB_10626:
	add rsp,32
	pop r14
LB_10624:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_906_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10665
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10657
LB_10665:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "x'"
	add r14,2
	cmp r14,r10
	jg LB_10673
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,120
	jnz LB_10673
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,39
	jnz LB_10673
	jmp LB_10674
LB_10673:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10671
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10671:
	jmp LB_10657
LB_10674:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10660
	btr r12,1
	clc
	jmp LB_10661
LB_10660:
	bts r12,1
	stc
LB_10661:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10658
	btr r12,0
	clc
	jmp LB_10659
LB_10658:
	bts r12,0
	stc
LB_10659:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 196
	push LB_10654
	push LB_10654
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1974 {  } ⊢ %_7478 : %_7478
 ; {>  %_713~2':_r64 %_714~1':_r64 %_7477~0':_r64 }
; _f1974 {  } ⊢ °2◂{  }
; _some { %_7478 %_7477 } ⊢ %_7479 : %_7479
 ; {>  %_713~2':_r64 %_714~1':_r64 %_7478~°2◂{  }:_p1949 %_7477~0':_r64 }
; _some { °2◂{  } 0' } ⊢ °0◂{ °2◂{  } 0' }
; ∎ %_7479
 ; {>  %_713~2':_r64 %_714~1':_r64 %_7479~°0◂{ °2◂{  } 0' }:(_opn)◂({ _p1949 _r64 }) }
; 	∎ °0◂{ °2◂{  } 0' }
	bt r12,2
	jc LB_10644
	mov rdi,r8
	call dlt
LB_10644:
	bt r12,1
	jc LB_10645
	mov rdi,r14
	call dlt
LB_10645:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °2◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_10648
	mov rsi,0
	bt r14,0
	jc LB_10648
	jmp LB_10649
LB_10648:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_10649:
	mov rax,0x0200_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_10646
	btr QWORD [rdi],0
	jmp LB_10647
LB_10646:
	bts QWORD [rdi],0
LB_10647:
	mov r14,r13
	bt r12,0
	jc LB_10652
	btr r12,1
	jmp LB_10653
LB_10652:
	bts r12,1
LB_10653:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_10650
	btr QWORD [rdi],1
	jmp LB_10651
LB_10650:
	bts QWORD [rdi],1
LB_10651:
	mov r8,0
	bts r12,2
	ret
LB_10654:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10656
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10655
LB_10656:
	add rsp,8
	ret
LB_10657:
	add rsp,32
	pop r14
LB_10655:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_906_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10696
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10688
LB_10696:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_10704
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,39
	jnz LB_10704
	jmp LB_10705
LB_10704:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10702
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10702:
	jmp LB_10688
LB_10705:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10691
	btr r12,1
	clc
	jmp LB_10692
LB_10691:
	bts r12,1
	stc
LB_10692:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10689
	btr r12,0
	clc
	jmp LB_10690
LB_10689:
	bts r12,0
	stc
LB_10690:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 197
	push LB_10685
	push LB_10685
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1972 {  } ⊢ %_7481 : %_7481
 ; {>  %_718~1':_r64 %_717~2':_r64 %_7480~0':_r64 }
; _f1972 {  } ⊢ °0◂{  }
; _some { %_7481 %_7480 } ⊢ %_7482 : %_7482
 ; {>  %_718~1':_r64 %_7481~°0◂{  }:_p1949 %_717~2':_r64 %_7480~0':_r64 }
; _some { °0◂{  } 0' } ⊢ °0◂{ °0◂{  } 0' }
; ∎ %_7482
 ; {>  %_718~1':_r64 %_7482~°0◂{ °0◂{  } 0' }:(_opn)◂({ _p1949 _r64 }) %_717~2':_r64 }
; 	∎ °0◂{ °0◂{  } 0' }
	bt r12,1
	jc LB_10675
	mov rdi,r14
	call dlt
LB_10675:
	bt r12,2
	jc LB_10676
	mov rdi,r8
	call dlt
LB_10676:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °0◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_10679
	mov rsi,0
	bt r14,0
	jc LB_10679
	jmp LB_10680
LB_10679:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_10680:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_10677
	btr QWORD [rdi],0
	jmp LB_10678
LB_10677:
	bts QWORD [rdi],0
LB_10678:
	mov r14,r13
	bt r12,0
	jc LB_10683
	btr r12,1
	jmp LB_10684
LB_10683:
	bts r12,1
LB_10684:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_10681
	btr QWORD [rdi],1
	jmp LB_10682
LB_10681:
	bts QWORD [rdi],1
LB_10682:
	mov r8,0
	bts r12,2
	ret
LB_10685:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10687
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10686
LB_10687:
	add rsp,8
	ret
LB_10688:
	add rsp,32
	pop r14
LB_10686:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7155:
NS_E_RDI_7155:
NS_E_7155_ETR_TBL:
NS_E_7155_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_10728
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,96
	jnz LB_10728
	jmp LB_10729
LB_10728:
	jmp LB_10718
LB_10729:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_7156_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10733
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10734
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10734:
	jmp LB_10718
LB_10733:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10721
	btr r12,1
	clc
	jmp LB_10722
LB_10721:
	bts r12,1
	stc
LB_10722:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10719
	btr r12,0
	clc
	jmp LB_10720
LB_10719:
	bts r12,0
	stc
LB_10720:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 198
	push LB_10715
	push LB_10715
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_10736
	btr r12,2
	jmp LB_10737
LB_10736:
	bts r12,2
LB_10737:
	mov r13,r14
	bt r12,1
	jc LB_10738
	btr r12,0
	jmp LB_10739
LB_10738:
	bts r12,0
LB_10739:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1087 %_7483 ⊢ %_7484 : %_7484
 ; {>  %_722~1':_r64 %_7483~0':(_lst)◂(_r64) %_721~2':_r64 }
; _f1087 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push 4
	push LB_10710
	call NS_E_1087
LB_10710:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_10708
	btr r12,2
	clc
	jmp LB_10709
LB_10708:
	bts r12,2
	stc
LB_10709:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10706
	btr r12,1
	clc
	jmp LB_10707
LB_10706:
	bts r12,1
	stc
LB_10707:
	add rsp,24
; _some %_7484 ⊢ %_7485 : %_7485
 ; {>  %_7484~0':_stg %_722~1':_r64 %_721~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_7485
 ; {>  %_722~1':_r64 %_7485~°0◂0':(_opn)◂(_stg) %_721~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_10711
	mov rdi,r14
	call dlt
LB_10711:
	bt r12,2
	jc LB_10712
	mov rdi,r8
	call dlt
LB_10712:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_10713
	btr r12,3
	jmp LB_10714
LB_10713:
	bts r12,3
LB_10714:
	mov r8,0
	bts r12,2
	ret
LB_10715:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10717
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10716
LB_10717:
	add rsp,8
	ret
LB_10718:
	add rsp,32
	pop r14
LB_10716:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7156:
NS_E_RDI_7156:
NS_E_7156_ETR_TBL:
NS_E_7156_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_10763
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_10763
	jmp LB_10764
LB_10763:
	jmp LB_10755
LB_10764:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10756
	btr r12,0
	clc
	jmp LB_10757
LB_10756:
	bts r12,0
	stc
LB_10757:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 199
	push LB_10752
	push LB_10752
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; » 0xra |~ {  } ⊢ %_7486 : %_7486
 ; {>  %_725~1':_r64 %_726~0':_r64 }
; 	» 0xra _ ⊢ 2' : %_7486
	mov rdi,0xa
	mov r8,rdi
	bts r12,2
; _nil {  } ⊢ %_7487 : %_7487
 ; {>  %_725~1':_r64 %_726~0':_r64 %_7486~2':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_7486 %_7487 } ⊢ %_7488 : %_7488
 ; {>  %_725~1':_r64 %_7487~°1◂{  }:(_lst)◂(t3580'(0)) %_726~0':_r64 %_7486~2':_r64 }
; _cns { 2' °1◂{  } } ⊢ °0◂{ 2' °1◂{  } }
; _some %_7488 ⊢ %_7489 : %_7489
 ; {>  %_725~1':_r64 %_726~0':_r64 %_7488~°0◂{ 2' °1◂{  } }:(_lst)◂(_r64) }
; _some °0◂{ 2' °1◂{  } } ⊢ °0◂°0◂{ 2' °1◂{  } }
; ∎ %_7489
 ; {>  %_725~1':_r64 %_7489~°0◂°0◂{ 2' °1◂{  } }:(_opn)◂((_lst)◂(_r64)) %_726~0':_r64 }
; 	∎ °0◂°0◂{ 2' °1◂{  } }
	bt r12,1
	jc LB_10740
	mov rdi,r14
	call dlt
LB_10740:
	bt r12,0
	jc LB_10741
	mov rdi,r13
	call dlt
LB_10741:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂°0◂{ 2' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r8
	bt r12,2
	jc LB_10746
	btr r12,0
	jmp LB_10747
LB_10746:
	bts r12,0
LB_10747:
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_10744
	btr QWORD [rdi],0
	jmp LB_10745
LB_10744:
	bts QWORD [rdi],0
LB_10745:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_10750
	mov rsi,0
	bt r13,0
	jc LB_10750
	jmp LB_10751
LB_10750:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_10751:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_10748
	btr QWORD [rdi],1
	jmp LB_10749
LB_10748:
	bts QWORD [rdi],1
LB_10749:
	mov rsi,1
	bt r12,3
	jc LB_10742
	mov rsi,0
	bt r9,0
	jc LB_10742
	jmp LB_10743
LB_10742:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10743:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10752:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10754
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10753
LB_10754:
	add rsp,8
	ret
LB_10755:
	add rsp,16
	pop r14
LB_10753:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_904_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10788
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10780
LB_10788:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_7156_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10793
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10794
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10794:
	jmp LB_10780
LB_10793:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10783
	btr r12,1
	clc
	jmp LB_10784
LB_10783:
	bts r12,1
	stc
LB_10784:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10781
	btr r12,0
	clc
	jmp LB_10782
LB_10781:
	bts r12,0
	stc
LB_10782:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 200
	push LB_10777
	push LB_10777
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _cns { %_7490 %_7491 } ⊢ %_7492 : %_7492
 ; {>  %_729~3':_r64 %_7491~1':(_lst)◂(_r64) %_7490~0':_r64 %_730~2':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_7492 ⊢ %_7493 : %_7493
 ; {>  %_729~3':_r64 %_730~2':_r64 %_7492~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_7493
 ; {>  %_7493~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) %_729~3':_r64 %_730~2':_r64 }
; 	∎ °0◂°0◂{ 0' 1' }
	bt r12,3
	jc LB_10765
	mov rdi,r9
	call dlt
LB_10765:
	bt r12,2
	jc LB_10766
	mov rdi,r8
	call dlt
LB_10766:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_10771
	btr r12,2
	jmp LB_10772
LB_10771:
	bts r12,2
LB_10772:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_10769
	btr QWORD [rdi],0
	jmp LB_10770
LB_10769:
	bts QWORD [rdi],0
LB_10770:
	mov r8,r14
	bt r12,1
	jc LB_10775
	btr r12,2
	jmp LB_10776
LB_10775:
	bts r12,2
LB_10776:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_10773
	btr QWORD [rdi],1
	jmp LB_10774
LB_10773:
	bts QWORD [rdi],1
LB_10774:
	mov rsi,1
	bt r12,3
	jc LB_10767
	mov rsi,0
	bt r9,0
	jc LB_10767
	jmp LB_10768
LB_10767:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10768:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10777:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10779
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10778
LB_10779:
	add rsp,8
	ret
LB_10780:
	add rsp,32
	pop r14
LB_10778:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7157:
NS_E_RDI_7157:
NS_E_7157_ETR_TBL:
NS_E_7157_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\136\144."
	jmp LB_10836
LB_10835:
	add r14,1
LB_10836:
	cmp r14,r10
	jge LB_10837
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10835
	cmp al,10
	jz LB_10835
	cmp al,32
	jz LB_10835
LB_10837:
	add r14,4
	cmp r14,r10
	jg LB_10840
	movzx rax,BYTE [r13+r14+8*1+0-4]
	cmp al,226
	jnz LB_10840
	movzx rax,BYTE [r13+r14+8*1+1-4]
	cmp al,136
	jnz LB_10840
	movzx rax,BYTE [r13+r14+8*1+2-4]
	cmp al,144
	jnz LB_10840
	movzx rax,BYTE [r13+r14+8*1+3-4]
	cmp al,46
	jnz LB_10840
	jmp LB_10841
LB_10840:
	jmp LB_10813
LB_10841:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_10823
LB_10822:
	add r14,1
LB_10823:
	cmp r14,r10
	jge LB_10824
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10822
	cmp al,10
	jz LB_10822
	cmp al,32
	jz LB_10822
LB_10824:
	push r10
	call NS_E_7159_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10825
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10826
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10826:
	jmp LB_10814
LB_10825:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_10829
LB_10828:
	add r14,1
LB_10829:
	cmp r14,r10
	jge LB_10830
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10828
	cmp al,10
	jz LB_10828
	cmp al,32
	jz LB_10828
LB_10830:
	push r10
	call NS_E_7147_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10831
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10832
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10832:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10833
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10833:
	jmp LB_10814
LB_10831:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_10820
	btr r12,2
	clc
	jmp LB_10821
LB_10820:
	bts r12,2
	stc
LB_10821:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10818
	btr r12,1
	clc
	jmp LB_10819
LB_10818:
	bts r12,1
	stc
LB_10819:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10816
	btr r12,0
	clc
	jmp LB_10817
LB_10816:
	bts r12,0
	stc
LB_10817:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 201
	push LB_10810
	push LB_10810
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_10842
	btr r12,3
	jmp LB_10843
LB_10842:
	bts r12,3
LB_10843:
	mov r14,r8
	bt r12,2
	jc LB_10844
	btr r12,1
	jmp LB_10845
LB_10844:
	bts r12,1
LB_10845:
	mov r8,r13
	bt r12,0
	jc LB_10846
	btr r12,2
	jmp LB_10847
LB_10846:
	bts r12,2
LB_10847:
	mov r13,r9
	bt r12,3
	jc LB_10848
	btr r12,0
	jmp LB_10849
LB_10848:
	bts r12,0
LB_10849:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _f1963 %_7495 ⊢ %_7496 : %_7496
 ; {>  %_7494~0':(_lst)◂((_p1946)◂(_stg)) %_7495~1':(_p1942)◂(_stg) %_734~2':_r64 %_733~3':_r64 }
; _f1963 1' ⊢ °2◂1'
; _f928 { %_7494 %_7496 } ⊢ %_7497 : %_7497
 ; {>  %_7494~0':(_lst)◂((_p1946)◂(_stg)) %_7496~°2◂1':(_p1945)◂(_stg) %_734~2':_r64 %_733~3':_r64 }
; _f928 { 0' °2◂1' } ⊢ °1◂{ 0' °2◂1' }
; _some %_7497 ⊢ %_7498 : %_7498
 ; {>  %_734~2':_r64 %_7497~°1◂{ 0' °2◂1' }:(_p926)◂({ (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_733~3':_r64 }
; _some °1◂{ 0' °2◂1' } ⊢ °0◂°1◂{ 0' °2◂1' }
; ∎ %_7498
 ; {>  %_734~2':_r64 %_7498~°0◂°1◂{ 0' °2◂1' }:(_opn)◂((_p926)◂({ (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) })) %_733~3':_r64 }
; 	∎ °0◂°1◂{ 0' °2◂1' }
	bt r12,2
	jc LB_10796
	mov rdi,r8
	call dlt
LB_10796:
	bt r12,3
	jc LB_10797
	mov rdi,r9
	call dlt
LB_10797:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' °2◂1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_10802
	btr r12,2
	jmp LB_10803
LB_10802:
	bts r12,2
LB_10803:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_10800
	btr QWORD [rdi],0
	jmp LB_10801
LB_10800:
	bts QWORD [rdi],0
LB_10801:
	mov r8,r14
	bt r12,1
	jc LB_10808
	btr r12,2
	jmp LB_10809
LB_10808:
	bts r12,2
LB_10809:
	mov rsi,1
	bt r12,2
	jc LB_10806
	mov rsi,0
	bt r8,0
	jc LB_10806
	jmp LB_10807
LB_10806:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_10807:
	mov rax,0x0200_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_10804
	btr QWORD [rdi],1
	jmp LB_10805
LB_10804:
	bts QWORD [rdi],1
LB_10805:
	mov rsi,1
	bt r12,3
	jc LB_10798
	mov rsi,0
	bt r9,0
	jc LB_10798
	jmp LB_10799
LB_10798:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10799:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10810:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10812
	pop r14
	jmp LB_10815
LB_10812:
	add rsp,8
	ret
LB_10814:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_10815:
	ret
LB_10813:
	add rsp,48
	pop r14
LB_10811:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_10883
LB_10882:
	add r14,1
LB_10883:
	cmp r14,r10
	jge LB_10884
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10882
	cmp al,10
	jz LB_10882
	cmp al,32
	jz LB_10882
LB_10884:
	add r14,3
	cmp r14,r10
	jg LB_10887
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_10887
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,136
	jnz LB_10887
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,144
	jnz LB_10887
	jmp LB_10888
LB_10887:
	jmp LB_10873
LB_10888:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_10890
LB_10889:
	add r14,1
LB_10890:
	cmp r14,r10
	jge LB_10891
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10889
	cmp al,10
	jz LB_10889
	cmp al,32
	jz LB_10889
LB_10891:
	push r10
	call NS_E_7159_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10892
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10893
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10893:
	jmp LB_10873
LB_10892:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_10896
LB_10895:
	add r14,1
LB_10896:
	cmp r14,r10
	jge LB_10897
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10895
	cmp al,10
	jz LB_10895
	cmp al,32
	jz LB_10895
LB_10897:
	push r10
	call NS_E_7147_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10898
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10899
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10899:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10900
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10900:
	jmp LB_10873
LB_10898:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_mtc
	jmp LB_10903
LB_10902:
	add r14,1
LB_10903:
	cmp r14,r10
	jge LB_10904
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10902
	cmp al,10
	jz LB_10902
	cmp al,32
	jz LB_10902
LB_10904:
	push r10
	call NS_E_7157_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10905
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_10906
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_10906:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10907
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10907:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10908
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10908:
	jmp LB_10873
LB_10905:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_10880
	btr r12,3
	clc
	jmp LB_10881
LB_10880:
	bts r12,3
	stc
LB_10881:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_10878
	btr r12,2
	clc
	jmp LB_10879
LB_10878:
	bts r12,2
	stc
LB_10879:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10876
	btr r12,1
	clc
	jmp LB_10877
LB_10876:
	bts r12,1
	stc
LB_10877:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10874
	btr r12,0
	clc
	jmp LB_10875
LB_10874:
	bts r12,0
	stc
LB_10875:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push 202
	push LB_10870
	push LB_10870
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_10910
	btr r12,4
	jmp LB_10911
LB_10910:
	bts r12,4
LB_10911:
	mov r8,r9
	bt r12,3
	jc LB_10912
	btr r12,2
	jmp LB_10913
LB_10912:
	bts r12,2
LB_10913:
	mov r9,r14
	bt r12,1
	jc LB_10914
	btr r12,3
	jmp LB_10915
LB_10914:
	bts r12,3
LB_10915:
	mov r14,r10
	bt r12,4
	jc LB_10916
	btr r12,1
	jmp LB_10917
LB_10916:
	bts r12,1
LB_10917:
	mov r10,r13
	bt r12,0
	jc LB_10918
	btr r12,4
	jmp LB_10919
LB_10918:
	bts r12,4
LB_10919:
	mov r13,r9
	bt r12,3
	jc LB_10920
	btr r12,0
	jmp LB_10921
LB_10920:
	bts r12,0
LB_10921:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r10,rax
	mov rax,QWORD [rsp+8*3]
	mov r9,rax
	bts r12,3
	bts r12,4
; _f1963 %_7500 ⊢ %_7502 : %_7502
 ; {>  %_738~3':_r64 %_7499~0':(_lst)◂((_p1946)◂(_stg)) %_7501~2':(_p926)◂({ (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_7500~1':(_p1942)◂(_stg) %_737~4':_r64 }
; _f1963 1' ⊢ °2◂1'
; _f927 { { %_7499 %_7502 } %_7501 } ⊢ %_7503 : %_7503
 ; {>  %_7502~°2◂1':(_p1945)◂(_stg) %_738~3':_r64 %_7499~0':(_lst)◂((_p1946)◂(_stg)) %_7501~2':(_p926)◂({ (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_737~4':_r64 }
; _f927 { { 0' °2◂1' } 2' } ⊢ °0◂{ { 0' °2◂1' } 2' }
; _some %_7503 ⊢ %_7504 : %_7504
 ; {>  %_738~3':_r64 %_7503~°0◂{ { 0' °2◂1' } 2' }:(_p926)◂({ (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_737~4':_r64 }
; _some °0◂{ { 0' °2◂1' } 2' } ⊢ °0◂°0◂{ { 0' °2◂1' } 2' }
; ∎ %_7504
 ; {>  %_7504~°0◂°0◂{ { 0' °2◂1' } 2' }:(_opn)◂((_p926)◂({ (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) })) %_738~3':_r64 %_737~4':_r64 }
; 	∎ °0◂°0◂{ { 0' °2◂1' } 2' }
	bt r12,3
	jc LB_10850
	mov rdi,r9
	call dlt
LB_10850:
	bt r12,4
	jc LB_10851
	mov rdi,r10
	call dlt
LB_10851:
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ { 0' °2◂1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_10858
	btr r12,5
	jmp LB_10859
LB_10858:
	bts r12,5
LB_10859:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_10856
	btr QWORD [rdi],0
	jmp LB_10857
LB_10856:
	bts QWORD [rdi],0
LB_10857:
	mov r11,r14
	bt r12,1
	jc LB_10864
	btr r12,5
	jmp LB_10865
LB_10864:
	bts r12,5
LB_10865:
	mov rsi,1
	bt r12,5
	jc LB_10862
	mov rsi,0
	bt r11,0
	jc LB_10862
	jmp LB_10863
LB_10862:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_10863:
	mov rax,0x0200_0000_0000_0001
	or r11,rax
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_10860
	btr QWORD [rdi],1
	jmp LB_10861
LB_10860:
	bts QWORD [rdi],1
LB_10861:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_10854
	btr QWORD [rdi],0
	jmp LB_10855
LB_10854:
	bts QWORD [rdi],0
LB_10855:
	mov r10,r8
	bt r12,2
	jc LB_10868
	btr r12,4
	jmp LB_10869
LB_10868:
	bts r12,4
LB_10869:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_10866
	btr QWORD [rdi],1
	jmp LB_10867
LB_10866:
	bts QWORD [rdi],1
LB_10867:
	mov rsi,1
	bt r12,3
	jc LB_10852
	mov rsi,0
	bt r9,0
	jc LB_10852
	jmp LB_10853
LB_10852:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10853:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10870:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10872
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10871
LB_10872:
	add rsp,8
	ret
LB_10873:
	add rsp,64
	pop r14
LB_10871:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7158:
NS_E_RDI_7158:
NS_E_7158_ETR_TBL:
NS_E_7158_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "\226\136\144."
	jmp LB_10976
LB_10975:
	add r14,1
LB_10976:
	cmp r14,r10
	jge LB_10977
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10975
	cmp al,10
	jz LB_10975
	cmp al,32
	jz LB_10975
LB_10977:
	add r14,4
	cmp r14,r10
	jg LB_10980
	movzx rax,BYTE [r13+r14+8*1+0-4]
	cmp al,226
	jnz LB_10980
	movzx rax,BYTE [r13+r14+8*1+1-4]
	cmp al,136
	jnz LB_10980
	movzx rax,BYTE [r13+r14+8*1+2-4]
	cmp al,144
	jnz LB_10980
	movzx rax,BYTE [r13+r14+8*1+3-4]
	cmp al,46
	jnz LB_10980
	jmp LB_10981
LB_10980:
	jmp LB_10943
LB_10981:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_ptn
	jmp LB_10955
LB_10954:
	add r14,1
LB_10955:
	cmp r14,r10
	jge LB_10956
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10954
	cmp al,10
	jz LB_10954
	cmp al,32
	jz LB_10954
LB_10956:
	push r10
	call NS_E_5167_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10957
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10958
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10958:
	jmp LB_10944
LB_10957:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_line
	jmp LB_10961
LB_10960:
	add r14,1
LB_10961:
	cmp r14,r10
	jge LB_10962
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10960
	cmp al,10
	jz LB_10960
	cmp al,32
	jz LB_10960
LB_10962:
	push r10
	call NS_E_7159_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10963
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10964
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10964:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10965
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10965:
	jmp LB_10944
LB_10963:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_10968
LB_10967:
	add r14,1
LB_10968:
	cmp r14,r10
	jge LB_10969
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_10967
	cmp al,10
	jz LB_10967
	cmp al,32
	jz LB_10967
LB_10969:
	push r10
	call NS_E_7147_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_10970
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_10971
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_10971:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_10972
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_10972:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_10973
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_10973:
	jmp LB_10944
LB_10970:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_10952
	btr r12,3
	clc
	jmp LB_10953
LB_10952:
	bts r12,3
	stc
LB_10953:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_10950
	btr r12,2
	clc
	jmp LB_10951
LB_10950:
	bts r12,2
	stc
LB_10951:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_10948
	btr r12,1
	clc
	jmp LB_10949
LB_10948:
	bts r12,1
	stc
LB_10949:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10946
	btr r12,0
	clc
	jmp LB_10947
LB_10946:
	bts r12,0
	stc
LB_10947:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push 203
	push LB_10940
	push LB_10940
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_10982
	btr r12,4
	jmp LB_10983
LB_10982:
	bts r12,4
LB_10983:
	mov r8,r9
	bt r12,3
	jc LB_10984
	btr r12,2
	jmp LB_10985
LB_10984:
	bts r12,2
LB_10985:
	mov r9,r14
	bt r12,1
	jc LB_10986
	btr r12,3
	jmp LB_10987
LB_10986:
	bts r12,3
LB_10987:
	mov r14,r10
	bt r12,4
	jc LB_10988
	btr r12,1
	jmp LB_10989
LB_10988:
	bts r12,1
LB_10989:
	mov r10,r13
	bt r12,0
	jc LB_10990
	btr r12,4
	jmp LB_10991
LB_10990:
	bts r12,4
LB_10991:
	mov r13,r9
	bt r12,3
	jc LB_10992
	btr r12,0
	jmp LB_10993
LB_10992:
	bts r12,0
LB_10993:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r10,rax
	mov rax,QWORD [rsp+8*3]
	mov r9,rax
	bts r12,3
	bts r12,4
; _f1963 %_7507 ⊢ %_7508 : %_7508
 ; {>  %_7507~2':(_p1942)◂(_stg) %_741~4':_r64 %_7505~0':(_p1924)◂((_p1937)◂(_stg)) %_742~3':_r64 %_7506~1':(_lst)◂((_p1946)◂(_stg)) }
; _f1963 2' ⊢ °2◂2'
; _f928 { %_7505 %_7506 %_7508 } ⊢ %_7509 : %_7509
 ; {>  %_741~4':_r64 %_7505~0':(_p1924)◂((_p1937)◂(_stg)) %_742~3':_r64 %_7506~1':(_lst)◂((_p1946)◂(_stg)) %_7508~°2◂2':(_p1945)◂(_stg) }
; _f928 { 0' 1' °2◂2' } ⊢ °1◂{ 0' 1' °2◂2' }
; _some %_7509 ⊢ %_7510 : %_7510
 ; {>  %_7509~°1◂{ 0' 1' °2◂2' }:(_p926)◂({ (_p1924)◂((_p1937)◂(_stg)) (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_741~4':_r64 %_742~3':_r64 }
; _some °1◂{ 0' 1' °2◂2' } ⊢ °0◂°1◂{ 0' 1' °2◂2' }
; ∎ %_7510
 ; {>  %_7510~°0◂°1◂{ 0' 1' °2◂2' }:(_opn)◂((_p926)◂({ (_p1924)◂((_p1937)◂(_stg)) (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) })) %_741~4':_r64 %_742~3':_r64 }
; 	∎ °0◂°1◂{ 0' 1' °2◂2' }
	bt r12,4
	jc LB_10922
	mov rdi,r10
	call dlt
LB_10922:
	bt r12,3
	jc LB_10923
	mov rdi,r9
	call dlt
LB_10923:
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂{ 0' 1' °2◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_10928
	btr r12,4
	jmp LB_10929
LB_10928:
	bts r12,4
LB_10929:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_10926
	btr QWORD [rdi],0
	jmp LB_10927
LB_10926:
	bts QWORD [rdi],0
LB_10927:
	mov r10,r14
	bt r12,1
	jc LB_10932
	btr r12,4
	jmp LB_10933
LB_10932:
	bts r12,4
LB_10933:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_10930
	btr QWORD [rdi],1
	jmp LB_10931
LB_10930:
	bts QWORD [rdi],1
LB_10931:
	mov r10,r8
	bt r12,2
	jc LB_10938
	btr r12,4
	jmp LB_10939
LB_10938:
	bts r12,4
LB_10939:
	mov rsi,1
	bt r12,4
	jc LB_10936
	mov rsi,0
	bt r10,0
	jc LB_10936
	jmp LB_10937
LB_10936:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_10937:
	mov rax,0x0200_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_10934
	btr QWORD [rdi],2
	jmp LB_10935
LB_10934:
	bts QWORD [rdi],2
LB_10935:
	mov rsi,1
	bt r12,3
	jc LB_10924
	mov rsi,0
	bt r9,0
	jc LB_10924
	jmp LB_10925
LB_10924:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10925:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_10940:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10942
	pop r14
	jmp LB_10945
LB_10942:
	add rsp,8
	ret
LB_10944:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_10945:
	ret
LB_10943:
	add rsp,64
	pop r14
LB_10941:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_11035
LB_11034:
	add r14,1
LB_11035:
	cmp r14,r10
	jge LB_11036
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11034
	cmp al,10
	jz LB_11034
	cmp al,32
	jz LB_11034
LB_11036:
	add r14,3
	cmp r14,r10
	jg LB_11039
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_11039
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,136
	jnz LB_11039
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,144
	jnz LB_11039
	jmp LB_11040
LB_11039:
	jmp LB_11023
LB_11040:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_ptn
	jmp LB_11042
LB_11041:
	add r14,1
LB_11042:
	cmp r14,r10
	jge LB_11043
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11041
	cmp al,10
	jz LB_11041
	cmp al,32
	jz LB_11041
LB_11043:
	push r10
	call NS_E_5167_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11044
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11045
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11045:
	jmp LB_11023
LB_11044:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_line
	jmp LB_11048
LB_11047:
	add r14,1
LB_11048:
	cmp r14,r10
	jge LB_11049
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11047
	cmp al,10
	jz LB_11047
	cmp al,32
	jz LB_11047
LB_11049:
	push r10
	call NS_E_7159_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11050
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11051
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11051:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11052
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11052:
	jmp LB_11023
LB_11050:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_11055
LB_11054:
	add r14,1
LB_11055:
	cmp r14,r10
	jge LB_11056
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11054
	cmp al,10
	jz LB_11054
	cmp al,32
	jz LB_11054
LB_11056:
	push r10
	call NS_E_7147_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11057
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11058
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11058:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11059
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11059:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11060
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11060:
	jmp LB_11023
LB_11057:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_id_mtc
	jmp LB_11063
LB_11062:
	add r14,1
LB_11063:
	cmp r14,r10
	jge LB_11064
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11062
	cmp al,10
	jz LB_11062
	cmp al,32
	jz LB_11062
LB_11064:
	push r10
	call NS_E_7158_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11065
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_11066
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_11066:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11067
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11067:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11068
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11068:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11069
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11069:
	jmp LB_11023
LB_11065:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_11032
	btr r12,4
	clc
	jmp LB_11033
LB_11032:
	bts r12,4
	stc
LB_11033:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_11030
	btr r12,3
	clc
	jmp LB_11031
LB_11030:
	bts r12,3
	stc
LB_11031:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_11028
	btr r12,2
	clc
	jmp LB_11029
LB_11028:
	bts r12,2
	stc
LB_11029:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11026
	btr r12,1
	clc
	jmp LB_11027
LB_11026:
	bts r12,1
	stc
LB_11027:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11024
	btr r12,0
	clc
	jmp LB_11025
LB_11024:
	bts r12,0
	stc
LB_11025:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push 204
	push LB_11020
	push LB_11020
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' 1' 2' 3' }
	mov r11,r9
	bt r12,3
	jc LB_11071
	btr r12,5
	jmp LB_11072
LB_11071:
	bts r12,5
LB_11072:
	mov r9,r10
	bt r12,4
	jc LB_11073
	btr r12,3
	jmp LB_11074
LB_11073:
	bts r12,3
LB_11074:
	mov r10,r8
	bt r12,2
	jc LB_11075
	btr r12,4
	jmp LB_11076
LB_11075:
	bts r12,4
LB_11076:
	mov r8,r11
	bt r12,5
	jc LB_11077
	btr r12,2
	jmp LB_11078
LB_11077:
	bts r12,2
LB_11078:
	mov r11,r14
	bt r12,1
	jc LB_11079
	btr r12,5
	jmp LB_11080
LB_11079:
	bts r12,5
LB_11080:
	mov r14,r10
	bt r12,4
	jc LB_11081
	btr r12,1
	jmp LB_11082
LB_11081:
	bts r12,1
LB_11082:
	mov r10,r13
	bt r12,0
	jc LB_11083
	btr r12,4
	jmp LB_11084
LB_11083:
	bts r12,4
LB_11084:
	mov r13,r11
	bt r12,5
	jc LB_11085
	btr r12,0
	jmp LB_11086
LB_11085:
	bts r12,0
LB_11086:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r11,rax
	mov rax,QWORD [rsp+8*3]
	mov r10,rax
	bts r12,4
	bts r12,5
; _f1963 %_7513 ⊢ %_7515 : %_7515
 ; {>  %_7512~1':(_lst)◂((_p1946)◂(_stg)) %_7513~2':(_p1942)◂(_stg) %_745~5':_r64 %_7511~0':(_p1924)◂((_p1937)◂(_stg)) %_746~4':_r64 %_7514~3':(_p926)◂({ (_p1924)◂((_p1937)◂(_stg)) (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) }
; _f1963 2' ⊢ °2◂2'
; _f927 { { %_7511 %_7512 %_7515 } %_7514 } ⊢ %_7516 : %_7516
 ; {>  %_7512~1':(_lst)◂((_p1946)◂(_stg)) %_745~5':_r64 %_7515~°2◂2':(_p1945)◂(_stg) %_7511~0':(_p1924)◂((_p1937)◂(_stg)) %_746~4':_r64 %_7514~3':(_p926)◂({ (_p1924)◂((_p1937)◂(_stg)) (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) }
; _f927 { { 0' 1' °2◂2' } 3' } ⊢ °0◂{ { 0' 1' °2◂2' } 3' }
; _some %_7516 ⊢ %_7517 : %_7517
 ; {>  %_745~5':_r64 %_7516~°0◂{ { 0' 1' °2◂2' } 3' }:(_p926)◂({ (_p1924)◂((_p1937)◂(_stg)) (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) }) %_746~4':_r64 }
; _some °0◂{ { 0' 1' °2◂2' } 3' } ⊢ °0◂°0◂{ { 0' 1' °2◂2' } 3' }
; ∎ %_7517
 ; {>  %_745~5':_r64 %_7517~°0◂°0◂{ { 0' 1' °2◂2' } 3' }:(_opn)◂((_p926)◂({ (_p1924)◂((_p1937)◂(_stg)) (_lst)◂((_p1946)◂(_stg)) (_p1945)◂(_stg) })) %_746~4':_r64 }
; 	∎ °0◂°0◂{ { 0' 1' °2◂2' } 3' }
	bt r12,5
	jc LB_10994
	mov rdi,r11
	call dlt
LB_10994:
	bt r12,4
	jc LB_10995
	mov rdi,r10
	call dlt
LB_10995:
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°0◂{ { 0' 1' °2◂2' } 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_10996
	btr r12,4
	jmp LB_10997
LB_10996:
	bts r12,4
LB_10997:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_11004
	btr r12,6
	jmp LB_11005
LB_11004:
	bts r12,6
LB_11005:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_11002
	btr QWORD [rdi],0
	jmp LB_11003
LB_11002:
	bts QWORD [rdi],0
LB_11003:
	mov rcx,r14
	bt r12,1
	jc LB_11008
	btr r12,6
	jmp LB_11009
LB_11008:
	bts r12,6
LB_11009:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_11006
	btr QWORD [rdi],1
	jmp LB_11007
LB_11006:
	bts QWORD [rdi],1
LB_11007:
	mov rcx,r8
	bt r12,2
	jc LB_11014
	btr r12,6
	jmp LB_11015
LB_11014:
	bts r12,6
LB_11015:
	mov rsi,1
	bt r12,6
	jc LB_11012
	mov rsi,0
	bt rcx,0
	jc LB_11012
	jmp LB_11013
LB_11012:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_11013:
	mov rax,0x0200_0000_0000_0001
	or rcx,rax
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_11010
	btr QWORD [rdi],2
	jmp LB_11011
LB_11010:
	bts QWORD [rdi],2
LB_11011:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_11000
	btr QWORD [rdi],0
	jmp LB_11001
LB_11000:
	bts QWORD [rdi],0
LB_11001:
	mov r11,r10
	bt r12,4
	jc LB_11018
	btr r12,5
	jmp LB_11019
LB_11018:
	bts r12,5
LB_11019:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_11016
	btr QWORD [rdi],1
	jmp LB_11017
LB_11016:
	bts QWORD [rdi],1
LB_11017:
	mov rsi,1
	bt r12,3
	jc LB_10998
	mov rsi,0
	bt r9,0
	jc LB_10998
	jmp LB_10999
LB_10998:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_10999:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11020:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11022
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11021
LB_11022:
	add rsp,8
	ret
LB_11023:
	add rsp,80
	pop r14
LB_11021:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7159:
NS_E_RDI_7159:
NS_E_7159_ETR_TBL:
NS_E_7159_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; mtc_test
	jmp LB_11108
LB_11107:
	add r14,1
LB_11108:
	cmp r14,r10
	jge LB_11109
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11107
	cmp al,32
	jz LB_11107
LB_11109:
	push r10
	call NS_E_7160_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11110
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11102
LB_11110:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mtc_test_tl
	jmp LB_11113
LB_11112:
	add r14,1
LB_11113:
	cmp r14,r10
	jge LB_11114
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11112
	cmp al,32
	jz LB_11112
LB_11114:
	push r10
	call NS_E_7161_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11115
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11116
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11116:
	jmp LB_11102
LB_11115:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11105
	btr r12,1
	clc
	jmp LB_11106
LB_11105:
	bts r12,1
	stc
LB_11106:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11103
	btr r12,0
	clc
	jmp LB_11104
LB_11103:
	bts r12,0
	stc
LB_11104:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 205
	push LB_11099
	push LB_11099
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _cns { %_7518 %_7519 } ⊢ %_7520 : %_7520
 ; {>  %_749~3':_r64 %_7518~0':(_p1946)◂(_stg) %_750~2':_r64 %_7519~1':(_lst)◂((_p1946)◂(_stg)) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_7520 ⊢ %_7521 : %_7521
 ; {>  %_749~3':_r64 %_7520~°0◂{ 0' 1' }:(_lst)◂((_p1946)◂(_stg)) %_750~2':_r64 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_7521
 ; {>  %_749~3':_r64 %_7521~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1946)◂(_stg))) %_750~2':_r64 }
; 	∎ °0◂°0◂{ 0' 1' }
	bt r12,3
	jc LB_11087
	mov rdi,r9
	call dlt
LB_11087:
	bt r12,2
	jc LB_11088
	mov rdi,r8
	call dlt
LB_11088:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_11093
	btr r12,2
	jmp LB_11094
LB_11093:
	bts r12,2
LB_11094:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_11091
	btr QWORD [rdi],0
	jmp LB_11092
LB_11091:
	bts QWORD [rdi],0
LB_11092:
	mov r8,r14
	bt r12,1
	jc LB_11097
	btr r12,2
	jmp LB_11098
LB_11097:
	bts r12,2
LB_11098:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_11095
	btr QWORD [rdi],1
	jmp LB_11096
LB_11095:
	bts QWORD [rdi],1
LB_11096:
	mov rsi,1
	bt r12,3
	jc LB_11089
	mov rsi,0
	bt r9,0
	jc LB_11089
	jmp LB_11090
LB_11089:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11090:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11099:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11101
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11100
LB_11101:
	add rsp,8
	ret
LB_11102:
	add rsp,32
	pop r14
LB_11100:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_11131
LB_11130:
	add r14,1
LB_11131:
	cmp r14,r10
	jge LB_11132
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11130
	cmp al,32
	jz LB_11130
LB_11132:
	add r14,1
	cmp r14,r10
	jg LB_11135
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,46
	jnz LB_11135
	jmp LB_11136
LB_11135:
	jmp LB_11125
LB_11136:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_11138
LB_11137:
	add r14,1
LB_11138:
	cmp r14,r10
	jge LB_11139
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11137
	cmp al,32
	jz LB_11137
LB_11139:
	add r14,1
	cmp r14,r10
	jg LB_11143
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_11143
	jmp LB_11144
LB_11143:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11141
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11141:
	jmp LB_11125
LB_11144:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11128
	btr r12,1
	clc
	jmp LB_11129
LB_11128:
	bts r12,1
	stc
LB_11129:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11126
	btr r12,0
	clc
	jmp LB_11127
LB_11126:
	bts r12,0
	stc
LB_11127:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 206
	push LB_11122
	push LB_11122
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_7522 : %_7522
 ; {>  %_754~0':_r64 %_753~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; _some %_7522 ⊢ %_7523 : %_7523
 ; {>  %_7522~°1◂{  }:(_lst)◂(t3635'(0)) %_754~0':_r64 %_753~1':_r64 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_7523
 ; {>  %_7523~°0◂°1◂{  }:(_opn)◂((_lst)◂(t3638'(0))) %_754~0':_r64 %_753~1':_r64 }
; 	∎ °0◂°1◂{  }
	bt r12,0
	jc LB_11118
	mov rdi,r13
	call dlt
LB_11118:
	bt r12,1
	jc LB_11119
	mov rdi,r14
	call dlt
LB_11119:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_11120
	mov rsi,0
	bt r9,0
	jc LB_11120
	jmp LB_11121
LB_11120:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11121:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11122:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11124
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11123
LB_11124:
	add rsp,8
	ret
LB_11125:
	add rsp,32
	pop r14
LB_11123:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7160:
NS_E_RDI_7160:
NS_E_7160_ETR_TBL:
NS_E_7160_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; src_ptn
	jmp LB_11210
LB_11209:
	add r14,1
LB_11210:
	cmp r14,r10
	jge LB_11211
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11209
	cmp al,32
	jz LB_11209
LB_11211:
	push r10
	call NS_E_5519_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11212
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11170
LB_11212:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_11215
LB_11214:
	add r14,1
LB_11215:
	cmp r14,r10
	jge LB_11216
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11214
	cmp al,32
	jz LB_11214
LB_11216:
	add r14,3
	cmp r14,r10
	jg LB_11220
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_11220
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,138
	jnz LB_11220
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,162
	jnz LB_11220
	jmp LB_11221
LB_11220:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11218
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11218:
	jmp LB_11170
LB_11221:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_11184
LB_11183:
	add r14,1
LB_11184:
	cmp r14,r10
	jge LB_11185
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11183
	cmp al,32
	jz LB_11183
LB_11185:
	push r10
	call NS_E_4901_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11186
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11187
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11187:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11188
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11188:
	jmp LB_11171
LB_11186:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_11191
LB_11190:
	add r14,1
LB_11191:
	cmp r14,r10
	jge LB_11192
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11190
	cmp al,32
	jz LB_11190
LB_11192:
	add r14,3
	cmp r14,r10
	jg LB_11198
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_11198
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,151
	jnz LB_11198
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,130
	jnz LB_11198
	jmp LB_11199
LB_11198:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11194
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11194:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11195
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11195:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11196
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11196:
	jmp LB_11171
LB_11199:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; mtc_ptn
	jmp LB_11201
LB_11200:
	add r14,1
LB_11201:
	cmp r14,r10
	jge LB_11202
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11200
	cmp al,32
	jz LB_11200
LB_11202:
	push r10
	call NS_E_5167_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11203
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_11204
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_11204:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11205
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11205:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11206
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11206:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11207
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11207:
	jmp LB_11171
LB_11203:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_11181
	btr r12,4
	clc
	jmp LB_11182
LB_11181:
	bts r12,4
	stc
LB_11182:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_11179
	btr r12,3
	clc
	jmp LB_11180
LB_11179:
	bts r12,3
	stc
LB_11180:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_11177
	btr r12,2
	clc
	jmp LB_11178
LB_11177:
	bts r12,2
	stc
LB_11178:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11175
	btr r12,1
	clc
	jmp LB_11176
LB_11175:
	bts r12,1
	stc
LB_11176:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11173
	btr r12,0
	clc
	jmp LB_11174
LB_11173:
	bts r12,0
	stc
LB_11174:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push 207
	push LB_11167
	push LB_11167
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' {  } 1' {  } 2' }
	mov r11,r8
	bt r12,2
	jc LB_11222
	btr r12,5
	jmp LB_11223
LB_11222:
	bts r12,5
LB_11223:
	mov r8,r10
	bt r12,4
	jc LB_11224
	btr r12,2
	jmp LB_11225
LB_11224:
	bts r12,2
LB_11225:
	mov r10,r14
	bt r12,1
	jc LB_11226
	btr r12,4
	jmp LB_11227
LB_11226:
	bts r12,4
LB_11227:
	mov r14,r11
	bt r12,5
	jc LB_11228
	btr r12,1
	jmp LB_11229
LB_11228:
	bts r12,1
LB_11229:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r10,rax
	mov rax,QWORD [rsp+8*3]
	mov r9,rax
	bts r12,3
	bts r12,4
; _f1938 { %_7525 %_7526 } ⊢ %_7527 : %_7527
 ; {>  %_7524~0':(_p1924)◂((_p1931)◂(_stg)) %_758~3':_r64 %_757~4':_r64 %_7526~2':(_p1924)◂((_p1937)◂(_stg)) %_7525~1':_p1878 }
; _f1938 { 1' 2' } ⊢ °0◂{ 1' 2' }
; _f1926 %_7527 ⊢ %_7528 : %_7528
 ; {>  %_7524~0':(_p1924)◂((_p1931)◂(_stg)) %_7527~°0◂{ 1' 2' }:(_p1937)◂(_stg) %_758~3':_r64 %_757~4':_r64 }
; _f1926 °0◂{ 1' 2' } ⊢ °1◂°0◂{ 1' 2' }
; _f1964 { %_7524 %_7528 } ⊢ %_7529 : %_7529
 ; {>  %_7524~0':(_p1924)◂((_p1931)◂(_stg)) %_758~3':_r64 %_757~4':_r64 %_7528~°1◂°0◂{ 1' 2' }:(_p1924)◂((_p1937)◂(_stg)) }
; _f1964 { 0' °1◂°0◂{ 1' 2' } } ⊢ °0◂{ 0' °1◂°0◂{ 1' 2' } }
; _some %_7529 ⊢ %_7530 : %_7530
 ; {>  %_758~3':_r64 %_757~4':_r64 %_7529~°0◂{ 0' °1◂°0◂{ 1' 2' } }:(_p1946)◂(_stg) }
; _some °0◂{ 0' °1◂°0◂{ 1' 2' } } ⊢ °0◂°0◂{ 0' °1◂°0◂{ 1' 2' } }
; ∎ %_7530
 ; {>  %_758~3':_r64 %_757~4':_r64 %_7530~°0◂°0◂{ 0' °1◂°0◂{ 1' 2' } }:(_opn)◂((_p1946)◂(_stg)) }
; 	∎ °0◂°0◂{ 0' °1◂°0◂{ 1' 2' } }
	bt r12,3
	jc LB_11145
	mov rdi,r9
	call dlt
LB_11145:
	bt r12,4
	jc LB_11146
	mov rdi,r10
	call dlt
LB_11146:
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ 0' °1◂°0◂{ 1' 2' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_11151
	btr r12,4
	jmp LB_11152
LB_11151:
	bts r12,4
LB_11152:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_11149
	btr QWORD [rdi],0
	jmp LB_11150
LB_11149:
	bts QWORD [rdi],0
LB_11150:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r13,r14
	bt r12,1
	jc LB_11161
	btr r12,0
	jmp LB_11162
LB_11161:
	bts r12,0
LB_11162:
	mov rdi,r10
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_11159
	btr QWORD [rdi],0
	jmp LB_11160
LB_11159:
	bts QWORD [rdi],0
LB_11160:
	mov r13,r8
	bt r12,2
	jc LB_11165
	btr r12,0
	jmp LB_11166
LB_11165:
	bts r12,0
LB_11166:
	mov rdi,r10
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_11163
	btr QWORD [rdi],1
	jmp LB_11164
LB_11163:
	bts QWORD [rdi],1
LB_11164:
	mov rsi,1
	bt r12,4
	jc LB_11157
	mov rsi,0
	bt r10,0
	jc LB_11157
	jmp LB_11158
LB_11157:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_11158:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rsi,1
	bt r12,4
	jc LB_11155
	mov rsi,0
	bt r10,0
	jc LB_11155
	jmp LB_11156
LB_11155:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_11156:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_11153
	btr QWORD [rdi],1
	jmp LB_11154
LB_11153:
	bts QWORD [rdi],1
LB_11154:
	mov rsi,1
	bt r12,3
	jc LB_11147
	mov rsi,0
	bt r9,0
	jc LB_11147
	jmp LB_11148
LB_11147:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11148:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11167:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11169
	pop r14
	jmp LB_11172
LB_11169:
	add rsp,8
	ret
LB_11171:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_11172:
	ret
LB_11170:
	add rsp,80
	pop r14
LB_11168:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; mtc_val
	jmp LB_11253
LB_11252:
	add r14,1
LB_11253:
	cmp r14,r10
	jge LB_11254
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11252
	cmp al,32
	jz LB_11252
LB_11254:
	push r10
	call NS_E_7162_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11255
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11245
LB_11255:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_11258
LB_11257:
	add r14,1
LB_11258:
	cmp r14,r10
	jge LB_11259
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11257
	cmp al,32
	jz LB_11257
LB_11259:
	add r14,1
	cmp r14,r10
	jg LB_11263
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,61
	jnz LB_11263
	jmp LB_11264
LB_11263:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11261
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11261:
	jmp LB_11245
LB_11264:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_11266
LB_11265:
	add r14,1
LB_11266:
	cmp r14,r10
	jge LB_11267
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11265
	cmp al,32
	jz LB_11265
LB_11267:
	push r10
	call NS_E_7162_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11268
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11269
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11269:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11270
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11270:
	jmp LB_11245
LB_11268:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_11250
	btr r12,2
	clc
	jmp LB_11251
LB_11250:
	bts r12,2
	stc
LB_11251:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11248
	btr r12,1
	clc
	jmp LB_11249
LB_11248:
	bts r12,1
	stc
LB_11249:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11246
	btr r12,0
	clc
	jmp LB_11247
LB_11246:
	bts r12,0
	stc
LB_11247:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 208
	push LB_11242
	push LB_11242
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_11272
	btr r12,3
	jmp LB_11273
LB_11272:
	bts r12,3
LB_11273:
	mov r14,r8
	bt r12,2
	jc LB_11274
	btr r12,1
	jmp LB_11275
LB_11274:
	bts r12,1
LB_11275:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _f1965 { %_7531 %_7532 } ⊢ %_7533 : %_7533
 ; {>  %_7532~1':(_p1947)◂(_stg) %_7531~0':(_p1947)◂(_stg) %_762~2':_r64 %_761~3':_r64 }
; _f1965 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_7533 ⊢ %_7534 : %_7534
 ; {>  %_7533~°1◂{ 0' 1' }:(_p1946)◂(_stg) %_762~2':_r64 %_761~3':_r64 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_7534
 ; {>  %_7534~°0◂°1◂{ 0' 1' }:(_opn)◂((_p1946)◂(_stg)) %_762~2':_r64 %_761~3':_r64 }
; 	∎ °0◂°1◂{ 0' 1' }
	bt r12,2
	jc LB_11230
	mov rdi,r8
	call dlt
LB_11230:
	bt r12,3
	jc LB_11231
	mov rdi,r9
	call dlt
LB_11231:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_11236
	btr r12,2
	jmp LB_11237
LB_11236:
	bts r12,2
LB_11237:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_11234
	btr QWORD [rdi],0
	jmp LB_11235
LB_11234:
	bts QWORD [rdi],0
LB_11235:
	mov r8,r14
	bt r12,1
	jc LB_11240
	btr r12,2
	jmp LB_11241
LB_11240:
	bts r12,2
LB_11241:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_11238
	btr QWORD [rdi],1
	jmp LB_11239
LB_11238:
	bts QWORD [rdi],1
LB_11239:
	mov rsi,1
	bt r12,3
	jc LB_11232
	mov rsi,0
	bt r9,0
	jc LB_11232
	jmp LB_11233
LB_11232:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11233:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11242:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11244
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11243
LB_11244:
	add rsp,8
	ret
LB_11245:
	add rsp,48
	pop r14
LB_11243:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7161:
NS_E_RDI_7161:
NS_E_7161_ETR_TBL:
NS_E_7161_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ";"
	jmp LB_11314
LB_11313:
	add r14,1
LB_11314:
	cmp r14,r10
	jge LB_11315
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11313
	cmp al,32
	jz LB_11313
LB_11315:
	add r14,1
	cmp r14,r10
	jg LB_11318
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,59
	jnz LB_11318
	jmp LB_11319
LB_11318:
	jmp LB_11291
LB_11319:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_11301
LB_11300:
	add r14,1
LB_11301:
	cmp r14,r10
	jge LB_11302
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11300
	cmp al,32
	jz LB_11300
LB_11302:
	push r10
	call NS_E_7160_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11303
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11304
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11304:
	jmp LB_11292
LB_11303:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_test_tl
	jmp LB_11307
LB_11306:
	add r14,1
LB_11307:
	cmp r14,r10
	jge LB_11308
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11306
	cmp al,32
	jz LB_11306
LB_11308:
	push r10
	call NS_E_7161_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11309
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11310
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11310:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11311
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11311:
	jmp LB_11292
LB_11309:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_11298
	btr r12,2
	clc
	jmp LB_11299
LB_11298:
	bts r12,2
	stc
LB_11299:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11296
	btr r12,1
	clc
	jmp LB_11297
LB_11296:
	bts r12,1
	stc
LB_11297:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11294
	btr r12,0
	clc
	jmp LB_11295
LB_11294:
	bts r12,0
	stc
LB_11295:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 209
	push LB_11288
	push LB_11288
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_11320
	btr r12,3
	jmp LB_11321
LB_11320:
	bts r12,3
LB_11321:
	mov r14,r8
	bt r12,2
	jc LB_11322
	btr r12,1
	jmp LB_11323
LB_11322:
	bts r12,1
LB_11323:
	mov r8,r13
	bt r12,0
	jc LB_11324
	btr r12,2
	jmp LB_11325
LB_11324:
	bts r12,2
LB_11325:
	mov r13,r9
	bt r12,3
	jc LB_11326
	btr r12,0
	jmp LB_11327
LB_11326:
	bts r12,0
LB_11327:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _cns { %_7535 %_7536 } ⊢ %_7537 : %_7537
 ; {>  %_765~3':_r64 %_7536~1':(_lst)◂((_p1946)◂(_stg)) %_766~2':_r64 %_7535~0':(_p1946)◂(_stg) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_7537 ⊢ %_7538 : %_7538
 ; {>  %_765~3':_r64 %_7537~°0◂{ 0' 1' }:(_lst)◂((_p1946)◂(_stg)) %_766~2':_r64 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_7538
 ; {>  %_7538~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p1946)◂(_stg))) %_765~3':_r64 %_766~2':_r64 }
; 	∎ °0◂°0◂{ 0' 1' }
	bt r12,3
	jc LB_11276
	mov rdi,r9
	call dlt
LB_11276:
	bt r12,2
	jc LB_11277
	mov rdi,r8
	call dlt
LB_11277:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_11282
	btr r12,2
	jmp LB_11283
LB_11282:
	bts r12,2
LB_11283:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_11280
	btr QWORD [rdi],0
	jmp LB_11281
LB_11280:
	bts QWORD [rdi],0
LB_11281:
	mov r8,r14
	bt r12,1
	jc LB_11286
	btr r12,2
	jmp LB_11287
LB_11286:
	bts r12,2
LB_11287:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_11284
	btr QWORD [rdi],1
	jmp LB_11285
LB_11284:
	bts QWORD [rdi],1
LB_11285:
	mov rsi,1
	bt r12,3
	jc LB_11278
	mov rsi,0
	bt r9,0
	jc LB_11278
	jmp LB_11279
LB_11278:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11279:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11288:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11290
	pop r14
	jmp LB_11293
LB_11290:
	add rsp,8
	ret
LB_11292:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_11293:
	ret
LB_11291:
	add rsp,48
	pop r14
LB_11289:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_11341
LB_11340:
	add r14,1
LB_11341:
	cmp r14,r10
	jge LB_11342
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11340
	cmp al,32
	jz LB_11340
LB_11342:
	add r14,1
	cmp r14,r10
	jg LB_11345
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,46
	jnz LB_11345
	jmp LB_11346
LB_11345:
	jmp LB_11335
LB_11346:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_11348
LB_11347:
	add r14,1
LB_11348:
	cmp r14,r10
	jge LB_11349
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11347
	cmp al,32
	jz LB_11347
LB_11349:
	add r14,1
	cmp r14,r10
	jg LB_11353
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_11353
	jmp LB_11354
LB_11353:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11351
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11351:
	jmp LB_11335
LB_11354:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11338
	btr r12,1
	clc
	jmp LB_11339
LB_11338:
	bts r12,1
	stc
LB_11339:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11336
	btr r12,0
	clc
	jmp LB_11337
LB_11336:
	bts r12,0
	stc
LB_11337:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 210
	push LB_11332
	push LB_11332
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_7539 : %_7539
 ; {>  %_770~0':_r64 %_769~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; _some %_7539 ⊢ %_7540 : %_7540
 ; {>  %_770~0':_r64 %_7539~°1◂{  }:(_lst)◂(t3673'(0)) %_769~1':_r64 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_7540
 ; {>  %_770~0':_r64 %_7540~°0◂°1◂{  }:(_opn)◂((_lst)◂(t3676'(0))) %_769~1':_r64 }
; 	∎ °0◂°1◂{  }
	bt r12,0
	jc LB_11328
	mov rdi,r13
	call dlt
LB_11328:
	bt r12,1
	jc LB_11329
	mov rdi,r14
	call dlt
LB_11329:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_11330
	mov rsi,0
	bt r9,0
	jc LB_11330
	jmp LB_11331
LB_11330:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11331:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11332:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11334
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11333
LB_11334:
	add rsp,8
	ret
LB_11335:
	add rsp,32
	pop r14
LB_11333:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7162:
NS_E_RDI_7162:
NS_E_7162_ETR_TBL:
NS_E_7162_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_1677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11372
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11364
LB_11372:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_11380
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,39
	jnz LB_11380
	jmp LB_11381
LB_11380:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11378
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11378:
	jmp LB_11364
LB_11381:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11367
	btr r12,1
	clc
	jmp LB_11368
LB_11367:
	bts r12,1
	stc
LB_11368:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11365
	btr r12,0
	clc
	jmp LB_11366
LB_11365:
	bts r12,0
	stc
LB_11366:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 211
	push LB_11361
	push LB_11361
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1967 %_7541 ⊢ %_7542 : %_7542
 ; {>  %_773~2':_r64 %_7541~0':_stg %_774~1':_r64 }
; _f1967 0' ⊢ °1◂0'
; _some %_7542 ⊢ %_7543 : %_7543
 ; {>  %_7542~°1◂0':(_p1947)◂(_stg) %_773~2':_r64 %_774~1':_r64 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_7543
 ; {>  %_773~2':_r64 %_7543~°0◂°1◂0':(_opn)◂((_p1947)◂(_stg)) %_774~1':_r64 }
; 	∎ °0◂°1◂0'
	bt r12,2
	jc LB_11355
	mov rdi,r8
	call dlt
LB_11355:
	bt r12,1
	jc LB_11356
	mov rdi,r14
	call dlt
LB_11356:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11359
	btr r12,3
	jmp LB_11360
LB_11359:
	bts r12,3
LB_11360:
	mov rsi,1
	bt r12,3
	jc LB_11357
	mov rsi,0
	bt r9,0
	jc LB_11357
	jmp LB_11358
LB_11357:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11358:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11361:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11363
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11362
LB_11363:
	add rsp,8
	ret
LB_11364:
	add rsp,32
	pop r14
LB_11362:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; cst
	push r10
	call NS_E_4972_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11397
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11391
LB_11397:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11392
	btr r12,0
	clc
	jmp LB_11393
LB_11392:
	bts r12,0
	stc
LB_11393:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 212
	push LB_11388
	push LB_11388
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f1966 %_7544 ⊢ %_7545 : %_7545
 ; {>  %_778~1':_r64 %_7544~0':_p1927 %_777~2':_r64 }
; _f1966 0' ⊢ °0◂0'
; _some %_7545 ⊢ %_7546 : %_7546
 ; {>  %_7545~°0◂0':(_p1947)◂(t3686'(0)) %_778~1':_r64 %_777~2':_r64 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_7546
 ; {>  %_778~1':_r64 %_7546~°0◂°0◂0':(_opn)◂((_p1947)◂(t3689'(0))) %_777~2':_r64 }
; 	∎ °0◂°0◂0'
	bt r12,1
	jc LB_11382
	mov rdi,r14
	call dlt
LB_11382:
	bt r12,2
	jc LB_11383
	mov rdi,r8
	call dlt
LB_11383:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11386
	btr r12,3
	jmp LB_11387
LB_11386:
	bts r12,3
LB_11387:
	mov rsi,1
	bt r12,3
	jc LB_11384
	mov rsi,0
	bt r9,0
	jc LB_11384
	jmp LB_11385
LB_11384:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11385:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11388:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11390
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11389
LB_11390:
	add rsp,8
	ret
LB_11391:
	add rsp,16
	pop r14
LB_11389:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7163:
NS_E_RDI_7163:
NS_E_7163_ETR_TBL:
NS_E_7163_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_11422
LB_11421:
	add r14,1
LB_11422:
	cmp r14,r10
	jge LB_11423
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11421
	cmp al,10
	jz LB_11421
	cmp al,32
	jz LB_11421
LB_11423:
	add r14,1
	cmp r14,r10
	jg LB_11426
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,64
	jnz LB_11426
	jmp LB_11427
LB_11426:
	jmp LB_11412
LB_11427:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_11429
LB_11428:
	add r14,1
LB_11429:
	cmp r14,r10
	jge LB_11430
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11428
	cmp al,10
	jz LB_11428
	cmp al,32
	jz LB_11428
LB_11430:
	add r14,1
	cmp r14,r10
	jg LB_11434
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,46
	jnz LB_11434
	jmp LB_11435
LB_11434:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11432
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11432:
	jmp LB_11412
LB_11435:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_11437
LB_11436:
	add r14,1
LB_11437:
	cmp r14,r10
	jge LB_11438
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11436
	cmp al,10
	jz LB_11436
	cmp al,32
	jz LB_11436
LB_11438:
	push r10
	call NS_E_1677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11439
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11440
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11440:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11441
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11441:
	jmp LB_11412
LB_11439:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_def
	jmp LB_11444
LB_11443:
	add r14,1
LB_11444:
	cmp r14,r10
	jge LB_11445
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11443
	cmp al,10
	jz LB_11443
	cmp al,32
	jz LB_11443
LB_11445:
	push r10
	call NS_E_7164_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11446
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11447
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11447:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11448
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11448:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11449
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11449:
	jmp LB_11412
LB_11446:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_11419
	btr r12,3
	clc
	jmp LB_11420
LB_11419:
	bts r12,3
	stc
LB_11420:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_11417
	btr r12,2
	clc
	jmp LB_11418
LB_11417:
	bts r12,2
	stc
LB_11418:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11415
	btr r12,1
	clc
	jmp LB_11416
LB_11415:
	bts r12,1
	stc
LB_11416:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11413
	btr r12,0
	clc
	jmp LB_11414
LB_11413:
	bts r12,0
	stc
LB_11414:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push 213
	push LB_11409
	push LB_11409
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } 0' 1' }
	mov r10,r14
	bt r12,1
	jc LB_11451
	btr r12,4
	jmp LB_11452
LB_11451:
	bts r12,4
LB_11452:
	mov r14,r9
	bt r12,3
	jc LB_11453
	btr r12,1
	jmp LB_11454
LB_11453:
	bts r12,1
LB_11454:
	mov r9,r13
	bt r12,0
	jc LB_11455
	btr r12,3
	jmp LB_11456
LB_11455:
	bts r12,3
LB_11456:
	mov r13,r8
	bt r12,2
	jc LB_11457
	btr r12,0
	jmp LB_11458
LB_11457:
	bts r12,0
LB_11458:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _some { %_7547 %_7548 } ⊢ %_7549 : %_7549
 ; {>  %_781~3':_r64 %_7547~0':_stg %_782~2':_r64 %_7548~1':_p1980 }
; _some { 0' 1' } ⊢ °0◂{ 0' 1' }
; ∎ %_7549
 ; {>  %_781~3':_r64 %_782~2':_r64 %_7549~°0◂{ 0' 1' }:(_opn)◂({ _stg _p1980 }) }
; 	∎ °0◂{ 0' 1' }
	bt r12,3
	jc LB_11399
	mov rdi,r9
	call dlt
LB_11399:
	bt r12,2
	jc LB_11400
	mov rdi,r8
	call dlt
LB_11400:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_11403
	btr r12,2
	jmp LB_11404
LB_11403:
	bts r12,2
LB_11404:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_11401
	btr QWORD [rdi],0
	jmp LB_11402
LB_11401:
	bts QWORD [rdi],0
LB_11402:
	mov r8,r14
	bt r12,1
	jc LB_11407
	btr r12,2
	jmp LB_11408
LB_11407:
	bts r12,2
LB_11408:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_11405
	btr QWORD [rdi],1
	jmp LB_11406
LB_11405:
	bts QWORD [rdi],1
LB_11406:
	mov r8,0
	bts r12,2
	ret
LB_11409:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11411
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11410
LB_11411:
	add rsp,8
	ret
LB_11412:
	add rsp,64
	pop r14
LB_11410:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7164:
NS_E_RDI_7164:
NS_E_7164_ETR_TBL:
NS_E_7164_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_etr_act
	jmp LB_11472
LB_11471:
	add r14,1
LB_11472:
	cmp r14,r10
	jge LB_11473
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11471
	cmp al,10
	jz LB_11471
	cmp al,32
	jz LB_11471
LB_11473:
	push r10
	call NS_E_7165_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11474
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11468
LB_11474:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11469
	btr r12,0
	clc
	jmp LB_11470
LB_11469:
	bts r12,0
	stc
LB_11470:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 214
	push LB_11465
	push LB_11465
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f2003 %_7550 ⊢ %_7551 : %_7551
 ; {>  %_785~2':_r64 %_786~1':_r64 %_7550~0':_p1982 }
; _f2003 0' ⊢ °1◂0'
; _some %_7551 ⊢ %_7552 : %_7552
 ; {>  %_7551~°1◂0':_p1980 %_785~2':_r64 %_786~1':_r64 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_7552
 ; {>  %_7552~°0◂°1◂0':(_opn)◂(_p1980) %_785~2':_r64 %_786~1':_r64 }
; 	∎ °0◂°1◂0'
	bt r12,2
	jc LB_11459
	mov rdi,r8
	call dlt
LB_11459:
	bt r12,1
	jc LB_11460
	mov rdi,r14
	call dlt
LB_11460:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11463
	btr r12,3
	jmp LB_11464
LB_11463:
	bts r12,3
LB_11464:
	mov rsi,1
	bt r12,3
	jc LB_11461
	mov rsi,0
	bt r9,0
	jc LB_11461
	jmp LB_11462
LB_11461:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11462:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11465:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11467
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11466
LB_11467:
	add rsp,8
	ret
LB_11468:
	add rsp,16
	pop r14
LB_11466:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_11489
LB_11488:
	add r14,1
LB_11489:
	cmp r14,r10
	jge LB_11490
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11488
	cmp al,10
	jz LB_11488
	cmp al,32
	jz LB_11488
LB_11490:
	push r10
	call NS_E_7173_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11491
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11485
LB_11491:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11486
	btr r12,0
	clc
	jmp LB_11487
LB_11486:
	bts r12,0
	stc
LB_11487:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 215
	push LB_11482
	push LB_11482
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f2002 %_7553 ⊢ %_7554 : %_7554
 ; {>  %_789~2':_r64 %_7553~0':_p1981 %_790~1':_r64 }
; _f2002 0' ⊢ °0◂0'
; _some %_7554 ⊢ %_7555 : %_7555
 ; {>  %_789~2':_r64 %_790~1':_r64 %_7554~°0◂0':_p1980 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_7555
 ; {>  %_789~2':_r64 %_7555~°0◂°0◂0':(_opn)◂(_p1980) %_790~1':_r64 }
; 	∎ °0◂°0◂0'
	bt r12,2
	jc LB_11476
	mov rdi,r8
	call dlt
LB_11476:
	bt r12,1
	jc LB_11477
	mov rdi,r14
	call dlt
LB_11477:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11480
	btr r12,3
	jmp LB_11481
LB_11480:
	bts r12,3
LB_11481:
	mov rsi,1
	bt r12,3
	jc LB_11478
	mov rsi,0
	bt r9,0
	jc LB_11478
	jmp LB_11479
LB_11478:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11479:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11482:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11484
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11483
LB_11484:
	add rsp,8
	ret
LB_11485:
	add rsp,16
	pop r14
LB_11483:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7165:
NS_E_RDI_7165:
NS_E_7165_ETR_TBL:
NS_E_7165_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; grm_ord_end
	jmp LB_11545
LB_11544:
	add r14,1
LB_11545:
	cmp r14,r10
	jge LB_11546
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11544
	cmp al,10
	jz LB_11544
	cmp al,32
	jz LB_11544
LB_11546:
	push r10
	call NS_E_7172_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11547
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11522
LB_11547:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_11532
LB_11531:
	add r14,1
LB_11532:
	cmp r14,r10
	jge LB_11533
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11531
	cmp al,10
	jz LB_11531
	cmp al,32
	jz LB_11531
LB_11533:
	push r10
	call NS_E_7167_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11534
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11535
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11535:
	jmp LB_11523
LB_11534:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_11538
LB_11537:
	add r14,1
LB_11538:
	cmp r14,r10
	jge LB_11539
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11537
	cmp al,10
	jz LB_11537
	cmp al,32
	jz LB_11537
LB_11539:
	push r10
	call NS_E_7166_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11540
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11541
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11541:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11542
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11542:
	jmp LB_11523
LB_11540:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_11529
	btr r12,2
	clc
	jmp LB_11530
LB_11529:
	bts r12,2
	stc
LB_11530:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11527
	btr r12,1
	clc
	jmp LB_11528
LB_11527:
	bts r12,1
	stc
LB_11528:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11525
	btr r12,0
	clc
	jmp LB_11526
LB_11525:
	bts r12,0
	stc
LB_11526:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 216
	push LB_11519
	push LB_11519
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' { 2' 3' 4' } }
	mov r11,r8
	bt r12,2
	jc LB_11549
	btr r12,5
	jmp LB_11550
LB_11549:
	bts r12,5
LB_11550:
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_11553
	btr r12,6
	clc
	jmp LB_11554
LB_11553:
	bts r12,6
	stc
LB_11554:
	mov r8,rcx
	bt r12,6
	jc LB_11551
	btr r12,2
	jmp LB_11552
LB_11551:
	bts r12,2
LB_11552:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_11557
	btr r12,6
	clc
	jmp LB_11558
LB_11557:
	bts r12,6
	stc
LB_11558:
	mov r9,rcx
	bt r12,6
	jc LB_11555
	btr r12,3
	jmp LB_11556
LB_11555:
	bts r12,3
LB_11556:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_11561
	btr r12,6
	clc
	jmp LB_11562
LB_11561:
	bts r12,6
	stc
LB_11562:
	mov r10,rcx
	bt r12,6
	jc LB_11559
	btr r12,4
	jmp LB_11560
LB_11559:
	bts r12,4
LB_11560:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov rcx,rax
	mov rax,QWORD [rsp+8*3]
	mov r11,rax
	bts r12,5
	bts r12,6
; _f2007 { %_7558 %_7559 %_7556 %_7557 %_7560 } ⊢ %_7561 : %_7561
 ; {>  %_7557~1':_p1984 %_7559~3':(_p1942)◂(_stg) %_7556~0':_p1983 %_7560~4':(_opn)◂({ (_p1924)◂((_p1932)◂(_stg)) _p1982 }) %_793~6':_r64 %_794~5':_r64 %_7558~2':(_p1924)◂((_p1932)◂(_stg)) }
; _f2007 { 2' 3' 0' 1' 4' } ⊢ °1◂{ 2' 3' 0' 1' 4' }
; _some %_7561 ⊢ %_7562 : %_7562
 ; {>  %_7561~°1◂{ 2' 3' 0' 1' 4' }:_p1982 %_793~6':_r64 %_794~5':_r64 }
; _some °1◂{ 2' 3' 0' 1' 4' } ⊢ °0◂°1◂{ 2' 3' 0' 1' 4' }
; ∎ %_7562
 ; {>  %_7562~°0◂°1◂{ 2' 3' 0' 1' 4' }:(_opn)◂(_p1982) %_793~6':_r64 %_794~5':_r64 }
; 	∎ °0◂°1◂{ 2' 3' 0' 1' 4' }
	bt r12,6
	jc LB_11493
	mov rdi,rcx
	call dlt
LB_11493:
	bt r12,5
	jc LB_11494
	mov rdi,r11
	call dlt
LB_11494:
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°1◂{ 2' 3' 0' 1' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_11495
	btr r12,5
	jmp LB_11496
LB_11495:
	bts r12,5
LB_11496:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r8
	bt r12,2
	jc LB_11501
	btr r12,6
	jmp LB_11502
LB_11501:
	bts r12,6
LB_11502:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_11499
	btr QWORD [rdi],0
	jmp LB_11500
LB_11499:
	bts QWORD [rdi],0
LB_11500:
	mov rcx,r11
	bt r12,5
	jc LB_11505
	btr r12,6
	jmp LB_11506
LB_11505:
	bts r12,6
LB_11506:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_11503
	btr QWORD [rdi],1
	jmp LB_11504
LB_11503:
	bts QWORD [rdi],1
LB_11504:
	mov rcx,r13
	bt r12,0
	jc LB_11509
	btr r12,6
	jmp LB_11510
LB_11509:
	bts r12,6
LB_11510:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_11507
	btr QWORD [rdi],2
	jmp LB_11508
LB_11507:
	bts QWORD [rdi],2
LB_11508:
	mov rcx,r14
	bt r12,1
	jc LB_11513
	btr r12,6
	jmp LB_11514
LB_11513:
	bts r12,6
LB_11514:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,6
	jc LB_11511
	btr QWORD [rdi],3
	jmp LB_11512
LB_11511:
	bts QWORD [rdi],3
LB_11512:
	mov rcx,r10
	bt r12,4
	jc LB_11517
	btr r12,6
	jmp LB_11518
LB_11517:
	bts r12,6
LB_11518:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*4],rsi
	bt r12,6
	jc LB_11515
	btr QWORD [rdi],4
	jmp LB_11516
LB_11515:
	bts QWORD [rdi],4
LB_11516:
	mov rsi,1
	bt r12,3
	jc LB_11497
	mov rsi,0
	bt r9,0
	jc LB_11497
	jmp LB_11498
LB_11497:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11498:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11519:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11521
	pop r14
	jmp LB_11524
LB_11521:
	add rsp,8
	ret
LB_11523:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_11524:
	ret
LB_11522:
	add rsp,48
	pop r14
LB_11520:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; grm_ord
	jmp LB_11606
LB_11605:
	add r14,1
LB_11606:
	cmp r14,r10
	jge LB_11607
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11605
	cmp al,10
	jz LB_11605
	cmp al,32
	jz LB_11605
LB_11607:
	push r10
	call NS_E_7171_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11608
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11596
LB_11608:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_11611
LB_11610:
	add r14,1
LB_11611:
	cmp r14,r10
	jge LB_11612
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11610
	cmp al,10
	jz LB_11610
	cmp al,32
	jz LB_11610
LB_11612:
	push r10
	call NS_E_7167_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11613
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11614
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11614:
	jmp LB_11596
LB_11613:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_11617
LB_11616:
	add r14,1
LB_11617:
	cmp r14,r10
	jge LB_11618
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11616
	cmp al,10
	jz LB_11616
	cmp al,32
	jz LB_11616
LB_11618:
	push r10
	call NS_E_7166_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11619
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11620
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11620:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11621
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11621:
	jmp LB_11596
LB_11619:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_11624
LB_11623:
	add r14,1
LB_11624:
	cmp r14,r10
	jge LB_11625
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11623
	cmp al,10
	jz LB_11623
	cmp al,32
	jz LB_11623
LB_11625:
	push r10
	call NS_E_7165_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11626
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11627
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11627:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11628
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11628:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11629
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11629:
	jmp LB_11596
LB_11626:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_11603
	btr r12,3
	clc
	jmp LB_11604
LB_11603:
	bts r12,3
	stc
LB_11604:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_11601
	btr r12,2
	clc
	jmp LB_11602
LB_11601:
	bts r12,2
	stc
LB_11602:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11599
	btr r12,1
	clc
	jmp LB_11600
LB_11599:
	bts r12,1
	stc
LB_11600:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11597
	btr r12,0
	clc
	jmp LB_11598
LB_11597:
	bts r12,0
	stc
LB_11598:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push 217
	push LB_11593
	push LB_11593
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' { 2' 3' 4' } 5' }
	mov r11,r9
	bt r12,3
	jc LB_11631
	btr r12,5
	jmp LB_11632
LB_11631:
	bts r12,5
LB_11632:
	mov rcx,r8
	bt r12,2
	jc LB_11633
	btr r12,6
	jmp LB_11634
LB_11633:
	bts r12,6
LB_11634:
; 6' ⊢ { 2' 3' 4' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_11637
	btr r12,7
	clc
	jmp LB_11638
LB_11637:
	bts r12,7
	stc
LB_11638:
	mov r8,rdx
	bt r12,7
	jc LB_11635
	btr r12,2
	jmp LB_11636
LB_11635:
	bts r12,2
LB_11636:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_11641
	btr r12,7
	clc
	jmp LB_11642
LB_11641:
	bts r12,7
	stc
LB_11642:
	mov r9,rdx
	bt r12,7
	jc LB_11639
	btr r12,3
	jmp LB_11640
LB_11639:
	bts r12,3
LB_11640:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_11645
	btr r12,7
	clc
	jmp LB_11646
LB_11645:
	bts r12,7
	stc
LB_11646:
	mov r10,rdx
	bt r12,7
	jc LB_11643
	btr r12,4
	jmp LB_11644
LB_11643:
	bts r12,4
LB_11644:
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov rdx,rax
	mov rax,QWORD [rsp+8*3]
	mov rcx,rax
	bts r12,6
	bts r12,7
; _f2006 { %_7565 %_7566 %_7563 %_7564 %_7567 %_7568 } ⊢ %_7569 : %_7569
 ; {>  %_798~6':_r64 %_7564~1':_p1984 %_7566~3':(_p1942)◂(_stg) %_7565~2':(_p1924)◂((_p1932)◂(_stg)) %_797~7':_r64 %_7568~5':_p1982 %_7563~0':_p1983 %_7567~4':(_opn)◂({ (_p1924)◂((_p1932)◂(_stg)) _p1982 }) }
; _f2006 { 2' 3' 0' 1' 4' 5' } ⊢ °0◂{ 2' 3' 0' 1' 4' 5' }
; _some %_7569 ⊢ %_7570 : %_7570
 ; {>  %_798~6':_r64 %_7569~°0◂{ 2' 3' 0' 1' 4' 5' }:_p1982 %_797~7':_r64 }
; _some °0◂{ 2' 3' 0' 1' 4' 5' } ⊢ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; ∎ %_7570
 ; {>  %_798~6':_r64 %_7570~°0◂°0◂{ 2' 3' 0' 1' 4' 5' }:(_opn)◂(_p1982) %_797~7':_r64 }
; 	∎ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
	bt r12,6
	jc LB_11563
	mov rdi,rcx
	call dlt
LB_11563:
	bt r12,7
	jc LB_11564
	mov rdi,rdx
	call dlt
LB_11564:
; _emt_mov_ptn_to_ptn:{| 1111110.. |},°0◂°0◂{ 2' 3' 0' 1' 4' 5' } ⊢ 2'◂3'
	mov rcx,r9
	bt r12,3
	jc LB_11565
	btr r12,6
	jmp LB_11566
LB_11565:
	bts r12,6
LB_11566:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0006_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdx,r8
	bt r12,2
	jc LB_11571
	btr r12,7
	jmp LB_11572
LB_11571:
	bts r12,7
LB_11572:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_11569
	btr QWORD [rdi],0
	jmp LB_11570
LB_11569:
	bts QWORD [rdi],0
LB_11570:
	mov rdx,rcx
	bt r12,6
	jc LB_11575
	btr r12,7
	jmp LB_11576
LB_11575:
	bts r12,7
LB_11576:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_11573
	btr QWORD [rdi],1
	jmp LB_11574
LB_11573:
	bts QWORD [rdi],1
LB_11574:
	mov rdx,r13
	bt r12,0
	jc LB_11579
	btr r12,7
	jmp LB_11580
LB_11579:
	bts r12,7
LB_11580:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,7
	jc LB_11577
	btr QWORD [rdi],2
	jmp LB_11578
LB_11577:
	bts QWORD [rdi],2
LB_11578:
	mov rdx,r14
	bt r12,1
	jc LB_11583
	btr r12,7
	jmp LB_11584
LB_11583:
	bts r12,7
LB_11584:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,7
	jc LB_11581
	btr QWORD [rdi],3
	jmp LB_11582
LB_11581:
	bts QWORD [rdi],3
LB_11582:
	mov rdx,r10
	bt r12,4
	jc LB_11587
	btr r12,7
	jmp LB_11588
LB_11587:
	bts r12,7
LB_11588:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*4],rsi
	bt r12,7
	jc LB_11585
	btr QWORD [rdi],4
	jmp LB_11586
LB_11585:
	bts QWORD [rdi],4
LB_11586:
	mov rdx,r11
	bt r12,5
	jc LB_11591
	btr r12,7
	jmp LB_11592
LB_11591:
	bts r12,7
LB_11592:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*5],rsi
	bt r12,7
	jc LB_11589
	btr QWORD [rdi],5
	jmp LB_11590
LB_11589:
	bts QWORD [rdi],5
LB_11590:
	mov rsi,1
	bt r12,3
	jc LB_11567
	mov rsi,0
	bt r9,0
	jc LB_11567
	jmp LB_11568
LB_11567:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11568:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11593:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11595
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11594
LB_11595:
	add rsp,8
	ret
LB_11596:
	add rsp,64
	pop r14
LB_11594:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7166:
NS_E_RDI_7166:
NS_E_7166_ETR_TBL:
NS_E_7166_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,112
; ";"
	jmp LB_11739
LB_11738:
	add r14,1
LB_11739:
	cmp r14,r10
	jge LB_11740
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11738
	cmp al,10
	jz LB_11738
	cmp al,32
	jz LB_11738
LB_11740:
	add r14,1
	cmp r14,r10
	jg LB_11743
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,59
	jnz LB_11743
	jmp LB_11744
LB_11743:
	jmp LB_11674
LB_11744:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_11746
LB_11745:
	add r14,1
LB_11746:
	cmp r14,r10
	jge LB_11747
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11745
	cmp al,10
	jz LB_11745
	cmp al,32
	jz LB_11745
LB_11747:
	add r14,3
	cmp r14,r10
	jg LB_11751
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_11751
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,138
	jnz LB_11751
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,162
	jnz LB_11751
	jmp LB_11752
LB_11751:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11749
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11749:
	jmp LB_11674
LB_11752:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst_ptn
	jmp LB_11692
LB_11691:
	add r14,1
LB_11692:
	cmp r14,r10
	jge LB_11693
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11691
	cmp al,10
	jz LB_11691
	cmp al,32
	jz LB_11691
LB_11693:
	push r10
	call NS_E_5800_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11694
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11695
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11695:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11696
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11696:
	jmp LB_11675
LB_11694:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; ","
	jmp LB_11699
LB_11698:
	add r14,1
LB_11699:
	cmp r14,r10
	jge LB_11700
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11698
	cmp al,10
	jz LB_11698
	cmp al,32
	jz LB_11698
LB_11700:
	add r14,1
	cmp r14,r10
	jg LB_11706
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,44
	jnz LB_11706
	jmp LB_11707
LB_11706:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11702
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11702:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11703
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11703:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11704
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11704:
	jmp LB_11675
LB_11707:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; dst_ptn
	jmp LB_11709
LB_11708:
	add r14,1
LB_11709:
	cmp r14,r10
	jge LB_11710
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11708
	cmp al,10
	jz LB_11708
	cmp al,32
	jz LB_11708
LB_11710:
	push r10
	call NS_E_5800_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11711
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_11712
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_11712:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11713
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11713:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11714
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11714:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11715
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11715:
	jmp LB_11675
LB_11711:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lc_code
	jmp LB_11718
LB_11717:
	add r14,1
LB_11718:
	cmp r14,r10
	jge LB_11719
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11717
	cmp al,10
	jz LB_11717
	cmp al,32
	jz LB_11717
LB_11719:
	push r10
	call NS_E_7147_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11720
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_11721
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_11721:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_11722
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_11722:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11723
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11723:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11724
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11724:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11725
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11725:
	jmp LB_11675
LB_11720:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
; grm_etr_act
	jmp LB_11728
LB_11727:
	add r14,1
LB_11728:
	cmp r14,r10
	jge LB_11729
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11727
	cmp al,10
	jz LB_11727
	cmp al,32
	jz LB_11727
LB_11729:
	push r10
	call NS_E_7165_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11730
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_11731
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_11731:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_11732
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_11732:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_11733
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_11733:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11734
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11734:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11735
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11735:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11736
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11736:
	jmp LB_11675
LB_11730:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*6],rax
	mov QWORD [rsp+8*1+16*6],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*6]
	bt rax,0
	jc LB_11689
	btr r12,6
	clc
	jmp LB_11690
LB_11689:
	bts r12,6
	stc
LB_11690:
	mov rax,QWORD [rsp+16*6+8*1]
	mov rcx,rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_11687
	btr r12,5
	clc
	jmp LB_11688
LB_11687:
	bts r12,5
	stc
LB_11688:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_11685
	btr r12,4
	clc
	jmp LB_11686
LB_11685:
	bts r12,4
	stc
LB_11686:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_11683
	btr r12,3
	clc
	jmp LB_11684
LB_11683:
	bts r12,3
	stc
LB_11684:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_11681
	btr r12,2
	clc
	jmp LB_11682
LB_11681:
	bts r12,2
	stc
LB_11682:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11679
	btr r12,1
	clc
	jmp LB_11680
LB_11679:
	bts r12,1
	stc
LB_11680:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11677
	btr r12,0
	clc
	jmp LB_11678
LB_11677:
	bts r12,0
	stc
LB_11678:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,112
	push rdi
	push rsi
	push 218
	push LB_11671
	push LB_11671
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' 4' 5' 6' } ⊢ { {  } {  } 0' {  } 1' 2' 3' }
	mov rdx,r9
	bt r12,3
	jc LB_11753
	btr r12,7
	jmp LB_11754
LB_11753:
	bts r12,7
LB_11754:
	mov r9,rcx
	bt r12,6
	jc LB_11755
	btr r12,3
	jmp LB_11756
LB_11755:
	bts r12,3
LB_11756:
	mov rcx,r8
	bt r12,2
	jc LB_11757
	btr r12,6
	jmp LB_11758
LB_11757:
	bts r12,6
LB_11758:
	mov r8,r11
	bt r12,5
	jc LB_11759
	btr r12,2
	jmp LB_11760
LB_11759:
	bts r12,2
LB_11760:
	mov r11,r14
	bt r12,1
	jc LB_11761
	btr r12,5
	jmp LB_11762
LB_11761:
	bts r12,5
LB_11762:
	mov r14,r10
	bt r12,4
	jc LB_11763
	btr r12,1
	jmp LB_11764
LB_11763:
	bts r12,1
LB_11764:
	mov r10,r13
	bt r12,0
	jc LB_11765
	btr r12,4
	jmp LB_11766
LB_11765:
	bts r12,4
LB_11766:
	mov r13,rcx
	bt r12,6
	jc LB_11767
	btr r12,0
	jmp LB_11768
LB_11767:
	bts r12,0
LB_11768:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r11,rax
	mov rax,QWORD [rsp+8*3]
	mov r10,rax
	bts r12,4
	bts r12,5
; _some { %_7572 %_7574 } ⊢ %_7575 : %_7575
 ; {>  %_7572~1':(_p1924)◂((_p1932)◂(_stg)) %_7574~3':_p1982 %_7573~2':(_p1942)◂(_stg) %_801~5':_r64 %_802~4':_r64 %_7571~0':(_p1924)◂((_p1932)◂(_stg)) }
; _some { 1' 3' } ⊢ °0◂{ 1' 3' }
; _some { %_7571 %_7573 %_7575 } ⊢ %_7576 : %_7576
 ; {>  %_7575~°0◂{ 1' 3' }:(_opn)◂({ (_p1924)◂((_p1932)◂(_stg)) _p1982 }) %_7573~2':(_p1942)◂(_stg) %_801~5':_r64 %_802~4':_r64 %_7571~0':(_p1924)◂((_p1932)◂(_stg)) }
; _some { 0' 2' °0◂{ 1' 3' } } ⊢ °0◂{ 0' 2' °0◂{ 1' 3' } }
; ∎ %_7576
 ; {>  %_7576~°0◂{ 0' 2' °0◂{ 1' 3' } }:(_opn)◂({ (_p1924)◂((_p1932)◂(_stg)) (_p1942)◂(_stg) (_opn)◂({ (_p1924)◂((_p1932)◂(_stg)) _p1982 }) }) %_801~5':_r64 %_802~4':_r64 }
; 	∎ °0◂{ 0' 2' °0◂{ 1' 3' } }
	bt r12,5
	jc LB_11647
	mov rdi,r11
	call dlt
LB_11647:
	bt r12,4
	jc LB_11648
	mov rdi,r10
	call dlt
LB_11648:
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂{ 0' 2' °0◂{ 1' 3' } } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_11649
	btr r12,4
	jmp LB_11650
LB_11649:
	bts r12,4
LB_11650:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r13
	bt r12,0
	jc LB_11653
	btr r12,5
	jmp LB_11654
LB_11653:
	bts r12,5
LB_11654:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_11651
	btr QWORD [rdi],0
	jmp LB_11652
LB_11651:
	bts QWORD [rdi],0
LB_11652:
	mov r11,r8
	bt r12,2
	jc LB_11657
	btr r12,5
	jmp LB_11658
LB_11657:
	bts r12,5
LB_11658:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_11655
	btr QWORD [rdi],1
	jmp LB_11656
LB_11655:
	bts QWORD [rdi],1
LB_11656:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov r13,r14
	bt r12,1
	jc LB_11665
	btr r12,0
	jmp LB_11666
LB_11665:
	bts r12,0
LB_11666:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_11663
	btr QWORD [rdi],0
	jmp LB_11664
LB_11663:
	bts QWORD [rdi],0
LB_11664:
	mov r13,r10
	bt r12,4
	jc LB_11669
	btr r12,0
	jmp LB_11670
LB_11669:
	bts r12,0
LB_11670:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_11667
	btr QWORD [rdi],1
	jmp LB_11668
LB_11667:
	bts QWORD [rdi],1
LB_11668:
	mov rsi,1
	bt r12,5
	jc LB_11661
	mov rsi,0
	bt r11,0
	jc LB_11661
	jmp LB_11662
LB_11661:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_11662:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_11659
	btr QWORD [rdi],2
	jmp LB_11660
LB_11659:
	bts QWORD [rdi],2
LB_11660:
	mov r8,0
	bts r12,2
	ret
LB_11671:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11673
	pop r14
	jmp LB_11676
LB_11673:
	add rsp,8
	ret
LB_11675:
	add rsp,112
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_11676:
	ret
LB_11674:
	add rsp,112
	pop r14
LB_11672:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_11809
LB_11808:
	add r14,1
LB_11809:
	cmp r14,r10
	jge LB_11810
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11808
	cmp al,10
	jz LB_11808
	cmp al,32
	jz LB_11808
LB_11810:
	add r14,3
	cmp r14,r10
	jg LB_11813
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_11813
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,138
	jnz LB_11813
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,162
	jnz LB_11813
	jmp LB_11814
LB_11813:
	jmp LB_11786
LB_11814:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_11796
LB_11795:
	add r14,1
LB_11796:
	cmp r14,r10
	jge LB_11797
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11795
	cmp al,10
	jz LB_11795
	cmp al,32
	jz LB_11795
LB_11797:
	push r10
	call NS_E_5800_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11798
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11799
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11799:
	jmp LB_11787
LB_11798:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_11802
LB_11801:
	add r14,1
LB_11802:
	cmp r14,r10
	jge LB_11803
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11801
	cmp al,10
	jz LB_11801
	cmp al,32
	jz LB_11801
LB_11803:
	push r10
	call NS_E_7147_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11804
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11805
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11805:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11806
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11806:
	jmp LB_11787
LB_11804:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_11793
	btr r12,2
	clc
	jmp LB_11794
LB_11793:
	bts r12,2
	stc
LB_11794:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11791
	btr r12,1
	clc
	jmp LB_11792
LB_11791:
	bts r12,1
	stc
LB_11792:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11789
	btr r12,0
	clc
	jmp LB_11790
LB_11789:
	bts r12,0
	stc
LB_11790:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 219
	push LB_11783
	push LB_11783
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_11815
	btr r12,3
	jmp LB_11816
LB_11815:
	bts r12,3
LB_11816:
	mov r14,r8
	bt r12,2
	jc LB_11817
	btr r12,1
	jmp LB_11818
LB_11817:
	bts r12,1
LB_11818:
	mov r8,r13
	bt r12,0
	jc LB_11819
	btr r12,2
	jmp LB_11820
LB_11819:
	bts r12,2
LB_11820:
	mov r13,r9
	bt r12,3
	jc LB_11821
	btr r12,0
	jmp LB_11822
LB_11821:
	bts r12,0
LB_11822:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _none {  } ⊢ %_7579 : %_7579
 ; {>  %_7578~1':(_p1942)◂(_stg) %_806~2':_r64 %_7577~0':(_p1924)◂((_p1932)◂(_stg)) %_805~3':_r64 }
; _none {  } ⊢ °1◂{  }
; _some { %_7577 %_7578 %_7579 } ⊢ %_7580 : %_7580
 ; {>  %_7578~1':(_p1942)◂(_stg) %_7579~°1◂{  }:(_opn)◂(t3740'(0)) %_806~2':_r64 %_7577~0':(_p1924)◂((_p1932)◂(_stg)) %_805~3':_r64 }
; _some { 0' 1' °1◂{  } } ⊢ °0◂{ 0' 1' °1◂{  } }
; ∎ %_7580
 ; {>  %_7580~°0◂{ 0' 1' °1◂{  } }:(_opn)◂({ (_p1924)◂((_p1932)◂(_stg)) (_p1942)◂(_stg) (_opn)◂(t3743'(0)) }) %_806~2':_r64 %_805~3':_r64 }
; 	∎ °0◂{ 0' 1' °1◂{  } }
	bt r12,2
	jc LB_11769
	mov rdi,r8
	call dlt
LB_11769:
	bt r12,3
	jc LB_11770
	mov rdi,r9
	call dlt
LB_11770:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_11773
	btr r12,2
	jmp LB_11774
LB_11773:
	bts r12,2
LB_11774:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_11771
	btr QWORD [rdi],0
	jmp LB_11772
LB_11771:
	bts QWORD [rdi],0
LB_11772:
	mov r8,r14
	bt r12,1
	jc LB_11777
	btr r12,2
	jmp LB_11778
LB_11777:
	bts r12,2
LB_11778:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_11775
	btr QWORD [rdi],1
	jmp LB_11776
LB_11775:
	bts QWORD [rdi],1
LB_11776:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_11781
	mov rsi,0
	bt r8,0
	jc LB_11781
	jmp LB_11782
LB_11781:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_11782:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,2
	jc LB_11779
	btr QWORD [rdi],2
	jmp LB_11780
LB_11779:
	bts QWORD [rdi],2
LB_11780:
	mov r8,0
	bts r12,2
	ret
LB_11783:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11785
	pop r14
	jmp LB_11788
LB_11785:
	add rsp,8
	ret
LB_11787:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_11788:
	ret
LB_11786:
	add rsp,48
	pop r14
LB_11784:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7167:
NS_E_RDI_7167:
NS_E_7167_ETR_TBL:
NS_E_7167_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "!|"
	jmp LB_11846
LB_11845:
	add r14,1
LB_11846:
	cmp r14,r10
	jge LB_11847
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11845
	cmp al,10
	jz LB_11845
	cmp al,32
	jz LB_11845
LB_11847:
	add r14,2
	cmp r14,r10
	jg LB_11850
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,33
	jnz LB_11850
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,124
	jnz LB_11850
	jmp LB_11851
LB_11850:
	jmp LB_11832
LB_11851:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_rle_cut
	jmp LB_11840
LB_11839:
	add r14,1
LB_11840:
	cmp r14,r10
	jge LB_11841
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11839
	cmp al,10
	jz LB_11839
	cmp al,32
	jz LB_11839
LB_11841:
	push r10
	call NS_E_7168_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11842
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11843
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11843:
	jmp LB_11833
LB_11842:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11837
	btr r12,1
	clc
	jmp LB_11838
LB_11837:
	bts r12,1
	stc
LB_11838:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11835
	btr r12,0
	clc
	jmp LB_11836
LB_11835:
	bts r12,0
	stc
LB_11836:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 220
	push LB_11829
	push LB_11829
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_11852
	btr r12,2
	jmp LB_11853
LB_11852:
	bts r12,2
LB_11853:
	mov r13,r14
	bt r12,1
	jc LB_11854
	btr r12,0
	jmp LB_11855
LB_11854:
	bts r12,0
LB_11855:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f2011 %_7581 ⊢ %_7582 : %_7582
 ; {>  %_809~2':_r64 %_810~1':_r64 %_7581~0':_p1985 }
; _f2011 0' ⊢ °0◂0'
; _some %_7582 ⊢ %_7583 : %_7583
 ; {>  %_809~2':_r64 %_7582~°0◂0':_p1984 %_810~1':_r64 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_7583
 ; {>  %_809~2':_r64 %_810~1':_r64 %_7583~°0◂°0◂0':(_opn)◂(_p1984) }
; 	∎ °0◂°0◂0'
	bt r12,2
	jc LB_11823
	mov rdi,r8
	call dlt
LB_11823:
	bt r12,1
	jc LB_11824
	mov rdi,r14
	call dlt
LB_11824:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11827
	btr r12,3
	jmp LB_11828
LB_11827:
	bts r12,3
LB_11828:
	mov rsi,1
	bt r12,3
	jc LB_11825
	mov rsi,0
	bt r9,0
	jc LB_11825
	jmp LB_11826
LB_11825:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11826:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11829:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11831
	pop r14
	jmp LB_11834
LB_11831:
	add rsp,8
	ret
LB_11833:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
LB_11834:
	ret
LB_11832:
	add rsp,32
	pop r14
LB_11830:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_11877
LB_11876:
	add r14,1
LB_11877:
	cmp r14,r10
	jge LB_11878
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11876
	cmp al,10
	jz LB_11876
	cmp al,32
	jz LB_11876
LB_11878:
	push r10
	call NS_E_7169_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11879
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11871
LB_11879:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_11882
LB_11881:
	add r14,1
LB_11882:
	cmp r14,r10
	jge LB_11883
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11881
	cmp al,10
	jz LB_11881
	cmp al,32
	jz LB_11881
LB_11883:
	push r10
	call NS_E_7167_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11884
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11885
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11885:
	jmp LB_11871
LB_11884:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11874
	btr r12,1
	clc
	jmp LB_11875
LB_11874:
	bts r12,1
	stc
LB_11875:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11872
	btr r12,0
	clc
	jmp LB_11873
LB_11872:
	bts r12,0
	stc
LB_11873:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 221
	push LB_11868
	push LB_11868
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _f2012 { %_7584 %_7585 } ⊢ %_7586 : %_7586
 ; {>  %_7584~0':_p1986 %_814~2':_r64 %_813~3':_r64 %_7585~1':_p1984 }
; _f2012 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_7586 ⊢ %_7587 : %_7587
 ; {>  %_7586~°1◂{ 0' 1' }:_p1984 %_814~2':_r64 %_813~3':_r64 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_7587
 ; {>  %_7587~°0◂°1◂{ 0' 1' }:(_opn)◂(_p1984) %_814~2':_r64 %_813~3':_r64 }
; 	∎ °0◂°1◂{ 0' 1' }
	bt r12,2
	jc LB_11856
	mov rdi,r8
	call dlt
LB_11856:
	bt r12,3
	jc LB_11857
	mov rdi,r9
	call dlt
LB_11857:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_11862
	btr r12,2
	jmp LB_11863
LB_11862:
	bts r12,2
LB_11863:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_11860
	btr QWORD [rdi],0
	jmp LB_11861
LB_11860:
	bts QWORD [rdi],0
LB_11861:
	mov r8,r14
	bt r12,1
	jc LB_11866
	btr r12,2
	jmp LB_11867
LB_11866:
	bts r12,2
LB_11867:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_11864
	btr QWORD [rdi],1
	jmp LB_11865
LB_11864:
	bts QWORD [rdi],1
LB_11865:
	mov rsi,1
	bt r12,3
	jc LB_11858
	mov rsi,0
	bt r9,0
	jc LB_11858
	jmp LB_11859
LB_11858:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11859:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11868:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11870
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11869
LB_11870:
	add rsp,8
	ret
LB_11871:
	add rsp,32
	pop r14
LB_11869:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 222
	push LB_11891
	push LB_11891
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _f2013 {  } ⊢ %_7588 : %_7588
 ; {>  %_818~0':_r64 %_817~1':_r64 }
; _f2013 {  } ⊢ °2◂{  }
; _some %_7588 ⊢ %_7589 : %_7589
 ; {>  %_818~0':_r64 %_7588~°2◂{  }:_p1984 %_817~1':_r64 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_7589
 ; {>  %_818~0':_r64 %_7589~°0◂°2◂{  }:(_opn)◂(_p1984) %_817~1':_r64 }
; 	∎ °0◂°2◂{  }
	bt r12,0
	jc LB_11887
	mov rdi,r13
	call dlt
LB_11887:
	bt r12,1
	jc LB_11888
	mov rdi,r14
	call dlt
LB_11888:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_11889
	mov rsi,0
	bt r9,0
	jc LB_11889
	jmp LB_11890
LB_11889:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11890:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11891:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11893
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11892
LB_11893:
	add rsp,8
	ret
LB_11894:
	add rsp,0
	pop r14
LB_11892:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7168:
NS_E_RDI_7168:
NS_E_7168_ETR_TBL:
NS_E_7168_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_11916
LB_11915:
	add r14,1
LB_11916:
	cmp r14,r10
	jge LB_11917
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11915
	cmp al,10
	jz LB_11915
	cmp al,32
	jz LB_11915
LB_11917:
	push r10
	call NS_E_7169_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11918
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11910
LB_11918:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle_cut
	jmp LB_11921
LB_11920:
	add r14,1
LB_11921:
	cmp r14,r10
	jge LB_11922
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11920
	cmp al,10
	jz LB_11920
	cmp al,32
	jz LB_11920
LB_11922:
	push r10
	call NS_E_7168_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11923
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11924
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11924:
	jmp LB_11910
LB_11923:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11913
	btr r12,1
	clc
	jmp LB_11914
LB_11913:
	bts r12,1
	stc
LB_11914:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11911
	btr r12,0
	clc
	jmp LB_11912
LB_11911:
	bts r12,0
	stc
LB_11912:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 223
	push LB_11907
	push LB_11907
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _f2014 { %_7590 %_7591 } ⊢ %_7592 : %_7592
 ; {>  %_7591~1':_p1985 %_821~3':_r64 %_822~2':_r64 %_7590~0':_p1986 }
; _f2014 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_7592 ⊢ %_7593 : %_7593
 ; {>  %_821~3':_r64 %_822~2':_r64 %_7592~°0◂{ 0' 1' }:_p1985 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_7593
 ; {>  %_821~3':_r64 %_822~2':_r64 %_7593~°0◂°0◂{ 0' 1' }:(_opn)◂(_p1985) }
; 	∎ °0◂°0◂{ 0' 1' }
	bt r12,3
	jc LB_11895
	mov rdi,r9
	call dlt
LB_11895:
	bt r12,2
	jc LB_11896
	mov rdi,r8
	call dlt
LB_11896:
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_11901
	btr r12,2
	jmp LB_11902
LB_11901:
	bts r12,2
LB_11902:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_11899
	btr QWORD [rdi],0
	jmp LB_11900
LB_11899:
	bts QWORD [rdi],0
LB_11900:
	mov r8,r14
	bt r12,1
	jc LB_11905
	btr r12,2
	jmp LB_11906
LB_11905:
	bts r12,2
LB_11906:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_11903
	btr QWORD [rdi],1
	jmp LB_11904
LB_11903:
	bts QWORD [rdi],1
LB_11904:
	mov rsi,1
	bt r12,3
	jc LB_11897
	mov rsi,0
	bt r9,0
	jc LB_11897
	jmp LB_11898
LB_11897:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11898:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11907:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11909
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11908
LB_11909:
	add rsp,8
	ret
LB_11910:
	add rsp,32
	pop r14
LB_11908:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 224
	push LB_11930
	push LB_11930
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _f2015 {  } ⊢ %_7594 : %_7594
 ; {>  %_826~0':_r64 %_825~1':_r64 }
; _f2015 {  } ⊢ °1◂{  }
; _some %_7594 ⊢ %_7595 : %_7595
 ; {>  %_7594~°1◂{  }:_p1985 %_826~0':_r64 %_825~1':_r64 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_7595
 ; {>  %_7595~°0◂°1◂{  }:(_opn)◂(_p1985) %_826~0':_r64 %_825~1':_r64 }
; 	∎ °0◂°1◂{  }
	bt r12,0
	jc LB_11926
	mov rdi,r13
	call dlt
LB_11926:
	bt r12,1
	jc LB_11927
	mov rdi,r14
	call dlt
LB_11927:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_11928
	mov rsi,0
	bt r9,0
	jc LB_11928
	jmp LB_11929
LB_11928:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11929:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11930:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11932
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11931
LB_11932:
	add rsp,8
	ret
LB_11933:
	add rsp,0
	pop r14
LB_11931:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7169:
NS_E_RDI_7169:
NS_E_7169_ETR_TBL:
NS_E_7169_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\159\166"
	jmp LB_11951
LB_11950:
	add r14,1
LB_11951:
	cmp r14,r10
	jge LB_11952
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11950
	cmp al,10
	jz LB_11950
	cmp al,32
	jz LB_11950
LB_11952:
	add r14,3
	cmp r14,r10
	jg LB_11955
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_11955
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,159
	jnz LB_11955
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,166
	jnz LB_11955
	jmp LB_11956
LB_11955:
	jmp LB_11943
LB_11956:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn_atm
	jmp LB_11958
LB_11957:
	add r14,1
LB_11958:
	cmp r14,r10
	jge LB_11959
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11957
	cmp al,10
	jz LB_11957
	cmp al,32
	jz LB_11957
LB_11959:
	push r10
	call NS_E_7170_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11960
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11961
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11961:
	jmp LB_11943
LB_11960:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_11964
LB_11963:
	add r14,1
LB_11964:
	cmp r14,r10
	jge LB_11965
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11963
	cmp al,10
	jz LB_11963
	cmp al,32
	jz LB_11963
LB_11965:
	add r14,3
	cmp r14,r10
	jg LB_11970
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,226
	jnz LB_11970
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,159
	jnz LB_11970
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,167
	jnz LB_11970
	jmp LB_11971
LB_11970:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11967
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11967:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11968
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11968:
	jmp LB_11943
LB_11971:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_11948
	btr r12,2
	clc
	jmp LB_11949
LB_11948:
	bts r12,2
	stc
LB_11949:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11946
	btr r12,1
	clc
	jmp LB_11947
LB_11946:
	bts r12,1
	stc
LB_11947:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11944
	btr r12,0
	clc
	jmp LB_11945
LB_11944:
	bts r12,0
	stc
LB_11945:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 225
	push LB_11940
	push LB_11940
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_11972
	btr r12,3
	jmp LB_11973
LB_11972:
	bts r12,3
LB_11973:
	mov r13,r14
	bt r12,1
	jc LB_11974
	btr r12,0
	jmp LB_11975
LB_11974:
	bts r12,0
LB_11975:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f2016 %_7596 ⊢ %_7597 : %_7597
 ; {>  %_7596~0':_p1987 %_830~1':_r64 %_829~2':_r64 }
; _f2016 0' ⊢ °0◂0'
; _some %_7597 ⊢ %_7598 : %_7598
 ; {>  %_7597~°0◂0':_p1986 %_830~1':_r64 %_829~2':_r64 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_7598
 ; {>  %_7598~°0◂°0◂0':(_opn)◂(_p1986) %_830~1':_r64 %_829~2':_r64 }
; 	∎ °0◂°0◂0'
	bt r12,1
	jc LB_11934
	mov rdi,r14
	call dlt
LB_11934:
	bt r12,2
	jc LB_11935
	mov rdi,r8
	call dlt
LB_11935:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11938
	btr r12,3
	jmp LB_11939
LB_11938:
	bts r12,3
LB_11939:
	mov rsi,1
	bt r12,3
	jc LB_11936
	mov rsi,0
	bt r9,0
	jc LB_11936
	jmp LB_11937
LB_11936:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11937:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11940:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11942
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11941
LB_11942:
	add rsp,8
	ret
LB_11943:
	add rsp,48
	pop r14
LB_11941:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_ptn_atm
	jmp LB_11989
LB_11988:
	add r14,1
LB_11989:
	cmp r14,r10
	jge LB_11990
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11988
	cmp al,10
	jz LB_11988
	cmp al,32
	jz LB_11988
LB_11990:
	push r10
	call NS_E_7170_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11991
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11985
LB_11991:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11986
	btr r12,0
	clc
	jmp LB_11987
LB_11986:
	bts r12,0
	stc
LB_11987:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 226
	push LB_11982
	push LB_11982
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f2017 %_7599 ⊢ %_7600 : %_7600
 ; {>  %_834~1':_r64 %_7599~0':_p1987 %_833~2':_r64 }
; _f2017 0' ⊢ °1◂0'
; _some %_7600 ⊢ %_7601 : %_7601
 ; {>  %_7600~°1◂0':_p1986 %_834~1':_r64 %_833~2':_r64 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_7601
 ; {>  %_7601~°0◂°1◂0':(_opn)◂(_p1986) %_834~1':_r64 %_833~2':_r64 }
; 	∎ °0◂°1◂0'
	bt r12,1
	jc LB_11976
	mov rdi,r14
	call dlt
LB_11976:
	bt r12,2
	jc LB_11977
	mov rdi,r8
	call dlt
LB_11977:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11980
	btr r12,3
	jmp LB_11981
LB_11980:
	bts r12,3
LB_11981:
	mov rsi,1
	bt r12,3
	jc LB_11978
	mov rsi,0
	bt r9,0
	jc LB_11978
	jmp LB_11979
LB_11978:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11979:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11982:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11984
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11983
LB_11984:
	add rsp,8
	ret
LB_11985:
	add rsp,16
	pop r14
LB_11983:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7170:
NS_E_RDI_7170:
NS_E_7170_ETR_TBL:
NS_E_7170_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_12006
LB_12005:
	add r14,1
LB_12006:
	cmp r14,r10
	jge LB_12007
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12005
	cmp al,10
	jz LB_12005
	cmp al,32
	jz LB_12005
LB_12007:
	push r10
	call NS_E_1245_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12008
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12002
LB_12008:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12003
	btr r12,0
	clc
	jmp LB_12004
LB_12003:
	bts r12,0
	stc
LB_12004:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 227
	push LB_11999
	push LB_11999
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f2019 %_7602 ⊢ %_7603 : %_7603
 ; {>  %_838~1':_r64 %_7602~0':_stg %_837~2':_r64 }
; _f2019 0' ⊢ °1◂0'
; _some %_7603 ⊢ %_7604 : %_7604
 ; {>  %_7603~°1◂0':_p1987 %_838~1':_r64 %_837~2':_r64 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_7604
 ; {>  %_838~1':_r64 %_7604~°0◂°1◂0':(_opn)◂(_p1987) %_837~2':_r64 }
; 	∎ °0◂°1◂0'
	bt r12,1
	jc LB_11993
	mov rdi,r14
	call dlt
LB_11993:
	bt r12,2
	jc LB_11994
	mov rdi,r8
	call dlt
LB_11994:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11997
	btr r12,3
	jmp LB_11998
LB_11997:
	bts r12,3
LB_11998:
	mov rsi,1
	bt r12,3
	jc LB_11995
	mov rsi,0
	bt r9,0
	jc LB_11995
	jmp LB_11996
LB_11995:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11996:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11999:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12001
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12000
LB_12001:
	add rsp,8
	ret
LB_12002:
	add rsp,16
	pop r14
LB_12000:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_12023
LB_12022:
	add r14,1
LB_12023:
	cmp r14,r10
	jge LB_12024
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12022
	cmp al,10
	jz LB_12022
	cmp al,32
	jz LB_12022
LB_12024:
	push r10
	call NS_E_4901_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12025
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12019
LB_12025:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12020
	btr r12,0
	clc
	jmp LB_12021
LB_12020:
	bts r12,0
	stc
LB_12021:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 228
	push LB_12016
	push LB_12016
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f2018 %_7605 ⊢ %_7606 : %_7606
 ; {>  %_841~2':_r64 %_842~1':_r64 %_7605~0':_p1878 }
; _f2018 0' ⊢ °0◂0'
; _some %_7606 ⊢ %_7607 : %_7607
 ; {>  %_7606~°0◂0':_p1987 %_841~2':_r64 %_842~1':_r64 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_7607
 ; {>  %_7607~°0◂°0◂0':(_opn)◂(_p1987) %_841~2':_r64 %_842~1':_r64 }
; 	∎ °0◂°0◂0'
	bt r12,2
	jc LB_12010
	mov rdi,r8
	call dlt
LB_12010:
	bt r12,1
	jc LB_12011
	mov rdi,r14
	call dlt
LB_12011:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12014
	btr r12,3
	jmp LB_12015
LB_12014:
	bts r12,3
LB_12015:
	mov rsi,1
	bt r12,3
	jc LB_12012
	mov rsi,0
	bt r9,0
	jc LB_12012
	jmp LB_12013
LB_12012:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12013:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12016:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12018
	pop r14
	mov rdi,r9
LB_12018: