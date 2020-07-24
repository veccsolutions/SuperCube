include <common.scad>
include <parts/bedBracket.scad>
include <parts/e3dv6.scad>
include <parts/nema17motor.scad>
include <parts/x-carriageBearingClamp.scad>
include <parts/x-RailBrackets.scad>
include <parts/x-carriageFront.scad>
include <parts/x-carriageBack.scad>

include <parts/y-carriageBearingClamp.scad>
include <parts/y-carriageE3DV6.scad>

include <parts/z-top.scad>
include <parts/z-bottom.scad>
include <parts/z-GantryBracket.scad>
include <parts/railClamp.scad>

// positions
zGantryPosition = 335;
carriageYPosition = 300;//printerSizeX / 2;
carriageXPosition = 300;//printerSizeX / 2;

// render options
renderFrame = true;
renderBelts = true;
renderZAxis = true;
renderZGantry = true;
renderYAxis = true;
renderXAxis = true;
renderYCarriage = true;
renderE3DHotEnd = true;

// sizes
heatBedX = 310;
heatBedY = 310;
heatBedScrewOffset = 35;
printerSizeX = 500;
printerSizeY = 500;
printerSizeZ = 610;


bottomHeight = 40;
secondHeight = bottomHeight + 365 + 40;
printedColor = [.5, 0, 0];
printedColor1 = [.6, .1, .1];
frameColor = [.2, .2, .2];
bearingColor = [.5, .5, .5];
beltColor = [.52, .36, .23];
purpleColor = [.64, .12, .94];
frameExtrusionHorizontalX = printerSizeX - 40;
frameExtrusionHorizontalY = printerSizeY - 40;
yBarLength = printerSizeY - 40 - 40; // -4 for the space for the brackets
xBarLength = printerSizeX - 40 - 4; // -40 for the brackets
gantryXExtrusionLength = printerSizeX - 150 - zGantryBracketX;
gantryYExtrusionLength = max(heatBedY - (bedBracketDepth + bedBracketThickness) * 2, zGantryBracketY) + 5;

zScrewLength = 365;
zBarLength = zScrewLength + 20 + 20; //20 above for the top bracket and 20 below for the bottom bracket

//overrides here

zBarLength = 415;
XBarLength = 450;

//end overrides

zBarOffset = zBarLength - zScrewLength - 20;
actualcarriageXPosition = carriageXPosition + 105;
actualcarriageYPosition = carriageYPosition + 120;

echo("PARTS: 2x 10mm Steel Bar", xBarLength, "X");
echo("PARTS: 2x 10mm Steel Bar", yBarLength, "Y");
echo("PARTS: 4x 10mm Steel Bar: ", zBarLength, "Z");
echo("PARTS: 2x  20x20 Extrusion: ", gantryXExtrusionLength, "gantry - x");
echo("PARTS: 2x  20x20 Extrusion: ", gantryYExtrusionLength, "gantry - Y");
echo("PARTS: 8x  20x20 Extrusion: ", frameExtrusionHorizontalX, " frame - X");
echo("PARTS: 8x  20x40 Extrusion: ", frameExtrusionHorizontalY, " frame - Y");
echo("PARTS: 4x  20x20 Extrusion: ", printerSizeZ);
echo("PARTS: 2x  M4x35mm screws - right side belt bearings");
echo("PARTS: 4x  M4x15mm screws - y rail bearings");
echo("PARTS: 10x  M3x10mm screws - 8 for y rail clamps, 2 for E3D clamp");
echo("PARTS: 4x  M3x7mm screws - y carriage");
echo("PARTS: 38x M3x5mm screws - 32 rod clamp screws, 3 y carriage belt clamp");
echo("PARTS: 2x  M3x25mm screws - cooling fan");

echo("PARTS: 16x M3x10mm screws - motor screws");
    //bottom bar x->y - 8
    //bottom bar x->z - 8
    //bottom bar y->z - 8
    //second bar x->y - 8
    //second bar x->z - 8
    //second bar y->z - 8
    //third bar x->z - 8
    //third bar y->z - 8
    //fourth bar x->y - 8
    //fourth bar x->z - 8
    //fourth bar y->z - 8
    //gantry x->y - 8
echo("PARTS: 96x M5x8mm screws - frame corners");
    //z bottom - 4
    //gantry bracket - 8
    //gantry bed - 8
    //left x rail - 12
    //right x rail - 12
echo("PARTS: 44x M5x10mm screws - plastic to frame");
echo("PARTS: 156x M5 T-Nuts for 20x20 extrusion");


echo("PARTS: Z-SCREW Length: ", zScrewLength);
echo("PARTS: 2x Z-Motors");
echo("PARTS: 2x XY-Motors");
echo("PARTS: 6mm Belt length (rough estimate):", (frameExtrusionHorizontalX * 2 + frameExtrusionHorizontalY) * 2);
echo("PARTS: 6x 6mm Toothed Idler Pulleys");
echo("PARTS: 2x 6mm Smooth Idler Pulleys");

echo("PRINT: 1x printables/x-carriageBack.scad");
echo("PRINT: 1x printables/x-carriageBackBeltClamp.scad");
echo("PRINT: 1x printables/x-carriageE3DV6.scad");
echo("PRINT: 1x printables/x-carriageE3DV6Clamp.scad");
echo("PRINT: 2x printables/y-carriageBack.scad");
echo("PRINT: 1x printables/y-railBracketBackLeft.scad");
echo("PRINT: 1x printables/y-railBracketBackRight.scad");
echo("PRINT: 1x printables/y-railBracketFrontLeft.scad");
echo("PRINT: 1x printables/y-railBracketFrontRight.scad");
echo("PRINT: 2x printables/z-bottom.scad");
echo("PRINT: 2x printables/z-gantryBracket.scad");
echo("PRINT: 4x printables/z-gantryBracketClamp.scad");
echo("PRINT: 2x printables/z-top.scad");
echo("PRINT: 4x printables/bedBracket.scad");


echo("MEASUREMENTS: Top 40x20", zScrewLength);
echo("MEASUREMENTS: Bottom 40x20", bottomHeight);

module frame()
{
    extrusionVertical(l = printerSizeZ);
    translate([frameExtrusionHorizontalX + 20, 0, 0])
        extrusionVertical(l = printerSizeZ);

    translate([0, frameExtrusionHorizontalY + 20, 0])
    {
        extrusionVertical(l = printerSizeZ);
        translate([frameExtrusionHorizontalX + 20, 0, 0])
            extrusionVertical(l = printerSizeZ);
    }

    translate([20, 0, 0])
    {
        extrusionHorizontalX(l = frameExtrusionHorizontalX);

        translate([0, 0, bottomHeight])
            extrusionHorizontalX(l = frameExtrusionHorizontalX, y = 40);

        translate([0, 0, secondHeight])
            extrusionHorizontalX(l = frameExtrusionHorizontalX, y = 40);

        translate([0, 0, printerSizeZ - 20])
            extrusionHorizontalX(l = frameExtrusionHorizontalX);
    }

    translate([20, printerSizeY - 20, 0])
    {
        extrusionHorizontalX(l = frameExtrusionHorizontalX);

        translate([0, 0, bottomHeight])
            extrusionHorizontalX(l = frameExtrusionHorizontalX, y = 40);

        translate([0, 0, secondHeight])
            extrusionHorizontalX(l = frameExtrusionHorizontalX, y = 40);

        translate([0, 0, printerSizeZ - 20])
            extrusionHorizontalX(l = frameExtrusionHorizontalX);
    }

    translate([0, 20, 0])
    {
        extrusionHorizontalY(l = frameExtrusionHorizontalY);

        translate([0, 0, bottomHeight])
            extrusionHorizontalY(l = frameExtrusionHorizontalY, y = 40);

        translate([0, 0, secondHeight])
            extrusionHorizontalY(l = frameExtrusionHorizontalY, y = 40);

        translate([0, 0, printerSizeZ - 20])
            extrusionHorizontalY(l = frameExtrusionHorizontalY);
    }

    translate([printerSizeX - 20, 20, 0])
    {
        extrusionHorizontalY(l = frameExtrusionHorizontalY);

        translate([0, 0, bottomHeight])
            extrusionHorizontalY(l = frameExtrusionHorizontalY, y = 40);

        translate([0, 0, secondHeight])
            extrusionHorizontalY(l = frameExtrusionHorizontalY, y = 40);

        translate([0, 0, printerSizeZ - 20])
            extrusionHorizontalY(l = frameExtrusionHorizontalY);
    }
}

module zAxis()
{
    translate([zBottomWidth, 0, 0])
    rotate([180, 0, 180])
    color(printedColor)
        zBottom();

    translate([10, 20, 0])
    {
        translate([0, 0, zGantryPosition - 1])
            color(bearingColor)
            lmu10();

        translate([0, 0, -zBarOffset])
            tenMMBar(l = zBarLength);
    }

    translate([zBottomWidth - 10, 20, -1])
    {
        translate([0, 0, zGantryPosition])
            color(bearingColor)
            lmu10();

        translate([0, 0, -zBarOffset])
            tenMMBar(l = zBarLength);
    }

    translate([zBottomWidth / 2, 25, 0])
    {
        cylinder(d = 8, h = zScrewLength, $fn = 100);
    }

    color(printedColor)
    translate([00, 0, zScrewLength])
        zTop();
}

module bedBracketWithScrew(hole = 1)
{
    if (hole == 1) {
        color(printedColor)
            translate([0, -20, -bedBracketThickness])
                bedBracket();
        translate([13, 17, 0])
            polyhole(d = 10, h = 27);
    }
    else {
        color(printedColor)
            translate([bedBracketWidth, -20, 0])
            rotate([0,180,0])
                bedBracket();
        translate([28.5, 17, 0])
            polyhole(d = 10, h = 27);
    }
}

module combinedGantryBracket()
{
    color(printedColor)
        zGantryBracket();
    
    translate([zGantryBracketX + 1, (zGantryBracketY - zGantryBracketBase) / 2, 0])
    {
        color(printedColor1)
        zGantryBracketClamp();

        translate([0, zGantryBracketBase - zGantryBracketBaseWidth, 0])
            color(printedColor1)
            zGantryBracketClamp();
    }
}

module combinedXBarFront()
{
    color(printedColor)
    translate([20, 0, 0])
        xRailBracketFrontLeft();

    color(printedColor)
    translate([printerSizeX, 0, 0])
        xRailBracketFrontRight();

    color(printedColor)
    translate([actualcarriageXPosition + 4.5, 10, 0])
        xCarriageFront();

    color(printedColor1)
    translate([actualcarriageXPosition - 6.5, 13, 58])
        rotate([180,0,0])
        xCarriageBearingClamp();

    color(bearingColor)
    translate([actualcarriageXPosition, 13, 38])
        rotate([0,90,0])
        lmu10();

    translate([printerSizeX / 2 - xBarLength / 2, 13, 38])
        rotate([0,90,0])
        tenMMBar(l = xBarLength);

    translate([20, 20, -45]) {
        nema17motor();

        translate([nema17PlateWidth / 2, nema17PlateWidth / 2, 48])
            bearings12mm();
    }
}

module combinedXBarBack()
{
    color(printedColor)
    translate([20, 0, 0]) {
        // rotate([0, 0, -90])
        xRailBracketBackLeft();
    }

    color(printedColor)
    translate([printerSizeX, 0, 0])
        xRailBracketBackRight();

    color(printedColor)
    translate([actualcarriageXPosition + 4.5, -60, 0])
        xCarriageBack();

    color(printedColor1)
    translate([actualcarriageXPosition - 6.5, -13, 18])
        xCarriageBearingClamp();

    color(bearingColor)
    translate([actualcarriageXPosition, -13, 38])
        rotate([0,90,0])
        lmu10();

    translate([printerSizeX / 2 - xBarLength / 2, -13, 38])
        rotate([0,90,0])
        tenMMBar(l = xBarLength);

    translate([20, -nema17PlateWidth - 20, -45 + 13]) {
        nema17motor();

        translate([nema17PlateWidth / 2, nema17PlateWidth / 2, 48])
            bearings12mm();
    }
}

module ZGantry()
{
    translate([printerSizeX / 2, printerSizeY / 2, 0])
    {
        translate([-heatBedX / 2, -(heatBedY / 2), 27])
        {
            difference() {
                cube([heatBedX, heatBedY, 2]);
                translate([heatBedScrewOffset, heatBedScrewOffset, -.1])
                    polyhole(d = 4, h = 2.2);
                translate([heatBedX - heatBedScrewOffset, heatBedScrewOffset, -.1])
                    polyhole(d = 4, h = 2.2);
                translate([heatBedScrewOffset, heatBedX - heatBedScrewOffset, -.1])
                    polyhole(d = 4, h = 2.2);
                translate([heatBedX - heatBedScrewOffset, heatBedX - heatBedScrewOffset, -.1])
                    polyhole(d = 4, h = 2.2);
            }
        }

        color(frameColor)
        {
            translate([-gantryXExtrusionLength / 2, 0, 0])
            {
                translate([0, -(heatBedY / 2) + bedBracketThickness + bedBracketDepth - 2.5, 0])
                    extrusionHorizontalX(l = gantryXExtrusionLength);
                    
                translate([0, (heatBedY / 2) - (20 + bedBracketThickness + bedBracketDepth) + 2.5, 0])
                    extrusionHorizontalX(l = gantryXExtrusionLength);
            }

            translate([-gantryXExtrusionLength / 2 - 20, 0, 0])
            {
                translate([0, -(gantryYExtrusionLength / 2), 0])
                    extrusionHorizontalY(l = gantryYExtrusionLength);

                translate([gantryXExtrusionLength + 20, -(gantryYExtrusionLength / 2), 0])
                    extrusionHorizontalY(l = gantryYExtrusionLength);
            }
        }

        translate([0, -(heatBedY / 2) + bedBracketThickness + bedBracketDepth - 2.5, 0])
        rotate([0, 0, 180])
        {
            translate([-(heatBedX / 2) + heatBedScrewOffset - 13, 0, 0])
                bedBracketWithScrew();

            translate([(heatBedX / 2) - bedBracketWidth - heatBedScrewOffset + 13, 0, 0])
                bedBracketWithScrew(hole = 2);
        }

        translate([0, (heatBedY / 2) - bedBracketThickness - bedBracketDepth + 2.5, 0])
        {
            translate([-(heatBedX / 2) + heatBedScrewOffset - 13, 0, 0])
                bedBracketWithScrew();

            translate([(heatBedX / 2) - bedBracketWidth - heatBedScrewOffset + 13, 0, 0])
                bedBracketWithScrew(hole = 2);
        }

        translate([gantryXExtrusionLength / 2 + 20, -zGantryBracketY / 2, 0])
        {
            combinedGantryBracket();
        }

        translate([-gantryXExtrusionLength / 2 - 20, zGantryBracketY / 2, 0])
        {
            rotate([0, 0, 180])
                combinedGantryBracket();
        }
    }
}

module Belts() {
    motorX = 20 + nema17PlateWidth / 2;
    backMotorY = printerSizeY - 20 - nema17PlateWidth / 2;
    frontMotorY = 20 + nema17PlateWidth / 2;
    pulleyX = printerSizeX - 35;
    pulleyFrontY = 20 + nema17PlateWidth / 2;
    pulleyBackY = printerSizeY - 35;
    pulleyBottomZ = 490;
    pulleyTopZ = pulleyBottomZ + 12;
    rightBeltLength = pulleyBackY - pulleyFrontY + 6;
    
    // bottom belt
    translate([0,0,490]) {
        // stationary idlers
        translate([pulleyX, frontMotorY, -2])
            bearings12mm();
        translate([pulleyX, backMotorY, -2])
            bearings12mm();

        // carriage idlers
        translate([actualcarriageXPosition + 17, frontMotorY + 13, -2]) //front
            bearings12mm();
        translate([actualcarriageXPosition + 30, backMotorY, -2]) //back
            bearings12mm();

        color(beltColor) {
            // front motor turn
            translate([motorX - 6 - 1, frontMotorY - 6, 0])
                cube([1, 13, 6]);

            // x front inner
            translate([motorX - 6, frontMotorY + 6, 0])
                cube([actualcarriageXPosition - 12, 1, 6]);
                
            // x front outer
            translate([motorX - 6 - 1, frontMotorY - 6, 0])
                cube([printerSizeX - 20 - nema17PlateWidth, 1, 6]);

            // y long
            translate([pulleyX + 6, pulleyFrontY - 6, 0])
                cube([1, rightBeltLength, 6]);

            // x back
            translate([actualcarriageXPosition + 23, pulleyBackY, 0])
                cube([pulleyX - (actualcarriageXPosition + 23) + 6, 1, 6]);

            // y back
            translate([actualcarriageXPosition + 23, actualcarriageYPosition, 0]) // end: backMotorY + 6
                cube([1, (backMotorY + 6) - actualcarriageYPosition, 6]);

            // y front
            translate([actualcarriageXPosition + 23, frontMotorY + 6, 0]) // end: backMotorY + 6
                cube([1, actualcarriageYPosition - 40 - frontMotorY - 6, 6]);
        }
    }

    //top belt
    translate([0,0,503]) {
        // stationary idlers
        translate([pulleyX, frontMotorY, -2]) //front
            bearings12mm();
        translate([pulleyX, backMotorY, -2]) //back
            bearings12mm();

        // carriage idlers
        translate([actualcarriageXPosition + 30, frontMotorY + 1, -2]) //front
            bearings12mm();
        translate([actualcarriageXPosition + 17, backMotorY - 12, -2]) // back
            bearings12mm();

        color(beltColor) {
            // back motor turn
            translate([motorX - 6 - 1, backMotorY - 6, 0])
                cube([1, 13, 6]);

            // x front
            translate([actualcarriageXPosition + 23, pulleyFrontY - 6, 0])
                cube([pulleyX - (actualcarriageXPosition + 23) + 6, 1, 6]);
            
            // y long
            translate([pulleyX + 6, pulleyFrontY - 6, 0])
                cube([1, rightBeltLength, 6]);

            // x back inner
            translate([motorX - 6, backMotorY - 6, 0])
                cube([actualcarriageXPosition - 12, 1, 6]);
            
            // x back outer
            translate([motorX - 6 - 1, backMotorY + 6, 0])
                cube([printerSizeX - 20 - nema17PlateWidth, 1, 6]);

            // y back
            translate([actualcarriageXPosition + 23, actualcarriageYPosition, 0]) // end: backMotorY + 6
                cube([1, backMotorY - actualcarriageYPosition - 5, 6]);

            // y front
            translate([actualcarriageXPosition + 23, frontMotorY - 6, 0]) // end: backMotorY + 6
                cube([1, actualcarriageYPosition - 40 - frontMotorY + 6, 6]);
        }
    }
}

if (renderFrame)
    color(frameColor)
        frame();

if (renderZAxis) {
    translate([20, printerSizeY / 2 + zBottomWidth / 2, bottomHeight + 40])
        rotate([0, 0, -90])
            zAxis();

    translate([printerSizeX - 20, printerSizeY / 2 - zBottomWidth / 2, bottomHeight + 40])
        rotate([0, 0, 90])
            zAxis();
}

if (renderZGantry)
    translate([0, 0, bottomHeight + 40 + zGantryPosition])
        ZGantry();

if (renderXAxis) {
    translate([0, 0, secondHeight + 40])
        combinedXBarFront();

    translate([0, printerSizeY, secondHeight + 40])
        combinedXBarBack();
}

if (renderBelts)
    Belts();

if (renderYAxis)
    translate([actualcarriageXPosition, printerSizeY / 2 - yBarLength / 2, 480]) {
        translate([0, 0, 40])
            rotate([-90,0,0])
            tenMMBar(l = yBarLength);

        rotate([-90,0,0])
        tenMMBar(l = yBarLength);
    }

if (renderYCarriage) {
    translate([actualcarriageXPosition - 12, actualcarriageYPosition, secondHeight + 15]) {
        translate([-15, -40, 35])
            rotate([0,0,90])
                yCarriageE3DV6Clamp();
        rotate([0,0,-90])
        {
            yCarriageE3DV6();

            color(bearingColor)
            translate([5.5, 12, 20])
                rotate([0, 90, 0])
                    lmu10();

            color(bearingColor)
            translate([5.6, 12, 60])
                rotate([0, 90, 0])
                    lmu10();

            translate([0, 5, 0])
                yCarriageBearingClamp();

            translate([30,35.5,20])
                yCarriageBearingBeltClamp();
        
                
            if (renderE3DHotEnd) {
                translate([20, -15, 50])
                {
                    rotate([0,0,-90])
                        e3dv6();

                    //cold end fan bracket
                    color(purpleColor)
                    translate([15, -15, -50])
                        rotate([0,0,90])
                        e3dv6Fan();
                    
                    //cold end fan
                    color([.4,.4,.4])
                    translate([25, -15, -50])
                        rotate([0,0,90])
                        cube([30, 10, 30]);

                    //part fan
                    color([.4,.4,.4])
                    translate([-25, 35, -60])
                        rotate([30, 0, 0])
                        cube([50, 50, 15]);
                }
            }
        }
    }
}
