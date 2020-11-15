module yCarriageBearingClamp() {

    difference() {
        cube([21, 33, 40]);

        // Y slide bearing cutout
        translate([-1, 1.5, 20])
            rotate([-90,90,0])
            {
                polyhole(d = lmu10Diameter, h = lmu10Length + 1, $fn = 100);
                translate([0, 0, -5])
                    polyhole(d = 11, h = 49.2, $fn = 100);
            }

        // bottom screw hole
        translate([-.1, 33/2, 5])
            rotate([0,90,0])
                hole3mm(h = 10.2);

        // top front screw hole
        translate([-.1, 5, 40-5])
            rotate([0,90,0])
                hole3mm(h = 10.2);

        // top front screw hole
        translate([-.1, 28, 40-5])
            rotate([0,90,0])
                hole3mm(h = 10.2);

        // material cutout so there's less to print
        difference() {
            translate([5, -.1, -.1])
                cube([25, 40, 45]);

            translate([-1.5, -1.5, 20.1])
                rotate([-90,90,0])
                {
                    polyhole(d = lmu10Diameter + 5, h = lmu10Length + 10, $fn = 100);
                    translate([0, 0, -5])
                        polyhole(d = 11, h = 49.2, $fn = 100);
                }
        }
    }

}