radius = 126 / 2; // 반지름
bttm_radius = radius / 1.3; // 원기둥 밑면 반지름
height = 66.5; // 높이

smoothness = 100; // 매끈도

// 벽두께
h_thick = 0.28 * 7; // 0.28의 배수로 설정
v_thick = 0.4 * 5; // 0.4의 배수로 설정

module body(){
    difference(){
        cylinder(h=height, r1=bttm_radius, r2=radius, $fn = smoothness);
        body_hole();
        side_holes();
        bottom_holes();
    }
}

module body_hole(){
    difference(){
        cylinder(h=height, r1=bttm_radius-v_thick, r2=radius-v_thick, $fn = smoothness);
        cylinder(h=h_thick, r=radius, $fn = smoothness);
    }
    cylinder(h=h_thick, r=11, $fn=smoothness); // fixture 구멍
}

// 측면 구멍
module side_holes(){
    size = 3;
    count = 29;
    angle = 6;
    floor_height = 5;
    floor_count = 12;
    
    for (j=[0:floor_count])
        rotate([0,0,j*angle/2])
        translate([0,0,j*floor_height])
        
        // 한개의 구멍층
        union(){
            r = size/2;
            translate([0,0,h_thick+r])
            for (i=[0:count])
                rotate([90,0,i*angle])
                    cylinder(r=r, h=radius*2, $fn=20, center=true);
        }
}

// 바닥면 구멍
module bottom_holes(){
    size = 1;
    count = 17;
    for (i=[0:count])
        rotate([0,0,i*10])
            cube([bttm_radius*2 - (v_thick*3), size, h_thick*2], center=true);
}

module fixture(thk){
    difference(){
        union(){
            cylinder(r=11+(v_thick*thk), h=15+(h_thick*thk), $fn=smoothness);
            translate([0,0,15+(h_thick*thk)]) // 이음매 보강재
                cylinder(h=height/2, r1=11+(v_thick*thk), r2=5.5, $fn = smoothness);
        }
        fixture_hole();
        cylinder(r=5.5, h=height, $fn=smoothness); //column 구멍
    }
}

module fixture_hole(){
    difference(){
        cylinder(r=11, h=15, $fn=smoothness);
        translate([0,0,7.5])
            cube([11*2, 0.4*4, 15], center=true);
    }    
}

module handle(thk){
    difference(){
        translate([0,0,15])
            cylinder(r=5.5+(v_thick*thk), h=45+(h_thick*thk), $fn=smoothness);
        handle_hole();
    }
}

module handle_hole(){
    translate([0,0,15])
        cylinder(r=5.5, h=45, $fn=smoothness);
}

module main(){
    body();
    fixture(2);
    handle(2);
}

main();