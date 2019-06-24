let string_of_list m f l = List.fold_left (fun r x -> r^m^(f x)) "" l
let b = true
let pnt x s = if x then (print_string s;flush stdout)
module Sgn :
sig
  type t
  val ini : unit -> t
  val print : t -> string
end
= struct
  type t = int
  let sgn_N = ref 0
  let ini () =
    let n = !sgn_N in
    sgn_N := n+1;
    n
  let print x = (string_of_int x)
end
module SgnSet = Set.Make(struct type t = Sgn.t let compare = compare end)
type tm =
  | Prm of Sgn.t
  | Val of Sgn.t
  | App of tm * tm
type cxt = (Sgn.t,tm) Hashtbl.t
type c = (tm * tm) list
let cxt_ini:cxt = Hashtbl.create 10
let rec print_tm e =
  ( match e with
    | Prm p -> "p"^(Sgn.print p)
    | Val v -> "X"^(Sgn.print v)
    | App (e1,e2) -> "("^(print_tm e1)^"◂"^(print_tm e2)^")"
  )
let print_cxt c =
  Hashtbl.fold
    (fun i v r -> r^"X"^(Sgn.print i)^" -> "^(print_tm v)^"\n")
    c ""
let cxt_ini () = Hashtbl.create 10
let cxt_add c i e =
  let c = Hashtbl.copy c in
  (Hashtbl.add c i e);
  c
let rec subst_i i a e =
  ( match e with
    | Prm _ -> e
    | Val j -> if i=j then a else e
    | App (e1,e2) -> App (subst_i i a e1,subst_i i a e2)
  )
let rec subst s e =
  ( match e with
    | Prm _ -> e
    | Val i -> ( try Hashtbl.find s i with _ -> e)
    | App(e1,e2) -> App(subst s e1,subst s e2)
  )
let rec subst_c s c =
  ( match c with
    | [] -> []
    | (e0,e1)::tl -> (subst s e0,subst s e1)::(subst_c s tl)
  )
let cmp_subst sl : cxt =
  pnt true ("cmp_subst:"^(string_of_list "*>" print_cxt sl)^"\n");
  let c = Hashtbl.create 10 in
  let rec f c0 l =
    let c0 = Hashtbl.copy c0 in
    ( match l with
      | [] -> c0
      | hd::tl ->
        Hashtbl.iter (fun i e -> Hashtbl.add c0 i (subst hd e))
          c0;
        Hashtbl.iter
          (fun i e ->
             if Hashtbl.mem c0 i then ()
             else Hashtbl.add c0 i e )
          hd;
        f c0 tl
    ) in
  let r = f c sl in
  pnt true ("cmp_subst$"^(print_cxt r)^"\n");
  r
let rec ftvs (e:tm) : SgnSet.t =
  let s0 = SgnSet.empty in
  ( match e with
    | Prm i -> s0
    | Val i -> SgnSet.add i s0
    | App (e1,e2) -> SgnSet.union (ftvs e1) (ftvs e2)
  )
let ftv j e = SgnSet.mem j (ftvs e)

exception Fail
let rec unify (c:c) : cxt =
  let c =
    ( match c with
      | [] -> Hashtbl.create 10
      | (e0,e1)::tl ->
        ( match e0,e1 with
          | Prm p0,Prm p1 ->
            if p0=p1 then unify tl else raise Fail
          | Val v0,_ ->
            if (ftv v0 e1) then (raise Fail)
            else
              let s0 = cxt_add (cxt_ini ()) v0 e1 in
              cmp_subst [s0;(unify (subst_c s0 tl))]
          | _,Val v1 ->
            if (ftv v1 e0) then (raise Fail)
            else
              let s0 = cxt_add (cxt_ini ()) v1 e0 in
              cmp_subst [s0;(unify (subst_c s0 tl))]
          | App(e1,e2),App(e3,e4) ->            unify ([(e1,e3);(e2,e4)]@tl)
          | _ -> raise Fail
        )
    ) in
  (pnt true ("unify > "^(print_cxt c)^"\n"));
  c
module Exp = struct
  type t =
    | ValE of Sgn.t
    | AppE of t * t
    | Abs of Sgn.t * t
    | Let of Sgn.t * t * t
  type scm = SgnSet.t * tm
  type gma = (Sgn.t ,scm) Hashtbl.t
  let print_scm (a,y) =
    let s0 = SgnSet.fold (fun x r -> r^","^(Sgn.print x)) a "" in
    let s1 = print_tm y in
    "∀"^s0^"."^s1
  let print_gma g =
    Hashtbl.fold
      (fun k c r -> r^","^(print_scm c)^":"^("x"^(Sgn.print k)))
      g ""
  let gma_ini () : gma = Hashtbl.create 10
  let gma_add g i c =
    let g = Hashtbl.copy g in
    Hashtbl.add g i c;
    g
  let rec subst_scm s (a,e) : scm =
    let s0 = Hashtbl.create 10 in
    Hashtbl.iter
      (fun k v ->
         if SgnSet.mem k a then ()
         else Hashtbl.add s0 k v)
      s;
    (a,subst s0 e)
  let ftvs_scm ((a,e):scm) : SgnSet.t = SgnSet.diff (ftvs e) a
  let ftvs_gma g : SgnSet.t =
    let g = Hashtbl.copy g in
    let s0 = SgnSet.empty in
    Hashtbl.fold (fun k v r -> SgnSet.union (ftvs_scm v) r) g s0
  let subst_gma (c:cxt) (g:gma) : gma =
    let g = Hashtbl.copy g in
    let c = Hashtbl.copy c in
    Hashtbl.iter
      (fun i (u,y) ->
         let c0 = cxt_ini () in
         Hashtbl.iter
           (fun k v ->
              if (SgnSet.mem k u) then ()
              else Hashtbl.add c0 k v)
           c;
         Hashtbl.add g i (subst_scm c0 (u,y)))
      g;
    g
  let imp = Sgn.ini ()
  let rec w (g:gma) (e:t) : (cxt * tm) =
    pnt false ("w:"^(print_gma g)^"\n");
    let r =
      ( match g,e with
        | _,ValE i ->
          let (u,m) = Hashtbl.find g i in
          let y = SgnSet.fold (fun j r -> subst_i j (Val (Sgn.ini ())) r) u m in
          (cxt_ini (),y)
        | _,(AppE (e1,e2)) ->
          let (s1,y1) = w g e1 in
          let (s2,y2) = w (subst_gma s1 g) e2 in
          let b = Sgn.ini () in
          let v = unify [(subst s2 y1,App(App(Prm imp,y2),Val b))] in
          (cmp_subst [s1;s2;v],subst v (Val b))
        | _,(Abs(x,e1)) ->
          let b = Sgn.ini() in
          let (s,y) = w (gma_add g x (SgnSet.empty,(Val b))) e1 in
          (s,App(App(Prm imp,subst s (Val b)),y))
        | _,(Let(x,e1,e2)) ->
          let (s1,y1) = w g e1 in
          let an = SgnSet.diff (ftvs y1) (ftvs_gma (subst_gma s1 g)) in
          let (s2,y2) = w (gma_add (subst_gma s1 g) x (an,y1)) e2 in
          (cmp_subst [s1;s2],y2)
      ) in
    pnt true ("w > "^(print_cxt (fst r))^","^(print_tm (snd r))^"\n");
    r
end