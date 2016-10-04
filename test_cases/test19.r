/* thunderbolt & sung */
/*
	testing object function call in subpatch(user-built function)
	expected: 
		#N canvas 1 2 3 4 5;
		#X obj 3 0 Hello World!;
		#N canvas 0 0 0 0 0 test subpatch;
		#X obj 0 0 test object in subpatch;
		#X restore 0 0 pd test subpatch;
		
	actual: 
		#N canvas 1 2 3 4 5;
		#X obj 3 0 Hello World!;
		#N canvas 0 0 0 0 0 test subpatch;
		#X obj 0 0 test object in subpatch;
		#X restore 0 0 pd test subpatch;
*/
int a;
string b;
canvas main(1,2,3,4,5) {
/*
	assigned to global variables
*/
	a = 3;
	b = "Hello World!";

	object(b, a, 0);
	subpatch_test("test subpatch", 0, 0);
}

canvas subpatch_test() {
	object("test object in subpatch", 0, 0);
}
