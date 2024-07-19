module body(width, thick) {
    linear_extrude(thick, $fn=100)
        offset(2)offset(-2)
            polygon(points=[[0,0],[width,0],[width,width],[0,width]]);
        
}

module hook(thick, length, extenderLength) {
    translate([0,extenderLength,0]){
        rotate_extrude(angle=180, $fn=100)
            translate([length,0,0])
                    offset(1.5)offset(-1.5)
                        square([thick,thick]);
        translate([-length-thick,0,0])
        rotate([90,0,0])
        linear_extrude(extenderLength, $fn=100)
            offset(1.5)offset(-1.5)
                square([thick,thick]);
    }
}

module hanger_vertical(width, thick, length, extenderLength) {
    body(width, thick);
    translate([width,width/2-thick/2,length+thick])
        rotate([-90,-90,0])
            hook(thick, length, extenderLength);
}

module hanger_horizontal(width, thick, length, extenderLength) {
    body(width, thick);
    translate([length+width,0,0])
        rotate([270,0,0])
            hook(thick, length, extenderLength);
}

module multi_hanger(number, thick, holderWidth, hookLength, hookExtenderLength){
    interval = 2.5*(thick+hookLength);
    for(i=[0:number]){
        if (i == number){
            translate([0,i * interval,0])
            rotate([90,0,0])
                body(holderWidth, thick);
        } 
        else {
            translate([0,i*interval,0])
                union(){
                    translate([0,-thick,thick])
                        rotate([-90,0,0])
                            body(thick, interval);
                    translate([thick,-hookLength-thick,0])
                        rotate([0,0,-90])
                            hook(thick, hookLength, hookExtenderLength);
                }
        }
    }
}

// hanger_vertical(width=20, thick=6, length=12, extenderLength=0); // 수직 걸이
// hanger_horizontal(width=20, thick=6, length=35, extenderLength=60); // 수평 걸이

multi_hanger(number=5, thick=7, holderWidth=40, hookLength=10, hookExtenderLength=20); // 멀티 걸이