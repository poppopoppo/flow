%{
open Flow
%}

%token SRC ARR DEF CLN L_RCD R_RCD CNN M_CNN Z ARR_END EQV DTA STT_CLN
%token LCE EXP CO_PRD END_CO_PRD AGL AGL_END ARR_STT F_ALL PRD PRD_STT END_PRD
%token L_PRN R_PRN  CO_PRD_STT  APP L_APP R_APP DOT L_PRJ D_EXP
%token TEST ACT SPL
(*
%token EOP PRD TEST PRD_STT R_APP STT END_PRD CLQ STT
*)
%token <string> NAM GL_NAM MCR
%token <int> INT ROT
%token PLS MLT
%token EOF

%left DOT
%left PLS
%left MLT
%left L_APP
%left L_PRJ

%start buffer


%type <Flow.Buffer.t> buffer
%type <Flow.Plc.t> plc plc_top
%type <Flow.Plc.t list> plcs
%%
buffer:
  | vh_frm_top EOF { Flow.Buffer.Evo $1 }
  | glb_etr EOF { Flow.Buffer.Glb $1 }
  | glb_mode EOF {
      let (n,s,d) = $1 in
      (Flow.Buffer.Glb_mode { name=n; src=s; dst=d })
         }
  | def_plc EOF { $1 }
  | ARR_END EOF { Flow.Buffer.End }
  ;
def_plc:
  | DTA def_name EQV def_coprd  { Flow.Buffer.Def (Data.CoPrd { name=$2; cns=$4 }) }
  | DTA def_name EQV def_prd  { Flow.Buffer.Def (Data.Prd { name=$2; cns=$4 }) }
  ;
def_name:
  | NAM  { $1 }
  | NAM R_APP NAM { $1 }
  ;
def_coprd:
  | CO_PRD plc_top CLN name  { [($4,$2)] }
  | CO_PRD plc_top CLN name def_coprd  { ($4,$2)::$5 }
  ;
def_prd:
  | PRD plc_top CLN name  { [($4,$2)] }
  | PRD plc_top CLN name def_prd  { ($4,$2)::$5 }
  ;
plc_top:
  | plcs { Flow.Plc.Rcd $1 }
  | EXP plc { $2 }
  ;
plcs:
  | { [] }
  | plcs plc { $1@[$2] }
  ;
plc:
  | Z { Flow.Plc.Z }
  | name { Flow.Plc.Name $1 }
  | L_RCD plc_top R_RCD { $2 }
  ;
name:
  | NAM { $1 }
glb_mode:
  | LCE LCE NAM CLN plc_top SRC plc_top { ($3,$5,$7) }
  ;

glb_etr:
  | LCE NAM typ_def DEF lc_code {
    let (src,dst) = $3 in
    Glb_St.Gl_Etr {
      name=$2;
      src=src;
      dst=dst;
      code=$5
      }
    }
  ;
lc_code:
  | vh_frm_code { $1 }
  ;
typ_def:
  | { (Flow.Plc.Mt,Flow.Plc.Mt) }
  | CLN plc_top SRC plc_top { ($2,$4) }
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
  | plc_ept exp_top { Exp.Exp ($1,$2) }
  ;
exp_top:
  | exp_lst macro { Exp.Rcd $1 }
  | EXP exp macro { $2 }
  | D_EXP exp macro { Flow.Exp.L_App ($2,Flow.Exp.Root 0) }
  ;
macro:
  | { }
  | SPL macros  { }
  ;
macros:
  | MCR DEF exp  { }
  | MCR DEF exp macros { }
  ;
plc_ept:
  |  { Flow.Plc.Mt }
  | ACT plc_top CLN { $2 }
  ;
vh_frm_lst:
  | vh_frm_code  { [$1] }
  | vh_frm_lst M_CNN vh_frm_code { $1@[$3] }
  ;

exp_lst:
  | { [] }
  | exp_lst exp  { $1@[$2] }
  ;

exp:
  | AGL exp AGL_END { Exp.Agl $2 }
  | const { $1 }
  | APP exp DOT exp { Exp.App ($2,$4) }
  | exp PLS exp { Exp.Plus ($1,$3) }
  | exp MLT exp { Exp.Mult ($1,$3) }
  | L_PRN exp R_PRN { $2 }
  | exp L_APP exp { Exp.L_App ($1,$3) }
  | exp L_PRJ exp { Exp.L_Prj ($1,$3) }
  | L_RCD exp_lst R_RCD { Exp.Rcd $2 }
  | ARR_STT lc_code { Exp.IO $2 }
  | MCR { Exp.Gl_call ("%"^$1) }
  ;
const:
  | INT { Exp.Z $1 }
  | ROT { Exp.Root $1 }
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
