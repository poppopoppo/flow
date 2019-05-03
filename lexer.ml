# 1 "lexer.mll"
 
    open Parser
    exception Error of string

# 7 "lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\223\255\224\255\002\000\062\000\147\000\157\000\229\255\
    \230\255\231\255\162\000\238\255\239\255\240\255\241\255\242\255\
    \243\255\001\000\177\000\013\000\251\255\157\000\120\000\250\255\
    \014\000\255\255\253\255\021\000\146\000\023\000\025\000\008\000\
    \025\000\252\255\244\255\235\255\237\255\236\255\228\255\234\255\
    \233\255\247\255\246\255\248\255\245\255\005\001\080\001\168\000\
    ";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\030\000\029\000\028\000\032\000\255\255\
    \255\255\255\255\032\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\032\000\032\000\006\000\255\255\032\000\032\000\255\255\
    \001\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\023\000\023\000\028\000\
    ";
  Lexing.lex_default =
   "\001\000\000\000\000\000\255\255\255\255\255\255\255\255\000\000\
    \000\000\000\000\255\255\000\000\000\000\000\000\000\000\000\000\
    \000\000\255\255\255\255\255\255\000\000\255\255\255\255\000\000\
    \255\255\000\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\255\255\255\255\255\255\
    ";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\003\000\003\000\003\000\003\000\003\000\000\000\003\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \003\000\011\000\003\000\010\000\007\000\000\000\017\000\000\000\
    \013\000\012\000\008\000\009\000\000\000\006\000\018\000\044\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\020\000\041\000\026\000\000\000\000\000\000\000\
    \000\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\016\000\019\000\015\000\014\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\037\000\034\000\000\000\000\000\000\000\000\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\040\000\035\000\033\000\036\000\000\000\000\000\000\000\
    \000\000\000\000\022\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\047\000\047\000\047\000\
    \047\000\047\000\047\000\047\000\047\000\047\000\047\000\042\000\
    \047\000\047\000\047\000\047\000\047\000\047\000\047\000\047\000\
    \047\000\047\000\021\000\045\000\045\000\045\000\045\000\045\000\
    \045\000\045\000\045\000\045\000\045\000\045\000\045\000\045\000\
    \045\000\045\000\045\000\045\000\045\000\045\000\045\000\045\000\
    \045\000\045\000\045\000\045\000\045\000\000\000\000\000\000\000\
    \002\000\000\000\000\000\045\000\045\000\045\000\045\000\045\000\
    \045\000\045\000\045\000\045\000\045\000\045\000\045\000\045\000\
    \045\000\045\000\045\000\045\000\045\000\045\000\045\000\045\000\
    \045\000\045\000\045\000\045\000\045\000\030\000\023\000\025\000\
    \039\000\027\000\000\000\000\000\000\000\028\000\031\000\032\000\
    \000\000\000\000\000\000\000\000\000\000\043\000\000\000\000\000\
    \000\000\000\000\038\000\024\000\029\000\046\000\046\000\046\000\
    \046\000\046\000\046\000\046\000\046\000\046\000\046\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\045\000\045\000\
    \045\000\045\000\045\000\045\000\045\000\045\000\045\000\045\000\
    \045\000\045\000\045\000\045\000\045\000\045\000\045\000\045\000\
    \045\000\045\000\045\000\045\000\045\000\045\000\045\000\045\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\045\000\045\000\
    \045\000\045\000\045\000\045\000\045\000\045\000\045\000\045\000\
    \045\000\045\000\045\000\045\000\045\000\045\000\045\000\045\000\
    \045\000\045\000\045\000\045\000\045\000\045\000\045\000\045\000\
    \046\000\046\000\046\000\046\000\046\000\046\000\046\000\046\000\
    \046\000\046\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\046\000\046\000\046\000\046\000\046\000\046\000\046\000\
    \046\000\046\000\046\000\046\000\046\000\046\000\046\000\046\000\
    \046\000\046\000\046\000\046\000\046\000\046\000\046\000\046\000\
    \046\000\046\000\046\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\046\000\046\000\046\000\046\000\046\000\046\000\046\000\
    \046\000\046\000\046\000\046\000\046\000\046\000\046\000\046\000\
    \046\000\046\000\046\000\046\000\046\000\046\000\046\000\046\000\
    \046\000\046\000\046\000\000\000\000\000\000\000\000\000\000\000\
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
    \000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\003\000\003\000\000\000\255\255\003\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\003\000\000\000\000\000\255\255\000\000\255\255\
    \000\000\000\000\000\000\000\000\255\255\000\000\000\000\017\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\019\000\024\000\255\255\255\255\255\255\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\029\000\031\000\255\255\255\255\255\255\255\255\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\027\000\030\000\032\000\030\000\255\255\255\255\255\255\
    \255\255\255\255\000\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\018\000\
    \047\000\047\000\047\000\047\000\047\000\047\000\047\000\047\000\
    \047\000\047\000\000\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\255\255\255\255\255\255\
    \000\000\255\255\255\255\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\021\000\022\000\022\000\
    \028\000\021\000\255\255\255\255\255\255\021\000\021\000\021\000\
    \255\255\255\255\255\255\255\255\255\255\018\000\255\255\255\255\
    \255\255\255\255\028\000\022\000\021\000\045\000\045\000\045\000\
    \045\000\045\000\045\000\045\000\045\000\045\000\045\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\045\000\045\000\
    \045\000\045\000\045\000\045\000\045\000\045\000\045\000\045\000\
    \045\000\045\000\045\000\045\000\045\000\045\000\045\000\045\000\
    \045\000\045\000\045\000\045\000\045\000\045\000\045\000\045\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\045\000\045\000\
    \045\000\045\000\045\000\045\000\045\000\045\000\045\000\045\000\
    \045\000\045\000\045\000\045\000\045\000\045\000\045\000\045\000\
    \045\000\045\000\045\000\045\000\045\000\045\000\045\000\045\000\
    \046\000\046\000\046\000\046\000\046\000\046\000\046\000\046\000\
    \046\000\046\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\046\000\046\000\046\000\046\000\046\000\046\000\046\000\
    \046\000\046\000\046\000\046\000\046\000\046\000\046\000\046\000\
    \046\000\046\000\046\000\046\000\046\000\046\000\046\000\046\000\
    \046\000\046\000\046\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\046\000\046\000\046\000\046\000\046\000\046\000\046\000\
    \046\000\046\000\046\000\046\000\046\000\046\000\046\000\046\000\
    \046\000\046\000\046\000\046\000\046\000\046\000\046\000\046\000\
    \046\000\046\000\046\000\255\255\255\255\255\255\255\255\255\255\
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
    \255\255";
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
# 206 "lexer.ml"

  | 1 ->
# 16 "lexer.mll"
                           ( ARR       )
# 211 "lexer.ml"

  | 2 ->
# 17 "lexer.mll"
                                ( ARR_END )
# 216 "lexer.ml"

  | 3 ->
# 18 "lexer.mll"
                               ( SRC             )
# 221 "lexer.ml"

  | 4 ->
# 19 "lexer.mll"
          ( CLN )
# 226 "lexer.ml"

  | 5 ->
# 20 "lexer.mll"
                           ( M_CNN )
# 231 "lexer.ml"

  | 6 ->
# 21 "lexer.mll"
            ( CO_PRD )
# 236 "lexer.ml"

  | 7 ->
# 22 "lexer.mll"
            ( CO_PRD_STT )
# 241 "lexer.ml"

  | 8 ->
# 23 "lexer.mll"
            ( END_CO_PRD )
# 246 "lexer.ml"

  | 9 ->
# 24 "lexer.mll"
            ( PRD_STT )
# 251 "lexer.ml"

  | 10 ->
# 25 "lexer.mll"
            ( END_PRD )
# 256 "lexer.ml"

  | 11 ->
# 26 "lexer.mll"
                     ( DEF )
# 261 "lexer.ml"

  | 12 ->
# 27 "lexer.mll"
          ( L_RCD )
# 266 "lexer.ml"

  | 13 ->
# 28 "lexer.mll"
          ( R_RCD )
# 271 "lexer.ml"

  | 14 ->
# 29 "lexer.mll"
          ( CNN )
# 276 "lexer.ml"

  | 15 ->
# 30 "lexer.mll"
          ( L_PRN )
# 281 "lexer.ml"

  | 16 ->
# 31 "lexer.mll"
          ( R_PRN )
# 286 "lexer.ml"

  | 17 ->
# 32 "lexer.mll"
          ( EXP )
# 291 "lexer.ml"

  | 18 ->
# 33 "lexer.mll"
                      ( R_APP )
# 296 "lexer.ml"

  | 19 ->
# 34 "lexer.mll"
                     ( L_APP )
# 301 "lexer.ml"

  | 20 ->
# 35 "lexer.mll"
                      ( APP )
# 306 "lexer.ml"

  | 21 ->
# 36 "lexer.mll"
                                ( EOP  )
# 311 "lexer.ml"

  | 22 ->
# 37 "lexer.mll"
                                ( Z )
# 316 "lexer.ml"

  | 23 ->
let
# 38 "lexer.mll"
                             lxm
# 322 "lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) lexbuf.Lexing.lex_curr_pos in
# 38 "lexer.mll"
                                  ( GL_NAM(lxm) )
# 326 "lexer.ml"

  | 24 ->
# 39 "lexer.mll"
          ( PLS )
# 331 "lexer.ml"

  | 25 ->
# 40 "lexer.mll"
          ( MLT )
# 336 "lexer.ml"

  | 26 ->
# 41 "lexer.mll"
          ( ROT )
# 341 "lexer.ml"

  | 27 ->
# 42 "lexer.mll"
                      ( AGL )
# 346 "lexer.ml"

  | 28 ->
let
# 43 "lexer.mll"
           lxm
# 352 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 43 "lexer.mll"
                ( INT (int_of_string lxm) )
# 356 "lexer.ml"

  | 29 ->
let
# 44 "lexer.mll"
                lxm
# 362 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 44 "lexer.mll"
                    ( NAM (lxm) )
# 366 "lexer.ml"

  | 30 ->
# 46 "lexer.mll"
                    ( token lexbuf                         )
# 371 "lexer.ml"

  | 31 ->
# 47 "lexer.mll"
                    ( EOF               )
# 376 "lexer.ml"

  | 32 ->
# 48 "lexer.mll"
                    ( raise (Error (Printf.sprintf
                      "At offset %d: unexpected character.\n"
                      (Lexing.lexeme_start lexbuf))) )
# 383 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

;;

