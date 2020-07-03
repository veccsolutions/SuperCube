include <../common.scad>
include <../parts/blowerFan.scad>

difference() {
    blowerFan();
    
    translate([-30, -30, 1]) {
        cube([100,100,100]);
    }
}