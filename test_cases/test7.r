/* thunderbolt & sung */
/*
	test calling built-in function object
	expected: 
		#N canvas 1 2 3 4 5;
		#X obj 0 0 foo;
	actual: 
		#N canvas 1 2 3 4 5;
		#X obj 0 0 foo;
*/
int a;
string b;
canvas main(1,2,3,4,5) {
	a = 0;
	b = "hello world!";

	object("foo", 0, 0);
}
