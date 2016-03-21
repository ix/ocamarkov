open Markov
open Core.Std

let () =
  match In_channel.input_line stdin with
    | Some filename ->
        (match generate 25 @@ In_channel.read_all filename with
          | Some data -> Printf.printf "%s\n" data
          | None -> ())
    | None -> ()
