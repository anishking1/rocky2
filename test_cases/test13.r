/* thunderbolt & sung */
/*
	testing arithematic calculations
	expected: 
		#N canvas 1 2 3 4 5;
		#X obj 0 5 a = 0, a + 5 = 5;
		#X obj 0 -5 a = 0, a - 5 = -5;
		#X obj 1 5 a = 1, a * 5 = 5;
		#X obj 2 1 a = 2, a / 2 = 1;

	actual: 
		#N canvas 1 2 3 4 5;
		#X obj 0 5 a = 0, a + 5 = 5;
		#X obj 0 -5 a = 0, a - 5 = -5;
		#X obj 1 5 a = 1, a * 5 = 5;
		#X obj 2 1 a = 2, a / 2 = 1;
*/
int a;
string b;
canvas main(1,2,3,4,5) {
	a = 0;
	b = "a = 0, a + 5 = 5";

	object(b, a, a + 5);
	object("a = 0, (a - 5) = -5", a, (a - 5));

	a = a + 1;
	object("a = a + 1 = 1, a * 5 = 5", a, a * 5);
	
	a = a + 1;
	object("a = a + 1 = 2, a / 2 = 1", a, a / 2);
}
