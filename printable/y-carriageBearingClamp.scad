include <../common.scad>
include <../parts/railClamp.scad>
include <../parts/y-carriageBearingClamp.scad>

echo("With Supports: no");

rotate([0,-90,0])
    yCarriageBearingClamp();