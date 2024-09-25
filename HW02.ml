(*

HW02
 
Team Members (computingID, Name):  
- pnh9yt, James Daniel
- zsx4ey, Kathleen O'Donovan
- npd7af, Rishi Vanga
- skg3cn, Mary Ellen Schuster

List of sources used (or 'none'): 

HW02 consists of writing a number of OCaml functions. For each exercise below,
create an OCaml function that will perform the specified task.

The function definitions have been given to you. Run each function agaist your
own test cases to verify correctness. Include the test cases that you ran and 
the results in the comments for each exercsie. 

Using the problem prompts below, fill in the function definitions. To do this,
replace the line:
     
    failwith "Not Implemented"

with your own code. Your code should be the "body" of the function. Besides the
failwith statment, do not edit or remove anything in the file. Some of the 
contents of this file are needed by the autograder. 

Some tests are provided below via OCaml's built-in assert function; they will
raise an exception on failure and return () on success.

This homework assignment is intended to give you practice with some introductory
OCaml features. Please resist using more advanced OCaml features than the ones
listed below.

;;
int, float, bool, true, false, string, char, unit, ()
+, -, *, /, mod, +., -., *., /., ^
<, >, <=, >=, =, <>, ==, != 
&&, ||, not, let, ->, double quote, single quote

If you think that you need to use functionality that is not listed above,
please post a question to Piazza.
*) 

(* Problem 1 ************************************************************** *)
(*
Goal: Write a function, cube, of type
     int -> int
that cubes a parameter
*)

let cube x = x * x * x;;

(* 
   assert( cube 1 = 1);;
   assert( cube 3 = 27);;
*)
(*
   Other test cases run:
   assert( cube 2 = 8);;
   assert( cube 4 = 64);;
   assert( cube 5 = 125);;
*)


(* Problem 2 ************************************************************** *)
(*
Goal: Write a function, cubef, of type
     float -> float
that cubes a parameter
*)

let cubef x = x *. x *. x;;

(* 
   assert( cubef 1. = 1.);;
   assert( cubef 3. = 27.);;
*)
(*
   Other test cases run:
   assert( cubef 2. = 8.);;
   assert( cubef 4. = 64.);;
   assert( cubef 5. = 125.);;
*)


(* Problem 3 ************************************************************** *)
(*
Goal: Write a function, increment, of type 
     int -> int
that increases an integer by 1
*)

let increment x = x + 1;;

(* 
   assert( increment 7 = 8);;
   assert( increment 100 = 101);;
*)
(*
   Other test cases run:
   assert( increment 50 = 51);;
   assert( increment 201 = 202);;
*)


(* Problem 4 ************************************************************** *)
(*
Goal: Write a function, excited, of type 
     string -> string
that adds an exclamation point on to the end of a string
*)

let excited x = x ^ "!";;

(* 
   assert( excited "hi" = "hi!");;
   assert( excited "R" = "R!");;
*)
(*
   Other test cases run:
   assert( excited "bwaa" = "bwaa!");;
   assert( excited "meow" = "meow!");;
*)


(* Problem 5 ************************************************************** *)
(*
Goal: Write a function, less_than_5, of type 
     int -> bool
that determines if a number is less than 5
*)

let less_than_5 x = x < 5;;

(* 
	assert( less_than_5 3 = true);;
	assert( less_than_5 7 = false);;
	assert( less_than_5 5 = false);;
*)
(*
   Other test cases run:
   assert( less_than_5 100 = false);;
   assert( less_than_5 1 = true);;
*)


(* Problem 6 ************************************************************** *)
(*
Goal: Write a function, the_unit_value, of type 
     int 'a -> unit 
that always evaluates to the unit type
*)

let the_unit_value x = ();;

(* 
	assert( the_unit_value 0 = ());;
	assert( the_unit_value 7 = ());;
*)
(*
   Other test cases run:
   assert( the_unit_value 301 = ());;
   assert( the_unit_value 1 = ());;
*)


(* Problem 7 ************************************************************** *)
(*
Goal: Write a function, middle, of type 
     int -> bool
that determines if a number is between 5 and 10 (exclusive) 
*)

let middle x = x > 5 && x < 10;;

(* 
	assert( middle 0 = false);;
	assert( middle 5 = false);;
	assert( middle 7 = true);;
	assert( middle 12 = false);;
*)
(*
   Other test cases run:
   assert( middle 9 = true);;
   assert( middle 182 = false);;
*)


(* Problem 8 ************************************************************** *)
(*
Goal: Write a function, middlef, of type 
     float -> bool
that determines if a number is between 5 and 10 (exclusive) 
*)

let middlef x = x > 5.0 && x < 10.0;;

(* 
	assert( middlef 0.3 = false);;
	assert( middlef 5.0 = false);;
	assert( middlef 9.99 = true);;
	assert( middlef 14.1 = false);;
*)
(*
   Other test cases run:
   assert( middlef 9.0 = true);;
   assert( midlef 128.0 = false);;
*)
