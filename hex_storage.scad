height = 80;
radius = 45/2;
wall_thickness = 1;
number_of_sets = 2;

module parameters_below_here_are_constant(){}
apothem = radius*cos(180/6);
$fn=6;

module hex_tube(Height,rad){
	rotate([0,0,30])
	difference(){
		cylinder(h = Height, r = rad);
		translate([0,0,1*wall_thickness])
		cylinder(h = Height, r = rad-wall_thickness);
	}
}

module hex_set(H,R){
	hex_tube(H,R);
	translate([apothem-wall_thickness/2,R+R*cos(60)-wall_thickness/1,0])
	hex_tube(H,R);
}

for(i = [0:number_of_sets-1]){
	translate([(apothem-wall_thickness/2)*2*i,0,0])
	hex_set(height,radius);
}