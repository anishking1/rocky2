/* thunderbolt & sung */
/*
	negative test: connectW, connecting object with object in different canvas
		build-fail
		
	actual: 
		build-fail
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

	connectW(o1, 0, "jar~", 1);	/* cannot connect to object in different canvas */
}

canvas sub() {
	object("jar~", 0, 0);	/* object 2 */
}
