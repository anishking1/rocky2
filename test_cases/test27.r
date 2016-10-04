/* thunderbolt & sung */
/*
	testing connectW, connecting object with subpatch
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
	sub("subpatch", x - 5, y - 5); /* object 1 */

	connectW(o1, 0, "subpatch", 1);
}

canvas sub() {
	object("jar~", 0, 0);	/* object 2 */
}
