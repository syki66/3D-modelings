thick=5;
width=42;
height=40;
length=235;

difference(){
    linear_extrude(height+thick, $fn=100)
        offset(4)offset(-4)
        square([length+thick*2,width+thick*2]);
    translate([thick, thick, thick])
        linear_extrude(height, $fn=100)
            square([length,width]);
    translate([0,(width/2)-(width-7*2)/2+thick,thick+10])
        cube([thick, width-7*2,height]);
    translate([length-165,0,thick])
        cube([165+thick,thick*2,height+thick]);    
}