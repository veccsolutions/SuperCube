module combinedYBarRight()
{
    color(printedColor)
    translate([printerSizeX, 20, 0])
        rotate([0, 0, 90])
            MotorMountRight();
            
    color(printedColor)
    translate([printerSizeX, printerSizeY, 0])
        rotate([0, 0, 90])
         yRailBracketRight();

    color(printedColor)
    translate([printerSizeX - 10, actualCarriageYPosition + 6, 0])
        rotate([0, 0, 90])
        yCarriageRight();

    // TODO: Fix the YCarriage Clamp
    // color(printedColor1)
    // translate([printerSizeX - 10, actualCarriageYPosition + 44, 18])
    //     rotate([0,0,-90])
    //     xCarriageBearingClamp();

    color(bearingColor)
    translate([printerSizeX - 13, actualCarriageYPosition + 7.5, 38])
        rotate([-90,0,0])
        lmu10();

    translate([printerSizeX - 13, 22, 38])
        rotate([-90,0,0])
        tenMMBar(l = yBarLength);

    translate([printerSizeX - 20 - nema17PlateWidth, 20, -45]) {
        nema17motor();

        translate([nema17PlateWidth / 2, nema17PlateWidth / 2, 48])
            bearings12mm();
    }
}

module combinedYBarLeft()
{
    color(printedColor)
    translate([0, 20, 0]) {
        rotate([0, 0, 90])
            MotorMountLeft();
    }

    color(printedColor)
    translate([0, printerSizeY, 0])
        rotate([0, 0, 90])
            yRailBracketLeft();

    color(printedColor)
    translate([10, actualCarriageYPosition + 42, 0])
        rotate([0, 0, -90])
            yCarriageLeft();

    //TODO: fix the yCarriageBearingClamp
    // color(printedColor1)
    // translate([13, actualCarriageYPosition - 6.5, 18])
    //     rotate([0, 0, 90])
    //     xCarriageBearingClamp();

    color(bearingColor)
    translate([13, actualCarriageYPosition + 11, 38])
        rotate([-90, 0, 0])
        lmu10();

    translate([13, 22, 38])
        rotate([-90, 0, 0])
        tenMMBar(l = xBarLength);

    translate([20, 20, -45 + 13]) {
        nema17motor();

        translate([nema17PlateWidth / 2, nema17PlateWidth / 2, 48])
            bearings12mm();
    }
}

module Belts() {
    motorX = 20 + nema17PlateWidth / 2;
    rightMotorX = printerSizeY - 20 - nema17PlateWidth / 2;
    leftMotorX = 20 + nema17PlateWidth / 2;
    backPulleyY = printerSizeX - 35 - 20;
    backBeltLength = printerSizeY - 40 - 30;

    // bottom belt
    translate([0, 20, 5]) {
        // stationary idlers
        translate([leftMotorX, backPulleyY, -2])
            bearings12mm();
        translate([rightMotorX, backPulleyY, -2])
            bearings12mm();

        // carriage idlers
        translate([leftMotorX, actualCarriageYPosition + 10.5, -2]) //left
            bearings12mm();
        translate([rightMotorX - 13, actualCarriageYPosition - 2, -2]) //right
            bearings12mm();

        color(beltColor) {
            // right motor turn
            translate([rightMotorX - 7, nema17PlateWidth / 2 - 7, 0])
                cube([13, 1, 6]);

            // inner right
            translate([rightMotorX - 7, nema17PlateWidth / 2 - 7, 0])
                cube([1, actualCarriageYPosition - 10, 6]);

            // outer right
            translate([rightMotorX + 6, nema17PlateWidth / 2 - 7, 0])
                cube([1, printerSizeY - 20 - nema17PlateWidth, 6]);

            // back
            translate([leftMotorX - 6, backPulleyY + 6, 0])
                cube([backBeltLength, 1, 6]);

            // left
            translate([leftMotorX - 7, actualCarriageYPosition + 4, 0]) {
                // side
                cube([1, printerSizeY - actualCarriageYPosition - 52, 6]);
                // x
                cube([actualCarriageXPosition, 1, 6]); // TODO: adjust for x carriage position offset
            }

            // right x
            translate([actualCarriageXPosition + 80, actualCarriageYPosition + 4, 0]) // end: rightMotorX + 6
                cube([printerSizeX - actualCarriageXPosition - 80 - 20 - nema17PlateWidth / 2 - 7 + 1, 1, 6]);
                //x = offset from translate - extrusion - bearing position + belt width
        }
    }

    //top belt
    translate([0, 20, 18]) {
        // stationary idlers
        translate([leftMotorX, backPulleyY, -2]) //front
            bearings12mm();
        translate([rightMotorX, backPulleyY, -2]) //back
            bearings12mm();

        // carriage idlers
        translate([leftMotorX + 13, actualCarriageYPosition - 2.5, -2]) // left
            bearings12mm();
        translate([rightMotorX, actualCarriageYPosition + 11, -2]) // right
            bearings12mm();

        color(beltColor) {
            // left motor turn
            translate([leftMotorX - 7, nema17PlateWidth / 2 - 7, 0])
                cube([13, 1, 6]);

            // inner left
            translate([leftMotorX + 6, nema17PlateWidth / 2 - 7, 0])
                cube([1, actualCarriageYPosition - 10, 6]);

            // outer left
            translate([leftMotorX - 7, nema17PlateWidth / 2 - 7, 0])
                cube([1, printerSizeY - 20 - nema17PlateWidth, 6]);

            // back
            translate([leftMotorX - 6, backPulleyY + 6, 0])
                cube([backBeltLength, 1, 6]);

            // right side
            translate([rightMotorX + 6, actualCarriageYPosition + 4, 0])
                cube([1, printerSizeY - actualCarriageYPosition - 52, 6]);

            // left x
            translate([leftMotorX + 6, actualCarriageYPosition + 4, 0]) // end: rightMotorX + 6
                cube([actualCarriageXPosition - 13, 1, 6]);

            // right x
            translate([actualCarriageXPosition + 80, actualCarriageYPosition + 4, 0]) // end: rightMotorX + 6
                cube([printerSizeX - actualCarriageXPosition - 80 - 20 - nema17PlateWidth / 2 + 7, 1, 6]);
        }
    }
}