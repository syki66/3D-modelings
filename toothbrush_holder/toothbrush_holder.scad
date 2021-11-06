thick = 5; // 클립 두께
inner_thick = 15; // 빈공간 두께

// 정면기준
depth = 40; // 깊이
width = 30; // 가로
height = thick * 2 + inner_thick; // 세로

difference(){
    cube([height, depth, width]);

    translate([thick, 0, 0])
        cube([inner_thick, depth - thick, width]);
}