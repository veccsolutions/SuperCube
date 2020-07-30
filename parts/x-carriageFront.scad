module xCarriageFront() {
    
    // main block
    difference() {
        translate([0, 3, 0])
            cube([33, 47, 58]);

        // top cutout
        translate([-.1, 14, 30])
            cube([34.2, 37.1, 32.1]);

        // bottom support cutout
        translate([-.1, -.1, -.1])
            cube([33.2, 14.1, 18.1]);
        
        // bottom bearing cutout
        translate([2, 23, 2])
            cube([29, 40.2, 12]);

        // bottom belt coutout
        translate([-11.1, 35, 2])
            cube([15.2, 5, 12]);

        // bottom long belt coutout
        translate([-11.1, 23, 2])
            cube([44.2, 5, 12]);
        
        // bottom bearing screw
        translate([11.5, 44.125, -.1])
            polyhole(d = 5.5, h = 15.2);
        
        // top belt cutout
        translate([17, 23, 15])
            cube([31.1, 20, 12]);

        // top bearing coutout
        translate([2, 23, 15])
            cube([29, 40.2, 12]);
        
        // top bearing screw
        translate([24.5, 32.12, 13.9])
            polyhole(d = 5.5, h = 16.2);

        // bearing clamp screw hole top left
        translate([5, 14, 53])
            rotate([90, 0, 0])
                    hole3mm(h = 12.2);

        // bearing clamp screw hole top right
        translate([28, 14, 53])
            rotate([90, 0, 0])
                    hole3mm(h = 12.2);
                
        // bearing clamp screw hole bottom
        translate([33 / 2, 25, 53-30])
            rotate([90, 0, 0])
                hole3mm(h = 25.2);

        // Y slide bearing cutout
        translate([.5, 3, 38]) {
            translate([1, 0, 0])
                rotate([0,90,0])
                    polyhole(d = lmu10Diameter, h = lmu10Length + 1, $fn = 100);

            translate([-7.1, 0, 0])
                rotate([0,90,0])
                    polyhole(d = 11, h = 49.2, $fn = 100);
        }
    }
    
    // lower clamp
    translate([18, 24, -7]) //12
        mirror([0, 1, 0])
            rotate([-90, 0, 0])
                railClamp(l = 10, h = 0);

    // upper clamp
    translate([18, 24, 37])
        rotate([90, 0, 0])
            railClamp(l = 10, h = 2);
}