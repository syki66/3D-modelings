internal_z_height = 24.5;

body_width = 214.6;
body_height = 214.6;

horizontal_thickness = 1.12;
vertical_thickness = 1.2;

bolt_hole_width = 3;

distance_between_bolt_holes = 20 - bolt_hole_width;


difference(){
    cube([body_width, body_height, internal_z_height + horizontal_thickness], center=true);
    
    translate([0,0,horizontal_thickness])
        cube([body_width-(vertical_thickness*2), body_height-(vertical_thickness*2), internal_z_height], center=true);
}