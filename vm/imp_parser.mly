%{
  open Types
  open Ty
  open Imp_parser_header
%}

%token SRC ARR DEF CLN L_RCD R_RCD Z ARR_END ISO DTA CNT EMT
%token LCE EXP AGL PRD EOP VCT ARR_REV ARR_REV_IN
%token L_PRN R_PRN  APP COPRD_END PRD_END MNS APP_EVL PLS_EVL MLT_EVL CST
%token ACT SPL FOR_ALL MDL MDL_END L_BLK R_BLK  COPRD SEQ EQ
%token IO PRJ N SLH L_HLZ R_HLZ M_HLZ  L_OPN R_OPN L_LST R_LST SGN
%token MCR PLS MLT EOF CMM LET TYP_STG TYP_SGN TYP_VCT TYP_OPN_VCT
%token DEQ FNT EXN WC TEST PLS_NAT MNS_NAT MLT_NAT L_VCT L_LST_PLS
%token NOT_SPL DTA_GRM ORD_LEX_COPRD ORD_COPRD GRM NOT AGL_TOP AGL_COD
%token <string> NAM STG VAL
%token <int> INT IN OUT ROT SLF NAT INJ IDX CHO

%left AGL_PRE
%left FOR_ALL
%left EQ
%left PLS MNS
%left MLT
%left APP
%left CST
%left PRJ
%left TYP_VCT TYP_OPN_VCT
%right IO

%start buffer
%start file

%type <Types.mdl> file
%type <Types.buffer> buffer
%type <Peg.grammar> dta_grm
%type <code list> code_coprd_list
%type <opr> exp
%%
buffer:
  | vh_frm_top EOF {
    let (_,o,_) = $1 in
    Evo o }
  | ARR_END EOF { End }
  ;
file:
  | def_mdl { Util.pnt flg "parse:file\n"; $1 }
  ;
def_mdl:
  | MDL NAM def_arg DEF gl_etr_lst MDL_END {
    let (x,_) = Ty.typing_mdl($2,[],$5) in
    x }
  ;
def_arg:
  | { ([],StgMap.empty) }
  | APP args { $2 }
args:
  | arg {
    let (a,m) = $1 in
    ([a],m) }
  | arg args {
    let ((a,m1),(al,m2)) = ($1,$2) in
    let (m3,_) = mrg_stgMap m1 m2 in
    ([a]@al,m3) }
arg:
  | VAL {
    let v =
      if StgMap.mem $1 !typ_vct then StgMap.find $1 !typ_vct
        else vsgn () in
        typ_vct:=(StgMap.add $1 v !typ_vct);
    (v,StgMap.add $1 v StgMap.empty) }
  | L_RCD arg_list R_RCD  {
    let (al,m) = $2 in
    (rcd_cl al,m) }
  ;
arg_list:
  | arg { let (a,m) = $1 in ([a],m) }
  | arg_list arg  {
    let ((al,ml),(a,m)) = ($1,$2) in
    let (m1,_) = mrg_stgMap ml m in
    (al@[a],m1) }
  ;
gl_etr_lst:
  |   { [] }
  | mdl_etr gl_etr_lst  { $1::$2 }
  ;
mdl_etr:
  | glb_etr { $1 }
  | def_typ { $1 }
  ;
def_typ:
  | DTA def_typ_clique { Flow_Clq $2 }
  | DTA def_typ_body { Flow $2 }
  | dta_grm { Gram $1 }
  ;
dta_grm:
  | DTA_GRM grm_clq { $2 }
  ;
grm_clq:
  | grm_etr { [$1] }
  | grm_etr grm_clq { $1::$2 }
  ;
grm_etr:
  | SLF NAM ISO grm_ord   { ($2,[],$4) }
  | SLF NAM EQ grm_ptns grm_prd { ($2,[],[((Peg.Synt,$4,$5),None)]) }
  ;
grm_ord:
  | grm_rule { [($1,None)] }
  | grm_ord grm_rule  { $1@[($2,None)] }
grm_rule:
  | ord grm_ptns grm_prd { ($1,$2,$3) }
  ;
ord:
  | ORD_COPRD { Peg.Synt }
  | ORD_LEX_COPRD { Peg.Lex }
  ;
grm_ptns:
  | { [] }
  | grm_ptns grm_ptn  { $1@[$2] }
  ;
grm_ptn:
  | grm_atom { $1 }
  | L_LST grm_atom R_LST { Peg.List $2 }
  | L_LST_PLS grm_atom R_LST { Peg.List $2 }
  | L_OPN grm_atom R_OPN { Peg.Option $2 }
  ;
grm_atom:
  | STG { Peg.Text $1 }
  | NAM { Peg.Name $1 }
  ;
grm_prd:
  | { None }
  | prd_flg grm_ptns { Some ($1,$2) }
  ;
prd_flg:
  | SPL { Peg.And }
  | NOT_SPL { Peg.Not }
  ;
def_typ_clique:
  | SLF def_typ_body_clq { [$2] }
  | SLF def_typ_body_clq def_typ_clique { [$2]@$3 }
  ;
def_typ_body:
  | NAM def_arg  { Def_Abs ($1,fst $2) }
  | NAM def_arg ISO def_coprd   { Def_CoPrd ($1,fst $2,$4) }
  | NAM def_arg ISO def_prd  { Def_Prd ($1,fst $2,$4) }
  | FNT NAM ISO name_list { Def_Fnt ($2,$4) }
  | FNT NAM APP L_BLK INT R_BLK ISO NAM   { Def_Fnt_Dep ($2,$5,$8) }
  | NAM def_arg EQ typ  { Def_Eqv ($1,fst $2,$4) }
  ;
def_typ_body_clq:
  | NAM def_arg  { Def_Abs ($1,fst $2) }
  | NAM def_arg ISO def_coprd   {
    let (a,_) = $2 in
    Def_CoPrd ($1,a,List.map (fun (y,n) -> (y,n)) $4) }
  | NAM def_arg ISO def_prd  { Def_Prd ($1,fst $2,$4) }
  | NAM def_arg EQ typ  { Def_Eqv ($1,fst $2,$4) }
  ;
name_list:
  | NAM { [$1] }
  | NAM name_list { $1::$2 }
  ;
def_coprd:
  | COPRD typ_top CLN NAM  { [($2,$4)] }
  | COPRD typ_top CLN NAM def_coprd  { ($2,$4)::$5 }
  ;
def_prd:
  | PRD typ_top CLN NAM  { [($2,$4)] }
  | PRD typ_top CLN NAM def_prd  { ($2,$4)::$5 }
  ;
typ_top:
  | typs { rcd_cl $1 }
  | EXP typ { $2 }
  ;
typs:
  | { [] }
  | typs typ { $1@[$2] }
  ;
typ:
  | L_RCD typ_top R_RCD { $2 }
  | typ APP typ { $1<+$3 }
  | typ PRJ typ { vct<+$1<+$3 }
  | L_OPN typ R_OPN { opn<+$2 }
  | L_LST typ R_LST { lst<+$2 }
  | VAL {
    ( try
      let v = StgMap.find $1 !typ_vct in
      v
      with _ -> let v = vsgn() in
      typ_vct:=(StgMap.add $1 v !typ_vct); vsgn()
    ) }
  | NAM { Prm (sgn()) }
  | Z { pZ }
  | N { nat }
  | typ IO typ  { $1-*$3 }
  | SGN { sgn_sgn }
  | TYP_STG { stg }
  ;
glb_etr:
  | LCE glb_etr_body { Etr(SgnMap.empty,$2)  }
  | LCE glb_etr_clique { Etr_Clq (SgnMap.empty,$2) }
  ;
glb_etr_clique:
  | SLF glb_etr_body { [$2] }
  | SLF glb_etr_body glb_etr_clique { [$2]@$3 }
  ;
glb_etr_body:
  | NAM typ_def DEF IN stt_code {
    (* let (scm,(src,dst)) = Ty.typing $5 in *)
  (*  let (src,dst) = (Val (Sgn.ini()),Val (Sgn.ini())) in
    let b = Ty.typing_vh [] (Ty.vh_of_code $5) src dst in *
    ($1,SgnMap.empty,Ty.subst b src,Ty.subst b dst,$5) *)
    ($1,Val (Sgn.ini()),Val(Sgn.ini()),$5)
  }
  ;
typ_def:
  | { (vsgn(),vsgn()) }
  | CLN typ_top SRC typ_top { ($2,$4) }
  ;
stt_code:
  | vh_frm_top code {
      match $2 with
      | None -> C_E $1
      | Some x -> C_V (C_E $1,x) }
  | L_HLZ h_frm_list R_HLZ tail {
    match $4 with
    | None -> C_H $2
    | Some x -> C_V(C_H $2,x)
  }
  | vh_frm_top code_coprd_list COPRD_END tail {
    let c = C_CoP($1,$2) in
    match $4 with
    | None -> c
    | Some x -> C_V(c,x)
   }
  | vh_frm_top code_prd_list PRD_END tail {
    let c = C_P($1,$2) in
    match $4 with
    | None -> c
    | Some x -> C_V(c,x)
  }
  | vh_frm_top IN stt_code eop tail {
    let c = C_IO($1,$2,$3) in
    match $5 with
      | None -> c
      | Some x -> (C_V(c,x)) }
  ;
code:
  | eop tail { $2 }
  | ARR vh_frm_top code {
    ( match $3 with
      | None -> Some (C_E $2)
      | Some x -> Some (C_V (C_E $2,x)) ) }
  | ARR L_HLZ h_frm_list R_HLZ tail {
    ( match $5 with
      | None -> Some (C_H $3)
      | Some x -> Some (C_V(C_H $3,x))
      )
  }
  | ARR vh_frm_top code_coprd_list COPRD_END tail {
    let c = C_CoP($2,$3) in
    match $5 with
    | None -> Some c
    | Some x -> Some (C_V(c,x)) }
  | ARR vh_frm_top code_prd_list PRD_END tail {
    let c = C_P($2,$3) in
    match $5 with
    | None -> Some c
    | Some x -> Some (C_V(c,x))  }
  | ARR vh_frm_top IN stt_code eop tail {
    let c = C_IO($2,$3,$4) in
    match $6 with
      | None -> Some c
      | Some x -> Some (C_V(c,x)) }
  ;
eop:
  | EOP {}
  | OUT {}
  ;
tail:
  | { None  }
  | SEQ code { $2 }
  ;

code_coprd_list:
  | { [] }
  | code_coprd_list COPRD stt_code  { $1@[$3] }
  ;

code_prd_list:
  | { [] }
  | code_prd_list PRD stt_code  { $1@[$3] }
  ;

h_frm_list:
  | stt_code { [$1] }
  | stt_code M_HLZ h_frm_list { $1::$3 }
  ;

vh_frm_top:
  | typ_ept exp_top { let (e,m) = $2 in ($1,e,m) }
  ;
exp_top:
  | exp_lst macro { (Opr_Rcd $1,$2) }
  | EXP exp macro { ($2,$3) }
  ;
macro:
  | { [] }
  | macro ARR_REV macro_node SPL  { [] }
  ;
macro_seq:
  | {}
  | SEQ macro {}
  ;
macro_node:
  | let_ptn LET exp_top {}
  ;
let_ptn:
  | let_ptn_atm {}
  | let_ptn_atm let_ptn {}
  ;
let_ptn_atm:
  | NAM {}
  | L_RCD let_ptn R_RCD {}
  ;
typ_ept:
  |  { vsgn() }
  | ACT typ_top CLN { $2 }
  ;
exp_lst:
  | { [] }
  | exp_lst exp  { $1@[$2] }
  ;

exp:
  | AGL exp R_BLK { Agl $2 }
  | AGL_TOP exp %prec AGL_PRE { Agl $2 }
  | INT { Opr_Z $1 }
  | PLS_EVL { Opr_Name "+" }
  | MLT_EVL { Opr_Name "*" }
  | APP_EVL { Opr_Name "◂" }
  | EMT { Opr_Name "⋎" }
  | CNT { Opr_Name "⋏" }
  | EXN { Opr_Name "?" }
  | ROT { Opr_Name "$" }
  | IDX { Prj(Opr_Name "$",$1) }
  | VCT { Opr_Name "#" }
  | INJ { Opr_Inj $1 }
  | CHO { Opr_Cho $1  }
  | NAM  { Opr_Name $1 }
  | SGN { Opr_App(Opr_Name "&",Opr_Rcd []) }
  | STG { Opr_Stg $1 }
  | SLF { Opr_Name "@" }
  | exp PLS exp { Opr_App (Opr_Name "+",Opr_Rcd [$1;$3]) }
  | exp MLT exp { Opr_App (Opr_Name "*",Opr_Rcd [$1;$3]) }
  | exp MNS exp { Opr_App (Opr_Name "+",Opr_Rcd [$1;Opr_App (Opr_Name "-",$3)]) }
  | exp CST { Opr_App(Opr_Name "//",$1) }
  | L_PRN MNS exp R_PRN { Opr_App (Opr_Name "-",$3) }
  | exp EQ exp { Opr_App(Opr_App(Opr_Name "=",$1),$3) }
  | L_PRN exp R_PRN { $2 }
  | exp APP exp { Opr_App ($1,$3) }
  | exp PRJ INT { Prj ($1,$3) }
  | L_RCD exp_lst R_RCD { Opr_Rcd $2 }
  | L_OPN R_OPN { Opr_Name "‹›" }
  | L_OPN exp R_OPN { Opr_App(Opr_Name "‹",$2) }
  | L_LST lst_list R_LST { $2 }
  ;
lst_list:
  | { Opr_App (Opr_Name "nil",Opr_Rcd []) }
  | exp lst_list { Opr_App (Opr_Name "cns",Opr_Rcd [$1;$2]) }
  ;