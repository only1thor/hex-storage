height = 50;
diameter = 32;
wall_thickness = 1;
number_in_x_axis = 2;
number_in_y_axis = 2;

module parameters_below_here_are_constant(){}
radius = diameter / 2;
apothem = radius * cos(180 / 6);
$fn = 6;

module hex_tube(Height, rad) {
	rotate([0, 0, 30])
	difference() {
		cylinder(h = Height, r = rad);
		translate([0, 0, 1 * wall_thickness])
		cylinder(h = Height, r = rad - wall_thickness);
	}
}

for (i = [0 : number_in_x_axis - 1]) {
	for (j = [0 : number_in_y_axis - 1]) {
		translate([
			(apothem - wall_thickness / 2) * 2 * i + (radius - 2*wall_thickness)*(j % 2) ,
			(radius + radius * cos(60)) * j - (wall_thickness)*(j % 2),
			 0])
		hex_tube(height, radius);
	}
}