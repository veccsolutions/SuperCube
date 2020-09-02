include <../common.scad>
include <../parts/railClamp.scad>
include <../parts/y-carriageLeft.scad>

echo("With Supports: yes");

rotate([180, 0, 0])
    yCarriageLeft();