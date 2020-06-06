xRailBracketSizeHeight = 72;
xRailBracketBackSize = 10;

module xRailBracketMotor(motorHeight = 12)
{
    difference() {
        union() {
            difference() {
                cube([2, 20, xRailBracketSizeHeight]);
                translate([-.1, 10, xRailBracketSizeHeight - 10])
                    rotate([0, 90, 0])
                        polyhole(d = 5, h = 2.2);
            }
            
            translate([22, 13, 29])
                rotate([90,0,-90])
                railClamp();

            translate([-20, 20, 0])
            {
                difference() {
                    cube([20 + 2, 2, xRailBracketSizeHeight]);
                    translate([10, -.1, 10])
                        rotate([-90, 0, 0])
                            polyhole(d = 5, h = 2.2);
                    translate([10, -.1, xRailBracketSizeHeight - 10])
                        rotate([-90, 0, 0])
                            polyhole(d = 5, h = 2.2);        }

                difference() {
                    cube([20, nema17PlateWidth, 2]);
                    translate([10, 10, -.1])
                        polyhole(d = 5, h = 2.2);
                    translate([10, nema17PlateWidth - 10, -.1])
                        polyhole(d = 5, h = 2.2);        }
            }

            difference() {
                cube([nema17PlateWidth, 20, 2]);
                translate([nema17PlateWidth - 10, 10, -.1])
                    polyhole(d = 5, h = 2.2);        }

            if (motorHeight > 0) {
                translate([0, 18, 0])
                    cube([nema17PlateWidth, 2, motorHeight + 2]);
                translate([-2, 20, 0])
                    cube([2, nema17PlateWidth, motorHeight + 2]);
            }
            translate([0, 20, motorHeight])
                nema17MotorPlate(h = 2);
        }
        translate([0, 20, -.1])
        cube([nema17PlateWidth, nema17PlateWidth, motorHeight + .1]);
    }
}

module xRailBracketFrontLeft()
{
    xRailBracketMotor(motorHeight = 0);
}

module xRailBracketBackLeft()
{
    mirror([0,1,0])

    xRailBracketMotor(motorHeight = 13);
}

module xRailBracketRight() {
    translate([20, 0, 0]) {
        translate([2, 13, 29])
            rotate([90,0,90])
                railClamp();

       difference() {
            cube([2, 20, xRailBracketSizeHeight]);
            translate([-.1, 10, xRailBracketSizeHeight - 6])
                rotate([0, 90, 0])
                    polyhole(d = 5, h = 2.2);
            
            translate([-.1, 10, 12])
                rotate([0, 90, 0])
                    polyhole(d = 5, h = 2.2);
        }

        translate([2, 0, 0])
        difference() {
            cube([nema17PlateWidth, 20, 2]);
            translate([nema17PlateWidth - 10, 10, -.1])
                polyhole(d = 5, h = 2.2);
        }
        

    }
    translate([0, 20, 0])
        difference() {
            cube([20, nema17PlateWidth, 2]);
            translate([10, 10, -.1])
                polyhole(d = 5, h = 2.2);
            translate([10, nema17PlateWidth - 10, -.1])
                polyhole(d = 5, h = 2.2);        }

    translate([0, 20, 0])
    difference()
    {
        cube([22, 2, xRailBracketSizeHeight]);

        translate([10, -.1, 10])
            rotate([-90, 0, 0])
                polyhole(d = 5, h = 2.2);
        translate([10, -.1, xRailBracketSizeHeight -10])
            rotate([-90, 0, 0])
                polyhole(d = 5, h = 2.2);
    }
    
    translate([20, 20, 0])
    difference()
    {
        pulleyHeight = 11.2;
        blockHeight = 2 * 3 + pulleyHeight * 2;

        cube([nema17PlateWidth / 2 + 6, nema17PlateWidth / 2 + 10, blockHeight]);
        translate([2, 8, 2.2]) {
            translate([0, 0, 0])
                cube([nema17PlateWidth / 2 + 6, nema17PlateWidth / 2 + 10, pulleyHeight]);
            translate([0, 0, 13.2])
                cube([nema17PlateWidth / 2 + 6, nema17PlateWidth / 2 + 10, pulleyHeight]);
        }

        translate([15, nema17PlateWidth / 2, -.1])
            polyhole(d = 4.2, h = 30);
    }
}

module xRailBracketFrontRight()
{
    mirror([1,0,0])
        xRailBracketRight();
}

module xRailBracketBackRight()
{
    mirror([1, 0, 0])
    mirror([0, 1, 0])
        xRailBracketRight();
}