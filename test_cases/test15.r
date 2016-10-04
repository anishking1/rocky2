/* thunderbolt & sung */
/*
	negative test: testing calling function with an argument
			 with uninitialized local variable
	expected: 
		build-fail: exception Not_Found
	actual: 
		build-fail: exception Not_Found
*/
canvas main(1,2,3,4,5) {
	int a;
	string b;

	a = 3;

	object(b, a, 0);
}
