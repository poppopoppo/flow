# 1 "imp_lexer.mll"
 
    open Imp_parser
    exception Error of string

# 7 "imp_lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\208\255\209\255\002\000\098\000\079\000\179\000\000\000\
    \215\255\216\255\192\000\005\000\226\255\227\255\228\255\229\255\
    \230\255\231\255\240\255\189\000\243\255\244\255\131\000\005\001\
    \006\000\252\255\218\000\130\000\131\000\135\000\239\255\001\000\
    \253\255\254\255\247\255\239\000\028\000\006\000\000\000\002\001\
    \008\001\014\000\015\000\000\000\131\000\251\255\016\000\027\000\
    \059\000\241\255\236\255\233\255\232\255\249\255\245\255\222\255\
    \220\255\221\255\218\255\219\255\105\001\180\001\238\001\223\255\
    \025\000\004\000\246\255\049\000\234\255\237\255\011\001\224\255\
    \057\002\132\002\207\002\217\002";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\045\000\044\000\043\000\047\000\041\000\
    \255\255\255\255\047\000\030\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\047\000\255\255\255\255\047\000\047\000\
    \047\000\255\255\047\000\047\000\255\255\000\000\255\255\007\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\020\000\017\000\042\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\005\000\005\000\005\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\013\000\255\255\
    \038\000\038\000\043\000\044\000";
  Lexing.lex_default =
   "\001\000\000\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\255\255\255\255\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\255\255\000\000\000\000\255\255\255\255\
    \255\255\000\000\255\255\028\000\028\000\028\000\000\000\255\255\
    \000\000\000\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\000\000\255\255\255\255\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\255\255\255\255\255\255\000\000\
    \255\255\255\255\000\000\255\255\000\000\000\000\255\255\000\000\
    \255\255\255\255\255\255\255\255";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\003\000\003\000\003\000\003\000\003\000\000\000\003\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \003\000\011\000\003\000\010\000\007\000\019\000\071\000\007\000\
    \013\000\012\000\008\000\009\000\000\000\006\000\022\000\034\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\021\000\027\000\051\000\050\000\000\000\023\000\
    \000\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\049\000\025\000\018\000\000\000\000\000\
    \017\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\016\000\020\000\015\000\014\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\047\000\035\000\048\000\029\000\029\000\040\000\039\000\
    \038\000\029\000\075\000\075\000\075\000\075\000\075\000\075\000\
    \075\000\075\000\075\000\075\000\037\000\036\000\057\000\056\000\
    \045\000\067\000\054\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\063\000\055\000\066\000\
    \068\000\069\000\026\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\000\000\000\000\000\000\
    \000\000\000\000\024\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\074\000\074\000\074\000\074\000\070\000\070\000\070\000\
    \070\000\070\000\070\000\070\000\070\000\070\000\070\000\046\000\
    \000\000\000\000\000\000\000\000\000\000\045\000\000\000\000\000\
    \002\000\072\000\072\000\072\000\072\000\072\000\072\000\072\000\
    \072\000\072\000\072\000\072\000\072\000\072\000\072\000\072\000\
    \072\000\072\000\072\000\072\000\072\000\072\000\072\000\072\000\
    \072\000\072\000\072\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\072\000\072\000\072\000\072\000\072\000\072\000\072\000\
    \072\000\072\000\072\000\072\000\072\000\072\000\072\000\072\000\
    \072\000\072\000\072\000\072\000\072\000\072\000\072\000\072\000\
    \072\000\072\000\072\000\070\000\070\000\070\000\070\000\070\000\
    \070\000\070\000\070\000\070\000\070\000\065\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \000\000\000\000\000\000\000\000\060\000\064\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \030\000\033\000\255\255\255\255\058\000\053\000\000\000\255\255\
    \044\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \032\000\000\000\000\000\059\000\052\000\031\000\000\000\041\000\
    \042\000\061\000\061\000\061\000\061\000\061\000\061\000\061\000\
    \061\000\061\000\061\000\000\000\000\000\000\000\000\000\000\000\
    \043\000\000\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\000\000\000\000\000\000\000\000\
    \060\000\000\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\061\000\061\000\061\000\061\000\
    \061\000\061\000\061\000\061\000\061\000\061\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\062\000\062\000\062\000\
    \062\000\062\000\062\000\062\000\062\000\062\000\062\000\062\000\
    \062\000\062\000\062\000\062\000\062\000\062\000\062\000\062\000\
    \062\000\062\000\062\000\062\000\062\000\062\000\062\000\000\000\
    \000\000\000\000\000\000\062\000\000\000\062\000\062\000\062\000\
    \062\000\062\000\062\000\062\000\062\000\062\000\062\000\062\000\
    \062\000\062\000\062\000\062\000\062\000\062\000\062\000\062\000\
    \062\000\062\000\062\000\062\000\062\000\062\000\062\000\062\000\
    \062\000\062\000\062\000\062\000\062\000\062\000\062\000\062\000\
    \062\000\062\000\062\000\062\000\062\000\062\000\062\000\062\000\
    \062\000\062\000\062\000\062\000\062\000\062\000\062\000\062\000\
    \062\000\000\000\000\000\000\000\000\000\062\000\000\000\062\000\
    \062\000\062\000\062\000\062\000\062\000\062\000\062\000\062\000\
    \062\000\062\000\062\000\062\000\062\000\062\000\062\000\062\000\
    \062\000\062\000\062\000\062\000\062\000\062\000\062\000\062\000\
    \062\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\072\000\072\000\072\000\072\000\072\000\072\000\
    \072\000\072\000\072\000\072\000\072\000\072\000\072\000\072\000\
    \072\000\072\000\072\000\072\000\072\000\072\000\072\000\072\000\
    \072\000\072\000\072\000\072\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\072\000\072\000\072\000\072\000\072\000\072\000\
    \072\000\072\000\072\000\072\000\072\000\072\000\072\000\072\000\
    \072\000\072\000\072\000\072\000\072\000\072\000\072\000\072\000\
    \072\000\072\000\072\000\072\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\074\000\
    \074\000\074\000\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\075\000\075\000\075\000\075\000\075\000\075\000\075\000\
    \075\000\075\000\075\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\075\000\075\000\075\000\075\000\075\000\075\000\
    \075\000\075\000\075\000\075\000\075\000\075\000\075\000\075\000\
    \075\000\075\000\075\000\075\000\075\000\075\000\075\000\075\000\
    \075\000\075\000\075\000\075\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\075\000\075\000\075\000\075\000\075\000\075\000\
    \075\000\075\000\075\000\075\000\075\000\075\000\075\000\075\000\
    \075\000\075\000\075\000\075\000\075\000\075\000\075\000\075\000\
    \075\000\075\000\075\000\075\000\000\000\000\000\000\000\000\000\
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
    \000\000\000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\003\000\003\000\000\000\255\255\003\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\003\000\000\000\000\000\000\000\011\000\007\000\
    \000\000\000\000\000\000\000\000\255\255\000\000\000\000\031\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\041\000\042\000\255\255\000\000\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\043\000\000\000\000\000\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\046\000\024\000\047\000\027\000\028\000\024\000\024\000\
    \024\000\029\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\024\000\024\000\036\000\036\000\
    \048\000\064\000\038\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\022\000\037\000\065\000\
    \067\000\067\000\000\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\255\255\255\255\255\255\
    \255\255\255\255\000\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\019\000\019\000\019\000\
    \019\000\019\000\019\000\019\000\019\000\019\000\019\000\044\000\
    \255\255\255\255\255\255\255\255\255\255\044\000\255\255\255\255\
    \000\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\070\000\070\000\070\000\070\000\070\000\
    \070\000\070\000\070\000\070\000\070\000\022\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \255\255\255\255\255\255\255\255\023\000\022\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \026\000\026\000\027\000\028\000\035\000\039\000\255\255\029\000\
    \040\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \026\000\255\255\255\255\035\000\039\000\026\000\255\255\040\000\
    \040\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\255\255\255\255\255\255\255\255\255\255\
    \040\000\255\255\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\255\255\255\255\255\255\255\255\
    \060\000\255\255\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\061\000\061\000\061\000\061\000\
    \061\000\061\000\061\000\061\000\061\000\061\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\061\000\061\000\061\000\
    \061\000\061\000\061\000\061\000\061\000\061\000\061\000\061\000\
    \061\000\061\000\061\000\061\000\061\000\061\000\061\000\061\000\
    \061\000\061\000\061\000\061\000\061\000\061\000\061\000\255\255\
    \255\255\255\255\255\255\061\000\255\255\061\000\061\000\061\000\
    \061\000\061\000\061\000\061\000\061\000\061\000\061\000\061\000\
    \061\000\061\000\061\000\061\000\061\000\061\000\061\000\061\000\
    \061\000\061\000\061\000\061\000\061\000\061\000\061\000\062\000\
    \062\000\062\000\062\000\062\000\062\000\062\000\062\000\062\000\
    \062\000\062\000\062\000\062\000\062\000\062\000\062\000\062\000\
    \062\000\062\000\062\000\062\000\062\000\062\000\062\000\062\000\
    \062\000\255\255\255\255\255\255\255\255\062\000\255\255\062\000\
    \062\000\062\000\062\000\062\000\062\000\062\000\062\000\062\000\
    \062\000\062\000\062\000\062\000\062\000\062\000\062\000\062\000\
    \062\000\062\000\062\000\062\000\062\000\062\000\062\000\062\000\
    \062\000\072\000\072\000\072\000\072\000\072\000\072\000\072\000\
    \072\000\072\000\072\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\072\000\072\000\072\000\072\000\072\000\072\000\
    \072\000\072\000\072\000\072\000\072\000\072\000\072\000\072\000\
    \072\000\072\000\072\000\072\000\072\000\072\000\072\000\072\000\
    \072\000\072\000\072\000\072\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\072\000\072\000\072\000\072\000\072\000\072\000\
    \072\000\072\000\072\000\072\000\072\000\072\000\072\000\072\000\
    \072\000\072\000\072\000\072\000\072\000\072\000\072\000\072\000\
    \072\000\072\000\072\000\072\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\073\000\
    \073\000\073\000\073\000\073\000\073\000\073\000\073\000\074\000\
    \074\000\074\000\074\000\074\000\074\000\074\000\074\000\074\000\
    \074\000\075\000\075\000\075\000\075\000\075\000\075\000\075\000\
    \075\000\075\000\075\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\075\000\075\000\075\000\075\000\075\000\075\000\
    \075\000\075\000\075\000\075\000\075\000\075\000\075\000\075\000\
    \075\000\075\000\075\000\075\000\075\000\075\000\075\000\075\000\
    \075\000\075\000\075\000\075\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\075\000\075\000\075\000\075\000\075\000\075\000\
    \075\000\075\000\075\000\075\000\075\000\075\000\075\000\075\000\
    \075\000\075\000\075\000\075\000\075\000\075\000\075\000\075\000\
    \075\000\075\000\075\000\075\000\255\255\255\255\255\255\255\255\
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
    \255\255\255\255";
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
# 16 "imp_lexer.mll"
                     ( token lexbuf )
# 313 "imp_lexer.ml"

  | 1 ->
# 17 "imp_lexer.mll"
                           ( LCE )
# 318 "imp_lexer.ml"

  | 2 ->
# 18 "imp_lexer.mll"
                             ( DTA )
# 323 "imp_lexer.ml"

  | 3 ->
# 19 "imp_lexer.mll"
            ( SLH )
# 328 "imp_lexer.ml"

  | 4 ->
# 20 "imp_lexer.mll"
                           ( FOR_ALL )
# 333 "imp_lexer.ml"

  | 5 ->
let
# 21 "imp_lexer.mll"
                   lxm
# 339 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) lexbuf.Lexing.lex_curr_pos in
# 21 "imp_lexer.mll"
                        ( VAL(lxm) )
# 343 "imp_lexer.ml"

  | 6 ->
# 22 "imp_lexer.mll"
                               ( EQV )
# 348 "imp_lexer.ml"

  | 7 ->
# 23 "imp_lexer.mll"
                           ( ARR       )
# 353 "imp_lexer.ml"

  | 8 ->
# 24 "imp_lexer.mll"
                                ( ARR_END )
# 358 "imp_lexer.ml"

  | 9 ->
# 25 "imp_lexer.mll"
                                 ( ARR_STT )
# 363 "imp_lexer.ml"

  | 10 ->
# 26 "imp_lexer.mll"
                               ( SRC             )
# 368 "imp_lexer.ml"

  | 11 ->
# 27 "imp_lexer.mll"
          ( CLN )
# 373 "imp_lexer.ml"

  | 12 ->
# 28 "imp_lexer.mll"
          ( SPL )
# 378 "imp_lexer.ml"

  | 13 ->
let
# 29 "imp_lexer.mll"
                     lxm
# 384 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) lexbuf.Lexing.lex_curr_pos in
# 29 "imp_lexer.mll"
                          ( MCR(lxm) )
# 388 "imp_lexer.ml"

  | 14 ->
# 30 "imp_lexer.mll"
                                    ( AGL )
# 393 "imp_lexer.ml"

  | 15 ->
# 31 "imp_lexer.mll"
          ( AGL_END )
# 398 "imp_lexer.ml"

  | 16 ->
# 32 "imp_lexer.mll"
                           ( M_CNN )
# 403 "imp_lexer.ml"

  | 17 ->
# 33 "imp_lexer.mll"
              ( CO_PRD )
# 408 "imp_lexer.ml"

  | 18 ->
# 34 "imp_lexer.mll"
              ( CO_PRD_STT )
# 413 "imp_lexer.ml"

  | 19 ->
# 35 "imp_lexer.mll"
              ( END_CO_PRD )
# 418 "imp_lexer.ml"

  | 20 ->
# 36 "imp_lexer.mll"
              ( PRD )
# 423 "imp_lexer.ml"

  | 21 ->
# 37 "imp_lexer.mll"
              ( PRD_STT )
# 428 "imp_lexer.ml"

  | 22 ->
# 38 "imp_lexer.mll"
              ( END_PRD )
# 433 "imp_lexer.ml"

  | 23 ->
# 43 "imp_lexer.mll"
                     ( DEF )
# 438 "imp_lexer.ml"

  | 24 ->
# 44 "imp_lexer.mll"
          ( ACT )
# 443 "imp_lexer.ml"

  | 25 ->
# 45 "imp_lexer.mll"
          ( L_RCD )
# 448 "imp_lexer.ml"

  | 26 ->
# 46 "imp_lexer.mll"
          ( R_RCD )
# 453 "imp_lexer.ml"

  | 27 ->
# 47 "imp_lexer.mll"
          ( CNN )
# 458 "imp_lexer.ml"

  | 28 ->
# 48 "imp_lexer.mll"
          ( L_PRN )
# 463 "imp_lexer.ml"

  | 29 ->
# 49 "imp_lexer.mll"
          ( R_PRN )
# 468 "imp_lexer.ml"

  | 30 ->
# 50 "imp_lexer.mll"
          ( EXP )
# 473 "imp_lexer.ml"

  | 31 ->
# 51 "imp_lexer.mll"
            ( D_EXP )
# 478 "imp_lexer.ml"

  | 32 ->
# 52 "imp_lexer.mll"
            ( STT_CLN )
# 483 "imp_lexer.ml"

  | 33 ->
# 53 "imp_lexer.mll"
                                ( R_APP )
# 488 "imp_lexer.ml"

  | 34 ->
# 54 "imp_lexer.mll"
                      ( APP )
# 493 "imp_lexer.ml"

  | 35 ->
# 55 "imp_lexer.mll"
                                ( PRJ )
# 498 "imp_lexer.ml"

  | 36 ->
# 56 "imp_lexer.mll"
                                ( Z )
# 503 "imp_lexer.ml"

  | 37 ->
# 57 "imp_lexer.mll"
            ( N )
# 508 "imp_lexer.ml"

  | 38 ->
let
# 58 "imp_lexer.mll"
                             lxm
# 514 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) lexbuf.Lexing.lex_curr_pos in
# 58 "imp_lexer.mll"
                                  ( GL_NAM(lxm) )
# 518 "imp_lexer.ml"

  | 39 ->
# 59 "imp_lexer.mll"
          ( PLS )
# 523 "imp_lexer.ml"

  | 40 ->
# 60 "imp_lexer.mll"
          ( MLT )
# 528 "imp_lexer.ml"

  | 41 ->
let
# 61 "imp_lexer.mll"
                      lxm
# 534 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) lexbuf.Lexing.lex_curr_pos in
# 61 "imp_lexer.mll"
                           ( ROT (String.length lxm) )
# 538 "imp_lexer.ml"

  | 42 ->
# 62 "imp_lexer.mll"
                      ( AGL )
# 543 "imp_lexer.ml"

  | 43 ->
let
# 63 "imp_lexer.mll"
           lxm
# 549 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 63 "imp_lexer.mll"
                ( INT (int_of_string lxm) )
# 553 "imp_lexer.ml"

  | 44 ->
let
# 64 "imp_lexer.mll"
                         lxm
# 559 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 64 "imp_lexer.mll"
                             ( NAM (lxm) )
# 563 "imp_lexer.ml"

  | 45 ->
# 66 "imp_lexer.mll"
                    ( token lexbuf                         )
# 568 "imp_lexer.ml"

  | 46 ->
# 67 "imp_lexer.mll"
                    ( EOF               )
# 573 "imp_lexer.ml"

  | 47 ->
# 68 "imp_lexer.mll"
                    ( raise (Error (Printf.sprintf
                      "At offset %d: unexpected character.\n"
                      (Lexing.lexeme_start lexbuf))) )
# 580 "imp_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

;;

