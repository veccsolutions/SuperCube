

module yRailBracket() {
    pulleyHeight = 11.2;
        blockHeight = 2 * 3 + pulleyHeight * 2;

    translate([20, 0, 0]) {
        translate([2, 13, 9])
            rotate([90,0,90])
                railClamp(h=30);

       difference() {
            cube([2, 20, yRailBracketSizeHeight]);
            translate([-.1, 10, yRailBracketSizeHeight - 6])
                rotate([0, 90, 0])
                    hole5mm(h = 2.2);
        }

        translate([2, 0, 0])
        difference() {
            cube([nema17PlateWidth, 20, 2]);
            translate([nema17PlateWidth - 10, 10, -.1])
                hole5mm(h = 2.2);
        }
    }
    translate([0, 20, 0])
    difference() {
        cube([20, nema17PlateWidth, 2]);
        translate([10, 10, -.1])
            hole5mm(h = 2.2);
        translate([10, nema17PlateWidth - 10, -.1])
            hole5mm(h = 2.2);
    }

    translate([0, 20, 0])
    difference()
    {
        cube([22, 2, yRailBracketSizeHeight]);

        translate([10, -.1, 10])
            rotate([-90, 0, 0])
                hole5mm(h = 2.2);
                
        translate([10, -.1, yRailBracketSizeHeight -10])
            rotate([-90, 0, 0])
                hole5mm(h = 2.2);
    }
    
    translate([20, 20, 0])
    difference()
    {
        cube([nema17PlateWidth / 2 + 6, nema17PlateWidth / 2 + 10, blockHeight]);
        translate([2, 8, 2.2]) {
            translate([0, 0, 0])
                cube([nema17PlateWidth / 2 + 6, nema17PlateWidth / 2 + 10, pulleyHeight]);
            translate([0, 0, 13.2])
                cube([nema17PlateWidth / 2 + 6, nema17PlateWidth / 2 + 10, pulleyHeight]);
        }

        translate([15, nema17PlateWidth / 2, -.1])
            polyhole(d = 5.5, h = 30);
    }

    translate([nema17PlateWidth / 2 + 18, nema17PlateWidth / 2 + 28, 0])
        cube([8, 2, blockHeight]);
}

module yRailBracketRight()
{
    mirror([1,0,0])
        yRailBracket();
}

module yRailBracketLeft()
{
    mirror([1, 0, 0])
        mirror([0, 1, 0])
            yRailBracket();
}