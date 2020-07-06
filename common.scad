include <materials.scad>
include <functions.scad>
include <parts/nema17MotorPlate.scad>
include <parts/lmu10.scad>

zGantryBracketX = 20;

module hole5mm(h = 2.2) {
    polyhole(d = 5.2, h = h);
}

module hole3mm(h = 2.2) {
    polyhole(d = 3.5, h = h);
}