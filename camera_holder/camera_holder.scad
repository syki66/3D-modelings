width=160;
thick=3;

cube([width,10,thick]);

translate([width-thick, 0, 2])
        rotate([0,20,20])
            cube([thick,10,100]);

translate([192,0,94])
    rotate([0,-5,15])
        camera_holder(width=30, height=40, holeWidth=0, holeThick=0, holderWidth=0);
//        camera_holder(width=30, height=40, holeWidth=25.3, holeThick=2, holderWidth=1.3);


module camera_holder(width, height, holeWidth, holeThick, holderWidth){
    translate([0,width,height])
        rotate([180,0,0])
            difference(){
                cube([thick, width, height]);
                translate([0,(width-holeWidth)/2+holderWidth/2,0])
                    cube([thick, holeWidth-holderWidth, holeWidth]);
                translate([thick/2-holeThick/2,(width-holeWidth)/2,0])
                    cube([holeThick, holeWidth, holeWidth]);
            }
}