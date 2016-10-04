(* thunderbolt & sung *)

let _ =
	let lexbuf = Lexing.from_channel stdin in
	let ast = Parser.program Scanner.token lexbuf in
	Semant.check ast;
	let m = (Codegen.translate ast)  ^  (Connect.connect ast) in
	print_string m
