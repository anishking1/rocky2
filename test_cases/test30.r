/* thunderbolt & sung */
/*
	testing loop statements, for
		#N canvas 1 2 3 4 5;
		#X obj 20 40 repeated objects;
		#X obj 30 60 repeated objects;
		#X obj 40 80 repeated objects;
		#X obj 50 100 repeated objects;
		#X obj 60 120 repeated objects;

		
	actual: 
		#N canvas 1 2 3 4 5;
		#X obj 20 40 repeated objects;
		#X obj 30 60 repeated objects;
		#X obj 40 80 repeated objects;
		#X obj 50 100 repeated objects;
		#X obj 60 120 repeated objects;
*/
canvas main(1,2,3,4,5) {
	string o1;
	int x;
	int y;
	int i;

	o1 = "repeated objects";
	x = 10;
	y = 20;
	
	for (i = 0; i < 5; i = i + 1) {
		object(o1, x, y);
		x = x + 10;
		y = y + 20;
	}


}
