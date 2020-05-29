xCarriageBearingHeight = 80;
xCarriageBearingInset = 2.5;
xCarriageBearingDiameter = 19;
xCarriageBearingRadius = xCarriageBearingDiameter / 2;
xCarriageBearingClampBarrelThickness = 2;
xCarriageBearingClampBarrelWidth = 40;
xCarriageBearingClampDiameter = xCarriageBearingClampBarrelThickness * 2 + xCarriageBearingDiameter;
xCarriageBearingClampRadius = xCarriageBearingClampDiameter / 2;

module xCarriageBearingClampBarrel() {
    difference() {
        union() {
            translate([0, xCarriageBearingRadius - xCarriageBearingInset, xCarriageBearingClampRadius])
            rotate([90, 90, 90])
                difference() {
                    polyhole(d = xCarriageBearingClampDiameter, h = xCarriageBearingClampBarrelWidth);
                    
                    translate([0, 0, -.1])
                        polyhole(d = xCarriageBearingDiameter, h = xCarriageBearingClampBarrelWidth + .2);
                }
        }

        translate([-.1, -.1 - xCarriageBearingInset - xCarriageBearingClampBarrelThickness, -.1])
            cube([xCarriageBearingClampBarrelWidth + .2, xCarriageBearingClampRadius, xCarriageBearingClampDiameter + .2]);
    }

    cube([xCarriageBearingClampBarrelWidth, xCarriageBearingRadius - xCarriageBearingInset, xCarriageBearingClampBarrelThickness]);
    translate([0, 0, xCarriageBearingDiameter + xCarriageBearingClampBarrelThickness])
        cube([xCarriageBearingClampBarrelWidth, xCarriageBearingRadius - xCarriageBearingInset, xCarriageBearingClampBarrelThickness]);
}

module xCarriageBearingBeltClamp() {
    difference() {
            union() {
                cube([.5, .5, 40]);
                translate([9.5, 0, 0])
                    cube([.5, .5, 40]);
                translate([0, .5, 0])
                    cube([10, 2, 40]);
            }
        xCarriageBearingBeltClampHoles();
    }
}

module xCarriageBearingBeltClampHoles() {
    translate([5, 0, 5.5])
        rotate([-90,0,0])
            polyhole(d = 3.5, h = 100);
    translate([5, 0, 19])
        rotate([-90,0,0])
            polyhole(d = 3.5, h = 100);
    translate([5, 0, 32.5])
        rotate([-90,0,0])
            polyhole(d = 3.5, h = 100);
}

module xCarriageBearingClamp() {
    //clamp parts
    translate([0, 0, 20 - xCarriageBearingClampRadius]) 
        xCarriageBearingClampBarrel();
    translate([0, 0, 60 - xCarriageBearingClampRadius])
        xCarriageBearingClampBarrel();

    //brackets
    difference()
    {
        cube([xCarriageBearingClampBarrelWidth, xCarriageBearingClampBarrelThickness, 10]);
        translate([5, -.1, 5])
            rotate([-90,0,0])
                polyhole(d = 3.5, h = xCarriageBearingClampBarrelThickness + .2);
        translate([xCarriageBearingClampBarrelWidth / 2, -.1, 5])
            rotate([-90,0,0])
                polyhole(d = 3.5, h = xCarriageBearingClampBarrelThickness + .2);
        translate([xCarriageBearingClampBarrelWidth - 5, -.1, 5])
            rotate([-90,0,0])
                polyhole(d = 3.5, h = xCarriageBearingClampBarrelThickness + .2);
    }

    translate([0, 0, 70])
    difference()
    {
        cube([xCarriageBearingClampBarrelWidth, xCarriageBearingClampBarrelThickness, 10]);
        translate([5, -.1, 5])
            rotate([-90,0,0])
                polyhole(d = 3.5, h = xCarriageBearingClampBarrelThickness + .2);
        translate([xCarriageBearingClampBarrelWidth / 2, -.1, 5])
            rotate([-90,0,0])
                polyhole(d = 3.5, h = xCarriageBearingClampBarrelThickness + .2);
        translate([xCarriageBearingClampBarrelWidth - 5, -.1, 5])
            rotate([-90,0,0])
                polyhole(d = 3.5, h = xCarriageBearingClampBarrelThickness + .2);
    }

    h = 80 - xCarriageBearingDiameter * 2 - 21;
    translate([0, 0, 40 - h / 2])
    difference()
    {
        cube([xCarriageBearingClampBarrelWidth, xCarriageBearingClampBarrelThickness, h]);
        translate([5, -.1, h / 2])
            rotate([-90,0,0])
                polyhole(d = 3.5, h = xCarriageBearingClampBarrelThickness + .2);
        translate([xCarriageBearingClampBarrelWidth / 2, -.1, h / 2])
            rotate([-90,0,0])
                polyhole(d = 3.5, h = xCarriageBearingClampBarrelThickness + .2);
        translate([xCarriageBearingClampBarrelWidth - 5, -.1, h / 2])
            rotate([-90,0,0])
                polyhole(d = 3.5, h = xCarriageBearingClampBarrelThickness + .2);
    }

    // belt tensioning
    translate([0, xCarriageBearingDiameter - xCarriageBearingInset, 20]) {
        cube([40, 2, 40]);
        translate([0, 11, 7.5])
            difference() {
                union() {    
                    hull() {
                        rotate([0,90,0])
                            cylinder(d = 15, h = 10, $fn = 100);

                        translate([0, 0, 40 - 15])
                            rotate([0,90,0])
                                cylinder(d = 15, h = 10, $fn = 100);
                    }
                    translate([0, -9.5, -7.5])
                        cube([10, 10.5, 40]);
                }
                translate([-.1, 1, 2])
                    cube([10.2, 4, 7]);
                translate([-.1, 1, 15])
                    cube([10.2, 4, 7]);
            }

        translate([30, 0, 0])
            difference() {
                union()
                {
                    cube([10, 13.5, 40]);
                    translate([5, 13.5, 0])
                        cube([1, .5, 40]);
                }
                translate([-.1, 9, 3])
                    cube([10.2, 2.5, 5.5]);
                translate([-.1, 9, 16.5])
                    cube([10.2, 2.5, 5.5]);
                translate([-.1, 9, 30])
                    cube([10.2, 2.5, 5.5]);

                xCarriageBearingBeltClampHoles();
            }
    }
}

module xCarriageHoleCutout() {
    // top
    translate([5, 0, xCarriageBearingHeight - 5])
        rotate([-90, 0, 0])
            polyhole(d = 3.5, h = 20);
    translate([20, 0, xCarriageBearingHeight - 5])
        rotate([-90, 0, 0])
            polyhole(d = 3.5, h = 20);
    translate([35, 0, xCarriageBearingHeight - 5])
        rotate([-90, 0, 0])
            polyhole(d = 3.5, h = 20);

    //middle
    translate([5, 0, 40])
        rotate([-90, 0, 0])
            polyhole(d = 3.5, h = 20);
    translate([20, 0, 40])
        rotate([-90, 0, 0])
            polyhole(d = 3.5, h = 20);
    translate([35, 0, 40])
        rotate([-90, 0, 0])
            polyhole(d = 3.5, h = 20);

    //bottom
    translate([5, 0, 5])
        rotate([-90, 0, 0])
            polyhole(d = 3.5, h = 20);
    translate([20, 0, 5])
        rotate([-90, 0, 0])
            polyhole(d = 3.5, h = 20);
    translate([35, 0, 5])
        rotate([-90, 0, 0])
            polyhole(d = 3.5, h = 20);
}