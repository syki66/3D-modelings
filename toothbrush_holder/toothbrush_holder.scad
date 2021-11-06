thick = 3; // 클립 두께
inner_thick = 15; // 클립 빈공간 두께

// 정면기준
depth = 40; // 클립 깊이
width = 20; // 클립 가로
height = thick * 2 + inner_thick; // 클립 세로

bridge_radius = 70; // 연결부 지름
bridge_thick = 3; // 연결부 두께

brush_thick = 5.2; // 칫솔 두께

difference(){
    cube([height, depth, width]);

    translate([thick, 0, 0])
        cube([inner_thick, depth - thick, width]);
}

difference(){
translate([height, bridge_radius + depth, 0])
    rotate([0,0,30])
        rotate_extrude(angle=-120)
            translate([bridge_radius, 0, 0])
                square([bridge_thick, width]);

translate([height - 5, bridge_radius + depth, width / 2 - brush_thick / 2])
    rotate([0,0,30])
        rotate_extrude(angle=-30)
            translate([bridge_radius, 0, 0])
                square([bridge_thick + 10, brush_thick]);
}