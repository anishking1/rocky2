/* thunderbolt & sung */
/*
	testing connectW (connect weak), connecting with object name 
		#N canvas 1 2 3 4 5;
		#X obj 3 0 foo~;
		#X obj 3 0 bar~;
		#X connect 0 0 1 0;
		
	actual: 
		#N canvas 1 2 3 4 5;
		#X obj 3 0 foo~;
		#X obj 3 0 bar~;
		#X connect 0 0 1 0;
*/
canvas main(1,2,3,4,5) {
	string o1;
	string o2;
	int x;
	int y;

	o1 = "foo~";
	o2 = "bar~";
	x = 10;
	y = 20;

/*
	each objects is numbered in order of declaration
*/
	object(o1, x, y);			/* object 0 */
	object(o2, x + 30, y + 20);		/* object 1 */

	connectW(o1, 0, o2, 0); /* connect from outlet 0 of "foo~" to inlet 0 of "bar~" */
}
