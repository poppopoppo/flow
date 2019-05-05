
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | Z
    | TEST
    | STT
    | SRC
    | R_RCD
    | R_PRN
    | R_APP
    | ROT
    | PRD_STT
    | PRD
    | PLS
    | NAM of (
# 8 "parser.mly"
       (string)
# 22 "parser.ml"
  )
    | M_CNN
    | MLT
    | L_RCD
    | L_PRN
    | L_APP
    | LCE
    | INT of (
# 9 "parser.mly"
       (int)
# 33 "parser.ml"
  )
    | GL_NAM of (
# 8 "parser.mly"
       (string)
# 38 "parser.ml"
  )
    | EXP
    | EOP
    | EOF
    | END_PRD
    | END_CO_PRD
    | DOT
    | DEF
    | CO_PRD_STT
    | CO_PRD
    | CNN
    | CLQ
    | CLN
    | ARR_END
    | ARR
    | APP
    | AGL
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState91
  | MenhirState90
  | MenhirState89
  | MenhirState88
  | MenhirState80
  | MenhirState77
  | MenhirState76
  | MenhirState74
  | MenhirState71
  | MenhirState67
  | MenhirState65
  | MenhirState61
  | MenhirState55
  | MenhirState53
  | MenhirState50
  | MenhirState44
  | MenhirState43
  | MenhirState42
  | MenhirState41
  | MenhirState35
  | MenhirState32
  | MenhirState30
  | MenhirState28
  | MenhirState25
  | MenhirState22
  | MenhirState20
  | MenhirState19
  | MenhirState17
  | MenhirState16
  | MenhirState12
  | MenhirState11
  | MenhirState10
  | MenhirState6
  | MenhirState3
  | MenhirState0

# 1 "parser.mly"
  
open Flow

# 112 "parser.ml"

let rec _menhir_run50 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_vh_frm_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | APP ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | GL_NAM _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
    | INT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | L_RCD ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | ROT ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50

and _menhir_goto_vh_frm_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_vh_frm_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv389 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | M_CNN ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack)
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv385 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv383 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_vh_frm_lst)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_h_frm = 
# 131 "parser.mly"
                                ( Exp.Canon _3 )
# 163 "parser.ml"
             in
            _menhir_goto_h_frm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv384)) : 'freshtv386)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv387 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv388)) : 'freshtv390)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv395 * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | M_CNN ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack)
        | ARR | ARR_END | CO_PRD_STT | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv391 * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_vh_frm_lst)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_vh_frm_top = 
# 113 "parser.mly"
                    ( Exp.Canon _2 )
# 189 "parser.ml"
             in
            _menhir_goto_vh_frm_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv392)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv393 * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv394)) : 'freshtv396)
    | _ ->
        _menhir_fail ()

and _menhir_run28 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | GL_NAM _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | INT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | L_RCD ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | ROT ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28

and _menhir_run30 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | GL_NAM _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | INT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | L_RCD ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | ROT ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30

and _menhir_run32 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | GL_NAM _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | INT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | L_RCD ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | ROT ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32

and _menhir_goto_coprd_tail : _menhir_env -> 'ttv_tail -> 'tv_coprd_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv381) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CO_PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv375 * 'tv_coprd_tail) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CNN ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | EXP ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | AGL | APP | ARR | ARR_END | CO_PRD_STT | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
            _menhir_reduce23 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState77) : 'freshtv376)
    | END_CO_PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv377) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CNN ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | EXP ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | AGL | APP | ARR | ARR_END | CO_PRD_STT | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
            _menhir_reduce23 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74) : 'freshtv378)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv379) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv380)) : 'freshtv382)

and _menhir_goto_tail : _menhir_env -> 'ttv_tail -> 'tv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv373 * _menhir_state * 'tv_h_frm) = Obj.magic _menhir_stack in
    let (_v : 'tv_tail) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv371 * _menhir_state * 'tv_h_frm) = Obj.magic _menhir_stack in
    let ((_2 : 'tv_tail) : 'tv_tail) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_h_frm)) = _menhir_stack in
    let _v : 'tv_vh_frm = 
# 123 "parser.mly"
    (
      match _2 with
      | None -> _1
      | Some t -> Exp.Seq (_1,t)
    )
# 332 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv369) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_vh_frm) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv345 * _menhir_state * 'tv_vh_frm_lst)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv343 * _menhir_state * 'tv_vh_frm_lst)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_lst)), _, (_3 : 'tv_vh_frm)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_vh_frm_lst = 
# 119 "parser.mly"
                            ( _1@[_3] )
# 350 "parser.ml"
         in
        _menhir_goto_vh_frm_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv344)) : 'freshtv346)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv351) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CO_PRD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv347) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AGL ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | APP ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | GL_NAM _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
            | INT _v ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
            | L_PRN ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | L_RCD ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | ROT ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55) : 'freshtv348)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv349) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv350)) : 'freshtv352)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv359) * _menhir_state * 'tv_vh_frm)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END_CO_PRD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv355) * _menhir_state * 'tv_vh_frm)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv353) * _menhir_state * 'tv_vh_frm)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _, (_2 : 'tv_vh_frm)), _, (_4 : 'tv_vh_frm)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_tail = 
# 136 "parser.mly"
                                                ( Some (Exp.CoPrd [_2;_4]) )
# 409 "parser.ml"
             in
            _menhir_goto_tail _menhir_env _menhir_stack _v) : 'freshtv354)) : 'freshtv356)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv357) * _menhir_state * 'tv_vh_frm)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv358)) : 'freshtv360)
    | MenhirState61 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv363) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv361) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, (_2 : 'tv_vh_frm)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_tail = 
# 135 "parser.mly"
               ( Some _2 )
# 429 "parser.ml"
         in
        _menhir_goto_tail _menhir_env _menhir_stack _v) : 'freshtv362)) : 'freshtv364)
    | MenhirState41 | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv367 * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv365 * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm)) = _menhir_stack in
        let _v : 'tv_vh_frm_lst = 
# 118 "parser.mly"
            ( [_1] )
# 441 "parser.ml"
         in
        _menhir_goto_vh_frm_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv366)) : 'freshtv368)
    | _ ->
        _menhir_fail ()) : 'freshtv370)) : 'freshtv372)) : 'freshtv374)

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv295 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv291 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | APP ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | GL_NAM _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
            | INT _v ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
            | L_PRN ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | L_RCD ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | ROT ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35) : 'freshtv292)
        | L_APP ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv293 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv294)) : 'freshtv296)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv301 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | AGL | APP | ARR | ARR_END | CO_PRD_STT | DOT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | PLS | ROT | R_PRN | R_RCD | TEST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv297 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp_app = 
# 154 "parser.mly"
                ( Exp.Plus (_1,_3) )
# 510 "parser.ml"
             in
            _menhir_goto_exp_app _menhir_env _menhir_stack _menhir_s _v) : 'freshtv298)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv299 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv300)) : 'freshtv302)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv307 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | AGL | APP | ARR | ARR_END | CO_PRD_STT | DOT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | MLT | PLS | ROT | R_PRN | R_RCD | TEST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv303 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp_app = 
# 155 "parser.mly"
                ( Exp.Mult (_1,_3) )
# 536 "parser.ml"
             in
            _menhir_goto_exp_app _menhir_env _menhir_stack _menhir_s _v) : 'freshtv304)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv305 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv306)) : 'freshtv308)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv311 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv309 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_3 : 'tv_exp)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_exp_app = 
# 157 "parser.mly"
                  ( Exp.L_App (_1,_3) )
# 556 "parser.ml"
         in
        _menhir_goto_exp_app _menhir_env _menhir_stack _menhir_s _v) : 'freshtv310)) : 'freshtv312)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv317 * _menhir_state) * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | AGL | APP | ARR | ARR_END | CO_PRD_STT | DOT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT | R_PRN | R_RCD | TEST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv313 * _menhir_state) * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)), _, (_4 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp_app = 
# 153 "parser.mly"
                    ( Exp.App (_2,_4) )
# 580 "parser.ml"
             in
            _menhir_goto_exp_app _menhir_env _menhir_stack _menhir_s _v) : 'freshtv314)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv315 * _menhir_state) * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv316)) : 'freshtv318)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv325 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv321 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv319 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp_app = 
# 156 "parser.mly"
                    ( _2 )
# 614 "parser.ml"
             in
            _menhir_goto_exp_app _menhir_env _menhir_stack _menhir_s _v) : 'freshtv320)) : 'freshtv322)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv323 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv324)) : 'freshtv326)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv331 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | APP | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv327 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _v : 'tv_exp_lst = 
# 140 "parser.mly"
                 ( _1@[_2] )
# 643 "parser.ml"
             in
            _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv328)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv329 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv330)) : 'freshtv332)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv337 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | ARR | ARR_END | CO_PRD_STT | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv333 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_vh_frm_top = 
# 115 "parser.mly"
            ( Exp.Exp (Flow.Exp.Nml _2) )
# 673 "parser.ml"
             in
            _menhir_goto_vh_frm_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv334)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv335 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv336)) : 'freshtv338)
    | MenhirState76 | MenhirState41 | MenhirState65 | MenhirState43 | MenhirState50 | MenhirState61 | MenhirState53 | MenhirState55 | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv341 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv339 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv340)) : 'freshtv342)
    | _ ->
        _menhir_fail ()

and _menhir_reduce10 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp_app -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_app)) = _menhir_stack in
    let _v : 'tv_exp = 
# 160 "parser.mly"
            ( _1 )
# 711 "parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_tail_code : _menhir_env -> 'ttv_tail -> 'tv_tail_code -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv289 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
    let (_v : 'tv_tail_code) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv287 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
    let ((_2 : 'tv_tail_code) : 'tv_tail_code) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)) = _menhir_stack in
    let _v : 'tv_vh_frm_code = 
# 92 "parser.mly"
    (
      match _2 with
      | None -> _1
      | Some t -> Exp.Seq (_1,t)
    )
# 731 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv285) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_vh_frm_code) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv245) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv243) = Obj.magic _menhir_stack in
        ((let _v : 'tv_coprd_tail = 
# 109 "parser.mly"
    ( [] )
# 747 "parser.ml"
         in
        _menhir_goto_coprd_tail _menhir_env _menhir_stack _v) : 'freshtv244)) : 'freshtv246)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv255) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail)) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv253) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail)) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _, (_2 : 'tv_vh_frm_code)), (_3 : 'tv_coprd_tail)), _, (_5 : 'tv_vh_frm_code)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_coprd = 
# 105 "parser.mly"
    ( Some (Exp.CoPrd ([_2]@_3@[_5])) )
# 761 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv251) = _menhir_stack in
        let (_v : 'tv_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv249) = Obj.magic _menhir_stack in
        let (_v : 'tv_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv247) = Obj.magic _menhir_stack in
        let ((_1 : 'tv_coprd) : 'tv_coprd) = _v in
        ((let _v : 'tv_tail_code = 
# 101 "parser.mly"
          ( _1 )
# 775 "parser.ml"
         in
        _menhir_goto_tail_code _menhir_env _menhir_stack _v) : 'freshtv248)) : 'freshtv250)) : 'freshtv252)) : 'freshtv254)) : 'freshtv256)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv259 * 'tv_coprd_tail)) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv257 * 'tv_coprd_tail)) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, (_1 : 'tv_coprd_tail)), _, (_3 : 'tv_vh_frm_code)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_coprd_tail = 
# 110 "parser.mly"
                                  ( _1@[_3] )
# 788 "parser.ml"
         in
        _menhir_goto_coprd_tail _menhir_env _menhir_stack _v) : 'freshtv258)) : 'freshtv260)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv263) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv261) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, (_2 : 'tv_vh_frm_code)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_tail_code = 
# 100 "parser.mly"
                    ( Some _2 )
# 801 "parser.ml"
         in
        _menhir_goto_tail_code _menhir_env _menhir_stack _v) : 'freshtv262)) : 'freshtv264)
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv283 * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv281 * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_code)) = _menhir_stack in
        let _v : 'tv_lc_code = 
# 37 "parser.mly"
                ( _1 )
# 813 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv279) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv277 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 823 "parser.ml"
        )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv275 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 831 "parser.ml"
        )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_lc_code) : 'tv_lc_code) = _v in
        ((let (((_menhir_stack, _menhir_s), (_2 : (
# 8 "parser.mly"
       (string)
# 838 "parser.ml"
        ))), (_3 : 'tv_typ_def)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 34 "parser.mly"
                                ( (_2,_5) )
# 845 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv273) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv271 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv267 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv265 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_glb_etr)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 20 "parser.mly"
      (Flow.buf)
# 867 "parser.ml"
            ) = 
# 24 "parser.mly"
                ( Flow.Glb _1 )
# 871 "parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv266)) : 'freshtv268)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv269 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv270)) : 'freshtv272)) : 'freshtv274)) : 'freshtv276)) : 'freshtv278)) : 'freshtv280)) : 'freshtv282)) : 'freshtv284)
    | _ ->
        _menhir_fail ()) : 'freshtv286)) : 'freshtv288)) : 'freshtv290)

and _menhir_goto_h_frm : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_h_frm -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv241 * _menhir_state * 'tv_h_frm) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARR ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv231) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | APP ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | GL_NAM _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | INT _v ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | L_PRN ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | L_RCD ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | ROT ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61) : 'freshtv232)
    | ARR_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv235) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv233) = Obj.magic _menhir_stack in
        ((let _1 = () in
        let _v : 'tv_tail = 
# 134 "parser.mly"
            ( None )
# 926 "parser.ml"
         in
        _menhir_goto_tail _menhir_env _menhir_stack _v) : 'freshtv234)) : 'freshtv236)
    | CO_PRD_STT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv237) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | APP ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | GL_NAM _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | INT _v ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | L_PRN ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | L_RCD ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | ROT ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53) : 'freshtv238)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv239 * _menhir_state * 'tv_h_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv240)) : 'freshtv242)

and _menhir_goto_buffer : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 20 "parser.mly"
      (Flow.buf)
# 964 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv229) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 20 "parser.mly"
      (Flow.buf)
# 973 "parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv227) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 20 "parser.mly"
      (Flow.buf)
# 981 "parser.ml"
    )) : (
# 20 "parser.mly"
      (Flow.buf)
# 985 "parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv228)) : 'freshtv230)

and _menhir_goto_exp_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv225 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | GL_NAM _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | INT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | L_RCD ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | ROT ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | R_RCD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv223 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState20 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv221 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_exp = 
# 161 "parser.mly"
                        ( Exp.Rcd _2 )
# 1023 "parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv222)) : 'freshtv224)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20) : 'freshtv226)

and _menhir_goto_exp_app : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_app -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState17 | MenhirState20 | MenhirState22 | MenhirState35 | MenhirState32 | MenhirState30 | MenhirState28 | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv205 * _menhir_state * 'tv_exp_app) = Obj.magic _menhir_stack in
        (_menhir_reduce10 _menhir_env (Obj.magic _menhir_stack) : 'freshtv206)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv213 * _menhir_state) * _menhir_state * 'tv_exp_app) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | TEST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv209 * _menhir_state) * _menhir_state * 'tv_exp_app) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv207 * _menhir_state) * _menhir_state * 'tv_exp_app) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_app)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp_top = 
# 143 "parser.mly"
                      ( Flow.Exp.Agl _2 )
# 1057 "parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv208)) : 'freshtv210)
        | L_APP | MLT | PLS ->
            _menhir_reduce10 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv211 * _menhir_state) * _menhir_state * 'tv_exp_app) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)) : 'freshtv214)
    | MenhirState76 | MenhirState41 | MenhirState65 | MenhirState43 | MenhirState50 | MenhirState61 | MenhirState53 | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv219 * _menhir_state * 'tv_exp_app) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL | APP | ARR | ARR_END | CO_PRD_STT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv215 * _menhir_state * 'tv_exp_app) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_app)) = _menhir_stack in
            let _v : 'tv_exp_top = 
# 144 "parser.mly"
            ( Flow.Exp.Nml _1 )
# 1082 "parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv216)
        | L_APP | MLT | PLS ->
            _menhir_reduce10 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv217 * _menhir_state * 'tv_exp_app) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv218)) : 'freshtv220)
    | _ ->
        _menhir_fail ()

and _menhir_goto_vh_frm_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_vh_frm_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState80 | MenhirState77 | MenhirState74 | MenhirState71 | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv195 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv185) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CNN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState80
            | EXP ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState80
            | AGL | APP | ARR | ARR_END | CO_PRD_STT | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
                _menhir_reduce23 _menhir_env (Obj.magic _menhir_stack) MenhirState80
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80) : 'freshtv186)
        | ARR_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv189) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv187) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_tail_code = 
# 99 "parser.mly"
            ( None )
# 1133 "parser.ml"
             in
            _menhir_goto_tail_code _menhir_env _menhir_stack _v) : 'freshtv188)) : 'freshtv190)
        | CO_PRD_STT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv191) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CNN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState71
            | EXP ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState71
            | AGL | APP | ARR | ARR_END | CO_PRD_STT | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
                _menhir_reduce23 _menhir_env (Obj.magic _menhir_stack) MenhirState71
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71) : 'freshtv192)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv193 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)) : 'freshtv196)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv203 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv199 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv197 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 20 "parser.mly"
      (Flow.buf)
# 1175 "parser.ml"
            ) = 
# 23 "parser.mly"
                   ( Flow.Evo _1 )
# 1179 "parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv198)) : 'freshtv200)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv201 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv202)) : 'freshtv204)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState41 | MenhirState43 | MenhirState50 | MenhirState61 | MenhirState53 | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv179) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_exp_top) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv177) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_exp_top) : 'tv_exp_top) = _v in
        ((let _v : 'tv_h_frm = 
# 130 "parser.mly"
            ( Exp.Exp _1 )
# 1207 "parser.ml"
         in
        _menhir_goto_h_frm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv178)) : 'freshtv180)
    | MenhirState76 | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv183 * _menhir_state * 'tv_exp_top_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_exp_top) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv181 * _menhir_state * 'tv_exp_top_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_exp_top) : 'tv_exp_top) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_top_lst)) = _menhir_stack in
        let _v : 'tv_exp_top_lst = 
# 149 "parser.mly"
                        ( _1@[_2] )
# 1223 "parser.ml"
         in
        _menhir_goto_exp_top_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv182)) : 'freshtv184)
    | _ ->
        _menhir_fail ()

and _menhir_run67 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_reduce23 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | APP | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT | R_RCD ->
        _menhir_reduce18 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv153) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv151) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState10 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | Z ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11) : 'freshtv152)
        | Z ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10) : 'freshtv154)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv157) * _menhir_state * 'tv_typs) * _menhir_state) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | Z ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | DEF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv155) * _menhir_state * 'tv_typs) * _menhir_state) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _, (_2 : 'tv_typs)), _), _, (_4 : 'tv_typs)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ_def = 
# 41 "parser.mly"
                      ( Flow.St.Rcd _2 )
# 1302 "parser.ml"
             in
            _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv156)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12) : 'freshtv158)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv161 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 1314 "parser.ml"
        ))) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState89
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv159 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 1326 "parser.ml"
            ))) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState89 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState90
            | Z ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState90
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState90) : 'freshtv160)
        | Z ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState89
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState89) : 'freshtv162)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv175 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 1352 "parser.ml"
        ))) * _menhir_state * 'tv_typs) * _menhir_state) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | Z ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv173 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 1366 "parser.ml"
            ))) * _menhir_state * 'tv_typs) * _menhir_state) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            ((let (((((_menhir_stack, _menhir_s), (_3 : (
# 8 "parser.mly"
       (string)
# 1371 "parser.ml"
            ))), _, (_5 : 'tv_typs)), _), _, (_7 : 'tv_typs)) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_glb_mode = 
# 30 "parser.mly"
                                  ( (_3,Flow.St.Rcd _5) )
# 1380 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv171) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_glb_mode) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv169 * _menhir_state * 'tv_glb_mode) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EOF ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv165 * _menhir_state * 'tv_glb_mode) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv163 * _menhir_state * 'tv_glb_mode) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, (_1 : 'tv_glb_mode)) = _menhir_stack in
                let _2 = () in
                let _v : (
# 20 "parser.mly"
      (Flow.buf)
# 1402 "parser.ml"
                ) = 
# 25 "parser.mly"
                 (
      let (x,y) = _1 in
      (Flow.Glb_mode (x,y)) )
# 1408 "parser.ml"
                 in
                _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv164)) : 'freshtv166)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv167 * _menhir_state * 'tv_glb_mode) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)) : 'freshtv170)) : 'freshtv172)) : 'freshtv174)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91) : 'freshtv176)
    | _ ->
        _menhir_fail ()

and _menhir_reduce18 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst = 
# 139 "parser.mly"
    ( [] )
# 1430 "parser.ml"
     in
    _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_const : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_const -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv149) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_const) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv147) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_const) : 'tv_const) = _v in
    ((let _v : 'tv_exp_app = 
# 152 "parser.mly"
          ( _1 )
# 1447 "parser.ml"
     in
    _menhir_goto_exp_app _menhir_env _menhir_stack _menhir_s _v) : 'freshtv148)) : 'freshtv150)

and _menhir_goto_exp_top_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_top_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState67 | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv141 * _menhir_state) * _menhir_state * 'tv_exp_top_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | APP ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | GL_NAM _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
        | INT _v ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
        | L_PRN ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | L_RCD ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | ROT ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv139 * _menhir_state) * _menhir_state * 'tv_exp_top_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState65 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv137 * _menhir_state) * _menhir_state * 'tv_exp_top_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_top_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp_top = 
# 145 "parser.mly"
                            ( Flow.Exp.RcdTop _2 )
# 1489 "parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv138)) : 'freshtv140)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65) : 'freshtv142)
    | MenhirState0 | MenhirState16 | MenhirState80 | MenhirState71 | MenhirState77 | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145 * _menhir_state * 'tv_exp_top_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | APP ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | GL_NAM _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | INT _v ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | L_PRN ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | L_RCD ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | ROT ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | ARR | ARR_END | CO_PRD_STT | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv143 * _menhir_state * 'tv_exp_top_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_top_lst)) = _menhir_stack in
            let _v : 'tv_vh_frm_top = 
# 114 "parser.mly"
                ( Exp.Exp (Exp.Rcd _1) )
# 1523 "parser.ml"
             in
            _menhir_goto_vh_frm_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv144)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76) : 'freshtv146)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv127 * 'tv_rcd_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_typ) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv125 * 'tv_rcd_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_typ) : 'tv_typ) = _v in
        ((let (_menhir_stack, (_1 : 'tv_rcd_lst)) = _menhir_stack in
        let _v : 'tv_rcd_lst = 
# 81 "parser.mly"
                ( _1@[_2] )
# 1549 "parser.ml"
         in
        _menhir_goto_rcd_lst _menhir_env _menhir_stack _v) : 'freshtv126)) : 'freshtv128)
    | MenhirState89 | MenhirState91 | MenhirState10 | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_typ) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv129 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_typ) : 'tv_typ) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typs)) = _menhir_stack in
        let _v : 'tv_typs = 
# 70 "parser.mly"
             ( _1@[_2] )
# 1565 "parser.ml"
         in
        _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv130)) : 'freshtv132)
    | MenhirState88 | MenhirState90 | MenhirState3 | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv135) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_typ) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv133) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_typ) : 'tv_typ) = _v in
        ((let _v : 'tv_typs = 
# 69 "parser.mly"
        ( [_1] )
# 1580 "parser.ml"
         in
        _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv134)) : 'freshtv136)
    | _ ->
        _menhir_fail ()

and _menhir_goto_rcd_lst : _menhir_env -> 'ttv_tail -> 'tv_rcd_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv123 * _menhir_state) * 'tv_rcd_lst) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | R_RCD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv121 * _menhir_state) * 'tv_rcd_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState6 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv119 * _menhir_state) * 'tv_rcd_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let ((_menhir_stack, _menhir_s), (_2 : 'tv_rcd_lst)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_rcd = 
# 77 "parser.mly"
                        ( Flow.St.Rcd _2 )
# 1610 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv117) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_rcd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv115) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_rcd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv113) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_rcd) : 'tv_rcd) = _v in
        ((let _v : 'tv_typ = 
# 74 "parser.mly"
        ( _1 )
# 1627 "parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv114)) : 'freshtv116)) : 'freshtv118)) : 'freshtv120)) : 'freshtv122)
    | Z ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6) : 'freshtv124)

and _menhir_run19 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce18 _menhir_env (Obj.magic _menhir_stack) MenhirState19

and _menhir_run18 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv111) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_const = 
# 165 "parser.mly"
        ( Exp.Root )
# 1653 "parser.ml"
     in
    _menhir_goto_const _menhir_env _menhir_stack _menhir_s _v) : 'freshtv112)

and _menhir_run42 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CNN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv109 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState42 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | APP ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | GL_NAM _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
        | INT _v ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
        | L_PRN ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | L_RCD ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | ROT ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43) : 'freshtv110)
    | AGL ->
        _menhir_reduce23 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | APP | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT | R_RCD ->
        _menhir_reduce18 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42

and _menhir_run22 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | GL_NAM _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | INT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | L_RCD ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | ROT ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22

and _menhir_run23 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 9 "parser.mly"
       (int)
# 1724 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv107) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 9 "parser.mly"
       (int)
# 1734 "parser.ml"
    )) : (
# 9 "parser.mly"
       (int)
# 1738 "parser.ml"
    )) = _v in
    ((let _v : 'tv_const = 
# 164 "parser.mly"
        ( Exp.Z _1 )
# 1743 "parser.ml"
     in
    _menhir_goto_const _menhir_env _menhir_stack _menhir_s _v) : 'freshtv108)

and _menhir_run24 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "parser.mly"
       (string)
# 1750 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv105) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 8 "parser.mly"
       (string)
# 1760 "parser.ml"
    )) : (
# 8 "parser.mly"
       (string)
# 1764 "parser.ml"
    )) = _v in
    ((let _v : 'tv_const = 
# 166 "parser.mly"
            ( Exp.Gl_call _1 )
# 1769 "parser.ml"
     in
    _menhir_goto_const _menhir_env _menhir_stack _menhir_s _v) : 'freshtv106)

and _menhir_run25 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | GL_NAM _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | INT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | L_RCD ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | ROT ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25

and _menhir_run44 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | GL_NAM _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | INT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | L_RCD ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | ROT ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44

and _menhir_reduce23 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_top_lst = 
# 148 "parser.mly"
    ( [] )
# 1824 "parser.ml"
     in
    _menhir_goto_exp_top_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_typ_def : _menhir_env -> 'ttv_tail -> 'tv_typ_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv103 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 1835 "parser.ml"
    )) * 'tv_typ_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv99 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 1845 "parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CNN ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | EXP ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | AGL | APP | ARR | ARR_END | CO_PRD_STT | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
            _menhir_reduce23 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16) : 'freshtv100)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv101 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 1867 "parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)) : 'freshtv104)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv29 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 1880 "parser.ml"
        ))) * _menhir_state * 'tv_typs) * _menhir_state) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv31 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 1889 "parser.ml"
        ))) * _menhir_state * 'tv_typs) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState89 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv33 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 1898 "parser.ml"
        ))) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv35 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 1907 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv37) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv38)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv39 * 'tv_coprd_tail)) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv40)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv41 * _menhir_state * 'tv_exp_top_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv43) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail)) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv45) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv46)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv49 * _menhir_state) * _menhir_state * 'tv_exp_top_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState61 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv51) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv52)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv53) * _menhir_state * 'tv_vh_frm)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv55) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv56)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv57 * _menhir_state * 'tv_vh_frm_lst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv61 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv67 * _menhir_state) * _menhir_state * 'tv_exp)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv69 * _menhir_state * 'tv_exp)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv71 * _menhir_state * 'tv_exp)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv73 * _menhir_state * 'tv_exp)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv79 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv81 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv83 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv85 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 2031 "parser.ml"
        )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv87) * _menhir_state * 'tv_typs) * _menhir_state) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv89) * _menhir_state * 'tv_typs) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv91) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv93 * _menhir_state) * 'tv_rcd_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv96)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv98)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv27) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 73 "parser.mly"
      ( Flow.St.Z None )
# 2074 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv28)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv25) = Obj.magic _menhir_stack in
    ((let _v : 'tv_rcd_lst = 
# 80 "parser.mly"
    ( [] )
# 2087 "parser.ml"
     in
    _menhir_goto_rcd_lst _menhir_env _menhir_stack _v) : 'freshtv26)

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | GL_NAM _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | INT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | L_RCD ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | ROT ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | APP ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | GL_NAM _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | INT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | L_RCD ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | ROT ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and buffer : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 20 "parser.mly"
      (Flow.buf)
# 2154 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv23) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CNN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EXP ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LCE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LCE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv9 * _menhir_state) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv5 * _menhir_state)) = Obj.magic _menhir_stack in
                let (_v : (
# 8 "parser.mly"
       (string)
# 2197 "parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | CLN ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv1 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 2208 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | L_RCD ->
                        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState88
                    | Z ->
                        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState88
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState88) : 'freshtv2)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv3 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 2228 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv4)) : 'freshtv6)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv7 * _menhir_state)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv8)) : 'freshtv10)
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv17 * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 8 "parser.mly"
       (string)
# 2245 "parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CLN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv11) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | L_RCD ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState3
                | Z ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3) : 'freshtv12)
            | DEF ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv13) = Obj.magic _menhir_stack in
                ((let _v : 'tv_typ_def = 
# 40 "parser.mly"
    ( Flow.St.Rcd [] )
# 2271 "parser.ml"
                 in
                _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv14)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv15 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 2281 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)) : 'freshtv18)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv19 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)) : 'freshtv22)
    | AGL | APP | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
        _menhir_reduce23 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv24))

# 233 "/home/kohe/.opam/system/lib/menhir/standard.mly"
  

# 2302 "parser.ml"
