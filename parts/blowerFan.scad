include <../common.scad>
include <../functions.scad>

module blowerFan() {
    difference() {
        color([1,0,0])
        union() {
            //cube([25.4, 19.7, 15.6]);
            hull() {
                translate([-23, 21.1, 0])
                    polyhole(d = 6.5, h = 15.6);
                translate([20, -17.3, 0])
                    polyhole(d = 6.5, h = 15.6);
            }

            translate([0, 10 - 6.5 - 1, 0])
                polyhole(d = 48.2, h = 15.6);
                
            translate([-27, -25, 0])
                cube([20, 25, 15.6]);

translate([-15.75, 0, 0])
scale([.8, 1.2, 1])
    polyhole(d = 28, h = 15.6);
            // translate([25.6 - 17.9, 27.5 + 20.2, 0])
                //6.5
                //10
                //16.5 + 32 = 48.8
            
        }

        //fan hole
        translate([2,1,1])
            polyhole(d = 32, h = 16.1);
        
        translate([-23, 21.1, -.1])
            polyhole(d = 4.5, h = 15.8);

        translate([20, -17.3, -.1])
            polyhole(d = 4.5, h = 15.8);
    }
}