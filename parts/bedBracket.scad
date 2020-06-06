bedBracketWidth = 10;
bedBracketHeight = 22;
bedBracketThickness = 5;
bedBracketDepth = 20;

module bedBracket()
{
    difference() {
        union() {
            cube([20, bedBracketThickness, bedBracketHeight]);
            translate([0, bedBracketThickness, 22 - bedBracketThickness])
                cube([bedBracketWidth, bedBracketDepth, bedBracketThickness]);
        }
    }
    // difference()
    // {
    //     cube([bedBracketWidth, bedBracketThickness, bedBracketHeight]);
    //     translate([bedBracketThickness, -.1, 10])
    //         rotate([-90, 0, 0])
    //         polyhole(d = 5.2, h = bedBracketThickness+.2);
    // }

    // translate([0, bedBracketThickness, 22 - bedBracketThickness])
    // difference()
    // {
    //     cube([bedBracketWidth, bedBracketDepth, bedBracketThickness]);
    //     translate([bedBracketWidth / 2, bedBracketDepth - 5, 0])
    //         polyhole(d = 3.2, h = bedBracketThickness);
    // }
}