smoothness = 1000;

internal_z_height = 38;

body_width = 214.6;
body_height = 214.6;

horizontal_thickness = 0.28 * 10;
vertical_thickness = 0.4 * 7;

bolt_hole_radius = 1.8;
distance_between_bolt_holes = 13.9 + (bolt_hole_radius*2);
bolt_hole_z_height = 32;

tire_hole_radius = 7.5;
tire_hole_z_height = 13;

motor_bottom_hole_distance = 11.3;
motor_bottom_hole_radius = 5;

camera_hole_width = 25.3;
camera_hole_thickness = 1.2;
camera_white_space_width = 1.2;

sonic_hole_radius = 8.5;
distance_between_sonic_holes = 26.4;
sonic_hole_z_height = 25.8;

sonic_center_hole_width = 10;
sonic_center_hole_height = 5;
sonic_center_hole_z_height = 33.3;

    
module body_frame() {    
    translate([0,0, (internal_z_height + horizontal_thickness) / 2])
    difference(){
        cube([body_width, body_height, (internal_z_height + horizontal_thickness) ], center=true);
        
        translate([0, 0, horizontal_thickness / 2])
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

module two_tire_holes(y,z){
    translate([-body_width/2, y, horizontal_thickness + z])
        rotate([0,90,0])
            hull(){
                translate([-6,0,0])
                    cylinder(r=tire_hole_radius, h = body_width, $fn=smoothness);
                
                cylinder(r=tire_hole_radius, h = body_width, $fn=smoothness);
            }
}

module bottom_hole(x,y){
    translate([x,y,0])
        cylinder(r = motor_bottom_hole_radius, h = horizontal_thickness*2, $fn=smoothness);
}

module camera_hole(){
    translate([0, (body_height / 2) - (vertical_thickness / 2), (internal_z_height + horizontal_thickness) - (camera_hole_width / 2) ])
    cube([camera_hole_width, camera_hole_thickness, camera_hole_width + camera_white_space_width], center=true);
    
    translate([0, (body_height / 2) - (vertical_thickness / 2), (internal_z_height + horizontal_thickness) - (camera_hole_width / 2) + 0.5])
    cube([camera_hole_width - camera_white_space_width, camera_hole_thickness * 3, camera_hole_width+1], center=true);
}

module sonic_hole(x, y, z, rotate){
    if (rotate == true) {
        translate([x + (distance_between_sonic_holes / 2), y, horizontal_thickness + z])
            rotate([90,0,0])
                cylinder(r=sonic_hole_radius, h = vertical_thickness, $fn=smoothness);
        
        translate([x - (distance_between_sonic_holes / 2), y, horizontal_thickness + z])
            rotate([90,0,0])
                cylinder(r=sonic_hole_radius, h = vertical_thickness, $fn=smoothness);
        
        translate([x - (sonic_center_hole_width/2), y, sonic_center_hole_z_height])
            rotate([90,0,0])
                cube([sonic_center_hole_width, sonic_center_hole_height, vertical_thickness]);
    }
    else {
        translate([x, y + (distance_between_sonic_holes / 2), horizontal_thickness + z])
            rotate([0,90,0])
                cylinder(r=sonic_hole_radius, h = vertical_thickness, $fn=smoothness);
        
        translate([x, y - (distance_between_sonic_holes / 2), horizontal_thickness + z])
            rotate([0,90,0])
                cylinder(r=sonic_hole_radius, h = vertical_thickness, $fn=smoothness);
        
        translate([x, y - (sonic_center_hole_width/2), sonic_center_hole_z_height+sonic_center_hole_height])
            rotate([0,90,0])
                cube([sonic_center_hole_height, sonic_center_hole_width, vertical_thickness]);
        
    }
}

module holes(){
    bolt_hole_pair(distance_between_bolt_holes + vertical_thickness - (body_height / 2), bolt_hole_z_height);
    bolt_hole_pair(0, bolt_hole_z_height);
    bolt_hole_pair((body_height / 2) - distance_between_bolt_holes - vertical_thickness, bolt_hole_z_height);
    
    two_tire_holes(distance_between_bolt_holes + vertical_thickness - (body_height / 2), tire_hole_z_height);
    two_tire_holes(0, tire_hole_z_height);
    two_tire_holes((body_height / 2) - distance_between_bolt_holes - vertical_thickness, tire_hole_z_height);
    
    bottom_hole( (body_width/2) - motor_bottom_hole_distance , 0 );
    bottom_hole( (body_width/2) - motor_bottom_hole_distance , distance_between_bolt_holes + vertical_thickness - (body_height / 2) );
    bottom_hole( (body_width/2) - motor_bottom_hole_distance , (body_height / 2) - distance_between_bolt_holes - vertical_thickness );
    
    bottom_hole( -((body_width/2) - motor_bottom_hole_distance), 0 );
    bottom_hole( -((body_width/2) - motor_bottom_hole_distance), distance_between_bolt_holes + vertical_thickness - (body_height / 2));
    bottom_hole( -((body_width/2) - motor_bottom_hole_distance), (body_height / 2) - distance_between_bolt_holes - vertical_thickness);
    
    camera_hole();
    
    sonic_hole( 
        body_width/2 - vertical_thickness,
        ((body_height / 2) - distance_between_bolt_holes - vertical_thickness) / 2,
        sonic_hole_z_height,
        false
    );
    sonic_hole( 
        -(body_width/2),
        (distance_between_bolt_holes + vertical_thickness - (body_height / 2)) / 2,
        sonic_hole_z_height,
        false
    );
    sonic_hole(
        -body_width/4,
        body_height/2,
        sonic_hole_z_height,
        true
    );
    sonic_hole(
        body_width/4,
        -body_height/2 + vertical_thickness,
        sonic_hole_z_height,
        true
    );

}

module main_body() {
    difference(){
        body_frame();
        
        holes();
    }
}

difference(){
    main_body();
    
    
    
    translate([-150,-210,-30])
    cube([300,300,100]);
    
    translate([-30,-180,-30])
    cube([300,300,100]);

    translate([-380,-180,-30])
    cube([300,300,100]);
    
    
}