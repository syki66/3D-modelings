thick=4;
width=30;
angle=20;

difference(){
    difference() {
        rotate([0,-angle,0]){
            difference(){
                rotate([0,angle,0])
                    cylinder(h=100+thick, d=width+thick*2, $fn=100);
                translate([-40-thick/2,-(width+thick*2)/2,])
                    cube([40,40,60]);
                }
        }

        translate([0,0,thick])
            rotate([0,-angle,0]){
                difference(){
                    rotate([0,angle,0])
                        cylinder(h=100+thick, d=width, $fn=100);
                    translate([-40,-(width+thick*2)/2,])
                        cube([40,40,60]);
                    }
            }
    }
    
    hole(width=30, height=15, thick=10);
}

module hole (width, height, thick){
    translate([10,-width/2,-1])
        rotate([90,0,90])
            linear_extrude(thick)
                polygon([[0, 0],[width / 2, height + 1],[width, 0]]);
}