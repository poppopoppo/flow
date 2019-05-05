%{
open Flow
%}

%token SRC ARR DEF CLN L_RCD R_RCD STT CNN M_CNN Z ARR_END
%token TEST CLQ LCE EXP PRD CO_PRD END_PRD END_CO_PRD R_APP AGL
%token L_PRN R_PRN PRD_STT CO_PRD_STT  APP L_APP DOT ROT EOP
%token <string> NAM GL_NAM
%token <int> INT
%token PLS MLT
%token EOF

%left DOT
%left PLS
%left MLT
%left L_APP

%start buffer

%type <Flow.buf> buffer
%%
buffer:
  | vh_frm_top EOF { Flow.Evo $1 }
  | glb_etr EOF { Flow.Glb $1 }
  | glb_mode EOF {
      let (x,y) = $1 in
      (Flow.Glb_mode (x,y)) }
  ;
glb_mode:
  | LCE LCE NAM CLN typs SRC typs { ($3,Flow.St.Rcd $5) }
  ;

glb_etr:
  | LCE NAM typ_def DEF lc_code { ($2,$5) }
  ;
lc_code:
  | vh_frm_code { $1 }
  ;
typ_def:
  | { Flow.St.Rcd [] }
  | CLN typs SRC typs { Flow.St.Rcd $2 }
  ;
(*
text:
  | EOF {}
  | gl_cod EOF  {  }
  ;
gl_cod:

  | gl_etr {  }
  | gl_cod gl_etr {  }
  | gl_code def_flow
  ;
gl_etr:
  | LCE lc_man {   }
  | LCE clq_lst {  }
  ;

lc_man:
  | NAM CLN typs SRC typs DEF lc_cod { }
  ;

clq_lst:
  | CLQ lc_man {  }
  | clq_lst CLQ lc_man { }
  ;
*)
typs:
  | typ { [$1] }
  | typs typ { $1@[$2] }
  ;
typ:
  | Z { Flow.St.Z None }
  | rcd { $1 }
  ;
rcd:
  | L_RCD rcd_lst R_RCD { Flow.St.Rcd $2 }
  ;
rcd_lst:
  | { [] }
  | rcd_lst typ { $1@[$2] }
(*
lc_cod:
  | { Flow.Exp.End }
  | arr_base ARR lc_cod  {Flow.Exp.Seq ($1,$3) }
  | cprd  { Flow.Exp.CoPrd $1 }
  | prd  { Flow.Exp.Prd $1 }
  ;
  *)
vh_frm_code:
  | vh_frm_top tail_code
    {
      match $2 with
      | None -> $1
      | Some t -> Exp.Seq ($1,t)
    }
  ;
tail_code:
  | ARR_END { None }
  | ARR vh_frm_code { Some $2 }
  | coprd { $1 }
  ;
coprd:
  | CO_PRD_STT vh_frm_code coprd_tail END_CO_PRD vh_frm_code
    { Some (Exp.CoPrd ([$2]@$3@[$5])) }
  ;

coprd_tail:
  | { [] }
  | coprd_tail CO_PRD vh_frm_code { $1@[$3] }
  ;
vh_frm_top:
  | CNN vh_frm_lst  { Exp.Canon $2 }
  | exp_top_lst { Exp.Exp (Exp.Rcd $1) }
  | EXP exp { Exp.Exp $2 }
  ;
vh_frm_lst:
  | vh_frm  { [$1] }
  | vh_frm_lst M_CNN vh_frm { $1@[$3] }
  ;
vh_frm:
  | h_frm tail
    {
      match $2 with
      | None -> $1
      | Some t -> Exp.Seq ($1,t)
    }
  ;
h_frm:
  | exp_top { Exp.Exp $1 }
  | L_RCD CNN vh_frm_lst R_RCD  { Exp.Canon $3 }
  ;
tail:
  | ARR_END { None }
  | ARR vh_frm { Some $2 }
  | CO_PRD_STT vh_frm CO_PRD vh_frm END_CO_PRD  { Some (Exp.CoPrd [$2;$4]) }
  ;
exp_lst:
  | { [] }
  | exp_lst exp  { $1@[$2] }
  ;
exp_top:
  | AGL exp_app TEST
  | exp_app
  | L_RCD exp_top_lst R_RCD
  ;
exp_top_lst:
  |
  | exp_top_lst exp_top
  ;
exp_app:
  | const { $1 }
  | APP exp DOT exp { Exp.App ($2,$4) }
  | exp PLS exp { Exp.Plus ($1,$3) }
  | exp MLT exp { Exp.Mult ($1,$3) }
  | L_PRN exp R_PRN { $2 }
  | exp L_APP exp { Exp.L_App ($1,$3) }
exp:
  | AGL exp TEST { $2 }

  | L_RCD exp_lst R_RCD { Exp.Rcd $2 }
  ;
const:
  | INT { Exp.Z $1 }
  | ROT { Exp.Root }
  | GL_NAM  { Exp.Gl_call $1 }
  ;
(*
cprd:
  | cprd_lst END_CO_PRD lc_cod  { [] }
  ;
cprd_lst:
  | CO_PRD_STT lc_cod {}
  | cprd_lst CO_PRD lc_cod  {}
  ;
prd:
  | prd_lst END_PRD lc_cod  { [] }
  ;
prd_lst:
  | PRD_STT lc_cod {}
  | prd_lst PRD lc_cod  {}
  ;
*)
