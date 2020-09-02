module zAxis(bottom, top, zBarOffset)
{
    translate([0, 0, bottom]) {
        translate([zBottomWidth, 0, 0])
            rotate([180, 0, 180])
            color(printedColor)
                zBottom();

        translate([10, 20, 0])
        {
            translate([0, 0, zGantryPosition - 1])
                color(bearingColor)
                lmu10();

            translate([0, 0, zBarOffset])
                tenMMBar(l = zBarLength);
        }

        translate([zBottomWidth - 10, 20, 0])
        {
            translate([0, 0, zGantryPosition])
                color(bearingColor)
                lmu10();

            translate([0, 0, zBarOffset]) { cube([100,1,1]); 
                tenMMBar(l = zBarLength);}
        }

        translate([zBottomWidth / 2, 25, 0])
            cylinder(d = 8, h = zScrewLength, $fn = 100);
    }

    color(printedColor)
    translate([00, 0, secondHeight])
        zTop();
}