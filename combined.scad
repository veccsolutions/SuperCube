include <common.scad>
include <parts/bedBracket.scad>
include <parts/nema17motor.scad>
include <parts/x-carriageBearingClamp.scad>
include <parts/x-carriageE3DV6.scad>
include <parts/y-RailBrackets.scad>
include <parts/y-carriageBearingClamp.scad>
include <parts/y-carriageFront.scad>
include <parts/y-carriageBack.scad>
include <parts/z-top.scad>
include <parts/z-bottom.scad>
include <parts/z-GantryBracket.scad>
include <parts/railClamp.scad>

renderFrame = false;


bottomHeight = 40;
secondHeight = bottomHeight + 365 + 40;
printedColor = [.5, 0, 0];
printedColor1 = [.6, .1, .1];
frameColor = [.2, .2, .2];
bearingColor = [.5, .5, .5];
beltColor = [.52, .36, .23];
heatBedX = 220;
heatBedY = 200;
printerSizeX = 500;
printerSizeY = 500;
printerSizeZ = 610;
frameExtrusionHorizontalX = printerSizeX - 40;
frameExtrusionHorizontalY = printerSizeY - 40;
yBarLength = printerSizeY - 40 - 4; // -4 for the space for the brackets
xBarLength = printerSizeX - 40 - 40; // -40 for the brackets
gantryXExtrusionLength = printerSizeX - 150 - zGantryBracketX;
gantryYExtrusionLength = max(heatBedY - (bedBracketDepth + bedBracketThickness) * 2, zGantryBracketY);

zGantryPosition = 0;
carriageYPosition = 200;//printerSizeX / 2;
carriageXPosition = 100;//printerSizeX / 2;

zScrewLength = 365;
zBarLength = zScrewLength + 20 + 20; //20 above for the top bracket and 20 below for the bottom bracket

//overrides here

zBarLength = 415;
yBarLength = 450;

//end overrides

zBarOffset = zBarLength - zScrewLength - 20;
actualCarriageXPosition = carriageXPosition + 100;

echo("PARTS: Z-SCREW Length: ", zScrewLength);
echo("PARTS: Z-Bar: 4x ", zBarLength);
echo("PARTS: Y-Bar: 2x ", yBarLength);
echo("PARTS: X-Bar: 2x ", xBarLength);
echo("PARTS: 2x Gantry X Extrusion Length: ", gantryXExtrusionLength);
echo("PARTS: 2x Gantry Y Extrusion Length: ", gantryYExtrusionLength);
echo("PARTS: 8x 20x20 Extrusion: ", frameExtrusionHorizontalY);
echo("PARTS: 8x 20x40 Extrusion: ", frameExtrusionHorizontalY);
echo("PARTS: 4x 20x20 Extrusion: ", printerSizeZ);
echo("PRINT: 2x printables/z-top.scad");
echo("PRINT: 2x printables/z-bottom.scad");
echo("PRINT: 2x printables/z-gantryBracket.scad");
echo("PRINT: 4x printables/z-gantryBracketClamp.scad");
echo("PRINT: 4x printables/bedBracket.scad");
echo("PRINT: 1x printables/y-railBracketFrontLeft.scad");
echo("PRINT: 1x printables/y-railBracketFrontRight.scad");
echo("PRINT: 1x printables/y-railBracketBackLeft.scad");
echo("PRINT: 1x printables/y-railBracketBackRight.scad");
echo("PRINT: 2x M4x35mm screws"); //right side bearings

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
        extrusionHorizontalX(l = 460);

        translate([0, 0, bottomHeight])
            extrusionHorizontalX(l = 460, y = 40);

        translate([0, 0, secondHeight])
            extrusionHorizontalX(l = 460, y = 40);

        translate([0, 0, 610 - 20])
            extrusionHorizontalX(l = 460);
    }

    translate([20, 480, 0])
    {
        extrusionHorizontalX(l = frameExtrusionHorizontalX);

        translate([0, 0, bottomHeight])
            extrusionHorizontalX(l = frameExtrusionHorizontalX, y = 40);

        translate([0, 0, secondHeight])
            extrusionHorizontalX(l = frameExtrusionHorizontalX, y = 40);

        translate([0, 0, 610 - 20])
            extrusionHorizontalX(l = frameExtrusionHorizontalX);
    }

    translate([0, 20, 0])
    {
        extrusionHorizontalY(l = frameExtrusionHorizontalY);

        translate([0, 0, bottomHeight])
            extrusionHorizontalY(l = frameExtrusionHorizontalY, y = 40);

        translate([0, 0, secondHeight])
            extrusionHorizontalY(l = frameExtrusionHorizontalY, y = 40);

        translate([0, 0, 610 - 20])
            extrusionHorizontalY(l = frameExtrusionHorizontalY);
    }

    translate([480, 20, 0])
    {
        extrusionHorizontalY(l = frameExtrusionHorizontalY);

        translate([0, 0, bottomHeight])
            extrusionHorizontalY(l = frameExtrusionHorizontalY, y = 40);

        translate([0, 0, secondHeight])
            extrusionHorizontalY(l = frameExtrusionHorizontalY, y = 40);

        translate([0, 0, 610 - 20])
            extrusionHorizontalY(l = frameExtrusionHorizontalY);
    }
}

module zAxis()
{
    mirror([0, 0, 1])
    color(printedColor)
        zBottom();

    translate([10, 20, 0])
    {
        translate([0, 0, zGantryPosition])
            color(bearingColor)
            lmu10();

        translate([0, 0, -zBarOffset])
            tenMMBar(l = zBarLength);
    }

    translate([zBottomWidth - 10, 20, 0])
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

module bedBracketWithScrew()
{
    color(printedColor)
        bedBracket();

    translate([5, bedBracketDepth, bedBracketHeight - 10])
        polyhole(d = 3, h = bedBracketThickness + 15);
}

module combinedGantryBracket()
{
    color(printedColor)
        zGantryBracket();
    
    translate([zGantryBracketX, (zGantryBracketY - zGantryBracketBase) / 2, 0])
    {
        color(printedColor1)
        zGantryBracketClamp();

        translate([0, zGantryBracketBase - zGantryBracketBaseWidth, 0])
            color(printedColor1)
            zGantryBracketClamp();
    }
}

module combinedYBarFront()
{
    color(printedColor)
    translate([20, 0, 0])
        yRailBracketFrontLeft();

    color(printedColor)
    translate([printerSizeX, 0, 0])
        yRailBracketFrontRight();

    color(printedColor)
    translate([carriageYPosition + 4.5, 10, 0])
        yCarriageFront();

    color(printedColor1)
    translate([carriageYPosition - 6.5, 13, 58])
        rotate([180,0,0])
        yCarriageBearingClamp();

    color(bearingColor)
    translate([carriageYPosition, 13, 38])
        rotate([0,90,0])
        lmu10();

    translate([printerSizeX / 2 - yBarLength / 2, 13, 38])
        rotate([0,90,0])
        tenMMBar(l = yBarLength);

    translate([20, 20, -45]) {
        nema17motor();

        translate([nema17PlateWidth / 2, nema17PlateWidth / 2, 48])
            bearings12mm();
    }
}

module combinedYBarBack()
{
    color(printedColor)
    translate([20, 0, 0]) {
        rotate([0, 0, 0])
        yRailBracketBackLeft();
    }

    color(printedColor)
    translate([printerSizeX, 0, 0])
        yRailBracketBackRight();

    color(printedColor)
    translate([carriageYPosition + 4.5, -60, 0])
        yCarriageBack();

    color(printedColor1)
    translate([carriageYPosition - 6.5, -13, 18])
        yCarriageBearingClamp();

    color(bearingColor)
    translate([carriageYPosition, -13, 38])
        rotate([0,90,0])
        lmu10();

    translate([printerSizeX / 2 - yBarLength / 2, -13, 38])
        rotate([0,90,0])
        tenMMBar(l = yBarLength);

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
        translate([-heatBedX / 2, -(heatBedY / 2), 30])
            cube([heatBedX, heatBedY, 2]);

        color(frameColor)
        {
            translate([-gantryXExtrusionLength / 2, 0, 0])
            {
                translate([0, -(heatBedY / 2) + bedBracketThickness + bedBracketDepth, 0])
                    extrusionHorizontalX(l = gantryXExtrusionLength);
                    
                translate([0, (heatBedY / 2) - (20 + bedBracketThickness + bedBracketDepth), 0])
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

        translate([0, -(heatBedY / 2) + bedBracketThickness + bedBracketDepth, 0])
        mirror([0, 1])
        {
            translate([-(heatBedX / 2), 0, 0])
                    bedBracketWithScrew();

            translate([(heatBedX / 2) - bedBracketWidth, 0, 0])
                    bedBracketWithScrew();
        }

        translate([0, +(heatBedY / 2) - bedBracketThickness - bedBracketDepth, 0])
        {
            translate([-(heatBedX / 2), 0, 0])
                    bedBracketWithScrew();

            translate([(heatBedX / 2) - bedBracketWidth, 0, 0])
                    bedBracketWithScrew();
        }

        translate([gantryXExtrusionLength / 2 + 20, -zGantryBracketY / 2, 0])
        {
            combinedGantryBracket();
        }

        translate([-gantryXExtrusionLength / 2 - 20, -zGantryBracketY / 2, 0])
        {
            mirror([1, 0, 0])
            combinedGantryBracket();
        }
    }
}

if (renderFrame)
    color(frameColor)
        frame();

translate([20, printerSizeY / 2 - zBottomWidth / 2, bottomHeight + 40])
    mirror([1, -1, 0])
        zAxis();

translate([printerSizeX - 20, printerSizeY / 2 + zBottomWidth / 2, bottomHeight + 40])
    mirror([1, 1, 0])
        zAxis();

translate([0, 0, bottomHeight + 40 + zGantryPosition])
    ZGantry();

translate([0, 0, secondHeight + 40])
    combinedYBarFront();

translate([0, printerSizeY, secondHeight + 40])
    combinedYBarBack();

//belts
{
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
        translate([carriageYPosition + 17, frontMotorY + 13, -2]) //front
            bearings12mm();
        translate([carriageYPosition + 30, backMotorY, -2]) //back
            bearings12mm();

        color(beltColor) {
            // front motor turn
            translate([motorX - 6 - 1, frontMotorY - 6, 0])
                cube([1, 13, 6]);

            // x front inner
            translate([motorX - 6, frontMotorY + 6, 0])
                cube([carriageYPosition - 12, 1, 6]);
                
            // x front outer
            translate([motorX - 6 - 1, frontMotorY - 6, 0])
                cube([printerSizeX - 20 - nema17PlateWidth, 1, 6]);

            // y long
            translate([pulleyX + 6, pulleyFrontY - 6, 0])
                cube([1, rightBeltLength, 6]);

            // x back
            translate([carriageYPosition + 23, pulleyBackY, 0])
                cube([pulleyX - (carriageYPosition + 23) + 6, 1, 6]);

            // y back
            translate([carriageYPosition + 23, actualCarriageXPosition, 0]) // end: backMotorY + 6
                cube([1, (backMotorY + 6) - actualCarriageXPosition, 6]);

            // y front
            translate([carriageYPosition + 23, frontMotorY + 6, 0]) // end: backMotorY + 6
                cube([1, actualCarriageXPosition - 40 - frontMotorY - 6, 6]);
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
        translate([carriageYPosition + 30, frontMotorY + 1, -2]) //front
            bearings12mm();
        translate([carriageYPosition + 17, backMotorY - 12, -2]) // back
            bearings12mm();

        color(beltColor) {
            // back motor turn
            translate([motorX - 6 - 1, backMotorY - 6, 0])
                cube([1, 13, 6]);

            // x front
            translate([carriageYPosition + 23, pulleyFrontY - 6, 0])
                cube([pulleyX - (carriageYPosition + 23) + 6, 1, 6]);
            
            // y long
            translate([pulleyX + 6, pulleyFrontY - 6, 0])
                cube([1, rightBeltLength, 6]);

            // x back inner
            translate([motorX - 6, backMotorY - 6, 0])
                cube([carriageYPosition - 12, 1, 6]);
            
            // x back outer
            translate([motorX - 6 - 1, backMotorY + 6, 0])
                cube([printerSizeX - 20 - nema17PlateWidth, 1, 6]);

            // y back
            translate([carriageYPosition + 23, actualCarriageXPosition, 0]) // end: backMotorY + 6
                cube([1, backMotorY - actualCarriageXPosition - 5, 6]);

            // y front
            translate([carriageYPosition + 23, frontMotorY - 6, 0]) // end: backMotorY + 6
                cube([1, actualCarriageXPosition - 40 - frontMotorY + 6, 6]);
        }
    }
}

// x rods
{
    translate([carriageYPosition, printerSizeX / 2 - xBarLength / 2, 480]) {
        translate([0, 0, 40])
            rotate([-90,0,0])
            tenMMBar(l = xBarLength);

        rotate([-90,0,0])
        tenMMBar(l = xBarLength);
    }
}

translate([carriageYPosition - 12, actualCarriageXPosition, secondHeight + 15])
rotate([0,0,-90])
{
    xCarriageE3DV6();

    color(bearingColor)
    translate([5.5, 12, 20])
        rotate([0, 90, 0])
            lmu10();

    color(bearingColor)
    translate([5.6, 12, 60])
        rotate([0, 90, 0])
            lmu10();


    translate([0, 5, 0])
        xCarriageBearingClamp();

    translate([30,35.5,20])
        xCarriageBearingBeltClamp();
}