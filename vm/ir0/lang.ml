open Util
module Rcd_Ptn = struct
  type 'a t =
    | R of ('a t) array
    | Ro of ('a t) array * 'a
    | A of 'a
    | Ro_Lb of ((string * 'a t) array) * 'a
    | R_Lb of (string * 'a t) array
  type path = lb list
  and lb = Lb of string | Idx of int
  let print_lb l =
    ( match l with
      | Lb s -> s
      | Idx i -> string_of_int i )
  let rec print f p =
    ( match p with
      | A r -> f r
      | R r -> "{ "^(Util.string_of_list " " (print f) (Array.to_list r))^" }"
      | Ro(rs,rt) -> "{ "^(Util.string_of_list " " (print f) (Array.to_list rs))^" < "^(f rt)^" }"
      | _ -> "lb" )
  let rec to_list p =
    ( match p with
      | A r -> [r]
      | R rs -> Array.fold_left (fun l r -> (to_list r) @ l) [] rs
      | Ro (rs,rt) -> rt::(Array.fold_left (fun l r -> (to_list r) @ l) [] rs)
      | _ -> [] )
  let p_a p =
    ( match p with
      | A r -> r
      | _ -> err "p_a:0" )
  let rec map f p =
    ( match p with
      | A r -> A (f r)
      | R rs -> R (Array.map (map f) rs)
      | Ro (rs,rt) -> Ro(Array.map (map f) rs,f rt)
      | _ -> err "map 0" )
  let rec get_path i p =
    let s = "⟦"^(Util.string_of_list "," print_lb i)^"⟧" in
    ( match i with
      | [] -> p
      | hd::tl ->
        ( match hd,p with
          | Idx hd,R rs ->
            if hd<(Array.length rs) then get_path tl rs.(hd)
            else err ("get_path 0:"^s)
          | Idx hd,Ro (rs,_) ->
            if hd<(Array.length rs) then get_path tl rs.(hd)
            else err ("get_path 1:"^s)
          | _ -> err ("get_path 2:"^s))
    )
  let rec set_path i p0 p1 =
    ( match i with
      | [] -> p1
      | hd::tl ->
        ( match hd,p0 with
          | Idx hd,R rs ->
            if hd<(Array.length rs)
            then
              R (Array.mapi
                   (fun i x -> if i=hd then set_path tl x p1 else x) rs)
            else err "get_path 0"
          | Idx hd,Ro (rs,rt) ->
            if hd<(Array.length rs)
            then
              let rs0 =
                (Array.mapi
                   (fun i x -> if i=hd then set_path tl x p1 else x)
                   rs) in
              Ro(rs0,rt)
            else err "get_path 1"
          | _ -> err "get_path 2")
    )
end
module Types = struct
  type level = int
  type prm =
    | Vct | Opn | Lst | Zn | N | Sgn | Stg | Z_u
    | Z_n of int | Axm of Sgn.t | Inj| Cho | Z_d of Sgn.t
    | EqT of string | Name of string
  type v_p = Sgn.t
  type 'y v_t = | WC | V of level | Q of level | Ln of 'y
  and v = t v_t
  and t =
    | Abs of v ref * t
    | Var of v ref | App of t * t
    | Imp of t * t | Prm of prm | Rcd of t_rcd
    | Rcd_Lb of t_rcd_lb | Rec of t_rec ref
  and v_rcd = t_rcd v_t
  and v_rcd_lb = t_rcd_lb v_t
  and t_rec = | CP of t * t_rcd | P of t * t * t_rcd | Rec_WC
  and t_rcd = | Cns of t * t_rcd | Uo of v_rcd ref | U
  and t_rcd_lb = | Cns_Lb of string * (t option) * t_rcd_lb | Uo_Lb of v_rcd_lb ref | U_Lb
  type print = { rl : (t_rec ref) list; vl : (v ref) list; }
  let v_vct:((v ref) list ref) = ref []
  let newvar () =
    let v = ref WC in
    v_vct := !v_vct@[v];
    v
  let newvar_l l =
    let v = ref (V l) in
    v_vct := !v_vct@[v];
    v
  let newvar_q l =
    let v = ref (Q l) in
    v_vct := !v_vct@[v];
    v
  let print_prm p =
    ( match p with
      | Vct -> "◃" | Opn -> "‹›" | Lst -> "⟦⟧" | Zn -> "ℤn"
      | N -> "ℕ" | Sgn -> "&" | Stg -> "ℙ"
      | Z_u -> "ℤ_u" | Z_n n -> "ℤ_n["^(string_of_int n)^"]"
      | Axm p -> "p"^(Sgn.print p) | Inj -> "↑" | Cho -> "↓"
      | Z_d p -> "ℤ_d_"^(Sgn.print p) | EqT s -> s^"( = _)"
      | Name n -> n )
  let rec print (rl:(t_rec ref list ref)) y =
    ( match y with
      | Var v ->
        let i = fst @@ (BatList.findi (fun _ vi -> vi==v) !v_vct) in
        ( match !v with
          | WC -> "_"
          | V l -> "v"^(string_of_int i)^"''("^(string_of_int l)^")"
          | Q l -> "t"^(string_of_int i)^"'("^(string_of_int l)^")"
          | Ln y -> print rl y )
      | App(y0,y1) -> "("^(print rl y0)^")◂("^(print rl y1)^")"
      | Imp(y0,y1) -> (print rl y0)^"→"^(print rl y1)
      | Prm p -> print_prm p
      | Rcd r -> "{ "^(print_rcd rl r)^"}"
      | Rcd_Lb _ -> "rcd_lb"
      | Rec r ->
        ( try
            let (i,_) = BatList.findi (fun _ p -> r==p) !rl in
            "@["^(string_of_int i)^"]"
          with Not_found ->
            rl := (!rl@[r]);
            let (i,_) = BatList.findi (fun _ p -> r==p) !rl in
            "@["^(string_of_int i)^"]."^(print_rec rl r)
        )
      | Abs(v,y) ->
        let i =fst @@ (BatList.findi (fun _ vi -> vi==v) !v_vct)in
        "∀["^(string_of_int i)^"]."^(print rl y)
    )
  and print_rec_a rl r =
    ( match !r with
      | CP(t0,_) -> "@."^(print rl t0)
      | P(t0,_,_) -> "@."^(print rl t0)
      | _ -> "@._" )
  and print_rec rl r =
    ( match !r with
      | CP(t0,t1) -> (print rl t0)^" ≃ ∐["^(print_rcd rl t1)^"]"
      | P(t0,tv,t1) -> (print rl t0)^" ≃ ∏["^(print rl tv)^" ⊢ "^(print_rcd rl t1)^"]"
      | _ -> "_" )
  and print_rcd rl r =
    ( match r with
      | U -> ""
      | Uo { contents = Ln r0 } -> print_rcd rl r0
      | Uo _ -> "<"
      | Cns(t0,t1) -> (print rl t0)^" "^(print_rcd rl t1) )
  let rec path i y : t =
    ( match i,y with
      | [],y -> y
      | (Rcd_Ptn.Idx hd)::tl,Rcd r -> path tl (path_rcd hd r)
      | _ -> err "path:0")
  and path_rcd j r =
    ( match j,r with
      | _,Uo { contents = Ln r0 } -> path_rcd j r0
      | 0,Cns(t0,_) -> t0
      | _,Cns(_,t1) -> path_rcd (j-1) t1
      | _ -> err "path_rcd" )
  let rec get_agl_i i y =
    ( match y with
      | Var { contents = Ln y0 } -> get_agl_i i y0
      | Rec { contents = CP(_,rs) } -> path_rcd i rs
      | _ -> err "get_agl_i 1" )
  let rec get_agl a i y =
    ( match i,y with
      | [],_ -> a
      | hd::tl,Rcd r -> Rcd (get_agl_rcd a hd tl r)
      | _ -> err "get_agl:0" )
  and get_agl_rcd a hd tl r =
    let open Rcd_Ptn in
    ( match hd,r with
      | _,Uo { contents = Ln r0 } -> get_agl_rcd a hd tl r0
      | Idx 0,Cns(t0,t1) -> Cns(get_agl a tl t0,t1)
      | Idx i,Cns(t0,t1) -> Cns(t0,get_agl_rcd a (Idx (i-1)) tl t1)
      | _ -> err "get_agl_rcd" )
  let new_wc () = newvar ()
  let rcd_cl l = List.fold_right (fun x r -> Cns(x,r)) l U
  let rcd_op l = List.fold_right (fun x r -> Cns(x,r)) l (Uo (ref WC))
  let rec rcd_cns l t =
    ( match t with
      | Rcd t -> List.fold_right (fun x r -> Cns(x,r)) l t
      | Var { contents = Ln y } -> rcd_cns l y
      | _ -> err ("rcd_cns:"^(print (ref []) t)) )
  let rec rcd_cns_lb l t =
    ( match t with
      | Rcd_Lb t -> List.fold_right (fun (n,x) r -> Cns_Lb(n,x,r)) l t
      | Var { contents = Ln y } -> rcd_cns_lb l y
      | _ -> err ("rcd_cns_lb:"^(print (ref []) t)))
  let zn v = Rec (ref (CP(App(Prm Zn,v),Cns(Rcd U,Cns(Rcd U,U)))))
  let opn v = Rec (ref (CP(App(Prm Opn,v),rcd_cl [(Rcd U);v])))
  let lst v =
    let rec y = ref(CP(App(Prm Lst,v),Cns((Rcd U),Cns(Rcd(Cns(v,Cns(Rec y,U))),U)))) in
    Rec y
  let coprd_cl a l =
    if (List.length l)>0 then CP(a,rcd_cl l)
    else err "coprd_cl"
  let coprd_op a l =
    if (List.length l)>0 then CP(a,rcd_op l)
    else err "coprd_op"
  let prd_cl a s l =
    if (List.length l)>0 then P(a,s,rcd_cl l)
    else err "prd_cl"
  let prd_op a s l =
    if (List.length l)>0 then P(a,s,rcd_op l)
    else err "prd_op"
  let rec abs a xs =
    ( match xs with
      | [] -> a
      | x::tl ->
        let a0 = abs a tl in
        let _ = mk_abs (ref []) x a0 in
        Abs(x,a0))
  and mk_abs rl x a =
    ( match a with
      | Abs(_,y0) -> mk_abs rl x y0
      | Var v ->
        ( match !v with
          | Q (-2) -> v := Ln (Var x)
          | Q q when q<(-2) -> v := Q (q+1)
          | Ln y -> mk_abs rl x y
          | _ -> () )
      | Imp(y0,y1)
      | App(y0,y1) -> mk_abs rl x y0; mk_abs rl x y1
      | Rcd r -> mk_abs_rcd rl x r
      | Rcd_Lb r -> mk_abs_rcd_lb rl x r
      | Rec r ->
        if List.exists (fun x -> x==r) !rl then ()
        else
          let _ = rl := r::!rl in
          mk_abs_rec rl x r
      | _ -> () )
  and mk_abs_rcd rl x r =
    ( match r with
      | Cns(y0,y1) -> mk_abs rl x y0; mk_abs_rcd rl x y1
      | U -> ()
      | Uo { contents = Ln y } -> mk_abs_rcd rl x y
      | _ -> () )
  and mk_abs_rcd_lb rl x r =
    ( match r with
      | Cns_Lb(_,Some y0,y1) -> mk_abs rl x y0; mk_abs_rcd_lb rl x y1
      | U_Lb -> ()
      | Uo_Lb { contents = Ln y } -> mk_abs_rcd_lb rl x y
      | _ -> () )
  and mk_abs_rec rl x r =
    ( match !r with
      | CP(y0,y1) -> mk_abs rl x y0; mk_abs_rcd rl x y1
      | P(y0,y1,y2) -> mk_abs rl x y0; mk_abs rl x y1; mk_abs_rcd rl x y2
      | _ -> ()
    )
end
module Tkn = struct
  type ('p, 'r) t =
    | Rcd of (('p, 'r) t) array
    | Rcd_Lb of ((string * ('p, 'r) t) array)
    | Tkn of ('p, 'r) tkn
  and ('p, 'r) tkn =
    | Name of string | Stg of string | Z of int
    | Zn of int * int | Sgn of Sgn.t | CoP of int * (('p, 'r) t)
    | P of ('p array) * (('p, 'r) t) | Pls | Mlt | Mns
    | Cmp | Eq | Inj of int | Cho of int | Fix
    | Exn | Fnc of 'p | Clj of 'p * (('p, 'r) t)
    | Ast of Peg.ast | Vct of (('p, 'r) t , ('p, 'r) t) Hashtbl.t
    | Grm of Peg.grammar * string | Frgn of string

  let rec print k =
    ( match k with
      | Rcd rs -> "{"^(Array.fold_left (fun s r -> s^" "^(print r)) "" rs)^"}"
      | Rcd_Lb rs ->
        "{>"^(Array.fold_left (fun s (l,r) -> s^" "^l^"~"^(print r)) "" rs)^"}"
      | Tkn v ->
        ( match v with
          | Name n -> n
          | Stg s ->
            if (String.length s)>=20
            then let s0 = String.sub s 0 20 in ("(\""^s0^"\""^"..)")
            else "\""^(String.escaped s)^"\""
          | Z z -> (string_of_int z)
          | Zn (z0,z1) -> "ℤ["^(string_of_int z1)^"]."^(string_of_int z0)
          | Sgn p -> "&."^(Sgn.print p)
          | CoP(i,ki) -> "∐["^(string_of_int i)^","^(print ki)^"]"
          | P (_,_) -> err "print"
          | Pls -> "+" | Mlt -> "*" | Mns -> "-" | Cmp -> "≤" | Eq -> "="
          | Inj i -> "↑["^(string_of_int i)^"]" | Cho i -> "↓["^(string_of_int i)^"]"
          | Fix -> "@" | Exn -> "¿"
          | Fnc _ -> "Fnc"
          | Clj (_,_) -> "Clj"
          | Ast a -> Peg.print_ast a
          | Vct v ->
            let s0 =
              Hashtbl.fold
                ( fun b k s0 -> s0^" "^(print b)^"~"^(print k))
                v "#.{" in
            s0^" }"
          | Frgn _ -> "Frgn"
          | Grm (_,n) -> "Grm."^n
        ))
  let vct_op v k a0 =
    if Hashtbl.mem v k
    then
      let a1 = Hashtbl.find v k in
      ( match a0 with
        | Tkn(CoP(0,Rcd [||])) -> ( Hashtbl.remove v k; a1)
        | _ -> ( Hashtbl.remove v k; Hashtbl.add v k a0; a1))
    else
      ( match a0 with
        | Tkn(CoP(0,Rcd [||])) -> Tkn(CoP(0,Rcd [||]))
        | _ -> (Hashtbl.add v k a0; Tkn(CoP(0,Rcd [||]))))
  let rec of_reg_ptn p =
    let open Rcd_Ptn in
    ( match p with
      | A a -> a
      | R rs -> Rcd (Array.map of_reg_ptn rs)
      | Ro (rs,rt) ->
        ( match rt with
          | Rcd rts -> Rcd ((Array.map of_reg_ptn rs) |+| rts)
          | _ -> err "of_reg_ptn 0" )
      | R_Lb rs -> Rcd_Lb (Array.map (fun (l,r) -> (l,of_reg_ptn r)) rs)
      | Ro_Lb (rs,rt) ->
        ( match rt with
          | Rcd_Lb rts -> Rcd_Lb ((Array.map (fun (l,r) -> (l,of_reg_ptn r)) rs) |+| rts)
          | _ -> err "of_reg_ptn 0" ))
  let rec get_path i k =
    ( match i,k with
      | [],_ -> k
      | hd::tl,Rcd rs -> get_path tl rs.(hd)
      | _ -> err "get_path 0"
    )
  let rec get_agl i k =
    ( match i,k with
      | [],_ -> agl k
      | (Rcd_Ptn.Idx hd)::tl,Rcd rs ->
        let (rs,j,_) =
          Array.fold_left
            (fun (rs,j,i) r ->
               if i=hd then
                 let (j,ki) = get_agl tl r in
                 (rs |+| [|ki|],j,i+1)
               else (rs |+| [|r|],j,i+1))
            ([||],0,0) rs in
        (j,Rcd rs)
      | _ -> err "get_agl:0" )
  and agl k =
    ( match k with
      | Tkn (CoP(m1,kx)) -> (m1,kx)
      | Tkn (Z z) -> ((if z=0 then 0 else 1),Rcd [||])
      | Tkn (Zn(z0,_)) -> ((if z0=0 then 0 else 1),Rcd [||])
      | _ -> err ("err 19:"^(print k)) )
end
module Ast = struct
  open Types
  type name = string
  type mdl = name * (glb_etr list)
  and scm = Types.t
  and mdl_gma = scm StgMap.t
  and glb_etr =
    | Etr of string * Types.t * Types.t * code
    | Etr_IR of string * Types.t * Types.t * pt
    | Flow of flow
    | Etr_Clq of ((string * Types.t * Types.t * code) list)
    | Etr_Clq_IR of (string * Types.t * Types.t * pt) list
    | Flow_Clq of flow list
    | Gram of Peg.grammar
  and flow =
    | Def_Abs of name * args
    | Def_Prd of name * args * ((Types.t * name) list)
    | Def_CoPrd of name * args * ((Types.t * name) list)
    | Def_Fnt of name * (name list)
    | Def_EqT of name * args * Types.t
  and args = name list
  and code =
    | E of exp_rcd | V of code * code | H of (code list)
    | A of exp_rcd * Rcd_Ptn.path * (code list)
    | P of exp_rcd * (code list) | F of exp_rcd * int * code
  and exp_rcd =
    | Agl_Op of exp_rcd
    | Rot | Rcd of exp_rcd array
    | Rcd_Lb of (exp_rcd option) * (string * (exp_rcd option)) array
    | App of exp_rcd * exp_rcd | Prj of exp_rcd * Rcd_Ptn.lb
    | Atm of exp_atm
  and exp_atm =
    | Z of int | Pls | Mlt | Mns | Cmp | Eq | Fix
    | Exn | Name of string | Inj of int | Cho of int | Stg of string
  and nd =
    | IR_Id of (r Rcd_Ptn.t) * ((r Rcd_Ptn.t) array)
    | IR_Ini of r * ((pt, r) Tkn.t)
    | IR_Call of (r * (r Rcd_Ptn.t)) * (r Rcd_Ptn.t)
    | IR_Glb_Call of string * r Rcd_Ptn.t * r Rcd_Ptn.t
    | IR_Out of r * (r Rcd_Ptn.t)
    | IR_Glb_Out of string * (r Rcd_Ptn.t)
    | IR_Etr of r Rcd_Ptn.t
    | IR_Clj of r * (r Rcd_Ptn.t) * pt
    | IR_Agl of (r Rcd_Ptn.t) * Rcd_Ptn.path * ((r Rcd_Ptn.t * pt) array) * r Rcd_Ptn.t
    | IR_Prd of r * (r Rcd_Ptn.t) * (pt array)
  and r = Types.v ref
  and pt = ir_code ref
  and ir_code =
    | Seq of nd * pt
    | Ret of r Rcd_Ptn.t
  type line =
    | End | Line of exp_rcd | Line_Agl of Rcd_Ptn.path * exp_rcd
  type st = (v ref,(pt, (v ref)) Tkn.t) Hashtbl.t
  type cs_f =
    | CS_f of ((r * (pt, r) Tkn.t) list) * pt
    | CS_f_il of pt
  type cs = cs_f Stack.t
  type ns = (string * Types.v ref) list ref
  type ns_t = (string * Types.v ref) list ref
  type ns_e = (string * ((pt, r) Tkn.tkn)) list ref
  type ns_grm = (string * Types.t_rec ref) list ref
  type rm = (string * Types.v ref) list ref
  type ns_v = (string * pt) list ref
  let rm:rm = ref []
  let ns:ns = ref []
  let ns_t:ns_t = ref []
  let ns_e:(ns_e) = ref []
  let ns_grm:ns_grm = ref []
  let ns_v:ns_v = ref []
  type ir_mdl = {
    mutable ns_v : (string * pt) list;
    mutable ns : (string * Types.v ref) list;
    mutable ns_e : (string * ((pt, r) Tkn.t)) list;
    mutable ns_t : (string * Types.v ref) list;
  }
  type et = ir_mdl * ((pt, r) Tkn.t)
  type inst = {
    al:(v ref * v ref) list;
    al_rcd:(v_rcd ref * v_rcd ref) list;
    al_rcd_lb : (v_rcd_lb ref * v_rcd_lb ref) list;
    rl : (t_rec ref * t_rec ref) list;
  }
  let rec print_mdl (n,g) =
    let s0 = "§§ "^n^" ≒ \n" in
    let rec lp g =
      ( match g with
        | [] -> "§§.\n"
        | hd::tl ->
          let s1 =
            ( match hd with
              | Etr(n,_,_,_) -> "§ "^n^"\n"
              | Flow f -> "¶ "^(print_flow f)
              | Etr_Clq _ -> "§ @ "^"\n"
              | Flow_Clq _ -> "¶ @"^"\n"
              | Gram g -> "¶+ℙ"^"\n"^(Peg.print g)
              | Etr_IR (n,_,_,_) -> "§+0 "^n^" ≒ ..\n"
              | Etr_Clq_IR _ -> "§+0"^" @. ..\n" ) in
          s1^(lp tl)) in
    s0^(lp g)
  and print_flow f =
    ( match f with
      | (Def_Abs(n,a)) -> let sa = print_args a in n^sa^"\n"
      | (Def_CoPrd(n,a,ps)) ->
        let ss =
          List.fold_left
            (fun ss (y,n) ->
               ss^"\t∐ "^(Types.print (ref []) y)^" : "^n^"\n")
            "" ps in
        let sa = print_args a in
        n^sa^" ≃ "^ss
      |  _ -> "¶"^"\n" )
  and print_args l =
    if l=[] then "" else List.fold_left (fun s _ -> s^"'") "◂" l
  let tk_agl a =
    let i = ref [] in
    let b = ref false in
    let rec lp p a =
      ( match a with
        | Agl_Op r -> i := p; b := true; r
        | Rcd r -> Rcd (Array.mapi (fun i r -> lp ((Rcd_Ptn.Idx i)::p) r) r)
        | _ -> a ) in
    let a = lp [] a in
    if !b then (!i,a) else err "tk_agl:0"
end

let rtl = " : "
let op0 = " \\ "
open Ast
let rec pnt_ptn r = Rcd_Ptn.print print_reg r
and print_ir p0 =
  ( match !p0 with
    | Seq (o,p1) -> "\t"^(print_nd o)^"\n"^(print_ir p1)
    | Ret r -> "\t ∎"^(Rcd_Ptn.print print_reg r)^"\n" )
and print_nd o =
  ( match o with
    | IR_Etr r -> "|»"^(pnt_ptn r)^rtl^(print_ty r)
    | IR_Clj (_,_,_) -> "||»"
    | IR_Prd (_,_,_) -> "∆ "
    | IR_Agl (ra,_,_,rr) -> "∇ "^(pnt_ptn ra)^" ⊢ "^(Rcd_Ptn.print print_reg rr)
    | IR_Id(r,rs) -> "$ "^(pnt_ptn r)^" ⊢ "^(Arr.fld_l (fun s r -> s^","^(pnt_ptn r)) "" rs)^rtl^(Arr.fld_l (fun s r -> s^","^(print_ty r)) "" rs)
    | IR_Out(_,_) -> "|◂"
    | IR_Glb_Out(n,_) -> n^" ⊢|"
    | IR_Glb_Call(n,_,_) -> n^" ⊢ "
    | IR_Call((f,x),y) -> "◂ "^(print_reg f)^" , "^(pnt_ptn x)^" ⊢ "^(pnt_ptn y)
    | IR_Ini(r,k) -> "|~"^(Tkn.print k)^" ⊢ "^(print_reg r)^rtl^(print_ty (A r))
  )
and print_reg r =
  let (n,_) = Lst.find (fun (_,v) -> r==v) !rm in
  n
and print_ty r = Types.print (ref []) (get_rm_ptn r)
and get_rm_ptn rp =
  ( match rp with
    | Rcd_Ptn.A r -> Var r
    | Rcd_Ptn.R rs ->
      let ts = Array.map get_rm_ptn rs in
      Types.Rcd(Types.rcd_cl (Array.to_list ts))
    | Rcd_Ptn.Ro (rs,rt) ->
      let ts = Array.map get_rm_ptn rs in
      let tt = Types.Var rt in
      Types.Rcd (Types.rcd_cns (Array.to_list ts) tt)
    | Rcd_Ptn.R_Lb rs ->
      let ts = Array.map (fun (n,r) -> (n,Some(get_rm_ptn r))) rs in
      Types.Rcd_Lb(Types.rcd_cns_lb (Array.to_list ts) (Types.Rcd_Lb Types.U_Lb))
    | Rcd_Ptn.Ro_Lb (rs,rt) ->
      let ts = Array.map (fun (n,r) -> (n,Some(get_rm_ptn r))) rs in
      let tt = Types.Var rt in
      Types.Rcd_Lb(Types.rcd_cns_lb (Array.to_list ts) tt))
let rec ret p =
  ( match !p with
    | Ret r -> (r,p)
    | Seq (_,p1) -> ret p1 )
let etr p =
  ( match !p with
    | Seq(IR_Etr r,p1) -> (r,p1)
    | _ -> err "etr:1" )
let rtn p =
  ( match !p with
    | Seq(IR_Agl(_,_,_,rr),p1) -> (rr,p1)
    | Seq(IR_Etr r,p1) -> (r,p1)
    | Seq(IR_Call ((_,_),y),p1) -> (y,p1)
    | _ -> err "etr:0" )
let get_r st r =
  let k =  Hashtbl.find st r in
  let _ = Hashtbl.remove st r in
  k
let rec get_reg_ptn st r =
  let open Rcd_Ptn in
  let open Tkn in
  ( match r with
    | A r0 -> get_r st r0
    | R rs -> Rcd (Array.fold_left (fun ks r0 -> ks |+| [|get_reg_ptn st r0|]) [||] rs)
    | Ro (rs,rt) ->
      let ks =
        Array.fold_left
          (fun ks r0 -> ks |+| [|get_reg_ptn st r0|])
          [||] rs in
      let kts = get_r st rt in
      ( match kts with
        | Rcd l -> Rcd (ks |+| l)
        | _ -> err "get_reg_ptn 0")
    | _ -> err "get_reg_ptn"
  )
let print m =
  let s_ns =
    List.fold_left
      (fun s_ns (n,v) -> s_ns^"` "^n^" : "^(Types.print (ref []) (Types.Var v))^"\n")
      "" m.ns in
  let s_ns_e =
    List.fold_left
      (fun s_ns_e (n,k) -> s_ns_e^"§ "^n^"="^(Tkn.print k)^"\n")
      "" m.ns_e in
  let s_ns_t =
    List.fold_left
      (fun s_ns_t (n,t) -> s_ns_t^"¶ "^n^"="^(Types.print (ref []) (Types.Var t))^"\n")
      "" m.ns_t in
  let s_ns_v =
    List.fold_left
      (fun  s_ns_v (n,p) ->
         let (r0,_) = etr p in
         let (r1,_) = ret p in
         let (y0,y1) = (get_rm_ptn r0,get_rm_ptn r1) in
         let p0 = Types.print (ref []) y0 in
         let p1 = Types.print (ref []) y1 in
         let sf = "§ "^n^" : "^p0^" ⊢ "^p1 in
         let sc = print_ir (List.assoc n m.ns_v) in
         s_ns_v^sf^" ≒ \n"^sc)
      "" m.ns_v in
  s_ns^s_ns_e^s_ns_t^s_ns_v
let set_r st r k = Hashtbl.add st r k
let rec set_reg_ptn st r k =
  let open Rcd_Ptn in
  let open Tkn in
  ( match r with
    | A r -> set_r st r k
    | R rs ->
      ( match k with
        | Tkn _ -> err "set_reg_ptn 1"
        | Rcd l ->
          let _ =
            Array.fold_left
              (fun i r ->
                 let _ = set_reg_ptn st r l.(i) in
                 i+1)
              0 rs in
          ()
        | Rcd_Lb _ -> err "set_reg_ptn 3" )
    | Ro (rs,rt) ->
      ( match k with
        | Tkn _ -> err "set_reg_ptn 0"
        | Rcd l ->
          let i =
            Array.fold_left
              (fun i r ->
                 let _ = set_reg_ptn st r l.(i) in
                 i+1)
              0 rs in
          let ln = Array.length l in
          if i=ln
          then set_r st rt (Rcd [||])
          else set_r st rt (Rcd(Array.init (ln-i) (fun n -> l.(i+n))))
        | _ -> err "set_reg_ptn 4"
      )
    | _ -> err "set_reg_ptn 0"
  )
let rec set_cs_k st l =
  ( match l with
    | [] -> ()
    | (r,k)::tl -> set_r st r k; set_cs_k st tl )
let get_cs_k st = Hashtbl.fold (fun r k l -> Hashtbl.remove st r; (r,k)::l) st []
let free_st st = Hashtbl.clear st
let rec run m p0 st cs =
  ( match !p0 with
    | Ret r ->
      let k = get_reg_ptn st r in
      if Stack.is_empty cs then k
      else
        let hd = Stack.pop cs in
        ( match hd with
          | CS_f_il pe ->
            let (r0,p1) = rtn pe in
            let _ = set_reg_ptn st r0 k in
            run m p1 st cs
          | CS_f (l,pe) ->
            let (r0,p1) = rtn pe in
            let _ = free_st st in
            let _ = set_cs_k st l in
            let _ = set_reg_ptn st r0 k in
            run m p1 st cs
        )
    | Seq (o,p1) ->
      ( match o with
        | IR_Etr _ -> err "run:0"
        | IR_Prd (_,_,_) -> err "err 10"
        | IR_Clj (_,_,_) -> err "err 11"
        | IR_Agl (ra,i,ps,_) ->
          let k0 = get_reg_ptn st ra in
          let open Tkn in
          let (j,k1) = get_agl i k0 in
          let (rx,pr) = ps.(j) in
          let _ = set_reg_ptn st rx k1 in
          Stack.push (CS_f_il p0) cs;
          run m pr st cs
        | IR_Ini (r0,k) ->
          let _ = set_r st r0 k in
          run m p1 st cs
        | IR_Id (r1,r2) ->
          let k1 = get_reg_ptn st r1 in
          let _ = Array.fold_left (fun _ r -> set_reg_ptn st r k1) () r2 in
          run m p1 st cs
        | IR_Call ((r1,rp2),rp0) ->
          let k_f = get_r st r1 in
          let kx = get_reg_ptn st rp2 in
          let y = app m k_f kx in
          ( match y with
            | `Tkn y ->
              let _ = set_reg_ptn st rp0 y in
              run m p1 st cs
            | `Fnc p ->
              let l = get_cs_k st in
              let (re,p1) = etr p in
              let _ = set_reg_ptn st re kx in
              Stack.push (CS_f(l,p0)) cs;
              run m p1 st cs )
        | IR_Glb_Call (_,_,_) -> err "run a2"
        | IR_Out (_,_) -> err "run a4"
        | IR_Glb_Out(_,_) -> err "run a5"
      )
  )
and app m f x =
  let open Tkn in
  ( match f,x with
    | Tkn Mns,Tkn (Z z) -> `Tkn (Tkn (Z (-z)))
    | Tkn Mns,Tkn (Zn(z0,z1)) -> `Tkn(Tkn(Zn(z1-(z0 mod z1),z1)))
    | Tkn Inj i,_ -> `Tkn (Tkn (CoP(i,x)))
    | Tkn (Cho _),_ -> err "err 7"
    | Tkn Exn,_ -> err "err 8"
    | Tkn Fix,_ -> err "err 9"
    | Tkn (Fnc pa),_ -> `Fnc pa
    | Tkn (Clj (_,_)),_ -> err "run 3"
    | Tkn Pls,Rcd [|(Tkn Z z1);(Tkn Z z2)|] -> `Tkn (Tkn (Z (z1+z2)))
    | Tkn Pls,Rcd [|(Tkn Zn(z1,z2));(Tkn Zn(z3,z4))|] when z2=z4 ->
      `Tkn (Tkn (Zn((z1+z3) mod z2,z2)))
    | Tkn Mlt,Rcd [|(Tkn Z z1);(Tkn Z z2)|] -> `Tkn (Tkn (Z (z1*z2)))
    | Tkn Mlt,Rcd [|(Tkn Zn(z1,z2));(Tkn Zn(z3,z4))|] when z2=z4 ->
      `Tkn (Tkn (Zn((z1*z3) mod z2,z2)))
    | Tkn Cmp,Rcd [|(Tkn Z z1);(Tkn Z z2)|] ->
      let b = if z1<=z2 then 1 else 0 in
      `Tkn (Tkn (Zn(b,2)))
    | Tkn Eq,Rcd [|x;y|] ->
      let b = if x=y then 1 else 0 in
      `Tkn (Tkn (Zn (b,2)))
    | Tkn (Grm (g,n)),Tkn Stg s ->
      let (a,s0) = Peg.parse g n s in
      ( match a with
        | None -> `Tkn (Rcd [| (Tkn(CoP(0,Rcd [||]))); (Tkn(Stg s0)) |])
        | Some a -> `Tkn(Rcd [|(Tkn(CoP(1,Tkn(Ast a))));(Tkn(Stg s0))|])
      )
    | Tkn(Frgn f),_ ->
      `Tkn(frgn f x)
    | Tkn (Tkn.Name n),_ ->
      let f = List.assoc n m.ns_e in
      app m f x
    | _ -> err "app:1"
  )
and frgn f x =
  let open Tkn in
  ( match f with
    | "&" ->
      ( match x with
        | Tkn.Rcd [||] -> Tkn.Tkn(Tkn.Sgn (sgn ()))
        | _ -> err "app 3" )
    | "⊵" ->
      ( match x with
        | Tkn.Rcd [|Tkn.Rcd[|Tkn.Tkn Tkn.Vct v;k|];a0|] ->
          let a1 = Tkn.vct_op v k a0 in
          Tkn.Rcd [|Rcd[|(Tkn (Vct v));k|];a1|]
        | _ -> err "app 8" )
    | "#" ->
      ( match x with
        | Tkn.Rcd [||] -> Tkn.Tkn(Vct (Hashtbl.create 10))
        | _ -> err "app 3" )
    | "pnt" ->
      let s = Tkn.print x in
      Util.pnt true ("pnt:"^s^"\n");
      Tkn.Rcd [||]
    | "read" ->
      ( match x with
        | Tkn.Tkn(Tkn.Stg s) ->
          let l = Util.load_file s in
          Tkn.Tkn (Tkn.Stg l)
        | _ -> err "read 0" )
    | _ -> err "frgn 0"
  ) (*
let seq p1 p2 =
  let (_,pr) = ret p1 in
  pr := !p2
let copy_vct v0 = v0
let rec seqs l r =
  ( match l with
    | [] -> Ret r
    | hd::tl ->
      let a0 = seqs tl r in
      Seq(hd,ref a0) )
let rpc n r0 =
  let rp0 =
    Rcd_Ptn.map
      (fun r -> (r,Array.init n (fun _ -> Types.newvar ())))
      r0 in
  let rpi i =
    Rcd_Ptn.map
      (fun (_,rs) -> rs.(i))
      rp0 in
  let rr = (Array.init n (fun i -> rpi i)) in
  let rec f r0 =
    ( match r0 with
      | Rcd_Ptn.A (r,rs) ->
        [IR_Id(r,rs)]
      | R rs ->
        Array.fold_left
          (fun c r -> (f r) @ c)
          [] rs
      | Ro (rr,(rt0,rts)) ->
        let cs =
          Array.fold_left
            (fun c r -> (f r) @ c)
            [] rr in
        (IR_Id(rt0,rts))::cs
      | R_Lb _ -> err "rpc 0"
      | Ro_Lb (_,_) -> err "rpc 1"
    ) in
  ((f rp0),rr)
let rec mk_rm rp =
  let open Rcd_Ptn in
  ( match rp with
    | R rs ->
      let a1 =
        Array.fold_left
          (fun a r ->
             let a1 = mk_rm r in
             a @ a1 )
          [] rs in
      a1
    | Ro (rs,rt) ->
      let a1 =
        Array.fold_left
          (fun a r ->
             let a1 = mk_rm r in
             a @ a1 )
          [] rs in
      (IR_Rm rt)::a1
    | R_Lb _ -> err "mk_rm 0"
    | Ro_Lb (_,_) -> err "mk_rm 1"
    | A r -> [(IR_Rm r)]
  )
let rec vh_of_ast p0 r0 c =
  let open Ast in
  ( match c with
    | V (a1,a2) ->
      let (p1,r1) = vh_of_ast p0 r0 a1 in
      let (p2,r2) = vh_of_ast p1 r1 a2 in
      (p2,r2)
    | H _ -> err "vm2:a1"
    | E n1 ->
      vh_of_exp_ptn p0 r0 n1
    | P (_,_) -> err "vm2:a2"
    | A (n1,ix,l) ->
      let (p1,r1) = vh_of_exp_ptn p0 r0 n1 in
      let rr = Rcd_Ptn.A (Types.newvar ()) in
      let (la,_) =
        List.fold_left
          (fun (la,i) c ->
             let rp = (Rcd_Ptn.A (Types.newvar ())) in
             let pi = ref (Ret (R [||])) in
             let (_,_) = vh_of_ast pi rp c in
             let la = la |+| [|(rp,pi)|] in
             (la,i+1))
          ([||],0) l in
      let p3 = ref (Ret rr) in
      p1 := Seq(IR_Agl(r1,ix,la,rr),p3);
      (p3,rr)
    | F (_,_,_) -> err "vm2:a4"
  )
and vh_of_exp_ptn p0 r0 e0 =
  let open Ast in
  let open Rcd_Ptn in
  ( match e0 with
    | Rot -> p0 := Ret r0; (p0,r0)
    | Rcd [||] ->
      let k = Tkn.Rcd [||] in
      let v1 = Types.newvar () in
      let r1 = Rcd_Ptn.A v1 in
      let p1 = ref (Ret r1) in
      p0 := Seq(IR_Ini(v1,k),p1);
      (p1,r1)
    | Rcd es ->
      let (l,rr) = rpc (Array.length es) r0 in
      let p1 = seqs l (R rr) in
      let (_,p2,rs) =
        Array.fold_left
          (fun (i,p2,rs) e ->
             let (p2,r1) = vh_of_exp_ptn p2 rr.(i) e in
             (i+1,p2,rs |+| [|r1|]))
          (0,ref p1,[||]) es in
      let p3 = (Ret (R rs)) in
      p2 := p3;
      (p2,R rs)
    | App (e1,e2) ->
      let (l,rr) = rpc 2 r0 in
      let p1 = seqs l (R rr) in
      ( match rr with
        | [| r1 ; r2 |] ->
          let (pf,rf) = vh_of_exp_ptn (ref p1) r1 e1 in
          let (px,rx) = vh_of_exp_ptn pf r2 e2 in
          let r3 = A (Types.newvar ()) in
          let p3 = ref (Ret r3) in
          px := Seq(IR_Call(r3,p_a rf,rx),p3);
          (p3,r3)
        | _ -> err "err 45" )
    | Prj (e,i) ->
      let (p1,r1) = vh_of_exp_ptn p0 r0 e in
      ( match r1 with
        | R rs ->
          let (cl,_) =
            Array.fold_left
              (fun (a,j) r ->
                 if i=j then (a,j+1)
                 else
                   let c0 = mk_rm r in
                   (c0 @ a,j+1))
              ([],0) rs in
          let p2 = seqs ev p1 cl rs.(i) in
          (p2,rs.(i))
        | Ro (rs,rt) ->
          let ev = PtMap.add p1 (Seq(Rm rt,p2)) ev in
          let (cl,_) =
            Array.fold_left
              (fun (a,j) r ->
                 if i=j then (a,j+1)
                 else
                   let c0 = mk_rm r in
                   (c0 @ a,j+1))
              ([],0) rs in
          let (ev,p3) = seqs ev p2 cl rs.(i) in
          (ev,p3,rs.(i))
        | P_A r1 ->
          let rs = Array.init (i+1) (fun _ -> sgn ()) in
          let rt = sgn () in
          let p2 = DName (sgn ()) in
          let ev = PtMap.add p1 (Seq(Prj(r1,(rs,rt)),p2)) ev in
          let p3 = DName (sgn ()) in
          let ev = PtMap.add p2 (Seq(Rm rt,p3)) ev in
          let (cl,_) =
            Array.fold_left
              (fun (a,j) r ->
                 if i=j then (a,j+1)
                 else
                   let c0 = mk_rm (P_A r) in
                   (c0 @ a,j+1))
              ([],0) rs in
          let (ev,p4) = seqs ev p3 cl (P_A rs.(i)) in
          (ev,p4,P_A rs.(i))
      )
    | Atm a -> vh_of_exp ev p0 a
    | Agl_Op _ -> err "Agl_Op:0"
  )
and vh_of_exp ev p e =
  let open Ast in
  let k =
    ( match e with
      | Ast.Z z -> Tkn.Z z
      | Ast.Pls -> Tkn.Pls
      | Ast.Mlt -> Tkn.Mlt
      | Ast.Mns -> Tkn.Mns
      | Cmp -> Tkn.Cmp
      | Eq -> Tkn.Eq
      | Fix -> Tkn.Fix
      | Exn -> Tkn.Exn
      | Name n -> Tkn.Name n
      | Inj i -> Tkn.Inj i
      | Cho i -> Tkn.Cho i
      | Stg s -> Tkn.Stg s
    ) in
  let r0 = sgn () in
  let r1 = P_A r0 in
  let p1 = DName (sgn ()) in
  let ev = PtMap.add p (Seq(Ini(r0,Tkn.Tkn k),p1)) ev in
  let ev = PtMap.add p1 (Ret r1) ev in
  (ev,p1,r1) *)
open Types
let rec occurs rl v1 =
  function
  | Var v2 ->
    if v1 == v2 then true
    else
      ( match !v2 with
        | V l1 ->
          let ml = (match !v1 with V l -> min l l1 | _ -> l1) in
          v2 := V ml; false
        | WC ->
          ( match !v1 with
            | V l -> v2 := V l; false
            | _ -> false )
        | Ln t1 -> occurs rl v1 t1
        | Q _ -> err "occurs:0" )
  | App(t1,t2)
  | Imp(t1,t2) -> (occurs rl v1 t1) || (occurs rl v1 t2)
  | Rcd l1 -> occurs_rcd rl v1 l1
  | Rcd_Lb l1 -> occurs_rcd_lb rl v1 l1
  | Rec rp ->
    if List.exists (fun p -> rp==p) rl then false
    else occurs_rec (rp::rl) v1 rp
  | _ -> false
and occurs_rcd rl v1 l1 =
  ( match l1 with
    | U -> false
    | Uo t ->
      ( match !t with
        | Ln t0 -> occurs_rcd rl v1 t0
        | _ -> false )
    | Cns(t1,t2) -> (occurs rl v1 t1)||(occurs_rcd rl v1 t2))
and rcd_occurs (v1:v_rcd ref) (l1:t_rcd) =
  ( match l1 with
    | U -> false
    | Uo t ->
      ( match !t with
        | V l1 ->
          let ml = (match !v1 with V l -> min l l1 | _ -> l1) in
          t := V ml;
          false
        | WC ->
          ( match !v1 with
            | V l -> t := V l; false
            | _ -> false )
        | Ln t1 -> rcd_occurs v1 t1
        | Q _ -> err "occurs:0" )
    | Cns(_,t2) -> rcd_occurs v1 t2)
and occurs_rcd_lb rl (v1:v ref) (l1:t_rcd_lb) =
  ( match l1 with
    | U_Lb -> false
    | Uo_Lb t ->
      ( match !t with
        | V l1 ->
          let ml = (match !v1 with V l -> min l l1 | _ -> l1) in
          t := V ml;
          false
        | WC -> false
        | Ln t1 -> occurs_rcd_lb rl v1 t1
        | Q _ -> err "occurs:0" )
    | Cns_Lb(_,Some t1,t2) -> (occurs rl v1 t1)||(occurs_rcd_lb rl v1 t2)
    | Cns_Lb(_,None,t2) -> occurs_rcd_lb rl v1 t2 )
and rcd_lb_occurs (v1:v_rcd_lb ref) (l1:t_rcd_lb) =
  ( match l1 with
    | U_Lb -> false
    | Uo_Lb t ->
      ( match !t with
        | Ln t0 -> rcd_lb_occurs v1 t0
        | _ -> false )
    | Cns_Lb(_,_,t2) -> rcd_lb_occurs v1 t2)
and occurs_rec pl v1 rp =
  ( match !rp with
    | CP(_,cp) -> occurs_rcd pl v1 cp
    | P(_,_,p) -> occurs_rcd pl v1 p
    | _ -> err "occurs_rec:0" )
let rec unify ru t0 t1 =
  let h = ref [] in
  let se = (Types.print h t0)^" ~ "^(Types.print h t1) in
  (* Util.pnt true ("enter unify:"^se^"\n"); *)
  if t0==t1 then ()
  else
    ( match t0,t1 with
      | Var v1,t2
      | t2,Var v1 ->
        ( match !v1 with
          | Ln t3 -> unify ru t2 t3
          | _ ->
            ( match t2 with
              | Rec rv ->
                let _ = occurs_rec [rv] v1 rv in
                v1 := Ln t2;
                ()
              | Var v2 ->
                if v1==v2 then ()
                else
                  let b = occurs [] v1 t2 in
                  if b then err ("unify:0:"^se)
                  else v1 := (Ln t2); ()
              | _ ->
                let b = occurs [] v1 t2 in
                if b then err ("unify:0:"^se)
                else v1 := (Ln t2); ()
            )
        )
      | App(t2,t3),App(t4,t5)
      | Imp(t2,t3),Imp(t4,t5) -> unify ru t2 t4; unify ru t3 t5
      | Prm p1,Prm p2 -> if p1=p2 then () else err ("unify:1:"^se)
      | Rec v1,Rec v2 ->
        if v1==v2 then ()
        else if List.exists (fun (x1,x2) -> (x1==v1&&x2==v2)||(x1==v2&&x2==v1)) ru then ()
        else unify_rec ((v1,v2)::ru) v1 v2
      | Rcd l1,Rcd l2 -> unify_rcd ru l1 l2
      | Rcd_Lb l1,Rcd_Lb l2 -> unify_rcd_lb ru l1 l2
      | _ -> err ("unify:2"^se)
    )
and unify_rcd ru l1 l2 =
  ( match l1,l2 with
    | U,U -> ()
    | Uo t1,l3
    | l3,Uo t1 ->
      ( match !t1 with
        | Ln t3 -> unify_rcd ru l3 t3
        | _ ->
          let b = rcd_occurs t1 l3 in
          if b then err "unify_rcd: 0"
          else t1 := (Ln l3); ()
      )
    | Cns(t1,t2),Cns(t3,t4) -> unify ru t1 t3; unify_rcd ru t2 t4
    | _ -> err "unify_rcd:1" )
and tl_rcd_lb l1 =
  ( match l1 with
    | U_Lb -> `Tl_U
    | Uo_Lb t0  ->
      ( match !t0 with
        | Ln t1 -> tl_rcd_lb t1
        | _ -> `Tl_Uo t0 )
    | Cns_Lb(_,_,l2) -> tl_rcd_lb l2 )
and find_lb (b:string) l1 =
  ( match l1 with
    | U_Lb -> `U
    | Uo_Lb t1 ->
      ( match !t1 with
        | Ln t3 -> find_lb b t3
        | _ ->
          let w1 = Var (newvar ()) in
          t1 := Ln (Cns_Lb(b,Some w1,Uo_Lb (ref WC)));
          `Lb w1
      )
    | Cns_Lb(b1,Some t1,t2) ->
      if b = b1 then `Lb t1 else find_lb b t2
    | Cns_Lb(b1,None,t2) ->
      if b=b1 then `U else find_lb b t2 )
and unify_rcd_lb ru l1 l2 =
  let rec f_l l1 =
    ( match l1 with
      | U_Lb -> ()
      | Uo_Lb t1 ->
        ( match !t1 with
          | Ln t2 -> f_l t2
          | _ -> ()
        )
      | Cns_Lb(b1,Some t1,t2) ->
        let _ =
          ( match find_lb b1 l2 with
            | `U -> err "unify_rcd_lb:0"
            | `Lb t -> unify ru t t1 ) in
        f_l t2
      | Cns_Lb(b1,None,t2) ->
        let _ =
          ( match find_lb b1 l2 with
            | `U -> ()
            | `Lb _ -> err "unify_rcd_lb 1" ) in
        f_l t2 ) in
  let _ = f_l l1 in
  let rec f_r l1 =
    ( match l1 with
      | U_Lb -> ()
      | Uo_Lb t1 ->
        ( match !t1 with
          | Ln t2 -> f_r t2
          | _ -> () )
      | Cns_Lb(b1,_,t2) ->
        let _ =
          ( match find_lb b1 l2 with
            | `U -> err "unify_rcd_lb:0"
            | `Lb _ -> () ) in
        f_r t2
    ) in
  let _ = f_r l2 in
  let rec f_tl l1 l2 =
    ( match l1,l2 with
      | Cns_Lb(_,_,t0),l3 | l3,Cns_Lb(_,_,t0) -> f_tl t0 l3
      | U_Lb,U_Lb -> ()
      | Uo_Lb v0,l3 | l3,Uo_Lb v0 ->
        ( match !v0 with
          | Ln l4 -> f_tl l3 l4
          | _ ->
            let b = rcd_lb_occurs v0 l3 in
            if b then err "unify_rcd_lb:0"
            else v0 := (Ln l3); ())
    ) in
  let _ = f_tl l1 l2 in
  ()
and unify_rec ru v1 v2 =
  ( match !v1,!v2 with
    | CP(t1,t2),CP(t3,t4) -> unify ru t1 t3; unify_rcd ru t2 t4
    | P(t1,t2,t3),P(t4,t5,t6) -> unify ru t1 t4; unify ru t2 t5; unify_rcd ru t3 t6
    | _ -> err "unify_rec:0" )
let rec gen rl l y =
  ( match y with
    | Var v ->
      ( match !v with
        | WC -> ()
        | V l0 -> if l<l0 then v := (Q l)
        | Q _ -> ()
        | Ln y1 -> gen rl l y1 )
    | App(t2,t3)
    | Imp(t2,t3) -> gen rl l t2; gen rl l t3
    | Rec v1 ->
      if List.exists (fun v -> v==v1) !rl then ()
      else (rl := !rl@[v1]; gen_rec rl l v1)
    | Rcd l1 -> gen_rcd rl l l1
    | Rcd_Lb l1 -> gen_rcd_lb rl l l1
    | _ -> ()
  )
and gen_rec rl l v1 =
  ( match !v1 with
    | CP(t0,r0) -> gen rl l t0; gen_rcd rl l r0
    | P(t0,t1,r0) -> gen rl l t0; gen rl l t1; gen_rcd rl l r0
    | _ -> err "gen_rec:0" )
and gen_rcd rl l r =
  ( match r with
    | U -> ()
    | Uo v ->
      ( match !v with
        | WC -> ()
        | V l0 -> if l<l0 then v := (Q l)
        | Q _ -> ()
        | Ln y1 -> gen_rcd rl l y1 )
    | Cns(t0,t1) -> gen rl l t0; gen_rcd rl l t1 )
and gen_rcd_lb rl l r =
  ( match r with
    | U_Lb -> ()
    | Uo_Lb v ->
      ( match !v with
        | V l0 -> if l<l0 then v := (Q l)
        | WC -> ()
        | Q _ -> ()
        | Ln y1 -> gen_rcd_lb rl l y1 )
    | Cns_Lb(_,Some t0,t1) -> gen rl l t0; gen_rcd_lb rl l t1
    | Cns_Lb(_,None,t1) -> gen_rcd_lb rl l t1 )
let inst_ini () = { al = []; al_rcd = []; al_rcd_lb = []; rl = []; }
let rec inst l i y =
  (* Util.pnt true "inst:0\n";
     Util.pnt true ("enter inst:"^(Types.print (ref []) y)^"\n"); *)
  ( match y with
    | App(Var {contents = Ln y0 },y1) -> inst l i (App(y0,y1))
    | App(Abs(v,y0),y1) ->
      let (y2,i) = inst l i y0 in
      let (y3,i) = inst l i y1 in
      let v0 = List.assq v i.al in
      v0 := Ln y3;
      (y2,i)
    | Var v ->
      ( match !v with
        | Q _ ->
          ( try (Var (List.assq v i.al),i)
            with Not_found ->
              let v0 = newvar_l l in
              let i = { i with al = (v,v0)::i.al } in
              (Var v0,i))
        | Ln y -> inst l i y
        | WC -> v := Types.V l; (y,i)
        | _ -> (y,i))
    | App (y1,y2) ->
      let (y1,i) = inst l i y1 in
      let (y2,i) = inst l i y2 in
      (App(y1,y2),i)
    | Imp (y1,y2) ->
      let (y1,i) = inst l i y1 in
      let (y2,i) = inst l i y2 in
      (Imp(y1,y2),i)
    | Rcd r -> let (r,i) = (inst_rcd l i r) in (Rcd r,i)
    | Rcd_Lb r -> let (r,i) = (inst_rcd_lb l i r) in (Rcd_Lb r,i)
    | Rec r0 ->
      ( try (Rec (List.assq r0 i.rl),i)
        with Not_found ->
          let r1 = ref Rec_WC in
          let i0 = { i with rl = (r0,r1)::i.rl } in
          let (r2,i) = inst_rec l i0 r0 in
          r1 := r2;
          (Rec r1,i))
    | _ -> (y,i))
and inst_rcd l (i:inst) r =
  ( match r with
    | U -> (r,i)
    | Uo v ->
      ( match !v with
        | Q _ ->
          ( try (Uo (List.assq v i.al_rcd),i)
            with Not_found ->
              let v0 = ref (Types.V l) in
              let i = { i with al_rcd = (v,v0)::i.al_rcd } in
              (Uo v0,i))
        | Ln y -> inst_rcd l i y
        | WC -> v := Types.V l; (r,i)
        | _ -> (r,i))
    | Cns(t1,t2) ->
      let (t1i,i) = inst l i t1 in
      let (t2i,i) = inst_rcd l i t2 in
      (Cns(t1i,t2i),i))
and inst_rcd_lb l (i:inst) r =
  ( match r with
    | U_Lb -> (r,i)
    | Uo_Lb v ->
      ( match !v with
        | Q _ ->
          ( try (Uo_Lb (List.assq v i.al_rcd_lb),i)
            with Not_found ->
              let v0 = ref (Types.V l) in
              let i = { i with al_rcd_lb = (v,v0)::i.al_rcd_lb } in
              (Uo_Lb v0,i))
        | Ln y -> inst_rcd_lb l i y
        | WC -> v := Types.V l; (r,i)
        | _ -> (r,i))
    | Cns_Lb(b,Some t1,t2) ->
      let (t1i,i) = inst l i t1 in
      let (t2i,i) = inst_rcd_lb l i t2 in
      (Cns_Lb(b,Some t1i,t2i),i)
    | Cns_Lb(b,None,t2) ->
      let (t2i,i) = inst_rcd_lb l i t2 in
      (Cns_Lb(b,None,t2i),i)  )
and inst_rec l i r =
  ( match !r with
    | CP(t0,t1) ->
      let (t0i,i) = inst l i t0 in
      let (t1i,i) = inst_rcd l i t1 in
      (CP(t0i,t1i),i)
    | P(t0,t1,t2) ->
      let (t0i,i) = inst l i t0 in
      let (t1i,i) = inst l i t1 in
      let (t2i,i) = inst_rcd l i t2 in
      (Types.P(t0i,t1i,t2i),i)
    | _ -> err "inst_rec:0" )
let gen_rm (l:int) rm = SgnMap.map (fun y -> gen (ref []) l y) rm
let rec slv m l (p0:pt) =
  let open Rcd_Ptn in
  ( match !p0 with
    | Ret _ -> ()
    | Seq(o,p1) ->
      let _ =
        ( match o with
          | IR_Etr r ->
            let _ = Rcd_Ptn.map (fun r -> inst l (inst_ini ()) (Var r)) r in
            slv m l p1
          | IR_Clj (_,_,_) -> err "slv:0"
          | IR_Prd (_,_,_) -> err "slv:1"
          | IR_Agl(ra,i,ps,rr) ->
            let (ta,_) = inst (l+1) (inst_ini ()) (get_rm_ptn ra) in
            let ts = Array.init (Array.length ps) (fun _ -> Var (newvar_l (l+1))) in
            let _ = unify [] (Types.path i ta) (Rec (ref (coprd_cl (Var (newvar_l (l+1))) (Array.to_list ts)))) in
            let _ =
              Array.fold_left
                ( fun j (r,p) ->
                    let (ti,_) = inst (l+1) (inst_ini()) (get_rm_ptn r) in
                    let _ = unify [] ti (get_agl (ts.(j)) i ta) in
                    let _ = gen (ref []) l ti in
                    let _ = slv m l p in
                    j+1 )
                0 ps in
            let tts = Array.map (fun (_,p) -> fst @@ inst (l+1) (inst_ini()) (get_rm_ptn (fst @@ ret p))) ps in
            let (rrt,_) = inst (l+1) (inst_ini()) (get_rm_ptn rr) in
            let _ = List.fold_left (fun y1 y2 -> unify [] y1 y2; y2) rrt (Array.to_list tts) in
            let _ = gen (ref []) l rrt in
            ()
          | IR_Id (r,rs) ->
            let ts = Array.map (fun r -> fst @@ inst (l+1) (inst_ini()) (get_rm_ptn r)) rs in
            let (t,_) = inst (l+1) (inst_ini()) (get_rm_ptn r) in
            let _ = List.fold_left (fun y1 y2 -> unify [] y1 y2; y2) t (Array.to_list ts) in
            let _ = Array.map (fun t -> gen (ref []) l t) ts in
            ()
          | IR_Call((f,x),y) ->
            let (tf,_) = inst (l+1) (inst_ini ()) (get_rm_ptn (A f)) in
            let (tx,_) = inst (l+1) (inst_ini ()) (get_rm_ptn x) in
            let (ty,_) = inst (l+1) (inst_ini ()) (get_rm_ptn y) in
            let _ = unify [] tf (Imp(tx,ty)) in
            gen (ref []) l ty
          | IR_Glb_Call(_,_,_) -> err "slv x0"
          | IR_Out (_,_) -> err "slv x1"
          | IR_Glb_Out (_,_) -> err "slv x2"
          | IR_Ini(r,k) ->
            let (tk,_) = inst (l+1) (inst_ini ()) (get_rm_ptn (A r)) in
            unify [] tk (fst @@ (inst (l+1) (inst_ini ()) (slv_tkn m k)))
        ) in
      (*  Util.Timer.pnt "slv t2"; *)
      slv m l p1
  )
and slv_tkn m k =
  let open Types in
  let open Tkn in
  ( match k with
    | Rcd rs -> Rcd(rcd_cl (Array.to_list (Array.map (slv_tkn m) rs)))
    | Rcd_Lb _ -> err "slv_kn 4"
    | Tkn a ->
      ( match a with
        | Stg _ -> Prm Types.Stg
        | Z _ -> zn (Prm Z_u)
        | Zn(_,_) -> zn (Var (newvar()))
        | Sgn _ -> Prm Sgn
        | Pls -> let y = zn (Var (newvar())) in Imp(Rcd (rcd_cl [y;y]),y)
        | Mlt -> let y = zn (Var (newvar())) in Imp(Rcd (rcd_cl [y;y]),y)
        | Mns -> let y = zn (Var (newvar())) in Imp(y,y)
        | Cmp -> let (y0,y1) = (zn (Prm Z_u),zn (Prm (Z_n 2))) in Imp(Rcd(rcd_cl [y0;y0]),y1)
        | Eq -> let y = Var (newvar()) in Imp(Rcd(rcd_cl [y;y]),y)
        | Name n -> Var(List.assoc n m.ns)
        | _ -> Var (newvar()) ))

and slv_grm gs n =
  ( try
      let y = List.assoc n !ns_grm in
      Rec y
    with Not_found ->
      let (_,(n,v,rs)) =
        ( try
            BatList.find_map
              (fun g -> try Some (find_grm g n) with _ -> None) gs
          with _ -> err ("slv_grm:0:"^n))
      in
      let y = ref Rec_WC in
      ns_grm := (n,y)::!ns_grm;
      let y0 = slv_entry gs (n,v,rs) in
      y := y0;
      Rec y )
and slv_entry gs (n,_,rs) =
  coprd_cl (Prm (Name n)) (List.map (fun (r,_) -> slv_rule gs r) rs)
and find_grm g n =
  BatList.find_map
    (fun (n0,v,rs) -> if n=n0 then Some(g,(n0,v,rs)) else None)
    g
and slv_rule gs (_,ps,_) = Rcd (slv_ps gs ps)
and slv_ps gs ps =
  ( match ps with
    | [] -> U
    | hd::tl -> Cns(slv_pattern gs hd,slv_ps gs tl))
and slv_pattern gs p =
  let open Peg in
  ( match p with
    | List a -> lst (slv_pattern_atm gs a)
    | Option a -> opn (slv_pattern_atm gs a)
    | Atm a -> slv_pattern_atm gs a )
and slv_pattern_atm gs a =
  ( match a with
    | Peg.Text _ -> Rcd U
    | Peg.Name n -> slv_grm gs n
    | Peg.Var v ->
      let (n,_,_) = !v in
      let y  = List.assoc n !ns_grm in
      Rec y
    | Peg.Any -> Prm Stg )
let rec slv_grms (gs:Peg.grammar list) =
  Util.pnt true "enter slv_grms:\n";
  ( match gs with
    | [] -> ()
    | g::tl ->
      let _  =
        List.fold_left
          (fun _ (n,_,_) ->
             let y = ref Rec_WC in
             ns_grm := (n,y)::!ns_grm )
          () g in
      let _ =
        List.fold_left
          (fun _ (n,_,rs) ->
             let y = coprd_cl (Prm (Name n)) (List.map (fun (r,_) -> slv_rule [g] r) rs) in
             let v = List.assoc n !ns_grm in
             v := y;
             ns := (n,ref (Ln(Imp(Prm Stg,Rcd(rcd_cl [Rec v;(Prm Stg)])))))::!ns
          ) () g in
      slv_grms tl
  )
let ir_of_ast p0 r0 c =
  ( match c with
    | E _ ->
      p0 := Ret r0; (p0,r0)
    | _ -> err "ir_of_ast 0" )
let rec mk_ir_mdl el =
  let m = { ns_v =[]; ns = []; ns_e = []; ns_t = [] } in
  m.ns_e <- ("‹›",Tkn(Tkn.Inj 0))::m.ns_e;
  m.ns <- ("‹›",ref (Ln(Imp(Rcd U,opn (Var(newvar_q (-1)))))))::m.ns;
  m.ns_e <- ("‹",Tkn(Tkn.Inj 1))::m.ns_e;
  let v = Var (newvar()) in
  m.ns <- ("‹",ref(Ln(Imp(v,opn v))))::m.ns;
  m.ns_e <- ("⟦⟧",Tkn(Tkn.Inj 0))::m.ns_e;
  m.ns <- ("⟦⟧",ref(Ln(Imp(Rcd U,lst (Var(newvar_q (-1)))))))::m.ns;
  m.ns_e <- ("⟦",Tkn(Tkn.Inj 0))::m.ns_e;
  let v = Var (newvar_q (-1)) in
  let y = lst v in
  m.ns <- ("⟦",ref(Ln(Imp(Rcd (rcd_cl [v;y]),y))))::m.ns;
  m.ns_e <- ("&",Tkn(Tkn.Frgn "&"))::m.ns_e;
  m.ns <- ("&",ref(Ln(Imp(Rcd U,Prm Sgn))))::m.ns;
  m.ns_e <- ("⊵",Tkn(Tkn.Frgn "⊵"))::m.ns_e;
  let t_b = Var (newvar_q (-1)) in
  let t_k = Var (newvar_q (-1)) in
  let t_o = opn t_k in
  let t_v = App(App(Prm Vct,t_o),t_b) in
  let t_s = Rcd(rcd_cl [Rcd(rcd_cl [t_v;t_b]);t_o]) in
  m.ns <- ("⊵",ref(Ln(Imp(t_s,t_s))))::m.ns;
  m.ns_e <- ("#",Tkn(Tkn.Frgn "#"))::m.ns_e;
  let t_b = Var (newvar_q (-1)) in
  let t_k = Var (newvar_q (-1)) in
  let t_o = opn t_k in
  let t_v = App(App(Prm Vct,t_o),t_b) in
  m.ns <- ("#",ref(Ln(Imp(Rcd U,t_v))))::m.ns;
  m.ns_e <- ("read",Tkn(Tkn.Frgn "read"))::m.ns_e;
  m.ns <- ("read",ref(Ln(Imp(Prm Stg,Prm Stg))))::m.ns;
  m.ns_e <- ("pnt",Tkn(Tkn.Frgn "pnt"))::m.ns_e;
  m.ns <- ("pnt",ref(Ln(Imp(Var (newvar_q (-1)),Rcd U))))::m.ns;
  mk_ir_mdl_etr m el
and mk_ir_mdl_etr m el =
  ( match el with
    | [] -> m
    | e::tl ->
      let _ =
        ( match e with
          | Etr(n,_,_,c) ->
            let r0 = Rcd_Ptn.A (Types.newvar ()) in
            let p0 = ref (Ret r0) in
            let (_,r1) = (ir_of_ast p0 r0 c) in
            let _ = slv m (-1) p0 in
            let y = Imp(get_rm_ptn r0,get_rm_ptn r1) in
            m.ns_v <- (n,p0)::m.ns_v;
            m.ns <- (n,ref(Ln y))::m.ns
          | Etr_IR(n,_,_,p) ->
            let _ = slv m (-1) p in
            let (r0,_) = etr p in
            let (r1,_) = ret p in
            let y = Imp(get_rm_ptn r0,get_rm_ptn r1) in
            m.ns_v <- (n,p)::m.ns_v;
            m.ns <- (n,ref(Ln y))::m.ns
          | Etr_Clq q ->
            let _ =
              List.fold_left
                (fun _ (n,_,_,c) ->
                   let r0 = Rcd_Ptn.A (Types.newvar ()) in
                   let p0 = ref (Ret r0) in
                   let (_,r1) = ir_of_ast p0 r0 c in
                   m.ns_v <- (n,p0)::m.ns_v;
                   let (y0,_) = inst (-1) (inst_ini ()) (get_rm_ptn r0) in
                   let (y1,_) = inst (-1) (inst_ini ()) (get_rm_ptn r1) in
                   let y = Imp(y0,y1) in
                   m.ns <- (n,ref(Ln y))::m.ns )
                () q in
            let _ =
              List.fold_left
                (fun _ (n,_,_,_) ->
                   let _ = List.assoc n m.ns_v in
                   let y = List.assoc n m.ns in
                   gen (ref []) (-1) (Var y) )
                () q in
            ()
          | Etr_Clq_IR _ -> err "x0"
          | Flow _ -> err "x1"
          | Flow_Clq _ -> err "x2"
          | Gram _ -> err "x3" ) in
      mk_ir_mdl_etr m tl
  )