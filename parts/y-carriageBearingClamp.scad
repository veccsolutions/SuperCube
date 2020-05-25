module yCarriageBearingClamp() {

    difference() {
        cube([44, 11, 40]);

        // Y slide bearing cutout
        translate([44 / 2 - 31 / 2, 00, 20]) {
            translate([-.1, 0, 0])
                rotate([0,90,0])
                    polyhole(d = 19, h = 31, $fn = 100);

            translate([-8, 0, 0])
                rotate([0,90,0])
                    polyhole(d = 11, h = 49.2, $fn = 100);
        }

        translate([5, -.1, 5])
            rotate([-90, 0, 0]) {
                translate([0, 0, 6.1])
                    polyhole(d = 8, h = 5.1);
                polyhole(d = 3.5, h = 10.2);
            }

        translate([39, -.1, 5])
            rotate([-90, 0, 0]) {
                translate([0, 0, 6.1])
                    polyhole(d = 8, h = 5.1);
                polyhole(d = 3.5, h = 10.2);
            }

        translate([5, -.1, 35])
            rotate([-90, 0, 0]) {
                translate([0, 0, 6.1])
                    polyhole(d = 8, h = 5.1);
                polyhole(d = 3.5, h = 10.2);
            }

        translate([39, -.1, 35])
            rotate([-90, 0, 0]) {
                translate([0, 0, 6.1])
                    polyhole(d = 8, h = 5.1);
                polyhole(d = 3.5, h = 10.2);
            }
    }
}