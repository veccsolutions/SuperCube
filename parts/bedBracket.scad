bedBracketWidth = 42;
bedBracketThickness = 5;
bedBracketDepth = 50;

module bedBracket()
{
    difference() {
        cube([bedBracketWidth, bedBracketDepth, bedBracketThickness]);

        translate([bedBracketWidth - 15, 20, -.1])
            cube([bedBracketWidth / 2 + .1, 30.1, bedBracketThickness + .2]);

        translate([bedBracketWidth / 2 - 12.5, 10, -.1])
            hull() {
                hole5mm(h = bedBracketThickness + .2);
                translate([25, 0, 0])
                    hole5mm(h = bedBracketThickness + .2);
            }

        translate([(bedBracketWidth - 15) / 2, 37, -.1])
            pomNutHoles(h = bedBracketThickness + .2);
    }
}