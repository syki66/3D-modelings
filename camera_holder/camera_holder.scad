width=100;
height=100;
thick=3;

cube([width,10,thick]);

translate([0,10+thick,0])
    rotate([90,0,0])
        cube([width,10,thick]);

translate([90,0,0])        
    cube([10,10,10]);

translate([width-10, 8, 4])
    rotate([-45,0,-52])
        union(){
            cube([10, thick, height * 1.48]);
            translate([0, 3, height * 1.45])
                rotate([55,0,0])
                cube([20,thick,30]);
        }