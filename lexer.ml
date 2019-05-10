# 1 "lexer.mll"
 
    open Parser
    exception Error of string

# 7 "lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\216\255\217\255\002\000\098\000\079\000\179\000\000\000\
    \223\255\224\255\192\000\231\255\232\255\233\255\234\255\235\255\
    \236\255\245\255\247\255\027\000\187\000\056\000\244\255\001\000\
    \254\255\255\255\250\255\025\000\000\000\007\000\006\000\000\000\
    \010\000\188\000\013\000\014\000\000\000\253\255\246\255\241\255\
    \238\255\237\255\252\255\248\255\230\255\227\255\229\255\228\255\
    \226\255\003\000\004\000\249\255\000\000\239\255\242\255\045\001\
    \120\001\195\001\205\001";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\037\000\036\000\035\000\039\000\033\000\
    \255\255\255\255\039\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\039\000\039\000\039\000\255\255\004\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\015\000\012\000\034\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\030\000\
    \030\000\035\000\036\000";
  Lexing.lex_default =
   "\001\000\000\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\255\255\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\255\255\255\255\255\255\000\000\255\255\
    \000\000\000\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\255\255\255\255\000\000\255\255\000\000\000\000\255\255\
    \255\255\255\255\255\255";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\003\000\003\000\003\000\003\000\003\000\000\000\003\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \003\000\011\000\003\000\010\000\007\000\000\000\000\000\007\000\
    \013\000\012\000\008\000\009\000\000\000\006\000\019\000\026\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\018\000\040\000\039\000\000\000\000\000\000\000\
    \000\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\038\000\000\000\017\000\000\000\000\000\
    \000\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\016\000\000\000\015\000\014\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\046\000\045\000\052\000\000\000\042\000\000\000\053\000\
    \054\000\000\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\041\000\000\000\000\000\000\000\
    \000\000\047\000\043\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\048\000\044\000\051\000\
    \000\000\000\000\021\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\050\000\022\000\025\000\
    \000\000\000\000\020\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\000\000\024\000\000\000\
    \000\000\000\000\000\000\023\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\049\000\000\000\000\000\
    \002\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \055\000\055\000\055\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \055\000\055\000\055\000\028\000\037\000\000\000\000\000\027\000\
    \000\000\000\000\000\000\033\000\032\000\031\000\000\000\000\000\
    \000\000\000\000\000\000\034\000\035\000\000\000\000\000\000\000\
    \000\000\030\000\029\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\036\000\056\000\056\000\056\000\
    \056\000\056\000\056\000\056\000\056\000\056\000\056\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \056\000\056\000\056\000\056\000\056\000\056\000\056\000\056\000\
    \056\000\056\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\056\000\056\000\056\000\056\000\056\000\056\000\056\000\
    \056\000\056\000\056\000\056\000\056\000\056\000\056\000\056\000\
    \056\000\056\000\056\000\056\000\056\000\056\000\056\000\056\000\
    \056\000\056\000\056\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\056\000\056\000\056\000\056\000\056\000\056\000\056\000\
    \056\000\056\000\056\000\056\000\056\000\056\000\056\000\056\000\
    \056\000\056\000\056\000\056\000\056\000\056\000\056\000\056\000\
    \056\000\056\000\056\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\003\000\003\000\000\000\255\255\003\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\003\000\000\000\000\000\255\255\255\255\007\000\
    \000\000\000\000\000\000\000\000\255\255\000\000\000\000\023\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\034\000\035\000\255\255\255\255\255\255\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\036\000\255\255\000\000\255\255\255\255\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\255\255\000\000\000\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\029\000\029\000\049\000\255\255\032\000\255\255\052\000\
    \052\000\255\255\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\032\000\255\255\255\255\255\255\
    \255\255\028\000\031\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\027\000\030\000\050\000\
    \255\255\255\255\000\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\019\000\021\000\021\000\
    \255\255\255\255\000\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\255\255\021\000\255\255\
    \255\255\255\255\255\255\021\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\019\000\255\255\255\255\
    \000\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\020\000\033\000\255\255\255\255\020\000\
    \255\255\255\255\255\255\020\000\020\000\020\000\255\255\255\255\
    \255\255\255\255\255\255\033\000\033\000\255\255\255\255\255\255\
    \255\255\020\000\020\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\033\000\055\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \056\000\056\000\056\000\056\000\056\000\056\000\056\000\056\000\
    \056\000\056\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\056\000\056\000\056\000\056\000\056\000\056\000\056\000\
    \056\000\056\000\056\000\056\000\056\000\056\000\056\000\056\000\
    \056\000\056\000\056\000\056\000\056\000\056\000\056\000\056\000\
    \056\000\056\000\056\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\056\000\056\000\056\000\056\000\056\000\056\000\056\000\
    \056\000\056\000\056\000\056\000\056\000\056\000\056\000\056\000\
    \056\000\056\000\056\000\056\000\056\000\056\000\056\000\056\000\
    \056\000\056\000\056\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_base_code =
   "";
  Lexing.lex_backtrk_code =
   "";
  Lexing.lex_default_code =
   "";
  Lexing.lex_trans_code =
   "";
  Lexing.lex_check_code =
   "";
  Lexing.lex_code =
   "";
}

let rec token lexbuf =
   __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 15 "lexer.mll"
                           ( LCE )
# 239 "lexer.ml"

  | 1 ->
# 16 "lexer.mll"
                             ( DTA )
# 244 "lexer.ml"

  | 2 ->
# 17 "lexer.mll"
                               ( F_ALL )
# 249 "lexer.ml"

  | 3 ->
# 18 "lexer.mll"
                               ( EQV )
# 254 "lexer.ml"

  | 4 ->
# 19 "lexer.mll"
                           ( ARR       )
# 259 "lexer.ml"

  | 5 ->
# 20 "lexer.mll"
                                ( ARR_END )
# 264 "lexer.ml"

  | 6 ->
# 21 "lexer.mll"
                                 ( ARR_STT )
# 269 "lexer.ml"

  | 7 ->
# 22 "lexer.mll"
                               ( SRC             )
# 274 "lexer.ml"

  | 8 ->
# 23 "lexer.mll"
          ( CLN )
# 279 "lexer.ml"

  | 9 ->
# 24 "lexer.mll"
                                    ( AGL )
# 284 "lexer.ml"

  | 10 ->
# 25 "lexer.mll"
          ( AGL_END )
# 289 "lexer.ml"

  | 11 ->
# 26 "lexer.mll"
                           ( M_CNN )
# 294 "lexer.ml"

  | 12 ->
# 27 "lexer.mll"
              ( CO_PRD )
# 299 "lexer.ml"

  | 13 ->
# 28 "lexer.mll"
              ( CO_PRD_STT )
# 304 "lexer.ml"

  | 14 ->
# 29 "lexer.mll"
              ( END_CO_PRD )
# 309 "lexer.ml"

  | 15 ->
# 30 "lexer.mll"
              ( PRD )
# 314 "lexer.ml"

  | 16 ->
# 31 "lexer.mll"
              ( PRD_STT )
# 319 "lexer.ml"

  | 17 ->
# 32 "lexer.mll"
              ( END_PRD )
# 324 "lexer.ml"

  | 18 ->
# 37 "lexer.mll"
                     ( DEF )
# 329 "lexer.ml"

  | 19 ->
# 38 "lexer.mll"
          ( L_RCD )
# 334 "lexer.ml"

  | 20 ->
# 39 "lexer.mll"
          ( R_RCD )
# 339 "lexer.ml"

  | 21 ->
# 40 "lexer.mll"
          ( CNN )
# 344 "lexer.ml"

  | 22 ->
# 41 "lexer.mll"
          ( L_PRN )
# 349 "lexer.ml"

  | 23 ->
# 42 "lexer.mll"
          ( R_PRN )
# 354 "lexer.ml"

  | 24 ->
# 43 "lexer.mll"
          ( EXP )
# 359 "lexer.ml"

  | 25 ->
# 44 "lexer.mll"
                                ( R_APP )
# 364 "lexer.ml"

  | 26 ->
# 45 "lexer.mll"
                               ( L_APP )
# 369 "lexer.ml"

  | 27 ->
# 46 "lexer.mll"
                      ( APP )
# 374 "lexer.ml"

  | 28 ->
# 47 "lexer.mll"
                                ( L_PRJ )
# 379 "lexer.ml"

  | 29 ->
# 48 "lexer.mll"
                                ( Z )
# 384 "lexer.ml"

  | 30 ->
let
# 49 "lexer.mll"
                             lxm
# 390 "lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) lexbuf.Lexing.lex_curr_pos in
# 49 "lexer.mll"
                                  ( GL_NAM(lxm) )
# 394 "lexer.ml"

  | 31 ->
# 50 "lexer.mll"
          ( PLS )
# 399 "lexer.ml"

  | 32 ->
# 51 "lexer.mll"
          ( MLT )
# 404 "lexer.ml"

  | 33 ->
let
# 52 "lexer.mll"
                      lxm
# 410 "lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) lexbuf.Lexing.lex_curr_pos in
# 52 "lexer.mll"
                           ( ROT (String.length lxm) )
# 414 "lexer.ml"

  | 34 ->
# 53 "lexer.mll"
                      ( AGL )
# 419 "lexer.ml"

  | 35 ->
let
# 54 "lexer.mll"
           lxm
# 425 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 54 "lexer.mll"
                ( INT (int_of_string lxm) )
# 429 "lexer.ml"

  | 36 ->
let
# 55 "lexer.mll"
                         lxm
# 435 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 55 "lexer.mll"
                             ( NAM (lxm) )
# 439 "lexer.ml"

  | 37 ->
# 57 "lexer.mll"
                    ( token lexbuf                         )
# 444 "lexer.ml"

  | 38 ->
# 58 "lexer.mll"
                    ( EOF               )
# 449 "lexer.ml"

  | 39 ->
# 59 "lexer.mll"
                    ( raise (Error (Printf.sprintf
                      "At offset %d: unexpected character.\n"
                      (Lexing.lexeme_start lexbuf))) )
# 456 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

;;

