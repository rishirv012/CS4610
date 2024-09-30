(* 
The purpose of this homework is to get practice with basic OCaml, but especially 
pattern matching and lists. Some functions will need to be recursive. As this 
assignment was produced with our course content in mind, please limit your use of
OCaml functionality to what we have been covering in class.

Given below is a sample OCaml function that uses the "= function" syntax. For this 
assignment, use this syntax. This function, is_first, takes a single value and a 
list and determines if the single value is the same as the first member of the list.
This examples is here to help you with syntax and style. 

let is_first = function
  | (_, []) -> false
  | (a, x::_) -> a = x;;

is_first(1,[1;2;3]);; (* true *)
is_first(1,[3;2;1]);; (* false *)

In order to get more practice with pattern matching, use match-with statements as
shown in the example below instead of if statements.

Instead of this:

let binary = function 
  | x ->
      if x > 9 then 1 
      else 0;;

Use this style: 

let binary = function
  | x -> match (x > 9) with
    | true -> 1            
    | false -> 0;;

binary 0;; (* 0 *)
binary 2;; (* 0 *)
binary 17;; (* 1 *)


You are given the first line of each function and the function signatures for each
problem below, but you'll need to create yourown test cases. 
*)



(* 1. FINISHED
 * Return the list of all elements of a given list that are less than e.
 *  
 * val less : 'a * 'a list -> 'a list 
 *)

let rec less = function
  | (_,[]) -> []
  | (a, x :: xs) -> match (a > x) with
    | true -> let y = less (a,xs) in
        x:: y 
    | false -> less (a,xs);;
assert (less (5, [1; 6; 3; 8; 2]) = [1; 3; 2]);;
assert (less (3, [5; 1; 2; 4]) = [1; 2]);;

(* 2. FINISHED
 * Write a tail-recursive version of `less`. Feel free to create a helper function.
 *  
 * val less_tail : 'a * 'a list -> 'a list 
 *)

let rec less_tail = function
let less_tail (a,lst) = 
  let rec helper(acc, lst) = match lst with 
    | [] -> List.rev acc 
    | x :: xs -> if (x < a) then helper (x::acc, xs)
                 else helper (acc, xs)
  in 
  helper ([], lst)
            
assert (less_tail (5, [1; 6; 3; 8; 2]) = [1; 3; 2]);;
assert (less_tail (3, [5; 1; 2; 4]) = [1; 2]);;

(* 3. FINISHED
 * Returns true if and only if list `list` contains adjacent equal elements.
 *  
 * val repeats : 'a list -> bool 
 *)

let rec repeats = function
  | [] -> false
  | [_] -> false
  | x::y::xs -> when x = y -> true 
  | _ ::y::xs-> repeats (y::xs)

assert (repeats [1; 2; 2; 3] = true);;
assert (repeats [1; 2; 3; 4] = false);;

(* 4. FINISHED
 * Returns the value of polynomial `polynomial` at x.
 * 
 * We represent a polynomial as a list of float coefficients,
 * with the constant coefficient first.
 * 
 * For example: 3x^2 + 5x + 1 would be represented as the list [1.0; 5.0; 3.0],
 * and `eval 2.0 [1.0; 5.0; 3.0]` should evaluate to 23.0. 
 * 
 * For missing terms, 0.0 will be used. 
 * i.e. x^3 - 2x is represented as the list [0.0; -2.0; 0.0; 1.0]
 * 
 * val eval : float * float list -> float 
 *)

let rec eval = function
  let eval (x: float, coefficients: float list) : float = 
    let rec aux coeffs power acc = 
      match coeffs with 
        | [] -> acc
        | h::t -> aux t (power + 1) (acc +. (h*. (x ** float_of_int power)))
        (*increment power by one, add the current value to acc, last expression evaluates to head times x to the power *)
    in 
    aux coefficients 0 0.0


assert (eval (2.0, [1.0; 5.0; 3.0]) = 23.0);;
assert (eval (1.0, [1.0; 5.0; 3.0]) = 9.0);;

(* 5. FINISHED
 * Returns true if e is a member of list list.
 *
 * val is_member : 'a * 'a list -> bool
 *)

let rec is_member = function
let rec is_member (e, lst) = 
  match lst with 
  | [] -> false
  | x::xs -> 
      if x = e then true
      else is_member (e, xs)
  
assert (is_member (2, [1; 2; 3; 4]) = true);;
assert (is_member (5, [1; 2; 3; 4]) = false);;

(* --- Several of the remaining functions build on each other --- *)

(* 6. FINISHED
 * Removes all the elements after the first occurrence of `e`
 * if it is in the list `list`, otherwise returns the empty list. 
 * You do not need to preserve the order of the items in the list.
 * You may want to create a helper function.
 *
 * val remove_after_e : 'a * 'a list -> 'a list 
 *)

let rec remove_after_e = function
let rec remove_after_e (e,lst) = 
  match lst with 
  | [] -> []
  | x :: xs ->
    if x = e then [x]
    else x :: remove_after_e(e, xs)

assert (remove_after_e (3, [1; 2; 3; 4; 5]) = [3; 2; 1]);;
assert (remove_after_e (1, [1; 2; 3]) = [1]);;

(* 7. 
 * Removes the first occurrence of `e` from the list `list`
 * if `a` is in the list, otherwise returns the unmodified list.
 *  
 * val remove_first : 'a * 'a list -> 'a list 
 *)

let rec remove_first = function
  |(_,[]) -> []
  |(a, x :: xs) -> match a == x with 
    |true -> xs
    |false -> let y =  remove_first (a, xs) in x :: y;;
    
assert (remove_first (2, [1; 2; 3; 2]) = [1; 3; 2]);;
assert (remove_first (4, [1; 2; 3]) = [1; 2; 3]);;

(* 8. 
 * Removes all the occurrences of e from the list list
 * if e is in the list, otherwise returns the unmodified list.
 *  
 * val remove_all : 'a * 'a list -> 'a list 
 *)

let rec remove_all= function
  | (_,[]) -> []
  |(a, x :: xs) -> match a == x with 
    |true -> remove_all (a, xs)
    |false -> let y =  remove_all (a, xs) in x :: y;;
assert (remove_all (2, [1; 2; 3; 2]) = [1; 3]);;
assert (remove_all (1, [1; 1; 1]) = []);;

(* 9. 
 * Removes all the elements of list `list` where `(test_fn element)`
 * returns false, otherwise returns the unmodified list.
 *
 * *** Obviously don't use List.filter
 *
 * val remove_if_not : ('a -> bool) * 'a list -> 'a list 
 *)

(* Make a few 'homemade' small functions for testing, such as this one *)
let is_positive x = x > 0;;

let rec remove_if_not = function

assert (remove_if_not (is_positive, [1; -2; 3; 0]) = [1; 3]);;
assert (remove_if_not (is_positive, [-1; -2; -3]) = []);;
