
horizontal_thickness = 0.28 * 10; // 0.28의 배수로 설정
vertical_thickness = 0.4 * 7; // 0.4의 배수로 설정

smoothness = 100; // 원의 매끈도

module main_body() {
    radius = 126 / 2;
    height = 66.5;
    
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
    
    h_thick=1.4;
    v_thick=1.2;

    rotate([180,0,0])
        translate([0,0,-height])
            difference() {
                cylinder(r = radius, h = height, $fn=smoothness);
                
                for (i = [0:7])
                    rotate([0,0,i*45])
                        translate([ -(cube_width / 2), -radius + v_thick, h_thick ])
                            cube([cube_width, radius, height]);
                
                cylinder(r = hole_radius - v_thick, h = height, $fn = smoothness);
            }
    
    difference(){
        cylinder(r = radius+vertical_thickness/2, h = height+horizontal_thickness, $fn=smoothness);
        
        cylinder(r = radius, h = height, $fn=smoothness);
        
        cylinder(r = hole_radius - v_thick, h = height*2, $fn = smoothness);
    }
    
}

module body_column() {
    height = 60;
    
    fixing_parts_height = 15;
    
    difference() {
        translate([0,0,fixing_parts_height])
            union(){
                cylinder(r = 6.425, h = height - fixing_parts_height, $fn=smoothness);
                translate([0,0,horizontal_thickness])
                cylinder(h=20, r1=12.4, r2=6.425, $fn = smoothness);
            }
            translate([0,0,0])
                cylinder(r = 3.625, h = height - horizontal_thickness, $fn = smoothness);
    }
}

module body_holes_bottom(){
    for (i = [1:18]){
        render() // 경고문구 회피하려고
            rotate([0,0,10*i])
                difference(){
                    cube([115, 1.5, horizontal_thickness*2], center=true);
                    
                    cube([40, 1.5, horizontal_thickness*2], center=true);
                }
    }
                
    radius = 1;
    height = horizontal_thickness;

    count = [0.3, 0.2];
    distance = 14.5;

    for (j = [0 : len(count)]){
        for (i =  [0 : count[j] : 6]) {
            translate([sin(360*i/6)*distance, cos(360*i/6)*distance, 0 ])
                linear_extrude(height=height)
                    circle(r=radius, $fn=smoothness);
        }
        distance = distance + 3.2 * j;
    }
}

module body_holes_side() {
    height =  horizontal_thickness*6;
    
    for (i = [1:36]){
        translate([0,0,(height/2) + horizontal_thickness])
            render() // 경고문구 회피하려고
                rotate([0,0,5*i])
                    difference(){
                        cube([130, 1.5, height], center=true);
                        
                        cube([110, 1.5, height], center=true);
                    }
    }
    
    for (i = [1:36]){
        translate([0,0, 32 ])
            render() // 경고문구 회피하려고
                rotate([0,0,5*i])
                    difference(){
                        cube([130, 1.5, height], center=true);
                        
                        cube([110, 1.5, height], center=true);
                    }
    }
    
    for (i = [1:36]){
        translate([0,0, 53 ])
            render() // 경고문구 회피하려고
                rotate([0,0,5*i])
                    difference(){
                        cube([130, 1.5, height], center=true);
                        
                        cube([110, 1.5, height], center=true);
                    }
    }
    
}

module sink_strainer(){
    fixing_parts();
    body_column(); 
    main_body();
}

sink_strainer();