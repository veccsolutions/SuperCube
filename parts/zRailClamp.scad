// this is where the 10mm rods go into to be clamped down

module zRailClamp(l = 20)
{
    difference(){        
        union()
        {
            translate([-7, -7, 0])
                cube([14, 22, l]);
            translate([0, 15, 0])
                cylinder(d = 14, h = l+0, $fn=100);
        }

        translate([0, 9, -1])
            tenMMBar(l = l + 2);
            
        translate([-1, 10, -.1])
            cube([2, 14, l + .2]);
        
        // screw holes
        translate([-7, 19, 5])
            rotate([0, 90, 0])
                polyhole(d = 3.5, h = 100);
        translate([-7, 19, 15])
            rotate([0, 90, 0])
                polyhole(d = 3.5, h = 100);

        //screw insets
        translate([-8, 16, (5 /2)])
            cube([5, 6, 5]);
        translate([-8, 16, 15 - (5 /2)])
            cube([5, 6, 5]);

        translate([3, 16, (5 /2)])
            cube([5, 6, 5]);
        translate([3, 16, 15 - (5 /2)])
            cube([5, 6, 5]);
    }
}