include <../common.scad>
include <../parts/railClamp.scad>
include <../parts/x-carriageBack.scad>

echo("With Supports: no");

rotate([180, 0, 0])
    xCarriageBack();