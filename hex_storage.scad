$fn=6;

module hex_tube(rad){
	difference(){
		cylinder(h = 50, r = rad);
		translate([0,0,1])
		cylinder(h = 50, r = rad-2);
	}
}

hex_tube(30);

