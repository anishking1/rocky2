/* thunderbolt & sung */
/*
	testing using global variables in subpatch
		#N canvas 1 2 3 4 5;
		#X obj 3 0 Hello World!;
		#N canvas 0 0 0 0 0 test subpatch;
		#X obj 3 0 test global variables a and b, a = 3;
		#X restore 0 0 pd test subpatch;
		
	actual: 
		#N canvas 1 2 3 4 5;
		#X obj 3 0 Hello World!;
		#N canvas 0 0 0 0 0 test subpatch;
		#X obj 3 0 test global variables a and b, a = 3;
		#X restore 0 0 pd test subpatch;
*/
int a;
string b;
/*
	main canvas has 5 arguments
*/
canvas main(1,2,3,4,5) {
/*
	assigned to global variables
*/
	a = 3;
	b = "Hello World!";

	object(b, a, 0);
	subpatch_test("test subpatch", 0, 0);
}

/*
	subpatch canvas has 4 arguments
*/
canvas subpatch_test(2, 3, 4, 5) {
	int a;
	string c;
	
	b = "test global variables a and b, a = 3";

/*
	There is local variable a, but in this case, global variable
	a has the priority since local variable a isn't initialized
*/
	object(b, a, 0);
}
