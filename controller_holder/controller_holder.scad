thick = 1.7;
height = 80;
width = 44;

linear_extrude(height){
    difference(){
        union(){
            offset(5)offset(-5)
                square([20, width]);
        }
        union(){
            translate([thick, thick, 0])
                offset(5)offset(-5)
                    square([20 - thick * 2, 44 - thick * 2]);
        }
    }
}

linear_extrude(thick){
    union(){
        offset(5)offset(-5)
            square([20, width]);
    }    
}