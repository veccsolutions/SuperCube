module xCarriageE3DV6() {
    difference() {
        cube([40, 5, xCarriageBearingHeight]);

        // 19 / 2 = 9.5
        // 12 - 9.5 = 2.5 mm deep

        translate([20 - 29 / 2, xCarriageBearingRadius + 5 - xCarriageBearingInset, 0]) {
            translate([0, 0, bearingBottom])
                rotate([0, 90, 0])
                    lmu10();
            translate([0, 0, bearingBottom + 40])
                rotate([0, 90, 0])
                    lmu10();
        }

        translate([0, -.1, 0])
            xCarriageHoleCutout();            bearingBottom = 20;


    }
}