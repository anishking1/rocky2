/* thunderbolt & sung */
/*
	testing subpatch(function declaration)
	expected: 
		#N canvas 1 2 3 4 5;
		#X obj 3 0 Hello World!;
	actual: 
		#N canvas 1 2 3 4 5;
		#X obj 3 0 Hello World!;
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
}

canvas subpatch_test() {

}
