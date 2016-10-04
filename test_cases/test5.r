/* thunderbolt & sung */

/*
	test initializing global variables int & string
	expected: #N canvas 1 2 3 4 5;
	actual: #N canvas 1 2 3 4 5;
*/
int a;
string b;
canvas main(1,2,3,4,5) {
	a = 0;
	b = "hello world!";
}
