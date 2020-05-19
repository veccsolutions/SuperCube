bedBracketWidth = 10;
bedBracketHeight = 22;
bedBracketThickness = 5;
bedBracketDepth = 20;

module bedBracket()
{
    difference()
    {
        cube([bedBracketWidth, bedBracketThickness, bedBracketHeight]);
        translate([bedBracketThickness, -.1, 10])
            rotate([-90, 0, 0])
            polyhole(d = 5, h = bedBracketThickness+.2);
    }

    translate([0, bedBracketThickness, 22 - bedBracketThickness])
    difference()
    {
        cube([bedBracketWidth, bedBracketDepth, bedBracketThickness]);
        translate([bedBracketWidth / 2, bedBracketDepth - 5, 0])
            polyhole(d = 3, h = bedBracketThickness);
    }
}