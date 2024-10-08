type number =
  | Int of int
  | Float of float;;


let multiply x y = match x,y with
  |Int x, Int y ->  Int (x*y)
  |Int x, Float y -> Float (float_of_string(string_of_float(float_of_int(x)*.y)))
  |Float x, Int y -> Float (float_of_string(string_of_float(x *.float_of_int(y))))
  |Float x, Float y -> Float (float_of_string(string_of_float(x*.y)));; 

let divide x y =  match x,y with
  |Int x, Int y -> if y==0 then raise(invalid_arg "Division by zero") else Int (x/y)
  |Int x, Float y -> if y==0.0 then raise(invalid_arg "Division by zero") else Float (float_of_string(string_of_float(float_of_int(x)/.y)))
  |Float x, Int y -> if y==0 then raise(invalid_arg "Division by zero") else Float (float_of_string(string_of_float(x /.float_of_int(y))))
  |Float x, Float y -> if y==0.0 then raise(invalid_arg "Division by zero") else Float (float_of_string(string_of_float(x/.y)));; 

let add x y = match x,y with
  |Int x, Int y ->  Int (x+y)
  |Int x, Float y -> Float (float_of_int(x)+.y)
  |Float x, Int y -> Float (x+.float_of_int(y))
  |Float x, Float y -> Float (x+.y);; 

let subtract x y = match x,y with
  |Int x, Int y ->  Int (x-y)
  |Int x, Float y -> Float (float_of_int(x)-.y)
  |Float x, Int y -> Float (x -. float_of_int(y))
  |Float x, Float y -> Float (x-.y);; 


let rec postfix_calculator = function
  |[] -> Int 0
  |`Num x::[] -> x
  |x::y::[] -> Int 0
  |`Num x::`Num y::`Op z::xs ->
      let a = match z with
        |"*" -> `Num (multiply x y) 
        |"/" -> `Num (divide x y)
        |"+" -> `Num (add x y)
        |"-" -> `Num (subtract x y)
        | _ -> failwith "Unknown operator" 
      in postfix_calculator (a::xs)
  | _ -> failwith "Invalid input";;  (* Handle invalid cases *)
  
          
let tokens1 = [`Num (Int 3); `Num (Float 3.2); `Op "*"; `Num (Int 2); `Op "+"];;
postfix_calculator tokens1;;
(* Example 1: 3 3.2 * 2 + => Float(11.6) *)
let tokens1 = [`Num (Int 3); `Num (Float 3.2); `Op "*"; `Num (Int 2); `Op "+"]
in assert (postfix_calculator tokens1 = Float 11.6);
(* Example 2: 4 2 / => Int(2) *)
let tokens2 = [`Num (Int 4); `Num (Int 2); `Op "/"] in
assert (postfix_calculator tokens2 = Int 2);
(* Example 3: 3 0 / => Division by zero (raises exception) *)
let tokens3 = [`Num (Int 3); `Num (Int 0); `Op "/"] in try let _ =
                                                             postfix_calculator tokens3 in assert false (* Should raise exception *) with
  Invalid_argument "Division by zero" -> assert true;;

