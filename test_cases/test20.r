/* thunderbolt & sung */
/*
	testing subpatch with arguments and declaraing local variables
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
	string b;

	object("test object in subpatch", 0, 0);
}
