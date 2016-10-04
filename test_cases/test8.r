/* thunderbolt & sung */
/*
	test substituting variables when calling a function
	expected: 
		#N canvas 1 2 3 4 5;
		#X obj 0 0 hello world!;
	actual: 
		#N canvas 1 2 3 4 5;
		#X obj 0 0 hello world!;
*/
int a;
string b;
canvas main(1,2,3,4,5) {
	a = 0;
	b = "hello world!";

	object(b, a, a);
}
