include <../common.scad>
include <../parts/z-gantryBracket.scad>

echo("With Supports: no");

translate([0,0,11.5])
    rotate([0,90,0])
        zGantryBracketClamp();