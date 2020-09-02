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