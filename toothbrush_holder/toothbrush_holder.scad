thick = 3; // 클립 두께
inner_thick = 15; // 클립 빈공간 두께

// 정면기준
depth = 40; // 클립 깊이
width = 20; // 클립 가로
height = thick * 2 + inner_thick; // 클립 세로

radius = 70; // 연결부 지름
bridge_thick = 3; // 연결부 두께

brush_thick = 0.28 * 20; // 칫솔 두께

hang = 30; // 칫솔 거는부분 길이

difference(){
    cube([height, depth, width]);

    translate([thick, 0, 0])
        cube([inner_thick, depth - thick, width]);
}


translate([height, radius + depth, 0])
    rotate_extrude(angle=-90)
        translate([radius, 0, 0])
            square([bridge_thick, width]);

difference(){
    union(){
        translate([height + radius,depth + radius,0])
            cube([thick, hang, width]);

        translate([height, radius + depth + hang, 0])
            rotate_extrude(angle=30)
                translate([radius, 0, 0])
                    square([bridge_thick, width]);
    }
    translate([0,0,(width - brush_thick) / 2])
        cube([radius*10, radius*10, brush_thick]);
}