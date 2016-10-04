(* thunderbolt & sung *)

(* Abstract Syntax Tree and functions for printing it *)

type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq |
          And | Or

type uop = Neg | Not

type typ = Int | Bool | Void | String

type bind = typ * string

type expr =
    Literal of int
  | BoolLit of bool
  | Id of string
  | Str of string
  | Binop of expr * op * expr
  | Unop of uop * expr
  | Assign of string * expr
  | Call of string * expr list
  | Noexpr

type stmt =
    Block of stmt list
  | Expr of expr
  | If of expr * stmt * stmt
  | For of expr * expr * expr * stmt
  | While of expr * stmt

type func_decl = {
    fname : string;
    formals_opt : int list;
    locals : bind list;
    body : stmt list;
  }

type program = bind list * func_decl list

(* Pretty-printing functions *)
let string_of_typ = function
	  Int -> "int"
	| Bool -> "bool"
	| Void -> "void"
	| String -> "string"

let string_of_op = function
	  Add -> "+"
	| Sub -> "-"
	| Mult -> "*"
	| Div -> "/"
	| Equal -> "=="
	| Neq -> "!="
	| Less -> "<"
	| Leq -> "<="
	| Greater -> ">"
	| Geq -> ">="
	| And -> "&&"
	| Or -> "||"

let string_of_uop = function
	  Neg -> "-"
	| Not -> "!"

let rec string_of_expr = function
	  Literal(l) -> string_of_int l
	| BoolLit(true) -> "true"
	| BoolLit(false) -> "false"
	| Id(s) -> s
	| Str(s) -> s
	| Binop(e1, o, e2) ->
		string_of_expr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_expr e2
	| Unop(o, e) -> string_of_uop o ^ string_of_expr e
	| Assign(v, e) -> v ^ " = " ^ string_of_expr e
	| Call(f, el) ->
		f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
	| Noexpr -> ""

let rec string_of_stmt = function
    Block(stmts) ->
      "{\n" ^ String.concat "" (List.map string_of_stmt stmts) ^ "}\n"
  | Expr(expr) -> string_of_expr expr ^ ";\n";
  | If(e, s, Block([])) -> "if (" ^ string_of_expr e ^ ")\n" ^ string_of_stmt s
  | If(e, s1, s2) ->  "if (" ^ string_of_expr e ^ ")\n" ^
      string_of_stmt s1 ^ "else\n" ^ string_of_stmt s2
  | For(e1, e2, e3, s) ->
      "for (" ^ string_of_expr e1  ^ " ; " ^ string_of_expr e2 ^ " ; " ^
      string_of_expr e3  ^ ") " ^ string_of_stmt s
  | While(e, s) -> "while (" ^ string_of_expr e ^ ") " ^ string_of_stmt s
