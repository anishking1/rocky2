/* thunderbolt & sung */
/*
	negative test: testing invalid arguments
	expected: 
		build-fail: illegal argument error
	actual: 
		build-fail: illegal argument error
*/
int a;
string b;
canvas main(1,2,3,4,5) {
	a = 0;
	b = "hello world!";

	object("foo~", "these", "should be int values");
}
