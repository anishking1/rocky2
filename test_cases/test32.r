/* thunderbolt & sung */
/*
	To fix the problem of test31.r, it is recommended to initialize all the variables
	before using multi-loop statements
		#N canvas 1 2 3 4 5;
		#X obj 10 20 repeated objects;
		#X obj 20 40 repeated objects;
		#X obj 30 60 repeated objects;
		#X obj 40 80 repeated objects;
		#X obj 50 100 repeated objects;
		
	actual: 
		#N canvas 1 2 3 4 5;
		#X obj 10 20 repeated objects;
		#X obj 20 40 repeated objects;
		#X obj 30 60 repeated objects;
		#X obj 40 80 repeated objects;
		#X obj 50 100 repeated objects;
*/
canvas main(1,2,3,4,5) {
	string o1;
	int x;
	int y;
	int i;
	int j;

	o1 = "repeated objects";
	x = 10;
	y = 20;
	j = 0;

	for (i = 0; i < 2; i = i + 1) {
		while (j < 5) {
			object(o1, x, y);
			x = x + 10;
			y = y + 20;
			j = j + 1;
		}
		j = 0;
	}


}
