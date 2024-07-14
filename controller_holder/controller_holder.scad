thick = 2;
height = 80;

linear_extrude(height){
    difference(){
        union(){
            offset(5)offset(-5)
                square([20,40]);
        }
        union(){
            translate([thick, thick, 0])
                offset(5)offset(-5)
                    square([20 - thick * 2, 40 - thick * 2]);
        }
    }
}

linear_extrude(thick){
    union(){
        offset(5)offset(-5)
            square([20,40]);
    }    
}