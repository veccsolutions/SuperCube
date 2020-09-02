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