type number = 
  | Int of int 
  | Float of float ;;

(* allows a value of type numebr to be 
either an integer or a float *)

let multiply (x, y) = function  
  | Int x, Int y -> Int(x*y)
  | Int x, Float y -> Float(float_of_int(x) *. y)
  | Float x, Int y -> Float(x *. (float_of_int(y)))
  | Float x, Float y -> Float(x *. y)
;;

let add (x, y) = function 
  | Int x, Int y -> Int(x+y)
  | Int x, Float y -> Float(float_of_int(x) +. y)
  | Float x, Int y -> Float(x +. (float_of_int(y)))
  | Float x, Float y -> Float(x +. y)

;; 

let divide (x,y) = function  
  | Int x, Int y -> if y == 0 then 
    raise(invalid_arg "Division by zero")
  else Int(x/y)
  |Int x, Float y -> if y == 0.0 then 
    raise(invalid_arg "Division by Zero")
  else Float(float_of_int(x) /. y)
  | Float x, Int y -> if y = 0 then 
    raise (invalid_arg "Division by Zero")
  else Float(x /. float_of_int(y))
  | Float x, Float y -> if y = 0.0 then 
    raise(invalid_arg "Division by zero") 
  else Float(x /. y) 
;;

let subtract (x,y ) = function  
  | Int x, Int y -> Int(x-y)
  | Int x, Float y -> Float(float_of_int(x) -. y)
  | Float x, Int y -> Float(x -. (float_of_int(y)))
  | Float x, Float y -> Float(x -. y)
;;

let rec postfix_calculator = function 
  | [] -> failwith "Invalid input"
  | 'Num x::[] -> x
  | x::y::[] -> failwith "Invalid input"
  | 'Num x::'Num y:: 'Op x::xs ->
    let a = match z with 
      |"*" -> 'Num(multiply x y)
      |"/" -> 'Num(divide x y)
      |"+" -> 'Num(add x y )
      |"-"-> 'Num(subtract x y)
      | _ -> failwith "Unknown Operator"
  in postfix_calculator (a::xs)
| _ -> failwith "Invalid input";; 

