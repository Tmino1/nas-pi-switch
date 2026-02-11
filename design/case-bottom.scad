// This file will contain OpenScad code for the nas/switch.
// components contained in this file will attempted to be as true to size as possible

module pi5(x,y,z) {
	rotate([90,0,0])
		translate([x,y,z])
				color("red")
					import("RASPBERRY_PI_5_.stl");
}

module switch(x,y,z) {
	translate([x,y,z])
		color("grey")
			cube([58.93,123.95,22.86], center=true);

}

module nvmeBoard(x,y,z) {
	translate([x,y,z])
		color("brown")
			cube([87,114,1.6],center=true);
	
}

module piModule(x,y,z) {
	translate([x,y,z+14]) { // Standoffs will cause the board to be 14mm above the base.
		nvmeBoard(x,y,z);
		pi5(x+1,y+9,z+29); // Trying to center on the board where the connections will be.
	}
}

piModule(0,0,0);
switch(17,0,60); // Trying to get switch front inline with eth port on pi.

//module bottom(x,y,z) {
//	color("grey")
//		cube()
//}

//bottom(0,0,0);

