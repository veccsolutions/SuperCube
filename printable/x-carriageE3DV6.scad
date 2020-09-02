include <../common.scad>
include <../parts/railClamp.scad>
include <../parts/y-carriageBearingClamp.scad>
include <../parts/y-carriageE3DV6.scad>

echo("With Supports: no");

translate([0, 0, 5])
    rotate([-90,0,0])
        yCarriageE3DV6();