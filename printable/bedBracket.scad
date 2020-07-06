include <../common.scad>
include <../parts/bedBracket.scad>

echo("With Supports: no");

rotate([90,0,0])
    bedBracket();