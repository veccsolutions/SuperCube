include <../common.scad>
include <../parts/railClamp.scad>
include <../parts/x-carriageBearingClamp.scad>
include <../parts/x-carriageE3DV6.scad>

translate([0, 0, 5])
rotate([-90,0,0])
    xCarriageE3DV6();