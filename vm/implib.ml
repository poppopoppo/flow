open Print
open Lang
open Ty
module Vmr = Vmr0
open Vmr
open NetSgn
type t = gl_st * tm * NetInt.rcd_tkn
let string_of_t b (g,y,k) =
  let p1 = "global state: "^(Print.string_of_gl_st g) in
  let p2 = "\nstate: `"^(Print.print_tm y)^" : "^(NetInt.print_rcd_tkn k)^"\n" in
  if b then p1^p2 else p2
let evo ((g,src,k):t) (b:Types.buffer) : t =
  (try
     ( match b with
       | Types.Evo e ->
         Util.pnt true (string_of_opr e);
         let (_,dst) = (vsgn(),vsgn()) in
         let (_,gv) = typing_mdl ("M",[],g) in
         let (b1,_) =
           ( try
               Ty.typing_nd (typ_env,gv)
                 typ_env StgMap.empty (nd_of_opr e) (SgnMap.empty,src) dst
             with Failure e -> raise (Failure e)) in
         Util.pnt dbg "test x0\n";
         let nm = net_of_g g in
         let (m0,h0,vi0) = idx_g nm in
         let _ = NetInt.free_v vi0 in
         Util.pnt dbg ("test x1: "^(print_g nm)^"\n");
         let w0 = ini_st_v () in
         let r0 = reg w0 in
         let (p0,_) = net_of_exp_ptn nm (P_A r0) (code_of_nd (ref []) [] e) in
         let _ = add_idx h0 vi0 (P_A r0) in
         Util.pnt dbg "test y0";
         let _ = mk_h m0 h0 vi0 p0 in
         let p0i = idx_of_net m0 h0 p0 in
         Util.pnt dbg "test x2";
         let _ = NetInt.free_v vi0 in
         let et = (p0i,Hashtbl.find h0 r0,vi0,k) in
         Util.pnt true (print_asm "" p0);
         Util.pnt true "test x3";
         let fd = Unix.fork () in
         ( match fd with
           | 0 ->
             Util.pnt true "fd=0\n";
             Util.open_out_close "default.tkn"
               (fun c -> Marshal.to_channel c et []);
             let _ = Unix.execve
                 "evo_tkn.exe"
                 (Array.make 0 "")
                 (Array.make 0 "") in
             exit 0
           (* let v0 =
                (try
                   Imp.evo_tkn v (ref c1) p
                 with Failure e -> raise (Failure ("Implib.evo:3:"^e))) in
              ( try
                  Util.open_out_close "default.tkn"
                    (fun c -> Marshal.to_channel c v0 [])
                with _ -> raise (Failure "err1.1"));
              exit 0 *)
           | _ ->
             Util.pnt true "fd=child ;;\n";
             let (_,x) = Unix.wait () in
             ( match x with
               | WEXITED 0 ->
                 Util.pnt true "WEXITED 0\n";
                 let ((_,_,_,v0):NetInt.et) =
                   ( try
                       Util.open_in_close "default.tkn"
                         (fun c -> Marshal.from_channel c)
                     with _ -> raise (Failure "err1.2")) in
                 Util.pnt false "TEST0\n";
                 pnt false ("implib.evo:2:"^(Print.print_tm (b1<*dst))^"\n");
                 (g,b1<*dst,v0)
               | _ -> raise (Failure "err1.3")
             ))
       | _ -> raise @@ Failure ("Implib:evo:_")
     )
   with
   | Stack_overflow ->
     (Util.pnt true "Implib.evo:Stack_overflow\n");
     raise @@ Failure "Implib:evo:Stack_overflow"
   | Failure e -> raise (Failure e)
   | Not_found -> raise (Failure "Implib:evo:Not_found")
  )

let init_st = ([],vsgn(),NetInt.Rcd_Rcd [||])
type ast_return =
  | Ast_Some of Types.buffer
  | Ast_Fail of string

let ast_from_string s =
  ( try
      let lexbuf = Lexing.from_string s in
      Ast_Some (Imp_parser.buffer Imp_lexer.token lexbuf)
    with _ -> Ast_Fail "" )

let ast_from_file (f:string) : Types.mdl =
  Util.open_in_close f
    (fun c ->
       let lexbuf = Lexing.from_channel c in
       Imp_parser.file Imp_lexer.token lexbuf)

let mdl_from_string (s:string) : mdl  =
  let lexbuf = Lexing.from_string s in
  Imp_parser.file Imp_lexer.token lexbuf

type ide =
  string list * (* file names for loading *)
  t (* state *)

exception Load
let load_from_file (s:string) : t =
  try
    if Filename.check_suffix s "st"
    then
      let st:t = Util.open_in_close s (fun c -> Marshal.from_channel c) in
      Util.pnt true ((string_of_t true st)^" is loaded from "^s^"\n");st
    else raise @@ Failure ("error:load: can't load "^s^". file prefix need to be st")
  with | Load -> Util.pnt true ("error:Load:load_from_file:"^"loading "^s^" is failed\n"); raise Load
       | Failure err -> Util.pnt true (err^"\n"); raise @@ Failure err
       | Util.OPEN_IN  -> Util.pnt true "open_in\n"; raise @@ Failure "open_in"
       | err -> Util.pnt true ("error:load_from_file:"^"loading "^s^" is failed\n"); raise err
let save_to_file (st:t) s =
  if Filename.check_suffix s "st"
  then
    let _ =
      Util.open_out_close s (fun c -> Marshal.to_channel c st []) in
    Util.pnt true ((string_of_t true st)^" is saved to "^s^"\n")
  else raise @@ Failure "error:load: can't save to s. file prefix need to be st"