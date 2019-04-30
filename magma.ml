type app =
  | Atm of int
  | App of app * app
type mid0 =
  | End0 of int
  | Mid0L of int * mid0
  | Mid0R of int * mid0
type mid1 =
  | End1 of mid0
  | Mid1L of mid0 * mid1
  | Mid1R of mid0 * mid1
type mid_tkn =
  | M0L | M0R | M1L | M1R
let rec mid1_to_app m =
  match m with
  | End1 m -> mid0_to_app m
  | Mid1L m0 m1 -> App (mid0_to_app m0) (mid1_to_app m1)
  | Mid1R m0 m1 -> App (mid1_to_app m1) (mid0_to_app m0)
and mid0_to_app m =
  match m with
  | End0 i -> Atm i
  | Mid1L i m0 -> App (Atm i) (mid1_to_app m0)
  | Mid1R i m0 -> App (mid1_to_app m0) (Atm i)
let rec str0_to_str1 (v:int list) (s:mid_tkn list) =
  
let rec gen_mid n =
