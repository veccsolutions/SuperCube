include <../common.scad>
include <../parts/railClamp.scad>
include <../parts/y-carriageBearingClamp.scad>

echo("With Supports: no");

translate([0,0,2.5])
    rotate([-90,0,0])
        yCarriageBearingBeltClamp();