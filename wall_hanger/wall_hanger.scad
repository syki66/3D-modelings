thick=6;
length=12;
width=20;

module body() {
    linear_extrude(thick, $fn=100)
        offset(2)offset(-2)
            polygon(points=[[0,0],[width,0],[width,width],[0,width]]);
        
}

module hook() {
    rotate_extrude(angle=180, $fn=100)
        translate([length,0,0])
                offset(1.5)offset(-1.5)
                    square([thick,thick]);
}

module hanger_vertical () {
    body();
    translate([width,width/2-thick/2,length+thick])
        rotate([-90,-90,0])
            hook();
}

module hanger_horizontal() {
    body();
    translate([length+width,width/2-thick/2,0])
        rotate([270,0,0])
            hook();
}

//hanger_vertical(); // 수직 걸이
hanger_horizontal(); // 수평 걸이