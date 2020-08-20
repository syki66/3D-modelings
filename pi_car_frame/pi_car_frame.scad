smoothness = 1000;

internal_z_height = 38;

body_width = 214.6;
body_height = 214.6;

horizontal_thickness = 1.12;
vertical_thickness = 1.2;

bolt_hole_radius = 1.5;
distance_between_bolt_holes = 20 - bolt_hole_radius;
bolt_hole_z_height = 32;
bolt_distance_from_wall = 7;
    
module body_frame() {    
    translate([0,0, (internal_z_height + horizontal_thickness) / 2])
    difference(){
        cube([body_width, body_height, internal_z_height + horizontal_thickness], center=true);
        
        translate([0,0,horizontal_thickness])
            cube([body_width-(vertical_thickness*2), body_height-(vertical_thickness*2), internal_z_height], center=true);
    }
}

module bolt_hole_pair(y,z){
    translate([-body_width/2, y + (distance_between_bolt_holes / 2), horizontal_thickness + z])
        rotate([0,90,0])
            cylinder(r=bolt_hole_radius, h = body_width, $fn=smoothness);
    
    translate([-body_width/2, y - (distance_between_bolt_holes / 2), horizontal_thickness + z])
        rotate([0,90,0])
            cylinder(r=bolt_hole_radius, h = body_width, $fn=smoothness);
}

module bolt_holes(){
    bolt_hole_pair(distance_between_bolt_holes + vertical_thickness - (body_height / 2), bolt_hole_z_height);
    bolt_hole_pair(0, bolt_hole_z_height);
    bolt_hole_pair((body_height / 2) - distance_between_bolt_holes - vertical_thickness, bolt_hole_z_height);
}

module main_body() {
    difference(){
        body_frame();
        
        bolt_holes();
    }
}

main_body();