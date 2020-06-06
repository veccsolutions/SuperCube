module xCarriageBack() {
    difference() {
        union() {
            difference() {
                //main block
                translate([-11, 0, 0])
                    cube([44, 47, 58]);

                // top cutout
                translate([-11.1, -.1, 30])
                    cube([44.2, 37.1, 32.1]);                

                // bottom support cutout
                translate([-11.1, 38, -.1])
                    cube([44.2, 20.1, 14.1]);
                
                // bottom bearing cutout
                translate([14, 10, 2])
                    cube([33.1, 18, 12]);

                // bottom belt coutout
                translate([4, -1, 2])
                    cube([27, 29.1, 12]);
                
                // bottom bearing screw
                translate([25.5, 18.75, -.1])
                    polyhole(d = 4.5, h = 15.2);

                // top long belt coutout
                translate([-11.1, 20, 15])
                    cube([44.2, 10, 12]);
                
                // top bearing coutout
                translate([4, -.1, 15])
                    cube([27, 30, 12]);

                // top belt cutout
                translate([-11.1, 10, 15])
                    cube([31.1, 8, 12]);
                
                // top bearing screw
                translate([12.5, 6.75, 13.9])
                    polyhole(d = 4.5, h = 16.2);

                // bearing clamp screw holes top
                translate([0, 47.1, 53]) {
                    translate([-6, 0, 0])
                        rotate([90, 0, 0])
                        polyhole(d = 3.5, h = 12.2);

                    translate([28, 0, 0])
                        rotate([90, 0, 0])
                        polyhole(d = 3.5, h = 12.2);
                }

                // bearing clamp screw holes bottom
                translate([0, 47.1, 23]) {
                    translate([-6, 0, 0])
                        rotate([90, 0, 0])
                        polyhole(d = 3.5, h = 25.2);

                    translate([28, 0, 0])
                        rotate([90, 0, 0])
                        polyhole(d = 3.5, h = 25.2);
                }

                // nut rail  
                translate([-11.1, 35, 19]) //-11.1
                    cube([50, 4, 8]); //8
            }

            translate([-4, 0, -7])
            rotate([90, -180, 0])
                mirror([0,0,1])
                railClamp(l = 30, h = -1);

            translate([-4, 0, 37])
                rotate([90,0, 0])
                mirror([0,0,1])
                railClamp(l = 40, h = -1);
        }

        // Y slide bearing cutout
        translate([44 / 2 - 31 / 2 - 11, 47, 38]) {
            translate([0, 0, 0])
                rotate([0,90,0])
                    polyhole(d = 19, h = 31, $fn = 100);

            translate([-7.1, 0, 0])
                rotate([0,90,0])
                    polyhole(d = 11, h = 49.2, $fn = 100);
        }
    }
}