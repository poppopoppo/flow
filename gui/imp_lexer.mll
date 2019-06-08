{
    open Imp_parser
    exception Error of string
}

let space = [' ' '\t' '\n' '\r']
let digit = ['0'-'9']
let alpha = ['a'-'z' 'A'-'Z']
let ascii = ['a'-'z' 'A'-'Z' '0'-'9' '(' ')' '!' '"' '#'
  '$' '%' '&' '\'' '=' '~' '~' '|' '{' '}' '`' '@' '[' ']'
  '*' '+' ';' ':' '<' '>' ',' '.' '?' '/' '\\' '_' ]
let alnum = digit | alpha
let name = alpha+  ("_" | digit | alpha)*
let z = (('-' digit+)|digit+)
rule token = parse
    | '\"' (([^ '\"']|"\\\"")* as lxm) '\"' { STG(lxm) }
    | ";" [^ '\n']* { Util.pnt true "start line comment\n"; token lexbuf }
    | ".;" (_)* ";."  { token lexbuf }
    | "§"  { LCE }
    | "§§"  { MDL }
    | "§§." { MDL_END }
    | "¶" { DTA }
    | "\\"  { SLH }
    | "∀" { FOR_ALL }
    | (name as lxm) "\'" { VAL(lxm) }
    | name as lxm { NAM(lxm) }
    | "≃" { ISO }
    | "=="  { DEQ }
    | ""| "~" { LET }
    | "»" { ARR }
    | "↑" { INJ }
    | "↓" { CHO }
(*
    | "»."  { ARR_END }
    | ".»" { ARR_STT }
*)
    | (('|')+ as lxm) "»" { IN(String.length lxm) }
    | "»" (('|')+ as lxm)  { OUT(String.length lxm) }
    | "⊢" { SRC }
    | "⋎" { EMT }
    | "⋏" { CNT }
    | "?" { EXN }
    | ":" { CLN }
    | "|" { SPL }
    | "∠" "["  { AGL }
    | "]" { R_BLK }
    | "[" { L_BLK }
    | "^" { SEQ }
    | "¦"  { M_HLZ }
    | "∐"   { COPRD }
    | "∏"   { PRD }
    | "∎" { EOP }
    | "∇" { COPRD_END }
    | "∆" { PRD_END }
    | "≒" { DEF }
    | "`" { ACT }
    | "//"  { CST }
    | "_" { WC }
    | "{" { L_RCD }
    | "}" { R_RCD }
    | "⁅" { L_HLZ }
    | "⁆" { R_HLZ  }
    | "⟦" { L_LST }
    | "⟧" { R_LST }
    | "‹" { L_OPN }
    | "›" { R_OPN }
    | "&" { SGN }
    | "#" { VCT }
    | "(" { L_PRN }
    | ")" { R_PRN }
    | "=" { EQ }
    | "!" { EXP }
    | "◂" { APP }
    | "◃" { PRJ }
    | "ℤ" { Z }
    | "ℕ" { N }
    | "ℾ" { TYP_STG }
    | "+" { PLS }
    | "*" { MLT }
    | "-" { MNS }
    | "," { CMM }
    | "$" (("\'")* as lxm) { ROT (String.length lxm) }
    | "@" (("\'")* as lxm) { SLF (String.length lxm) }
    | "◂\'" { APP_EVL }
    | "+\'" { PLS_EVL }
    | "*\'" { MLT_EVL }
    | "∠"  { AGL }
    | digit+ as lxm  { INT (int_of_string lxm) }
    | space+        { token lexbuf                         }
    | eof           { EOF               }
    | _             { raise (Error (Printf.sprintf
                      "At offset %d: unexpected character.\n"
                      (Lexing.lexeme_start lexbuf))) }
and line_comment = parse
  | "\n"  { Util.pnt true "end line comment\n"; token lexbuf }
  | _ { line_comment lexbuf }
