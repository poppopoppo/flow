
let dbg = true
open Types
open Print
let rec tkn_of_typ (p:typ) : tkn =
  ( match p with
    | Typ_Z -> Tkn_Btm
    | Typ_Rcd r -> Tkn_Rcd (List.map tkn_of_typ r)
    | Typ_IO (_,_) -> Tkn_Btm
    | Typ_Btm -> Tkn_Btm
    | Typ_For_All _ -> Tkn_Btm
    | _ -> Tkn_Btm
  )
let rec tkn_in_typ (g:gl_st) (p:typ) (t:tkn) : bool =
  match p with
  | Typ_Null -> true
  | Typ_Top -> true
  | Typ_Z ->
    ( match t with
      | Tkn_Exn _ -> true
      | Tkn_Z _ -> true
      | Tkn_Btm  -> true
      | _ -> false
    )
  | Typ_Rcd r ->
    ( match t with
      | Tkn_Exn _ -> true
      | Tkn_Btm  -> true
      | Tkn_Rcd v ->
        ( try
            List.for_all (fun (x,y) -> tkn_in_typ g x y) (List.combine r v)
          with | Invalid_argument _ -> false )
      | _ -> false
    )
  | Typ_CoPrd j ->
    ( match t with
      | Tkn_Exn _ -> true
      | Tkn_Btm  -> true
      | Tkn_CoPrd c ->
        let l = List.combine j c in
        let f (p,t) = tkn_in_typ g p t in
        List.for_all f l
      | _ -> false
    )
  | Typ_IO (src,dst) ->
    let (_,_) = (tkn_of_typ src,tkn_of_typ dst) in
    ( match t with
      | Tkn_Exn _ -> true
      | Tkn_Btm  -> true
      | Tkn_IO_Inj i ->
        ( match dst with
          | Typ_CoPrd f ->
            if src=(List.nth f i)
            then true else false
          | _ -> false )
      | Tkn_IO_Cho i ->
        ( match src with
          | Typ_Prd f ->
            if dst=(List.nth f i)
            then true else false
          | _ -> false )
      | Tkn_IO_Sgn -> src=(Typ_Rcd []) && dst=Typ_Sgn
      | Tkn_IO_Code (_,_,_,_) -> false
      | _ -> false
    )
  | Typ_Btm -> false
  | Typ_For_All _ -> false
  | _ -> false

exception Null

let rec evo (g:gl_st) (s:tkn list) (ir:int ref) (ai:int option) (a:opr) : tkn =
  let agl_flg = ref false in
  ( match a with
    | Opr_Z z -> Tkn_Z z
    | App (f,x) ->
      ( match (evo g s ir ai f,evo g s ir ai x) with
        | (Tkn_IO_Code(vs,k,(t,o,m),c),x) ->
          let k0 = k-(List.length s) in
          if k0=0
          then
            let v0 = evo g (vs@[x]) ir ai o in
            let v1 = evo_code g v0 ir c in
            v1
          else
            Tkn_IO_Code(vs@s,k0,(t,o,m),c)
        | (Tkn_IO_Inj i,x) ->
          Tkn_CoPrd (BatList.init (i+1) (fun j -> if j=i then x else Tkn_Null))
        | (Tkn_IO_Cho i,x) ->
          ( match x with
            | Tkn_Prd (v0,l) -> (evo_code g v0 ir (List.nth l i))
            | _ -> raise @@ Failure "error:Flow.evo:App:Cho:type unmatched"
          )
        | (Tkn_IO_Sgn,Tkn_Rcd []) ->
          (let p = !ir in ir:=(!ir + 1); Tkn_Sgn p)
        | (Tkn_IO_Plus,Tkn_Rcd [x;y]) ->
          ( match (x,y) with
            | (Tkn_Z x,Tkn_Z y) -> Tkn_Z (x+y)
            | (Tkn_Exn s,_) -> Tkn_Exn s
            | (_,Tkn_Exn s) -> Tkn_Exn s
            | _ -> raise @@ Failure "error:evo:Plus:type is unmatched"
          )
        | (Tkn_IO_Mult,Tkn_Rcd [x;y]) ->
          ( match (x,y) with
            | (Tkn_Z x,Tkn_Z y) -> Tkn_Z (x*y)
            | (Tkn_Exn s,_) -> Tkn_Exn s
            | (_,Tkn_Exn s) -> Tkn_Exn s
            | _ -> raise @@ Failure "error:evo:Plus:type is unmatched"
          )
        | (Tkn_IO_Minus,x) ->
          ( match x with
            | Tkn_Z x -> Tkn_Z (-x)
            | Tkn_Exn s -> Tkn_Exn s
            | _ -> raise @@ Failure "error:evo:Plus:type is unmatched"
          )
        | (Tkn_IO_Eq,Tkn_Rcd [x;y]) ->
          if (Eq.eq x y) then Tkn_IO_Inj 1 else Tkn_IO_Inj 0
        | (Tkn_IO_Exn,Tkn_Stg s) -> Tkn_Exn s
        | (f,x) -> raise @@ Failure ("error:Flow.evo:App:type unmatched\n"^
                                     (string_of_tkn 1 f)^" ◂ "^(string_of_tkn 1 x))
      )
    | Prj (f,x) ->
      ( match (evo g s ir ai f,evo g s ir ai x) with
        | (Tkn_Rcd l,Tkn_Z z) -> (List.nth l z)
        | (f',x') -> raise @@ Failure
            ("error:Imp.evo:Prj:type unmatched\n"^
             (string_of_tkn 0 f')^" ◃ "^(string_of_tkn 0 x'))
      )
    | Opr_Name n ->
      ( try
          Util.pnt dbg ("Opr_Name:"^n^"\n");
          if n="="
          then Tkn_IO_Eq
          else if n="+"
          then Tkn_IO_Plus
          else if n="*"
          then Tkn_IO_Mult
          else if n="&"
          then Tkn_IO_Sgn
          else if n="-"
          then Tkn_IO_Minus
          else if n = "?"
          then Tkn_IO_Exn
          else
            let find_etr n e =
              let (name,src,_,code) = e in
              if n=name
              then Some (Tkn_IO_Code([],1,(src,Root 0,[]),code))
              else None in
            let find_flow n f =
              ( match f with
                | Def_Prd (_,_,l) ->
                  ( try
                      let (i,(_,_)) =
                        BatList.findi
                          (fun _ (_,c) -> if c=n then true else false)
                          l in
                      Some (Tkn_IO_Cho i)
                    with _ -> None )
                | Def_CoPrd (_,_,l) ->
                  ( try
                      let (i,(_,_)) =
                        BatList.findi
                          (fun _ (_,c) -> if c=n then true else false)
                          l in
                      Some (Tkn_IO_Inj i)
                    with _ -> None )
                | _ -> raise @@ Failure "find_flow:not found"
              ) in
            let e = BatList.find_map
                (fun e ->
                   ( match e with
                     | Etr e -> find_etr n e

                     | Flow f -> find_flow n f
                     | Etr_Clq el -> (try Some (BatList.find_map (find_etr n) el) with _ -> None)
                     | Flow_Clq fl -> (try Some (BatList.find_map (find_flow n) fl) with _ -> None)
                   ) )
                g in
            Util.pnt dbg ("Opr_Name-found:"^(string_of_tkn 1 e)^"\n");
            e
        with
        | Not_found -> raise @@ Failure ("error:evo:global name "^n^" is not found")
      )
    | Opr_Rcd r -> Tkn_Rcd (List.map (evo g s ir ai) r)
    | Agl e ->
      let s' = evo g s ir ai e in
      if !agl_flg
      then raise @@ Failure "error:evo:Agl:double agl"
      else
        let i0 =
          ( match ai with
            | None -> raise @@ Failure "error:evo:Agl:agl"
            | Some i -> i) in
        agl_flg:=true;
        ( match s' with
          | Tkn_Z z ->
            if (i0=0)
            then (
              if z=0
              then Tkn_Rcd []
              else raise Null
            )
            else if (i0=1)
            then (
              if z!=0
              then Tkn_Rcd []
              else raise Null )
            else raise @@ Failure "error:agl:type unmatched"
          | Tkn_CoPrd l ->
            let a = List.nth l i0 in
            if a=Tkn_Null
            then raise Null
            else a
          | Tkn_Btm -> Tkn_Btm
          | Tkn_Null -> raise Null
          | _ -> raise @@ Failure "error:agl:type unmatched"
        )
    | Root r -> List.nth s r
    | Opr_Stg s -> Tkn_Stg s
    | _ -> raise @@ Failure "Imp.evo:not defined"
  )
and evo_code (g:gl_st) (s:tkn) (ir:int ref) (a:code) : tkn =
  ( match a with
    | Rtn _ -> s
    | Seq ((t,o,_),c) ->
      let s' = evo g [s] ir None o in
      if (tkn_in_typ g t s')
      then evo_code g s' ir c
      else raise @@ Failure ("type unmatched:"^(string_of_typ 0 t)^"¬:"^(string_of_tkn 0 s')^"\n")
    | Canon (l,c) ->
      ( match s with
        | Tkn_Rcd v ->
          let y =
            List.map
              (fun (t,x) -> evo_code g x ir t)
              (List.combine l v) in
          let s' = Tkn_Rcd y in
          evo_code g s' ir c
        | _ -> raise @@ Failure "error:evo_code:Canon"
      )
    | Code_CoPrd ((_,o,_),l,_) ->
      let vs =
        BatList.mapi
          (fun i x ->
             try
               let vi = evo g [s] ir (Some i) o in
               Some (evo_code g vi ir x)
             with Null -> None) l in
      let v0 = BatList.find_map (fun x -> x) vs in
      v0
    | Code_Prd ((_,o,_),l,c) ->
      let s0 = evo g [s] ir None o in
      let s1 = Tkn_Prd (s0,l) in
      let s2 = evo_code g s1 ir c in
      s2
    | Code_IO (i,(t,o,m),c0,c1) ->
      let f = Tkn_IO_Code ([s],i,(t,o,m),c0) in
      let s2 = evo_code g f ir c1 in
      s2
  )
(*
let check_io (g : gl_st) (c : code) (src:typ) (dst:typ) : bool =
  let (s,_) = (tkn_of_typ src,tkn_of_typ dst) in
  let v = evo_code g (src,s) (ref 0) c in
  tkn_in_typ g dst (snd v)
*)
