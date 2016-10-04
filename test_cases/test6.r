/* thunderbolt & sung */

/*
	negative test: initializing global variables int with string value
			 and string with int value
	expected: illegal assignment;
	actual: illegal assignment;
*/
int a;
string b;
canvas main(1,2,3,4,5) {
	a = "hello world!";	/* illegal assignment int = string in a = "hello world!" */
	b = 0;			/* illegal assignment string = int in b = 0 */
}
