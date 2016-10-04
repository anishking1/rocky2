(* thunderbolt & sung *)

(* semantic checking for the rocky2 compiler *)

open Ast

module StringMap = Map.Make(String)

(* Semantic checking of a program. Returns void if successful,
   throws an exception if something is wrong.

   Check each global variable, then check each function *)

let check (globals, functions) =

	(* Raise an exception if the given list has a duplicate *)
	let report_duplicate exceptf list =
		let rec helper = function
			  n1 :: n2 :: _ when n1 = n2 -> raise (Failure (exceptf n1))
			| _ :: t -> helper t
			| [] -> ()
		in helper (List.sort compare list)
	in

	(* Raise an exception if a give binding is to a void type *)
	let check_not_void exceptf = function
		  (Void, n) -> raise (Failure (exceptf n))
		| _ -> ()
	in

	(* Raise an exception of the given rvalue type cannot be assigned to
	   the given lvalue type *)
	let check_assign lvaluet rvaluet err =
		if lvaluet == rvaluet then lvaluet else raise err
	in

	(**** Checking Global Variables ****)
	List.iter (check_not_void (fun n -> "illegal void global " ^ n)) globals;

	let xa = [(Void, "X"); (Void, "A"); (Void, "N")] @ globals in
	report_duplicate (fun n -> "duplicate global " ^ n) (List.map snd xa);

 	(**** Checking Functions ****)
	report_duplicate (fun n -> "duplicate function " ^ n)
		(List.map (fun fd -> fd.fname) functions);

	(* Function declaration for a named function *)
	let built_in_decls = StringMap.add "object"
		{ fname = "object"; formals_opt = [0; 0; 0; 0];
		  locals = []; body = [] } (StringMap.add "kfi"
     		{ fname = "kfi"; formals_opt = [0; 0; 0; 0];
		  locals = []; body = [] }(StringMap.add "connectS"
     		{ fname = "connectS"; formals_opt = [0; 0; 0; 0];
		  locals = []; body = [] } (StringMap.singleton "connectW"
     		{ fname = "connectW"; formals_opt = [0; 0; 0; 0];
		  locals = []; body = [] })))

	in

	let function_decls = List.fold_left (fun m fd -> StringMap.add fd.fname fd m)
				built_in_decls functions
	in

	let function_decl s = try StringMap.find s function_decls
		with Not_found -> raise (Failure ("unrecognized function " ^ s))
	in

	let _ = function_decl "main" in (* Ensure "main" is defined *)

	let check_function func =
		List.iter (check_not_void (fun n -> "illegal void local " ^ n ^
			" in " ^ func.fname)) func.locals;

		let xa2 = [(Void, "X"); (Void, "A"); (Void, "N")] @ func.locals in
		report_duplicate (fun n -> "duplicate local " ^ n ^ " in " ^ func.fname)
			(List.map snd xa2);

	(* Type of each variable (global or local *)
	let symbols = List.fold_left (fun m (t, n) -> StringMap.add n t m)
		StringMap.empty (xa @ func.locals)
	in

	let type_of_identifier s =
		try StringMap.find s symbols
		with Not_found -> raise (Failure ("undeclared identifier " ^ s))
	in

	(* Return the type of an expression or throw an exception *)
	let rec expr = function
		  Literal _ -> Int
		| BoolLit _ -> Bool
		| Str _ -> String
		| Id s -> type_of_identifier s
		| Binop(e1, op, e2) as e -> let t1 = expr e1 and t2 = expr e2 in
		   (match op with
			  Add | Sub | Mult | Div when t1 = Int && t2 = Int -> Int
			| Equal | Neq when t1 = t2 -> Bool
			| Less | Leq | Greater | Geq when t1 = Int && t2 = Int -> Bool
			| And | Or when t1 = Bool && t2 = Bool -> Bool
			| _ -> raise (Failure ("illegal binary operator " ^
				string_of_typ t1 ^ " " ^ string_of_op op ^ " " ^
				string_of_typ t2 ^ " in " ^ string_of_expr e))
		   )
		| Unop(op, e) as ex -> let t = expr e in
		   (match op with
			  Neg when t = Int -> Int
			| Not when t = Bool -> Bool
			| _ -> raise (Failure ("illegal unary operator " ^ string_of_uop op ^
					string_of_typ t ^ " in " ^ string_of_expr ex)))
		| Noexpr -> Void
		| Assign(var, e) as ex -> let lt = type_of_identifier var
					  and rt = expr e in
			check_assign lt rt (Failure ("illegal assignment " ^
				string_of_typ lt ^ " = " ^ string_of_typ rt ^ " in " ^
				string_of_expr ex))
		| Call(fname, actuals) as call ->
			if (StringMap.mem fname function_decls) = false then
				raise (Failure("function not exist in " ^
					string_of_expr call))
			else
			(if fname = "object" then
			   (if  List.length actuals != 3 then
				raise (Failure("expecting 3 arguments in " ^
					string_of_expr call))
			    else
				List.iter2 (fun ft e -> let et = expr e in
				  ignore (check_assign ft et
				    (Failure("illegal actual argument found " ^
				     string_of_typ et ^ " expected " ^ string_of_typ ft
				     ^ " in " ^ string_of_expr e))))
			    [String; Int; Int] actuals; Void)
			else
			(if fname = "kfi" then
			   (if  List.length actuals != 2 then
				raise (Failure("expecting 2 arguments in " ^
					string_of_expr call))
			    else
				List.iter2 (fun ft e -> let et = expr e in
				  ignore (check_assign ft et
				    (Failure("illegal actual argument found " ^
				     string_of_typ et ^ " expected " ^ string_of_typ ft
				     ^ " in " ^ string_of_expr e))))
			    	[Void; String] actuals; Void)
			else
			(if fname = "connectW" then
			   (if  List.length actuals != 4 then
				raise (Failure("expecting 4 arguments in " ^
					string_of_expr call))
			    else
				List.iter2 (fun ft e -> let et = expr e in
				  ignore (check_assign ft et
				    (Failure("illegal actual argument found " ^
				     string_of_typ et ^ " expected " ^ string_of_typ ft
				     ^ " in " ^ string_of_expr e))))
			    	[String; Int; String; Int] actuals; Void)
			else
			(if fname = "connectS" then
			   (if  List.length actuals != 4 then
				raise (Failure("expecting 4 arguments in " ^
					string_of_expr call))
			    else
				List.iter2 (fun ft e -> let et = expr e in
				  ignore (check_assign ft et
				    (Failure("illegal actual argument found " ^
				     string_of_typ et ^ " expected " ^ string_of_typ ft
				     ^ " in " ^ string_of_expr e))))
			    	[Int; Int; Int; Int] actuals; Void)
			else
			    (if List.length actuals != 3 then
				raise (Failure("expecting 3 arguments in " ^
					string_of_expr call))
			     else
				List.iter2 (fun ft e -> let et = expr e in
					ignore (check_assign ft et
					   (Failure ("illegal actual argument found " ^
					   string_of_typ et ^ " expected " ^ string_of_typ
					   ft ^ " in " ^ string_of_expr e))))
				[String; Int; Int] actuals; Void)))))

		in

		let check_bool_expr e = if expr e != Bool
		    then raise (Failure ("expected Boolean expression in " ^ string_of_expr e))
		else () in

		(* Verify a statement or throw an exception *)
		let rec stmt = function
			  Block sl -> let rec check_block = function
				  Block sl :: ss -> check_block (sl @ ss)
				| s :: ss -> stmt s ; check_block ss
				| [] -> ()
				in check_block sl
			| Expr e -> ignore (expr e)
			| If(p, b1, b2) -> check_bool_expr p; stmt b1; stmt b2
			| For(e1, e2, e3, st) -> ignore (expr e1); check_bool_expr e2;
						 ignore (expr e3); stmt st
			| While(p, s) -> check_bool_expr p; stmt s
		in

		stmt (Block func.body)

	in
	List.iter check_function functions
