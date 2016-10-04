/* thunderbolt & sung */
/*
	test conditional statements
	expected: 
		#N canvas 1 2 3 4 5;
		#X obj 0 0 true: a == 0;
		#X obj 0 0 false: a == 0;
		#X obj 0 0 else if: a == 2;
		#X obj 0 0 false: a == 0 && a == 2;

	actual: 
		#N canvas 1 2 3 4 5;
		#X obj 0 0 true: a == 0;
		#X obj 0 0 false: a == 0;
		#X obj 0 0 else if: a == 2;
		#X obj 0 0 false: a == 0 && a == 2;

*/
int a;
canvas main(1,2,3,4,5) {
	a = 0;
	if (a == 0) {
		object("astrue: a == 0", 0, 0);
		object("asfalse: a == 0", 0, 0);
	} else { 
		object("false: a == 0", 0, 0);
	}

	a = 1;
	if (a == 0) {
		object("true: a == 0", 0, 0);
	} else { 
		object("false: a == 0", 0, 0);
	}

	a = 2;	/* testing else if */
	if (a == 0) {
		object("true: a == 0", 0, 0);
	} else if (a == 2) { 
		object("else if: a == 2", 0, 0);
	} else {
		object("false: a == 0 && a == 2", 0, 0);
	}

	a = 3;
	if (a == 0) {
		object("true: a == 0", 0, 0);
	} else if (a == 2) { 
		object("else if: a == 2", 0, 0);
	} else {
		object("false: a == 0 && a == 2", 0, 0);
	}
}
