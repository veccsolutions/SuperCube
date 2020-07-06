bedBracketWidth = 40;
bedBracketHeight = 22;
bedBracketThickness = 5;
bedBracketDepth = 20;

module bedBracket()
{
    difference() {
        union() {
            cube([bedBracketWidth, bedBracketThickness, bedBracketHeight]);
            translate([0, bedBracketThickness, 22 - bedBracketThickness])
                cube([bedBracketWidth, bedBracketDepth, bedBracketThickness]);
        }

        translate([5, bedBracketDepth, bedBracketHeight - bedBracketThickness-.1])
            hole3mm(h = bedBracketThickness+.2);

        translate([bedBracketWidth - 5, bedBracketDepth, bedBracketHeight - bedBracketThickness-.1])
            hole3mm(h = bedBracketThickness+.2);

        translate([bedBracketThickness, -.1, 10])
            rotate([-90, 0, 0])
                hull() {
                    hole5mm(h = bedBracketThickness + .2);
                    translate([bedBracketWidth - 10, 0, 0])
                        hole5mm(h = bedBracketThickness + .2);
                }
    }
}