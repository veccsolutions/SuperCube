include <materials.scad>
include <functions.scad>
include <parts/nema17MotorPlate.scad>
include <parts/lmu10.scad>

zGantryBracketX = 20;
lmu10Diameter = 20;
lmu10Length = 29;
yRailBracketSizeHeight = 72;

module hole5mm(h = 2.2) {
    polyhole(d = 5.5, h = h);
}

module hole3mm(h = 2.2) {
    polyhole(d = 3.5, h = h);
}