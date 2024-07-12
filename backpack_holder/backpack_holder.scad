wallWidth=100;
wallHeight=50;
wallThick=10;
neckWidth=100;
neckHeight=20;
neckLength=100;

cube([wallWidth, wallHeight, wallThick]);
difference(){
    translate([wallWidth/2, 0, 0]){
        scale([neckWidth*0.1, neckHeight*0.1, 1]) cylinder(h=neckLength, d=10, $fn=100);
    }
    translate([0, -wallHeight, 0]){
        cube([wallWidth, wallHeight, neckLength]);
    }
}