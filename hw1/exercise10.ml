(* HW 1 *)

open Printf

(* Exercise 10 *)
		
let rec cartesian alst blst =
	let rec cartesian_sub a blst = 
		match blst with [] -> [] | hd :: tl -> (a, hd) :: (cartesian_sub a tl)
	in
	match alst with 
	| hd::tl -> (cartesian_sub hd blst) @ (cartesian tl blst) 
	| [] -> [] ;;
	
(* Test Header *)

let rec contains_all l1 l2 =
	match l1 with
	| [] -> true
	| hd::tl -> if List.mem hd l2 then contains_all tl l2 else false;;

let equivalence a b = (contains_all a b) && (contains_all b a);;

let test t1 t2 answer =
  let v = cartesian t1 t2 in
  (equivalence v answer);;

(* Test Body *)

printf("%B") (test [1;2;3] [] []); print_newline();;
(* true *)

printf("%B") (test [] [4;5;6] []); print_newline();;
(* true *)

printf("%B") (test [1;2;3] [4;5;6] [(1, 4); (1, 5); (1, 6); (2, 4); (2, 5); (2, 6); (3, 4); (3, 5); (3, 6)]); print_newline();;
(* true *)

printf("%B") (test ['a';'b';'c'] [4;5;6] [('a', 4); ('a', 5); ('a', 6); ('b', 4); ('b', 5); ('b', 6); ('c', 4); ('c', 5); ('c', 6)]); print_newline();;
(* true *)

printf("%B") (test [true;false] [4;5;6] [(true, 4); (true, 5); (true, 6); (false, 4); (false, 5); (false, 6)]); print_newline();;
(* true *)

printf("%B") (test [true;false;false] [[1;2;3];[1;4];[5]] [(true, [1; 2; 3]); (true, [1; 4]); (true, [5]); (false, [1; 2; 3]); (false, [1; 4]); (false, [5]); (false, [1; 2; 3]); (false, [1; 4]); (false, [5])]); print_newline();;
(* true *)

printf("%B") (test ["empty"] [[];[]] [("empty", []); ("empty", [])]); print_newline();;
(* true *)


