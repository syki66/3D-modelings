smoothness = 100;

hole = 4 / 2;
thick = 0.4 * 7;
width = 0.28 * 10;
bar_len = 30;
bar_height = 30;
radius = 10;

translate([-thick,0,0])
    rotate([0,0,270])
        cube([30,thick,bar_height]);

translate([-(radius+thick), -bar_len, (bar_height/2)-(width/2) ])
rotate_extrude(angle=-180, $fn=smoothness)
    translate([radius,0,0])
        square([thick,width]);