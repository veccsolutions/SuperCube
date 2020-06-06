include <../common.scad>
include <../parts/railClamp.scad>
include <../parts/x-RailBrackets.scad>

echo("With Supports: yes");

rotate([0,0,-90])
    xRailBracketFrontRight();