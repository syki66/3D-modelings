thick=4;
width=30;
angle=20;

difference(){
    difference() {
        rotate([0,-angle,0]){
            difference(){
                rotate([0,angle,0])
                    cylinder(h=100+thick, d=width+thick*2);
                translate([-40,-(width+thick*2)/2,])
                    cube([40,40,60]);
                }
        }

        translate([0,0,thick])
            rotate([0,-angle,0]){
                difference(){
                    rotate([0,angle,0])
                        cylinder(h=100+thick, d=width);
                    translate([-40,-(width+thick*2)/2,])
                        cube([40,40,60]);
                    }
            }
    }

    for(i=[0:3]){
        translate([0,0,60 + i*12])
        holes(8);
    }
   
    translate([0,0,48])
        holes(5);
    
    translate([0,0,36])
        holes(5);    
    
    rotate([0,0,45])
        translate([0,0,24])
            holes(3);
    
    rotate([0,0,45])
        translate([0,0,12])
            holes(3);

    rotate([0,45,0])
        rotate([0,0,45])
            translate([0,0,12])
                holes(3);

}

module holes(num) {
    for(j=[0:num-1]){
        rotate([90,0,j*45])
            translate([0,0,20])
                cylinder(h=width, d=7, center=true);
    }
}