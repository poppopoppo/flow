let pnt s =
  print_string (s^"\n");flush stdout
let _ = pnt ""
let rec string_of_list f p l =
  match l with
  | [] -> ""
  | x::[] -> p x
  | x::tl -> (p x)^f^(string_of_list f p tl)

module Plc = struct
  type t =
    | Z
    | Rcd of t list
    | Name of string
    | IO of t * t
    | PM
    | Mt
  let rec string_of d x =
    match x with
    | Z -> "ℤ"
    | Rcd r ->
      if d=0
      then (string_of_list " " (string_of (d+1)) r)
      else "{ "^(string_of_list " " (string_of (d+1)) r)^" }"
    | Name n -> n
    | PM -> "?+"
    | Mt -> "?"
    | IO (src,dst) -> "("^(string_of (d+1) src)^"→"^(string_of (d+1) dst)^")"
end

module Exp = struct
  type vh =
    | Seq of vh * vh
    | Canon of vh list
    | Exp of Plc.t * t
    | CoPrd of vh list
  and t =
    | Agl of t
    | Z of int
    | Plus of t * t
    | Mult of t * t
    | Gl_call of string
    | Rcd of t list
    | Root of int
    | App of t * t
    | L_App of t * t
    | L_Prj of t * t
    | IO of vh
    | Exn of string
  let rec string_of_vh x =
    match x with
    | Seq (a,b) -> (string_of_vh a)^"\n» "^(string_of_vh b)
    | Canon l -> "{~ "^(string_of_list " ¦ " string_of_vh l)^" }"
    | Exp (p,x) -> (Plc.string_of 0 p)^" : "^(string_of x)
    | CoPrd l -> string_of_list " ∐ " string_of_vh l
  and string_of x =
    match x with
    | Agl e -> "∠["^(string_of e)^"]"
    | Z z -> string_of_int z
    | Plus (e1,e2) -> "("^(string_of e1)^"+"^(string_of e2)^")"
    | Mult (e1,e2) -> "("^(string_of e1)^"*"^(string_of e2)^")"
    | Gl_call n -> "#"^n
    | Rcd l -> "{"^(string_of_list " " string_of l)^"}"
    | Root i -> "$"^(String.make i '\'')
    | App (f,x) -> "‡"^(string_of f)^"."^(string_of x)
    | L_App (f,x) -> "("^(string_of f)^"◂"^(string_of x)
    | L_Prj (f,x) -> "("^(string_of f)^"◃"^(string_of x)
    | IO c -> ".» "^(string_of_vh c)
    | Exn s -> "¡"^s

end

module Data = struct
  type t =
      CoPrd of {
        name : string;
        cns : (string * Plc.t) list
      }
  let idx i v =
    match v with
    | CoPrd c ->
      let (n,p) = List.nth c.cns i in
      (c.name,n,p)
end

module St = struct
  type t =
    | Exn of exn
    | Z of (int option)
    | Rcd of t list
    | CoPrd of {
        name : string;
        st : coprd;
        agl_flg : bool
      }
    | Unknown
    | IO of {
        src : Plc.t;
        dst : Plc.t;
        roots : t list;
        code : Exp.vh
      }
    | Inj of (int * Data.t)
  and coprd =
    | Pure of (int * t)
    | Mix of t list
  and exn =
    | Typing_Error of string
    | Error of string
  let rec plc_to (p:Plc.t) : t =
    match p with
    | Plc.Z -> Z None
    | Rcd r -> Rcd (List.map plc_to r)
    | Name _ -> Unknown
    | PM -> Unknown
    | Mt -> Unknown
    | IO (_,_) -> Unknown
  let rec string_of d s =
    match s with
    | Z z ->
      ( match z with
        | Some z -> ("ℤ:"^(string_of_int z))
        | None -> ("ℤ:?")
      )
    | Rcd l ->
      let m = (string_of_list " " (string_of (d+1)) l) in
      if d=0 then ("{ "^m^" }") else ("{ "^m^" }")
    | Exn x ->
      (match x with
       | Typing_Error e -> "exn("^e^")"
       | Error e -> "exn("^e^")"
      )
    | CoPrd c ->
      ( match c.st with
      | Pure (i,e) -> c.name^":"^"∐["^(string_of_int i)^"]◂"^(string_of (d+1) e)
      | Mix _ -> c.name^":?"
      )
        (*
        ( match c.st with
          | St.Pure (i,x) -> ("["^(string_of_int i)^"]|"^(string_of_st (d+1) x))
          | St.Mix m -> string_of_list "∐" (string_of_st (d+1)) m
        )
        *)
    | Unknown -> "??:?"
    | IO _ -> "IO:?"
    | Inj (i,c) ->
      let (t,_,p) = Data.idx i c in
      (Plc.string_of (d+1) p)^"→"^t^":?"
end

module Glb_St = struct
  type glb_etr =
    | Gl_Etr of {
        name : string;
        src : Plc.t;
        dst : Plc.t;
        code : Exp.vh
      }
    | Dta_Def of Data.t
  type t = glb_etr list

  let string_of (s:t) =
    let f gs =
      ( match gs with
        | Gl_Etr g ->
          ("§ "^g.name^" : "^(Plc.string_of 0 g.src)^" ⊢ "^(Plc.string_of 0 g.dst)^" ≒ ? ")
        | Dta_Def (Data.CoPrd g) ->
          "¶ "^g.name^" = "^(string_of_list "|" (fun (n,_) -> n) g.cns)^" ≒ ?"
      )  in
    "gl_state # "^(string_of_list "," f s)

  let rec assoc (g:t) (n:string) : (int option * glb_etr) =
    ( match g with
      | [] -> raise @@ Failure ("error:Glb_St:assoc:not found global entry "^n)
      | h::t ->
        ( match h with
          | Gl_Etr h ->
            if h.name=n
            then (None,Gl_Etr h)
            else assoc t n
          | Dta_Def (Data.CoPrd d) ->
            try
              pnt ("pnt:assoc:{n d.name}= {"^n^" "^d.name^" }");
              let (i,_) = BatList.findi (fun _ (k,_) -> n=k) d.cns in
              (Some i,Dta_Def (Data.CoPrd d))
            with | Not_found -> assoc t n
        )
    )
end
let rec tkn_in_plc (p:Plc.t) (t:St.t) =
  match p with
  | Z ->
    ( match t with
      | Exn _ -> true
      | Z _ -> true
      | Rcd _ -> false
      | CoPrd c -> if c.name="Z" then true else false
      | Unknown -> true
      | IO _ -> false
      | Inj _ -> false
    )
  | Rcd r ->
    ( match t with
      | Exn _ -> true
      | Z _ -> false
      | Rcd v ->
        ( try
          List.for_all (fun (x,y) -> tkn_in_plc x y) (List.combine r v)
          with | Invalid_argument _ -> false )
      | CoPrd _ -> false
      | Unknown -> true
      | IO _ -> false
      | Inj _ -> false
    )
  | Name n ->
    ( match t with
      | Exn _ -> true
      | CoPrd c -> if c.name=n then true else false
      | Unknown -> true
      | _ -> false
    )
  | IO (src,dst) ->
    ( match t with
      | Exn _ -> true
      | Unknown -> true
      | IO f ->
        if f.src=src && f.dst=dst
        then true else false
      | Inj (i,c) ->
        let (t,_,p) = Data.idx i c in
        if src=p && dst=(Plc.Name t)
        then true else false
      | _ -> false
    )
    | PM -> true
    | Mt -> true
let rec plc_of_tkn (v:St.t) : Plc.t =
  match v with
  | St.Exn _ -> Plc.Mt
  | St.Z _ -> Plc.Z
  | St.Rcd r -> Plc.Rcd (List.map plc_of_tkn r)
  | St.CoPrd c -> Plc.Name c.name
  | St.Unknown -> Plc.Mt
  | St.IO f -> Plc.IO (f.src,f.dst)
  | St.Inj (i,c) ->
    let (t,_,p) = Data.idx i c in
    Plc.IO (p,(Plc.Name t))

let rec exp_of_tkn (v:St.t) : Exp.t =
  match v with
  | St.Exn _ -> Exp.Exn "St.Exn"
  | St.Z (Some z) -> Exp.Z z
  | St.Z None -> raise @@ Failure "error:exp_of_tkn:St.Z None"
  | St.Rcd r -> Exp.Rcd (List.map exp_of_tkn r)
  | St.CoPrd _ -> Exp.Exn "St.CoPrd"
  | St.Unknown -> Exp.Exn "St.Unknown"
  | St.IO f -> Exp.IO f.code
  | St.Inj (i,c) ->
    let (_,n,_) = Data.idx i c in
    Exp.Gl_call n
module Buffer = struct
  type t =
    | Evo of Exp.vh
    | Glb of Glb_St.glb_etr
    | Glb_mode of {
        name : string;
        src : Plc.t;
        dst : Plc.t
      }
    | Def of Data.t
    | End
  exception End
end
type evo_mode = Calc | Glb

type rcd_rtn =
  | RcdNml of St.t list
  | RcdAglMix of string * (St.t list list)
  | RcdAgl of string * int * St.t list

let rec evo (g:Glb_St.t) (rs:St.t list) (s:St.t) (a:Exp.t) : St.t =
  match a with
  | Exp.Z z -> St.Z (Some z)
  | Exp.App (f,x) ->
    ( match (evo g rs s f,evo g rs s x) with
      | (St.IO f,x) ->
        if (tkn_in_plc f.src x)
        then evo_vh g f.roots x f.code
        else raise @@ Failure "error:evo:L_App:type unmatched"
      | (St.Rcd l,St.Z (Some z)) -> (List.nth l z)
      | (St.Inj (i,c),x) ->
        ( match c with
          | Data.CoPrd c ->
            CoPrd {
              name=c.name;
              st=St.Pure (i,x);
              agl_flg=false
            }
        )
      | _ -> raise @@ Failure "error:evo:App:type unmatched"
    )
  | Exp.L_App (f,x) ->
    ( match (evo g rs s f,evo g rs s x) with
      | ((St.IO f),x) ->
        if (tkn_in_plc f.src x)
        then evo_vh g f.roots x f.code
        else raise @@ Failure "error:evo:L_App:type unmatched"
      | (St.Inj (i,c),x) ->
        ( match c with
          | Data.CoPrd c ->
            CoPrd {
              name=c.name;
              st=St.Pure (i,x);
              agl_flg=false
            }
        )
      | ((St.Rcd l),(St.Z (Some z))) -> (List.nth l z)
      | _ -> raise @@ Failure "error:evo:L_App:type unmatched"
    )
  | Exp.L_Prj (f,x) ->
    ( match (evo g rs s f,evo g rs s x) with
      | ((St.Rcd l),(St.Z (Some z))) -> (List.nth l z)
      | _ -> raise @@ Failure "error:evo:L_App:type unmatched"
    )
  | Exp.Plus (x,y) ->
    ( match (evo g rs s x,evo g rs s y) with
      | (St.Z x,St.Z y) ->
        ( match (x,y) with
          | (Some x,Some y) -> (St.Z (Some (x+y)))
          | _ -> (St.Z None)
        )
      | (x,y) ->
        let (px,py) = (St.string_of 0 x,St.string_of 0 y) in
        let msg =
          "error:evo:type is unmatched\n"^
          px^" + "^py^"\n" in
        raise @@ Failure msg
    )
  | Exp.Mult (x,y) ->
    ( match (evo g rs s x,evo g rs s y) with
      | (St.Z x,St.Z y) ->
        ( match (x,y) with
          | (Some x,Some y) -> (St.Z (Some (x*y)))
          | _ -> (St.Z None)
        )
      | (x,y) ->
        let (px,py) = (St.string_of 0 x,St.string_of 0 y) in
        let msg =
          "error:evo:type is unmatched\n"^
          px^" * "^py^"\n" in
        raise @@ Failure msg
    )
  | Exp.Gl_call n ->
    ( try
        let (i,f) = Glb_St.assoc g n in
        match (i,f) with
        | (_,Gl_Etr f) -> St.IO { src=f.src; dst=f.dst; roots=[]; code=f.code }
        | (Some i,Dta_Def f) -> St.Inj (i,f)
        | _ -> raise @@ Failure "error:evo:Gl_call:option"
      with
      | Not_found -> raise @@ Failure ("error:evo:global name "^n^" is not found")
    )
  | Exp.Rcd r ->
    let r' = List.map (evo g rs s) r in
    let r'' =
      (List.fold_left
         (fun l x ->
            match l with
            | RcdNml l ->
              ( match x with
                | St.CoPrd c ->
                  if c.agl_flg
                  then match c.st with
                    | St.Pure (i,v) -> RcdAgl (c.name,i,l@[v])
                    | St.Mix m -> RcdAglMix (c.name,(List.map (fun a -> l@[a]) m))
                  else RcdNml (l@[St.CoPrd c])
                | x -> RcdNml (l@[x])
              )
            | RcdAgl (n,i,v) ->
              ( match x with
                | St.CoPrd c ->
                  if c.agl_flg
                  then raise @@ Failure "error:evo_top:RcdAgl"
                  else  RcdAgl (n,i,v@[St.CoPrd c])
                | x -> RcdAgl (n,i,v@[x])
              )
            | RcdAglMix (n,m) ->
              ( match x with
                | St.CoPrd c ->
                  if c.agl_flg
                  then raise @@ Failure "error:evo_top:RcdAglMix"
                  else RcdAglMix (n,(List.map (fun w -> w@[St.CoPrd c]) m))
                | x -> RcdAglMix (n,(List.map (fun w -> w@[x]) m))
              )
         ) (RcdNml []) r') in
    ( match r'' with
      | RcdNml l -> (St.Rcd l)
      | RcdAglMix (n,ll) ->
        St.CoPrd {
          name=n;
          st=St.Mix (List.map (fun l -> St.Rcd l) ll);
          agl_flg=true
        }
      | RcdAgl (n,i,l) ->
        St.CoPrd {
          name=n;
          st=St.Pure (i,St.Rcd l);
          agl_flg=true
        }
    )
  | Exp.Agl e ->
    let s' = evo g rs s e in
    ( match s' with
      | St.CoPrd c ->
        if c.agl_flg
        then raise @@ Failure "error:evo_top:Agl"
        else St.CoPrd { c with agl_flg=true }
      | St.Z None ->
        St.CoPrd { name="Z"; st=St.Mix [St.Rcd [];St.Rcd []]; agl_flg=true }
      | St.Z (Some z) ->
        if z=0
        then St.CoPrd { name="Z"; st=St.Pure (0,St.Rcd []); agl_flg=true }
        else St.CoPrd { name="Z"; st=St.Pure (1,St.Rcd []); agl_flg=true }
      | _ -> raise @@ Failure "error:evo_top:Agl:CoPrd"
    )
  | Exp.Root i ->
    ( try
      List.nth (s::rs) i
      with
      | _ -> raise @@ Failure
          ("error:evo:Exp.Root "^(string_of_int i)^"\n"^
           "[ "^(string_of_list " ; " (St.string_of 0) (s::rs))^"]")
    )
  | Exp.IO f -> St.IO { src=Plc.Mt; dst=Plc.Mt; roots=(s::rs); code=f }
  | Exp.Exn e -> St.Exn (St.Error e)
and evo_vh (g:Glb_St.t) (rs:St.t list)(s:St.t) (a:Exp.vh) : St.t =
  match a with
  | Exp.Seq (f0,f1) ->
    let s' = evo_vh g rs s f0 in
    let s'' = evo_vh g rs s' f1 in
    s''
  | Exp.Canon l ->
    ( match s with
    | St.Rcd v ->
      St.Rcd (List.map (fun (t,x) -> evo_vh g rs x t) (List.combine l v))
    | _ -> raise @@ Failure "error:evo_vh:Canon"
    )
  | Exp.Exp (p,e) ->
    if (tkn_in_plc p s)
    then evo g rs s e
    else raise @@ Failure "error:evo_vh:Exp:tkn unmatched to place"
  | Exp.CoPrd l ->
    ( match s with
      | St.CoPrd c ->
        if c.agl_flg
        then ( match c.st with
            | St.Pure (i,p) -> evo_vh g rs p (List.nth l i)
            | St.Mix m ->
              St.CoPrd {
                name=c.name;
                st=St.Mix (List.map (fun (x,f) -> evo_vh g rs x f) (List.combine m l));
                agl_flg=false
              }
          )
        else raise @@ Failure "error:evo_vh:CoPrd:c.agl_flg=false"
      | _ -> raise @@ Failure "error:evo_vh:CoPrd"
    )

let print_st st =
  print_string ("state # "^(St.string_of 0 st)^"\n");flush stdout
