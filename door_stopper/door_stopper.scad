height=10;
thick=6;
holeThick=2;
holeAngle=225;
holeRadius=20;
neckLength=10;

module door_stopper(type){
    // head
    if (type == str("female")){
        rotate([0,0,(180-holeAngle)/2]){
            rotate_extrude(angle=holeAngle, $fn=100)
                translate([holeRadius,0,0])
                    square([holeThick,height]);
                
            rotate([0,0,holeAngle])
                translate([holeRadius+holeThick/2,0,0])
                cylinder(h=10, d=holeThick, $fn=100);    
                
            translate([holeRadius+holeThick/2,0,0])
                cylinder(h=10, d=holeThick, $fn=100);    
        }
    }
    if (type == str("male")){
        translate([0,holeThick,0])
            cylinder(h=height, r=holeRadius, $fn=100);
    }

    // neck
    translate([-thick/2,holeRadius,0])
        cube([thick,neckLength,height]);

    // body
    translate([-holeRadius,holeRadius+neckLength,0])
    cube([holeRadius*2,thick,height]);
}

door_stopper(type=str("female"));
//door_stopper(type=str("male"));