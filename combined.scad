include <combined/includes.scad>

// positions
zGantryPosition = 335;
carriageYPosition = 300; //printerSizeX / 2;
carriageXPosition = 100; //printerSizeX / 2;

// render options
renderFrame = true;
renderBelts = true;
renderZAxis = true;
renderZGantry = true;
renderXAxis = true;
renderYAxis = true;
renderXCarriage = true;
renderE3DHotEnd = true;

// sizes
heatBedX = 310;
heatBedY = 310;
heatBedScrewOffset = 35;
printerSizeX = 500;
printerSizeY = 500;
printerSizeZ = 610;

bottomHeight = 40;
secondHeight = printerSizeZ - yRailBracketSizeHeight - 80; //20 for the top rail, 20 for the angle bracket and 40 for the bar itself
printedColor = [.5, 0, 0];
printedColor1 = [.6, .1, .1];
frameColor = [.2, .2, .2];
bearingColor = [.5, .5, .5];
beltColor = [.52, .36, .23];
purpleColor = [.64, .12, .94];
frameExtrusionHorizontalX = printerSizeX - 40;
frameExtrusionHorizontalY = printerSizeY - 40;
yBarLength = printerSizeY - 50; // -4 for the space for the brackets
xBarLength = printerSizeX - 40 - 4; // -40 for the brackets
gantryXExtrusionLength = printerSizeX - 150 - zGantryBracketX;
gantryYExtrusionLength = max(heatBedY - (bedBracketDepth + bedBracketThickness) * 2, zGantryBracketY) + 5;

zScrewLength = 365;
zBarLength = secondHeight - bottomHeight; //zScrewLength + 20 + 20; //20 above for the top bracket and 20 below for the bottom bracket

//overrides here

zBarLength = 415;
xBarLength = 450;

//end overrides

zBarOffset = secondHeight - 20 - zBarLength - bottomHeight;
actualCarriageXPosition = carriageXPosition + 115;
actualCarriageYPosition = carriageYPosition + 110;

echo("PARTS: 2x 10mm Steel Bar", xBarLength, "X");
echo("PARTS: 2x 10mm Steel Bar", yBarLength, "Y");
echo("PARTS: 4x 10mm Steel Bar: ", zBarLength, "Z");
echo("PARTS: 2x  20x20 Extrusion: ", gantryXExtrusionLength, "gantry - X");
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

if (renderFrame)
    color(frameColor)
        frame();

if (renderZAxis) {
    translate([20, printerSizeY / 2 + zBottomWidth / 2, 0])
        rotate([0, 0, -90])
            zAxis(bottom = bottomHeight + 40, top = secondHeight, zBarOffset = zBarOffset);

    translate([printerSizeX - 20, printerSizeY / 2 - zBottomWidth / 2, 0])
        rotate([0, 0, 90])
            zAxis(bottom = bottomHeight + 40, top = secondHeight, zBarOffset = zBarOffset);
}

if (renderZGantry)
    translate([0, 0, bottomHeight + 40 + zGantryPosition])
        ZGantry();

// Different parts of the motion system
translate([0, 0, printerSizeZ - 40 - yRailBracketSizeHeight]) {
    if (renderYAxis) {
        combinedYBarRight();
        combinedYBarLeft();
    }
    if (renderBelts)
        Belts();

    if (renderXAxis)
        translate([printerSizeX / 2 - xBarLength / 2, actualCarriageYPosition + 24, -6]) {
            translate([0, 0, 44])
                rotate([0, 90, 0])
                    tenMMBar(l = yBarLength);

            rotate([0, 90, 0])
                tenMMBar(l = yBarLength);
        }
}



if (renderXCarriage) {
    translate([actualCarriageXPosition - 12, actualCarriageYPosition + 11, secondHeight + 14]) {
        // translate([-15, -40, 35])
        //     rotate([0,0,90])
        //         yCarriageE3DV6Clamp();
                
        // rotate([0,0,-90])
        {
            color(bearingColor)
            translate([5.5, 12.5, 20])
                rotate([0, 90, 0])
                    lmu10();

            color(bearingColor)
            translate([5.5, 12.5, 64])
                rotate([0, 90, 0])
                    lmu10();

            // color(printedColor)
            // translate([0, 5, 0])
            //     yCarriageBearingClamp();

            // translate([30,35.5,20])
            //     yCarriageBearingBeltClamp();
        
            translate([0, -20, 0]) {
                xCarriageE3DV6();
                
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


                    }
                }
                //part fan
                color([.4,.4,.4])
                translate([5, 21, 25])
                    rotate([90, 0, 0])
                    blowerFan();
            }
        }
    }
}
