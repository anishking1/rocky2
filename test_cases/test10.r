/* thunderbolt & sung */
/*
	negative test: testing invalid number of arguments
	expected: 
		build-fail: expecting 3 arguments
	actual: 
		build-fail: expecting 3 arguments
*/
int a;
string b;
canvas main(1,2,3,4,5) {
	a = 0;
	b = "hello world!";

	object("foo~", 0, 0, "object must have only 3 arguments");
}
