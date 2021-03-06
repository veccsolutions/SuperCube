zGantryBracketY = 190;
zGantryBracketX = 30;
zGantryBracketBaseWidth = 40;
zGantryBracketBase = 170;

module zGantryBracketClampBase()
{
    difference()
    {
        cube([zGantryBracketX, zGantryBracketBaseWidth, 20]);

        translate([zGantryBracketX+.4, zGantryBracketBaseWidth / 2, -.1])
            lmu10();

        translate([zGantryBracketX - 8, -.1, 10 - 6/2])
            cube([3, 10, 6]);

        translate([zGantryBracketX - 10, 5, 10])
            rotate([0, 90, 0])
                hole3mm(h = 10.1);

        translate([zGantryBracketX - 8, zGantryBracketBaseWidth - 10, 10 - 6 / 2])
            cube([3, 10.1, 6]);
            
        translate([zGantryBracketX - 10, zGantryBracketBaseWidth - 5, 10])
            rotate([0, 90, 0])
                hole3mm(h = 10.1);    
    }
}

module zGantryBracketScrewBracket()
{
    depth = zGantryBracketX + 10;

    difference()
    {
        cube([depth,30,2]);

        //center
        translate([depth / 2 + 3, 15, -.1])
            pomNutMount();
    }

    translate([0, 2, 2])
        mirror([0,0,1])
        rotate([0, 180, -90])
            triangle(out = depth, up = 18, thick = 2);

    translate([0, 30, 2])
        mirror([0,0,1])
        rotate([0, 180, -90])
            triangle(out = depth, up = 18, thick = 2);
}


module zGantryBracket()
{
    translate([0, (zGantryBracketY - zGantryBracketBase) / 2, 0])
    {
        zGantryBracketClampBase();

        translate([0, zGantryBracketBase - zGantryBracketBaseWidth, 0])
            zGantryBracketClampBase();
    }
    
    difference()
    {
        cube([2, zGantryBracketY, 20]);

        translate([-.1, 5, 10])
            rotate([0, 90, 0])
                hole5mm(h = 2.2);

        translate([-.1, zGantryBracketY - 5, 10])
            rotate([0, 90, 0])
                hole5mm(h = 2.2);

        translate([-.1, zGantryBracketY / 2 - 30, 10])
            rotate([0, 90, 0])
                hole5mm(h = 2.2);

        translate([-.1, zGantryBracketY / 2 + 30, 10])
            rotate([0, 90, 0])
                hole5mm(h = 2.2);
    }

    translate([2, zGantryBracketY / 2 - 15, 0])
    {
        zGantryBracketScrewBracket();
    }
}

module zGantryBracketClamp()
{
    width = 19 / 2 + 1;

    difference()
    {
        cube([width, zGantryBracketBaseWidth, 20]);

        translate([-1, zGantryBracketBaseWidth / 2, -.5])
            lmu10();

        translate([-.1, 5, 10])
            rotate([0, 90, 0])
            {
                hole3mm(h = width + .2);

                translate([0, 0, width - 3])
                    polyhole(d = 6, h = 3.2);
            }
            
        translate([-.1, zGantryBracketBaseWidth - 5, 10])
            rotate([0, 90, 0])
            {
                polyhole(d = 3, h = width + .2);
                
                translate([0, 0, width - 3])
                    polyhole(d = 6, h = 3.2);
            }
    }
}