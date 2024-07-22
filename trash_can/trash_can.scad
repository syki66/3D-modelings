width=220;
depth=100;
height=250;
scale=1.1;

module box (depth, width, height) {
    linear_extrude(height=height, scale=[1,scale], $fn=100)
        offset(5)offset(-5)
            square([width,depth]);
}

module clip (width, depth, thick) {
    linear_extrude(thick, $fn=100)
    offset(5)offset(-5)
        square([width, depth]);
}

module trash_can(thick){
    difference(){
        box(depth, width, height);
        
        translate([thick,thick,thick])
            box(depth-thick*2, width-thick*2, height);
    }
}

module holder(thick, height){
    width = width + 2; // 오차 보정
    depth = depth + ((depth * scale - depth) * 0.9); // 90% 위치에 고정
    
    difference(){
        clip(width+thick*2, depth+thick*2, thick);

        translate([thick,thick,0])
            clip(width, depth, thick);
    }

    translate([thick,0,0])
        linear_extrude(height)
            offset(2)offset(-2)
                square([width, thick]);
}

trash_can(2); // 쓰레기통
//holder(thick=5, height=60); // 걸이