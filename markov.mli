type word_pair = string * string
type state     = word_pair * string list

val (--) : int -> int -> int list
val tokenize : string -> string list
val pick     : 'a list -> 'a option
val parse    : string list -> state list 
val parse_string : string -> state list
val find : word_pair -> state list -> string list
val generate : int -> string -> string option
val generate' : int -> state list -> word_pair -> string list -> string list
val ref_wp : word_pair -> string ref * string ref
