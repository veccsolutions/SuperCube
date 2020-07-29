// this is where the 10mm rods go into to be clamped down

module railClamp(l = 20, d = 10, h = 10)
{
    difference(){        
        union()
        {
            translate([-7.5, -7, 0])
                cube([15, 12 + h, l]);

            translate([0, 5 + h, 0])
                cylinder(d = 15, h = l + 0, $fn=100);
        }

        translate([0, h - 1, -1])
            tenMMBar(l = l + 2);
            
        translate([-1, h, -.1])
            cube([2, 14, l + .2]);
        
        // screw holes
        translate([-7, h + 8, 5])
            rotate([0, 90, 0])
                hole3mm(h = 100);
        translate([-7, h + 8, 15])
            rotate([0, 90, 0])
                hole3mm(h = 100);

        //screw insets
        translate([-8, h + 5, 2])
            cube([5, 8, 6]);
        translate([-8, h + 5, 15 - 3])
            cube([5, 8, 6]);

        translate([3, h + 5, 2])
            cube([5, 8, 6]);
        translate([3, h + 5, 15 - 3])
            cube([5, 8, 6]);
    }
}