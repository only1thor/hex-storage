module hex_prism(height, radius) {
    points = [ for (i = [0:5]) let(a = 360 * i / 6) [radius * cos(a), radius * sin(a)] ];
    linear_extrude(height) polygon(points);
}

for (i = [0:2]) {
    for (j = [0:1]) {
        x = i * 2 * 30 + (j % 2) * 30;
        y = j * sqrt(3) * 30;
        translate([x, y, 0]) hex_prism(50, 30);
    }
}
