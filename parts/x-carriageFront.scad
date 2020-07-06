module xCarriageFront() {
    difference() {
        union() {
            difference() {
                //main block
                translate([-11, 3, 0])
                    cube([44, 47, 58]);

                // top cutout
                translate([-11.1, 13, 30])
                    cube([44.2, 37.1, 32.1]);

                // bottom support cutout
                translate([-11.1, -.1, -.1])
                    cube([44.2, 20.2, 14.1]);
                
                // bottom bearing cutout
                translate([3, 23, 2])
                    cube([28, 40.2, 12]);

                // bottom belt coutout
                translate([-11.1, 35, 2])
                    cube([15.2, 5, 12]);
        
                // bottom long belt coutout
                translate([-11.1, 23, 2])
                    cube([44.2, 5, 12]);
                
                // bottom bearing screw
                translate([12.5, 44.125, -.1])
                    polyhole(d = 4, h = 15.2);
                
                // top belt cutout
                translate([18, 23, 15])
                    cube([31.1, 20, 12]);

                // top bearing coutout
                translate([3, 23, 15])
                    cube([28, 40.2, 12]);
                
                // top bearing screw
                translate([25.5, 32.12, 13.9])
                    polyhole(d = 4, h = 16.2);

                // bearing clamp screw holes top
                translate([0, 14, 53]) {
                    translate([-6, 0, 0])
                        rotate([90, 0, 0])
                            hole3mm(h = 12.2);

                    translate([28, 0, 0])
                        rotate([90, 0, 0])
                            hole3mm(h = 12.2);
                }
                
                // bearing clamp screw holes bottom
                translate([0, 25, 53-30]) {
                    translate([-6, 0, 0])
                        rotate([90, 0, 0])
                            hole3mm(h = 25.2);

                    translate([28, 0, 0])
                        rotate([90, 0, 0])
                            hole3mm(h = 25.2);
                }

                // nut rail  
                translate([-11.1, 10, 19]) //-11.1
                    cube([50, 4, 8]); //8
            }

            translate([-4, 50, -7]) //12
                mirror([0, 1, 0])
                    rotate([-90, 0, 0])
                        railClamp(l = 30, h = -1);

            translate([-4, 50, 37])
                rotate([90,0, 0])
                    railClamp(l = 40, h = -1);
        }

        // Y slide bearing cutout
        translate([-6.5, 3, 38]) {
            translate([1, 0, 0])
                rotate([0,90,0])
                    polyhole(d = 19, h = 31, $fn = 100);

            translate([-7.1, 0, 0])
                rotate([0,90,0])
                    polyhole(d = 11, h = 49.2, $fn = 100);
        }
    }
}