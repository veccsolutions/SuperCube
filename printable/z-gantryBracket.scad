include <../common.scad>
include <../parts/z-gantryBracket.scad>

echo("With Supports: no");

rotate([0, 180, 0])
    zGantryBracket();