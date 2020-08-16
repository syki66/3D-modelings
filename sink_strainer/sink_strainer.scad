horizontal_thickness = 1.12; // 0.28의 배수로 설정
vertical_thickness = 1.2; // 0.4의 배수로 설정

smoothness = 100; // 원의 매끈도

module main_body() {
    radius = 126 / 2;
    height = 80;
    
    hole_radius = 22 / 2;
    hole_height = 15;
    
    difference() {
        cylinder(r = radius, h = height, $fn=smoothness);

        translate([0,0,horizontal_thickness]){
            cylinder(r = radius - vertical_thickness, h = height, $fn = smoothness);
        }
        
        cylinder(r = hole_radius, h = hole_height, $fn = smoothness);
        
        body_holes_bottom();
        
        body_holes_side();
    }
}

module fixing_parts() {
    radius = 22 / 2;
    height = 15;
    
    hole_radius = 9.65 / 2;
    
    cube_width = 3;

    rotate([180,0,0])
        translate([0,0,-height])
            difference() {
                cylinder(r = radius, h = height, $fn=smoothness);
                
                for (i = [0:7])
                    rotate([0,0,i*45])
                        translate([ -(cube_width / 2), -radius + vertical_thickness, horizontal_thickness ])
                            cube([cube_width, radius, height]);
                
                cylinder(r = hole_radius - vertical_thickness, h = height, $fn = smoothness);
            }
}

module body_column() {
    radius = 9.65 / 2;
    height = 75;
    
    fixing_parts_height = 15;
    
    difference() {
        translate([0,0,fixing_parts_height])            
            cylinder(r = radius, h = height - fixing_parts_height, $fn=smoothness);
            translate([0,0,0])
                cylinder(r = radius - vertical_thickness, h = height, $fn = smoothness);
    }
}

module body_holes_bottom(){
    radius = 0.75;
    height = horizontal_thickness;

    count = [0.2, 0.15, 0.12, 0.1, 0.1, 0.1, 0.075, 0.075, 0.075, 0.075, 0.065, 0.055, 0.05, 0.05, 0.05, 0.05, 0.04, 0.04, 0.04, 0.04];
    distance = 14;

    for (j = [0 : len(count)]){
        for (i =  [0 : count[j] : 6]) {
            translate([sin(360*i/6)*distance, cos(360*i/6)*distance, 0 ])
            cylinder(r=radius, h = height, $fn=smoothness);
        }
        distance = distance + 2.5 * j;
    }
}

module body_holes_side() {
    radius = 0.85;
    height = horizontal_thickness;
    distance = (126 / 2) - (vertical_thickness/2);
    
    for (j = [1 : 26])
    for (i =  [0 : 0.05 : 6]) {
        translate([sin(360*i/6)*distance, cos(360*i/6)*distance, j*3 ])
        cylinder(r=radius, h = height, $fn=smoothness);
    }
}

module sink_strainer(){
    fixing_parts();
    body_column(); 
    main_body();
}

sink_strainer();