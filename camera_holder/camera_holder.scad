width=100;
height=100;
thick=5;

cube([width,10,thick]);

translate([width-10, 8, 4])
    rotate([-45,0,-52])
        union(){
            cube([10, thick, height * 1.5]);
            translate([0, 3, height * 1.45])
                rotate([60,0,0])
                cube([20,thick,30]);
        }