/* thunderbolt & sung */
/*
	negative test: subpatch with argument with variables
	expected: 
		build-fail: Parsing Error
		
	actual: 
		build-fail: Parsing Error
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
	only literal is applied to arguments
*/
canvas subpatch_test(a, 3, 4, 5) {
	int a;
	string b;

	object("test object in subpatch", 0, 0);
}
