include <../common.scad>
include <../parts/railClamp.scad>
include <../parts/y-carriageBearingClamp.scad>

echo("With Supports: maybe");

rotate([90,0,0])
    yCarriageBearingClamp();