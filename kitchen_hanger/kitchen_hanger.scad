smoothness = 100;

hole = 4 / 2;
thick = 0.4 * 11;
width = 0.28 * 15;
height = 30;
radius = 15;

rotate_extrude(angle=270, $fn=smoothness)
    translate([hole,0,0])
        square([thick,width]);

translate([-thick,0,0])
    rotate([0,0,270])
        translate([hole,0,0])
            cube([30,thick,width]);

translate([-(radius+thick),-(hole+height),0])
rotate_extrude(angle=-180, $fn=smoothness)
    translate([radius,0,0])
        square([thick,width]);