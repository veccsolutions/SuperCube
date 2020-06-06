module xCarriageE3DV6WireBracket() {
    rotate([0,90,0])
        difference() {
            union() {
                polyhole(d = 10, h = 5);
                translate([-5, 0, 0])
                    cube([10, 5, 5]); 
            }
            translate([0, 0, -.1])
                polyhole(d = 5, h = 5.2);
        }
}

module xCarriageE3DV6ColdEndInset() {
    polyhole(d = 12.1, h = 15.2);
    polyhole(d = 16.1, h = 2.5);
    translate([0, 0, 12.1 - 4.01])
        polyhole(d = 16.1, h = 4.2);
}

module xCarriageE3DV6() {
    baseDepth = 15;

    //carriage mount
    difference() {
        union() {
            cube([40, 5, xCarriageBearingHeight]);
            translate([10, -5, xCarriageBearingHeight - 5])
                xCarriageE3DV6WireBracket();
            translate([25, -5, xCarriageBearingHeight - 5])
                xCarriageE3DV6WireBracket();        }

        translate([0, -.1, 0])
            xCarriageHoleCutout();
    }


    // e3d mount
    translate([0, -baseDepth, 35])
        difference() {
            cube([40, baseDepth, 12]);

            //left screw hole
            translate([5, -.1, 6])
                rotate([-90, 0, 0])
                polyhole(d = 3.5, h = baseDepth + .2);

            //right screw hole
            translate([35, -.1, 6])
                rotate([-90, 0, 0])
                polyhole(d = 3.5, h = baseDepth + .2);

            //left nut hole
            translate([-.1, 4, 3])
                cube([10.1, 3, 6]);

            //right nut hole
            translate([30, 4, 3])
                cube([10.1, 3, 6]);

            translate([20, 0, -.1])
                xCarriageE3DV6ColdEndInset();
        }
}

module xCarriageE3DV6Clamp() {
    difference() {
        baseDepth = 15;
        union() {
            cube([40, 5, 12]);
            translate([20, 0, 0])
                polyhole(d = 22.5, h = 12);
        }

        //left screw hole
        translate([5, -.1, 6])
            rotate([-90, 0, 0])
                polyhole(d = 3.5, h = baseDepth + .2);

        //right screw hole
        translate([35, -.1, 6])
            rotate([-90, 0, 0])
                polyhole(d = 3.5, h = baseDepth + .2);

        translate([20, 0, -.1])
            xCarriageE3DV6ColdEndInset();

        translate([-.1, -12, -.1])
            cube([40.2, 12, 15.2]);
    }
}