smoothness = 100;

hole = 4 / 2;
thick = 0.4 * 7;
width = 0.28 * 10;
height = 30;
length = 15;
angle= -140;

rotate_extrude(angle=270, $fn=smoothness)
    translate([hole,0,0])
        square([thick,width]);

translate([-thick,0,0])
    rotate([0,0,270])
        translate([hole,0,0])
            cube([30,thick,width]);

translate([-(hole+thick),-(height+hole),0])
    union(){
        rotate_extrude(angle=angle, $fn=smoothness)
            translate([hole,0,0])
                square([thick,width]);
        
        rotate([0,0,angle])
            translate([thick+hole,0,0])
                rotate([0,0,180])
                    cube([thick,length,width]);
    }