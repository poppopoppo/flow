# 1 "imp_lexer.mll"
 
    open Imp_parser
    exception Error of string

# 7 "imp_lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\164\255\165\255\005\000\170\255\088\000\089\000\090\000\
    \174\255\178\255\179\255\180\255\186\255\187\255\188\255\189\255\
    \190\255\191\255\192\255\197\255\198\255\203\255\083\000\205\255\
    \213\255\214\255\216\255\219\255\229\255\230\255\007\000\008\000\
    \192\000\018\000\241\255\000\000\109\000\074\000\125\000\113\000\
    \255\255\249\000\115\000\094\000\075\000\253\255\171\255\123\000\
    \160\000\011\001\056\000\021\001\078\001\126\000\249\255\250\255\
    \220\255\052\000\054\000\055\000\137\000\141\000\014\000\135\000\
    \247\255\139\000\245\255\001\000\054\000\035\000\243\255\242\255\
    \065\000\226\255\061\000\069\000\007\000\029\000\052\000\038\000\
    \075\000\073\000\220\000\207\255\208\255\209\255\210\255\159\000\
    \107\000\240\255\101\001\111\001\200\255\175\255\211\255\185\255\
    \096\000\235\255\206\255\232\255\199\255\100\000\221\255\134\000\
    \137\000\133\001\143\001\202\255\157\001\167\001\201\255\195\255\
    \196\255\193\255\194\255\181\255\182\255\183\255\177\255\239\255\
    \196\001\043\000\162\000\234\255\101\000\070\000\105\000\236\255\
    \237\255\222\255\225\255\233\255\204\255\228\000\254\255\255\255\
    ";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\088\000\255\255\087\000\083\000\082\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\091\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\024\000\037\000\
    \017\000\091\000\255\255\091\000\087\000\040\000\001\000\091\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\003\000\255\255\255\255\004\000\255\255\255\255\255\255\
    \255\255\028\000\027\000\079\000\011\000\007\000\255\255\255\255\
    \255\255\009\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \031\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\043\000\
    \038\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \071\000\255\255\255\255\255\255\255\255\032\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \017\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    ";
  Lexing.lex_default =
   "\001\000\000\000\000\000\255\255\000\000\255\255\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\255\255\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\255\255\255\255\
    \255\255\255\255\000\000\255\255\255\255\255\255\038\000\042\000\
    \000\000\255\255\042\000\043\000\255\255\000\000\000\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\000\000\000\000\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\000\000\255\255\255\255\255\255\000\000\000\000\
    \255\255\000\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\000\000\000\000\000\000\000\000\255\255\
    \255\255\000\000\255\255\255\255\000\000\000\000\000\000\000\000\
    \255\255\000\000\000\000\000\000\000\000\255\255\000\000\255\255\
    \255\255\255\255\255\255\000\000\255\255\255\255\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \255\255\255\255\255\255\000\000\255\255\255\255\255\255\000\000\
    \000\000\000\000\000\000\000\000\000\000\134\000\000\000\000\000\
    ";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\003\000\003\000\000\000\000\000\003\000\003\000\003\000\
    \000\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \003\000\012\000\039\000\017\000\007\000\003\000\018\000\014\000\
    \016\000\015\000\010\000\011\000\008\000\009\000\004\000\022\000\
    \036\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\027\000\038\000\029\000\013\000\028\000\024\000\
    \006\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\037\000\034\000\026\000\025\000\021\000\
    \023\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\020\000\031\000\019\000\030\000\046\000\
    \006\000\007\000\132\000\131\000\122\000\043\000\123\000\255\255\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\076\000\040\000\046\000\040\000\075\000\074\000\
    \078\000\044\000\082\000\080\000\079\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\061\000\
    \045\000\081\000\053\000\057\000\059\000\050\000\055\000\054\000\
    \073\000\077\000\072\000\071\000\067\000\065\000\060\000\064\000\
    \063\000\066\000\069\000\058\000\070\000\072\000\118\000\056\000\
    \114\000\113\000\035\000\112\000\111\000\104\000\090\000\103\000\
    \101\000\093\000\121\000\095\000\096\000\041\000\099\000\041\000\
    \049\000\049\000\049\000\049\000\049\000\049\000\049\000\049\000\
    \049\000\049\000\116\000\100\000\097\000\098\000\115\000\048\000\
    \102\000\108\000\033\000\068\000\105\000\047\000\130\000\119\000\
    \129\000\117\000\124\000\128\000\127\000\051\000\135\000\125\000\
    \120\000\120\000\120\000\120\000\120\000\120\000\120\000\120\000\
    \120\000\120\000\000\000\094\000\126\000\000\000\000\000\000\000\
    \002\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\042\000\000\000\000\000\122\000\120\000\
    \000\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\049\000\049\000\049\000\049\000\049\000\
    \049\000\049\000\049\000\049\000\049\000\052\000\052\000\052\000\
    \052\000\052\000\052\000\052\000\052\000\052\000\052\000\062\000\
    \000\000\000\000\000\000\000\000\000\000\042\000\052\000\052\000\
    \052\000\052\000\052\000\052\000\089\000\000\000\255\255\000\000\
    \000\000\000\000\083\000\084\000\121\000\000\000\000\000\042\000\
    \000\000\000\000\085\000\086\000\087\000\042\000\000\000\000\000\
    \000\000\255\255\000\000\255\255\000\000\000\000\052\000\052\000\
    \052\000\052\000\052\000\052\000\088\000\255\255\052\000\052\000\
    \052\000\052\000\052\000\052\000\052\000\052\000\052\000\052\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\052\000\
    \052\000\052\000\052\000\052\000\052\000\091\000\091\000\091\000\
    \091\000\091\000\091\000\091\000\091\000\091\000\091\000\091\000\
    \091\000\091\000\091\000\091\000\091\000\091\000\091\000\091\000\
    \091\000\000\000\000\000\000\000\000\000\000\000\000\000\052\000\
    \052\000\052\000\052\000\052\000\052\000\106\000\106\000\106\000\
    \106\000\106\000\106\000\106\000\106\000\106\000\106\000\106\000\
    \106\000\106\000\106\000\106\000\106\000\106\000\106\000\106\000\
    \106\000\000\000\000\000\000\000\092\000\109\000\109\000\109\000\
    \109\000\109\000\109\000\109\000\109\000\109\000\109\000\109\000\
    \109\000\109\000\109\000\109\000\109\000\109\000\109\000\109\000\
    \109\000\000\000\000\000\000\000\255\255\000\000\000\000\000\000\
    \000\000\000\000\000\000\119\000\107\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\120\000\120\000\120\000\120\000\
    \120\000\120\000\120\000\120\000\120\000\120\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\110\000\120\000\120\000\120\000\
    \120\000\120\000\120\000\120\000\120\000\120\000\120\000\120\000\
    \120\000\120\000\120\000\120\000\120\000\120\000\120\000\120\000\
    \120\000\120\000\120\000\120\000\120\000\120\000\120\000\000\000\
    \000\000\000\000\000\000\120\000\000\000\120\000\120\000\120\000\
    \120\000\120\000\120\000\120\000\120\000\120\000\120\000\120\000\
    \120\000\120\000\120\000\120\000\120\000\120\000\120\000\120\000\
    \120\000\120\000\120\000\120\000\120\000\120\000\120\000\000\000\
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
    \000\000\000\000\000\000\000\000\000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\255\255\255\255\000\000\003\000\003\000\
    \255\255\255\255\003\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000\003\000\000\000\000\000\
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
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\005\000\
    \006\000\007\000\022\000\030\000\031\000\037\000\031\000\038\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\033\000\039\000\036\000\042\000\033\000\033\000\
    \033\000\043\000\033\000\033\000\033\000\036\000\036\000\036\000\
    \036\000\036\000\036\000\036\000\036\000\036\000\036\000\035\000\
    \044\000\033\000\050\000\035\000\035\000\047\000\053\000\053\000\
    \057\000\033\000\058\000\059\000\060\000\062\000\035\000\063\000\
    \061\000\065\000\068\000\035\000\069\000\072\000\074\000\035\000\
    \076\000\076\000\000\000\077\000\077\000\078\000\088\000\078\000\
    \079\000\087\000\031\000\081\000\081\000\039\000\080\000\042\000\
    \048\000\048\000\048\000\048\000\048\000\048\000\048\000\048\000\
    \048\000\048\000\075\000\079\000\096\000\080\000\075\000\036\000\
    \101\000\103\000\000\000\067\000\104\000\036\000\121\000\032\000\
    \125\000\075\000\031\000\126\000\126\000\047\000\133\000\124\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\255\255\087\000\124\000\255\255\255\255\255\255\
    \000\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\041\000\255\255\255\255\122\000\032\000\
    \255\255\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\049\000\049\000\049\000\049\000\049\000\
    \049\000\049\000\049\000\049\000\049\000\051\000\051\000\051\000\
    \051\000\051\000\051\000\051\000\051\000\051\000\051\000\061\000\
    \255\255\255\255\255\255\255\255\255\255\041\000\051\000\051\000\
    \051\000\051\000\051\000\051\000\082\000\255\255\043\000\255\255\
    \255\255\255\255\082\000\082\000\122\000\255\255\255\255\041\000\
    \255\255\255\255\082\000\082\000\082\000\041\000\255\255\255\255\
    \255\255\039\000\255\255\042\000\255\255\255\255\051\000\051\000\
    \051\000\051\000\051\000\051\000\082\000\038\000\052\000\052\000\
    \052\000\052\000\052\000\052\000\052\000\052\000\052\000\052\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\052\000\
    \052\000\052\000\052\000\052\000\052\000\090\000\090\000\090\000\
    \090\000\090\000\090\000\090\000\090\000\090\000\090\000\091\000\
    \091\000\091\000\091\000\091\000\091\000\091\000\091\000\091\000\
    \091\000\255\255\255\255\255\255\255\255\255\255\255\255\052\000\
    \052\000\052\000\052\000\052\000\052\000\105\000\105\000\105\000\
    \105\000\105\000\105\000\105\000\105\000\105\000\105\000\106\000\
    \106\000\106\000\106\000\106\000\106\000\106\000\106\000\106\000\
    \106\000\255\255\255\255\255\255\091\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\109\000\
    \109\000\109\000\109\000\109\000\109\000\109\000\109\000\109\000\
    \109\000\255\255\255\255\255\255\133\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\120\000\106\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\120\000\120\000\120\000\120\000\
    \120\000\120\000\120\000\120\000\120\000\120\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\109\000\120\000\120\000\120\000\
    \120\000\120\000\120\000\120\000\120\000\120\000\120\000\120\000\
    \120\000\120\000\120\000\120\000\120\000\120\000\120\000\120\000\
    \120\000\120\000\120\000\120\000\120\000\120\000\120\000\255\255\
    \255\255\255\255\255\255\120\000\255\255\120\000\120\000\120\000\
    \120\000\120\000\120\000\120\000\120\000\120\000\120\000\120\000\
    \120\000\120\000\120\000\120\000\120\000\120\000\120\000\120\000\
    \120\000\120\000\120\000\120\000\120\000\120\000\120\000\255\255\
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
    \255\255\255\255\255\255\255\255\255\255";
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
let
# 20 "imp_lexer.mll"
                                                          lxm
# 268 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) (lexbuf.Lexing.lex_curr_pos + -1) in
# 20 "imp_lexer.mll"
                                                                    ( STG(Scanf.unescaped lxm) )
# 272 "imp_lexer.ml"

  | 1 ->
# 21 "imp_lexer.mll"
                    ( Util.pnt true "start line comment\n"; token lexbuf )
# 277 "imp_lexer.ml"

  | 2 ->
# 22 "imp_lexer.mll"
                          ( token lexbuf )
# 282 "imp_lexer.ml"

  | 3 ->
let
# 23 "imp_lexer.mll"
                      lxm
# 288 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 2) lexbuf.Lexing.lex_curr_pos in
# 23 "imp_lexer.mll"
                           ( R64(Int64.of_string lxm) )
# 292 "imp_lexer.ml"

  | 4 ->
let
# 24 "imp_lexer.mll"
                     lxm
# 298 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 3) lexbuf.Lexing.lex_curr_pos in
# 24 "imp_lexer.mll"
                          ( R64(Int64.of_string ("0x"^lxm)) )
# 302 "imp_lexer.ml"

  | 5 ->
# 25 "imp_lexer.mll"
              ( R2(false) )
# 307 "imp_lexer.ml"

  | 6 ->
# 26 "imp_lexer.mll"
              ( R2(true) )
# 312 "imp_lexer.ml"

  | 7 ->
# 27 "imp_lexer.mll"
            ( LCE )
# 317 "imp_lexer.ml"

  | 8 ->
# 28 "imp_lexer.mll"
             ( LCE_IR  )
# 322 "imp_lexer.ml"

  | 9 ->
# 29 "imp_lexer.mll"
              ( MDL )
# 327 "imp_lexer.ml"

  | 10 ->
# 30 "imp_lexer.mll"
              ( MDL_END )
# 332 "imp_lexer.ml"

  | 11 ->
# 31 "imp_lexer.mll"
           ( DTA )
# 337 "imp_lexer.ml"

  | 12 ->
# 32 "imp_lexer.mll"
               ( DTA_GRM )
# 342 "imp_lexer.ml"

  | 13 ->
# 33 "imp_lexer.mll"
             ( NOT_SPL )
# 347 "imp_lexer.ml"

  | 14 ->
# 34 "imp_lexer.mll"
            ( SLH )
# 352 "imp_lexer.ml"

  | 15 ->
# 35 "imp_lexer.mll"
            ( FOR_ALL )
# 357 "imp_lexer.ml"

  | 16 ->
let
# 36 "imp_lexer.mll"
               lxm
# 363 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_curr_pos + -1) in
# 36 "imp_lexer.mll"
                         ( VAL(lxm) )
# 367 "imp_lexer.ml"

  | 17 ->
let
# 37 "imp_lexer.mll"
              lxm
# 373 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 37 "imp_lexer.mll"
                  ( NAM(lxm) )
# 377 "imp_lexer.ml"

  | 18 ->
# 38 "imp_lexer.mll"
              ( OUT_IR )
# 382 "imp_lexer.ml"

  | 19 ->
# 39 "imp_lexer.mll"
              ( PRJ_IR  )
# 387 "imp_lexer.ml"

  | 20 ->
# 40 "imp_lexer.mll"
              ( CNS_IR  )
# 392 "imp_lexer.ml"

  | 21 ->
# 41 "imp_lexer.mll"
            ( INI_IR )
# 397 "imp_lexer.ml"

  | 22 ->
# 42 "imp_lexer.mll"
            ( MTC_IR )
# 402 "imp_lexer.ml"

  | 23 ->
# 43 "imp_lexer.mll"
            ( ISO )
# 407 "imp_lexer.ml"

  | 24 ->
# 44 "imp_lexer.mll"
          ( LET )
# 412 "imp_lexer.ml"

  | 25 ->
# 45 "imp_lexer.mll"
          ( OP )
# 417 "imp_lexer.ml"

  | 26 ->
# 46 "imp_lexer.mll"
          ( LB )
# 422 "imp_lexer.ml"

  | 27 ->
# 47 "imp_lexer.mll"
           ( ARR )
# 427 "imp_lexer.ml"

  | 28 ->
# 48 "imp_lexer.mll"
           ( ARR_REV )
# 432 "imp_lexer.ml"

  | 29 ->
# 49 "imp_lexer.mll"
             ( ARR_REV_IN )
# 437 "imp_lexer.ml"

  | 30 ->
let
# 50 "imp_lexer.mll"
                 lxm
# 443 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_curr_pos + -2) in
# 50 "imp_lexer.mll"
                           ( IN(String.length lxm) )
# 447 "imp_lexer.ml"

  | 31 ->
let
# 51 "imp_lexer.mll"
                      lxm
# 453 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 2) lexbuf.Lexing.lex_curr_pos in
# 51 "imp_lexer.mll"
                            ( OUT(String.length lxm) )
# 457 "imp_lexer.ml"

  | 32 ->
# 52 "imp_lexer.mll"
            ( SRC )
# 462 "imp_lexer.ml"

  | 33 ->
# 53 "imp_lexer.mll"
              ( SRC_OUT )
# 467 "imp_lexer.ml"

  | 34 ->
# 54 "imp_lexer.mll"
              ( SRC_IL )
# 472 "imp_lexer.ml"

  | 35 ->
# 55 "imp_lexer.mll"
           ( EXN )
# 477 "imp_lexer.ml"

  | 36 ->
# 56 "imp_lexer.mll"
          ( CLN )
# 482 "imp_lexer.ml"

  | 37 ->
# 57 "imp_lexer.mll"
          ( SPL )
# 487 "imp_lexer.ml"

  | 38 ->
# 58 "imp_lexer.mll"
             ( AGL )
# 492 "imp_lexer.ml"

  | 39 ->
# 59 "imp_lexer.mll"
          ( R_BLK )
# 497 "imp_lexer.ml"

  | 40 ->
# 60 "imp_lexer.mll"
          ( L_BLK )
# 502 "imp_lexer.ml"

  | 41 ->
# 61 "imp_lexer.mll"
          ( SEQ )
# 507 "imp_lexer.ml"

  | 42 ->
# 62 "imp_lexer.mll"
           ( MTC )
# 512 "imp_lexer.ml"

  | 43 ->
# 63 "imp_lexer.mll"
              ( COPRD )
# 517 "imp_lexer.ml"

  | 44 ->
# 64 "imp_lexer.mll"
              ( COPRD_PTN )
# 522 "imp_lexer.ml"

  | 45 ->
# 65 "imp_lexer.mll"
              ( PRD )
# 527 "imp_lexer.ml"

  | 46 ->
# 66 "imp_lexer.mll"
            ( EOP )
# 532 "imp_lexer.ml"

  | 47 ->
# 67 "imp_lexer.mll"
            ( COPRD_END )
# 537 "imp_lexer.ml"

  | 48 ->
# 68 "imp_lexer.mll"
            ( PRD_END )
# 542 "imp_lexer.ml"

  | 49 ->
# 69 "imp_lexer.mll"
            ( DEF )
# 547 "imp_lexer.ml"

  | 50 ->
# 70 "imp_lexer.mll"
          ( ACT )
# 552 "imp_lexer.ml"

  | 51 ->
# 71 "imp_lexer.mll"
            ( CST )
# 557 "imp_lexer.ml"

  | 52 ->
# 72 "imp_lexer.mll"
          ( WC )
# 562 "imp_lexer.ml"

  | 53 ->
let
# 73 "imp_lexer.mll"
                        lxm
# 568 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 4) (lexbuf.Lexing.lex_curr_pos + -1) in
# 73 "imp_lexer.mll"
                                 ( INJ(int_of_string lxm) )
# 572 "imp_lexer.ml"

  | 54 ->
let
# 74 "imp_lexer.mll"
                        lxm
# 578 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 4) (lexbuf.Lexing.lex_curr_pos + -1) in
# 74 "imp_lexer.mll"
                                 ( CHO(int_of_string lxm) )
# 582 "imp_lexer.ml"

  | 55 ->
let
# 75 "imp_lexer.mll"
                        lxm
# 588 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 4) (lexbuf.Lexing.lex_curr_pos + -1) in
# 75 "imp_lexer.mll"
                                 ( AGL_OP(int_of_string lxm) )
# 592 "imp_lexer.ml"

  | 56 ->
# 76 "imp_lexer.mll"
            ( VCT )
# 597 "imp_lexer.ml"

  | 57 ->
# 77 "imp_lexer.mll"
          ( L_RCD )
# 602 "imp_lexer.ml"

  | 58 ->
# 78 "imp_lexer.mll"
          ( R_RCD )
# 607 "imp_lexer.ml"

  | 59 ->
# 79 "imp_lexer.mll"
            ( L_LST )
# 612 "imp_lexer.ml"

  | 60 ->
# 80 "imp_lexer.mll"
            ( R_LST )
# 617 "imp_lexer.ml"

  | 61 ->
# 81 "imp_lexer.mll"
            ( L_OPN )
# 622 "imp_lexer.ml"

  | 62 ->
# 82 "imp_lexer.mll"
            ( R_OPN )
# 627 "imp_lexer.ml"

  | 63 ->
# 83 "imp_lexer.mll"
          ( SGN )
# 632 "imp_lexer.ml"

  | 64 ->
# 84 "imp_lexer.mll"
          ( VCT_INI )
# 637 "imp_lexer.ml"

  | 65 ->
# 85 "imp_lexer.mll"
          ( L_PRN )
# 642 "imp_lexer.ml"

  | 66 ->
# 86 "imp_lexer.mll"
          ( R_PRN )
# 647 "imp_lexer.ml"

  | 67 ->
# 87 "imp_lexer.mll"
           ( DSH )
# 652 "imp_lexer.ml"

  | 68 ->
# 88 "imp_lexer.mll"
          ( EQ )
# 657 "imp_lexer.ml"

  | 69 ->
# 89 "imp_lexer.mll"
          ( EXP )
# 662 "imp_lexer.ml"

  | 70 ->
# 90 "imp_lexer.mll"
            ( APP )
# 667 "imp_lexer.ml"

  | 71 ->
# 91 "imp_lexer.mll"
            ( PRJ )
# 672 "imp_lexer.ml"

  | 72 ->
# 92 "imp_lexer.mll"
            ( Z )
# 677 "imp_lexer.ml"

  | 73 ->
# 93 "imp_lexer.mll"
            ( N )
# 682 "imp_lexer.ml"

  | 74 ->
# 94 "imp_lexer.mll"
            ( TYP_STG )
# 687 "imp_lexer.ml"

  | 75 ->
# 95 "imp_lexer.mll"
          ( PLS )
# 692 "imp_lexer.ml"

  | 76 ->
# 96 "imp_lexer.mll"
          ( MLT )
# 697 "imp_lexer.ml"

  | 77 ->
# 97 "imp_lexer.mll"
          ( MNS )
# 702 "imp_lexer.ml"

  | 78 ->
# 98 "imp_lexer.mll"
            ( GRM )
# 707 "imp_lexer.ml"

  | 79 ->
# 99 "imp_lexer.mll"
           ( NOT )
# 712 "imp_lexer.ml"

  | 80 ->
# 100 "imp_lexer.mll"
              ( ORD_LEX_COPRD )
# 717 "imp_lexer.ml"

  | 81 ->
# 101 "imp_lexer.mll"
          ( CMM )
# 722 "imp_lexer.ml"

  | 82 ->
let
# 102 "imp_lexer.mll"
                      lxm
# 728 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) lexbuf.Lexing.lex_curr_pos in
# 102 "imp_lexer.mll"
                           ( ROT (String.length lxm) )
# 732 "imp_lexer.ml"

  | 83 ->
let
# 103 "imp_lexer.mll"
                      lxm
# 738 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) lexbuf.Lexing.lex_curr_pos in
# 103 "imp_lexer.mll"
                           ( SLF (String.length lxm) )
# 742 "imp_lexer.ml"

  | 84 ->
let
# 104 "imp_lexer.mll"
                 lxm
# 748 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_curr_pos + -1) in
# 104 "imp_lexer.mll"
                           ( IDX (int_of_string lxm) )
# 752 "imp_lexer.ml"

  | 85 ->
# 105 "imp_lexer.mll"
          ( DOT )
# 757 "imp_lexer.ml"

  | 86 ->
# 106 "imp_lexer.mll"
             ( AGL )
# 762 "imp_lexer.ml"

  | 87 ->
let
# 107 "imp_lexer.mll"
                lxm
# 768 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 107 "imp_lexer.mll"
                     ( INT (int_of_string lxm) )
# 772 "imp_lexer.ml"

  | 88 ->
# 108 "imp_lexer.mll"
                    ( token lexbuf                         )
# 777 "imp_lexer.ml"

  | 89 ->
# 109 "imp_lexer.mll"
            ( NL )
# 782 "imp_lexer.ml"

  | 90 ->
# 110 "imp_lexer.mll"
                    ( EOF               )
# 787 "imp_lexer.ml"

  | 91 ->
# 111 "imp_lexer.mll"
                    ( raise (Error (Printf.sprintf
                      "At offset %d: unexpected character.\n"
                      (Lexing.lexeme_start lexbuf))) )
# 794 "imp_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

and line_comment lexbuf =
   __ocaml_lex_line_comment_rec lexbuf 133
and __ocaml_lex_line_comment_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 115 "imp_lexer.mll"
          ( Util.pnt true "end line comment\n"; token lexbuf )
# 806 "imp_lexer.ml"

  | 1 ->
# 116 "imp_lexer.mll"
      ( line_comment lexbuf )
# 811 "imp_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_line_comment_rec lexbuf __ocaml_lex_state

;;

