module MotorMount(motorHeight = 12)
{
    difference() {
        union() {
            difference() {
                cube([2, 20, yRailBracketSizeHeight]);
                translate([-.1, 10, yRailBracketSizeHeight - 10])
                    rotate([0, 90, 0])
                        hole5mm(h = 2.2);
            }
      
            difference() {
                cube([nema17PlateWidth, 20, 2]);
                translate([nema17PlateWidth - 10, 10, -.1])
                    hole5mm(h = 2.2);
            }

            translate([22, 13, 9])
                //rotate([0,00])
                rotate([90,0,-90])
                railClamp(h = 30);

            translate([-20, 20, 0])
            {
                union() {
                    difference() {
                        cube([20+ 2, 2, yRailBracketSizeHeight]);
                        translate([10, -.1, 10])
                            rotate([-90, 0, 0])
                                hole5mm(h = 2.2);
                        translate([10, -.1, yRailBracketSizeHeight - 10])
                            rotate([-90, 0, 0])
                                hole5mm(h = 2.2);
                    }

                    difference() {
                        cube([20, nema17PlateWidth, 2]);
                        translate([10, 10, -.1])
                            hole5mm(h = 2.2);
                        translate([10, nema17PlateWidth - 10, -.1])
                            hole5mm(h = 2.2);
                    }
                }
            }

            if (motorHeight > 0) {
                translate([0, 18, 0])
                    cube([nema17PlateWidth, 2, motorHeight + 2]);
                translate([-2, 20, 0])
                    cube([2, nema17PlateWidth, motorHeight + 2]);
            }
            translate([0, 20, motorHeight])
                nema17MotorPlate(h = 2);
        }
        translate([0, 20, -.1])
            cube([nema17PlateWidth, nema17PlateWidth, motorHeight + .1]);
    }
}

module MotorMountLeft() {
    mirror([0,1,0])
        MotorMount(motorHeight = 13);
}

module MotorMountRight() {
    MotorMount(motorHeight = 0);
}