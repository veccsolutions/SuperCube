include <../common.scad>
include <../parts/railClamp.scad>
include <../parts/z-top.scad>

echo("With Supports: no");

rotate([90,0,0])
    zTop();