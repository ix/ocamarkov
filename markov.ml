open Core.Std

type word_pair = string * string
type state     = word_pair * string list

let (--) start length = List.range start length

let pick xs =
  match xs with
    | [] -> None
    | _ -> Random.self_init () ;
           List.nth xs @@ Random.int @@ List.length xs

let tokenize sentence =
  match sentence with
    | "" -> []
    | _  -> 
      List.map ~f:String.lowercase @@
        Str.split (Str.regexp " +") sentence

let parse words =
  let rec build ss words =
    if List.length words < 3 then
      List.rev ss
    else
      let t = (List.nth_exn words 0, List.nth_exn words 1) in
        build ((t, [List.nth_exn words 2]) :: ss) (List.tl_exn words)
  in build [] words

let parse_string str =
  parse @@ tokenize str

let find wp sl =
  let hits = Caml.List.find_all (fun (p, xs) -> ((=) wp p)) sl in
    List.concat @@ List.map ~f:snd hits

let ref_wp wp =
  (ref @@ fst wp, ref @@ snd wp)

let generate nwords str =
  Some ""

let rec generate' nwords sl words accum = 
  if nwords > 0 then
    let (w1, w2) as words = fst @@ pick sl in
      generate' (nwords - 1) sl accum
  else accum
