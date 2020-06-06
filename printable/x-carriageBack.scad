include <../common.scad>
include <../parts/railClamp.scad>
include <../parts/x-carriageBearingClamp.scad>

echo("With Supports: no");

rotate([90,0,0])
    xCarriageBearingClamp();