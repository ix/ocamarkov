type word_pair = bytes * bytes
type state     = word_pair * bytes list

module Markov : sig
  val tokenize : string -> string list
  val pick     : 'a list -> 'a
  val parse    : string list -> state list 
  val parse_string : string -> state list
end = struct
  open Batteries

  let pick xs =
    List.nth xs @@ Random.int @@ (List.length xs - 1)

  let tokenize sentence =
    match sentence with
      | "" -> []
      | _  -> 
        List.map String.lowercase @@
          Str.split (Str.regexp " +") sentence

  let parse xs =
    let rec build ss xs =
      match (List.length xs) < 3 with
        | true -> List.rev ss
        | _ ->
          let t = (List.nth xs 0, List.nth xs 1) in
            build ((t, [List.nth xs 2]) :: ss) (List.tl xs)
    in build [] xs

  let parse_string str =
    parse @@ tokenize str
end

(*
let () =
  Printf.printf "%s" @@ Batteries.dump @@ Markov.parse_string "The quick brown fox jumps over the brown fox who is slow jumps over the brown fox who is dead."
*)
