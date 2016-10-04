/* thunderbolt & sung */

/*
	negative test: declaring and initializing at the same time for
			 global variables int & string
	expected: build-fail: parsing error;
	actual: build-fail: parsing error;
*/
int a = 1;
string b = 2;
canvas main(1,2,3,4,5) {
}
