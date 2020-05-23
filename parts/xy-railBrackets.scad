xyRailBracketSizeHeight = 72;
xyRailBracketBackSize = 10;

module xyRailBracketFront()
{
    difference() {
        cube([2, 20, xyRailBracketSizeHeight]);
        translate([-.1, 10, xyRailBracketSizeHeight - 10])
            rotate([0, 90, 0])
                polyhole(d = 5, h = 2.2);
    }
    
    translate([22, 10, 29])
        rotate([90,0,-90])
        railClamp();

    translate([-20, 20, 0])
    {
        difference() {
            cube([20 + 2, 2, xyRailBracketSizeHeight]);
            translate([10, -.1, 10])
                rotate([-90, 0, 0])
                    polyhole(d = 5, h = 2.2);
            translate([10, -.1, xyRailBracketSizeHeight - 10])
                rotate([-90, 0, 0])
                    polyhole(d = 5, h = 2.2);        }

        difference() {
            cube([20, nema17PlateWidth, 3]);
            translate([10, 10, -.1])
                polyhole(d = 5, h = 3.2);
            translate([10, nema17PlateWidth - 10, -.1])
                polyhole(d = 5, h = 3.2);        }
    }

    difference() {
        cube([nema17PlateWidth, 20, 3]);
        translate([nema17PlateWidth - 10, 10, -.1])
            polyhole(d = 5, h = 3.2);        }


    translate([0, 20, 0])
        nema17MotorPlate(h = 3);
}

module xyRailBracketBack()
{
    translate([8, 0, 0])
        difference() {
            cube([2, 20, xyRailBracketSizeHeight]);
            translate([-.1, 10, xyRailBracketSizeHeight - 6])
                rotate([0, 90, 0])
                    polyhole(d = 5, h = 2.2);
            
            translate([-.1, 10, 12])
                rotate([0, 90, 0])
                    polyhole(d = 5, h = 2.2);
        }

    translate([-12, 10, 29])
        rotate([90,0,90])
            railClamp();
}