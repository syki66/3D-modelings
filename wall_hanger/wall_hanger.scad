thick=6;
length=12;

translate([20,0,length+thick])
rotate([-90,-90,0])
    rotate_extrude(angle=180, $fn=100)
        translate([length,10-thick/2,0])
                offset(1.5)offset(-1.5)
                    square([thick,thick]);

linear_extrude(thick, $fn=100)
    offset(2)offset(-2)
        polygon(points=[[0,0],[20,0],[20,20],[0,20]]);
    
