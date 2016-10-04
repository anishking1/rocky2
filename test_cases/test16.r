/* thunderbolt & sung */
/*
	testing using both local and global variables at the same time
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
	it is possible to have duplicated 
	name between global and local variables, but
	it isn't among local variables or global variables
*/
	int a;		
	string b;
	int c;

/*
	when there are global and local variables
	with the same name, a local variable has
	the priority to be assigned.
*/ 
	a = 3;
	b = "Hello World!";
	c = 0;

	object(b, a, c);
}
