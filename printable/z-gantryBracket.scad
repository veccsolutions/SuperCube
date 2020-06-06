include <../common.scad>
include <../parts/z-gantryBracket.scad>

echo("With Supports: no");

rotate([0, -90, 0])
    zGantryBracket();