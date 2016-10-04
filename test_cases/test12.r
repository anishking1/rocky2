/* thunderbolt & sung */
/*
	negative test: testing calling function with an argument
			 with uninitialized variable
	expected: 
		build-fail: exception Not_Found
	actual: 
		build-fail: exception Not_Found
*/
int a;
string b;
canvas main(1,2,3,4,5) {
	b = "Error!!!";

	object(b, a, 0);
}
