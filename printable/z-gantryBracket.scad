include <../common.scad>
include <../materials.scad>
include <../parts/z-gantryBracket.scad>

echo("With Supports: no");

rotate([-90, -90, 0])
    zGantryBracket();