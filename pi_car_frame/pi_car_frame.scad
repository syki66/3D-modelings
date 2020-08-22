smoothness = 1000;

internal_z_height = 38;

body_width = 214.6;
body_height = 214.6;

horizontal_thickness = 1.12;
vertical_thickness = 1.2;

bolt_hole_radius = 1.5;
distance_between_bolt_holes = 20 - bolt_hole_radius;
bolt_hole_z_height = 32;

tire_hole_radius = 7.5;
tire_hole_z_height = 11;

motor_bottom_hole_distance = 9.3;
motor_bottom_hole_radius = 5;

    
module body_frame() {    
    translate([0,0, (internal_z_height + horizontal_thickness) / 2])
    difference(){
        cube([body_width, body_height, (internal_z_height + horizontal_thickness) ], center=true);
        
        translate([0, 0, (horizontal_thickness / 2)])
            cube([body_width-(vertical_thickness*2), body_height-(vertical_thickness*2), internal_z_height ], center=true);
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

module holes(){
    bolt_hole_pair(distance_between_bolt_holes + vertical_thickness - (body_height / 2), bolt_hole_z_height);
    bolt_hole_pair(0, bolt_hole_z_height);
    bolt_hole_pair((body_height / 2) - distance_between_bolt_holes - vertical_thickness, bolt_hole_z_height);
    
    two_tire_holes(distance_between_bolt_holes + vertical_thickness - (body_height / 2), tire_hole_z_height);
    two_tire_holes(0, tire_hole_z_height);
    two_tire_holes((body_height / 2) - distance_between_bolt_holes - vertical_thickness, tire_hole_z_height);
    
    bottom_holes( (body_width/2) - motor_bottom_hole_distance , 0 );
    bottom_holes( (body_width/2) - motor_bottom_hole_distance , distance_between_bolt_holes + vertical_thickness - (body_height / 2) );
    bottom_holes( (body_width/2) - motor_bottom_hole_distance , (body_height / 2) - distance_between_bolt_holes - vertical_thickness );
    
    bottom_holes( -((body_width/2) - motor_bottom_hole_distance), 0 );
    bottom_holes( -((body_width/2) - motor_bottom_hole_distance), distance_between_bolt_holes + vertical_thickness - (body_height / 2));
    bottom_holes( -((body_width/2) - motor_bottom_hole_distance), (body_height / 2) - distance_between_bolt_holes - vertical_thickness);
}

module two_tire_holes(y,z){
    translate([-body_width/2, y, horizontal_thickness + z])
        rotate([0,90,0])
            hull(){
                translate([-7,0,0])
                    cylinder(r=tire_hole_radius, h = body_width, $fn=smoothness);
                
                cylinder(r=tire_hole_radius, h = body_width, $fn=smoothness);
            }
}

module bottom_holes(x,y){
    translate([x,y,0])
        cylinder(r = motor_bottom_hole_radius, h = horizontal_thickness, $fn=smoothness);
}

module main_body() {
    difference(){
        body_frame();
        
        holes();
    }
}

//bottom_holes();
main_body();