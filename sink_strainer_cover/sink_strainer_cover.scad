radius = 144 / 2; // 반지름
height = 10; // 높이

horizontal_thickness = 1.12; // 0.28의 배수로 설정
vertical_thickness = 1.2; // 0.4의 배수로 설정

smoothness = 1000; // 원의 매끈도

module hole() {
    distance = 0;
    hole_radius = 5;
    distance_between_holes = hole_radius * 3;
    hole_count = [1, 0.5, 0.4, 0.3, 0.2];    
    
    for ( i = [0 : radius / distance_between_holes]){
        for ( j = [0 : hole_count[i-1] : 10] ){
            translate([sin(360*j/6)*distance, cos(360*j/6)*distance, -(height/2) ]){
                cylinder(r = hole_radius, h = height, $fn=smoothness);
            }
        }
        distance = i * distance_between_holes;
    }
}

module plate() {
    difference() {
        cylinder(r = radius, h = height, $fn=smoothness);

        translate([0,0,horizontal_thickness]){
            cylinder(r = radius - (vertical_thickness * 2), h = height, $fn = smoothness);
        }
    }
}

module handle() {
    handle_length = 50;
    handle_width = 5;
    
    difference(){
        translate([-(handle_length / 2), -(handle_width / 2), 0]){
            cube([handle_length, handle_width, height]);
        }
        cube([40,10,10], center=true);
    }
}

module sink_strainer_cover(){
    union(){
        difference(){
            plate();
            hole();
            
            translate([0,0,-5]){
                cylinder(r = 5, h = 10, $fn=1000); // 가운데 실린더.
            }
            
        }
        handle();
    }
}

sink_strainer_cover();