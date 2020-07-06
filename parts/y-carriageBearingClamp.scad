yCarriageBearingHeight = 80;
yCarriageBearingInset = 2.5;
yCarriageBearingDiameter = 19;
yCarriageBearingRadius = yCarriageBearingDiameter / 2;
yCarriageBearingClampBarrelThickness = 2;
yCarriageBearingClampBarrelWidth = 40;
yCarriageBearingClampDiameter = yCarriageBearingClampBarrelThickness * 2 + yCarriageBearingDiameter;
yCarriageBearingClampRadius = yCarriageBearingClampDiameter / 2;

module yCarriageBearingClampBarrel() {
    difference() {
        union() {
            translate([0, yCarriageBearingRadius - yCarriageBearingInset, yCarriageBearingClampRadius])
            rotate([90, 90, 90])
                difference() {
                    polyhole(d = yCarriageBearingClampDiameter, h = yCarriageBearingClampBarrelWidth);
                    
                    translate([0, 0, -.1])
                        polyhole(d = yCarriageBearingDiameter, h = yCarriageBearingClampBarrelWidth + .2);
                }
        }

        translate([-.1, -.1 - yCarriageBearingInset - yCarriageBearingClampBarrelThickness, -.1])
            cube([yCarriageBearingClampBarrelWidth + .2, yCarriageBearingClampRadius, yCarriageBearingClampDiameter + .2]);
    }

    cube([yCarriageBearingClampBarrelWidth, yCarriageBearingRadius - yCarriageBearingInset, yCarriageBearingClampBarrelThickness]);
    translate([0, 0, yCarriageBearingDiameter + yCarriageBearingClampBarrelThickness])
        cube([yCarriageBearingClampBarrelWidth, yCarriageBearingRadius - yCarriageBearingInset, yCarriageBearingClampBarrelThickness]);
}

module yCarriageBearingBeltClamp() {
    difference() {
            union() {
                cube([.5, .5, 40]);
                translate([9.5, 0, 0])
                    cube([.5, .5, 40]);
                translate([0, .5, 0])
                    cube([10, 2, 40]);
            }
        yCarriageBearingBeltClampHoles();
    }
}

module yCarriageBearingBeltClampHoles() {
    translate([5, 0, 5.5])
        rotate([-90,0,0])
            hole3mm(h = 100);
    translate([5, 0, 19])
        rotate([-90,0,0])
            hole3mm(h = 100);
    translate([5, 0, 32.5])
        rotate([-90,0,0])
            hole3mm(h = 100);
}

module yCarriageBearingClamp() {
    //clamp parts
    translate([0, 0, 20 - yCarriageBearingClampRadius]) 
        yCarriageBearingClampBarrel();
    translate([0, 0, 60 - yCarriageBearingClampRadius])
        yCarriageBearingClampBarrel();

    //brackets
    difference()
    {
        cube([yCarriageBearingClampBarrelWidth, yCarriageBearingClampBarrelThickness, 10]);
        translate([5, -.1, 5])
            rotate([-90,0,0])
                hole3mm(h = yCarriageBearingClampBarrelThickness + .2);
        translate([yCarriageBearingClampBarrelWidth / 2, -.1, 5])
            rotate([-90,0,0])
                hole3mm(h = yCarriageBearingClampBarrelThickness + .2);
        translate([yCarriageBearingClampBarrelWidth - 5, -.1, 5])
            rotate([-90,0,0])
                hole3mm(h = yCarriageBearingClampBarrelThickness + .2);
    }

    translate([0, 0, 70])
    difference()
    {
        cube([yCarriageBearingClampBarrelWidth, yCarriageBearingClampBarrelThickness, 10]);
        translate([5, -.1, 5])
            rotate([-90,0,0])
                hole3mm(h = yCarriageBearingClampBarrelThickness + .2);
        translate([yCarriageBearingClampBarrelWidth / 2, -.1, 5])
            rotate([-90,0,0])
                hole3mm(h = yCarriageBearingClampBarrelThickness + .2);
        translate([yCarriageBearingClampBarrelWidth - 5, -.1, 5])
            rotate([-90,0,0])
                hole3mm(h = yCarriageBearingClampBarrelThickness + .2);
    }

    h = 80 - yCarriageBearingDiameter * 2 - 21;
    translate([0, 0, 40 - h / 2])
    difference()
    {
        cube([yCarriageBearingClampBarrelWidth, yCarriageBearingClampBarrelThickness, h]);
        translate([5, -.1, h / 2])
            rotate([-90,0,0])
                hole3mm(h = yCarriageBearingClampBarrelThickness + .2);
        translate([yCarriageBearingClampBarrelWidth / 2, -.1, h / 2])
            rotate([-90,0,0])
                hole3mm(h = yCarriageBearingClampBarrelThickness + .2);
        translate([yCarriageBearingClampBarrelWidth - 5, -.1, h / 2])
            rotate([-90,0,0])
                hole3mm(h = yCarriageBearingClampBarrelThickness + .2);
    }

    // belt tensioning
    translate([0, yCarriageBearingDiameter - yCarriageBearingInset, 20]) {
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

                yCarriageBearingBeltClampHoles();
            }
    }
}

module yCarriageHoleCutout() {
    // top
    translate([5, 0, yCarriageBearingHeight - 5])
        rotate([-90, 0, 0])
            hole3mm(h = 20);
    translate([20, 0, yCarriageBearingHeight - 5])
        rotate([-90, 0, 0])
            hole3mm(h = 20);
    translate([35, 0, yCarriageBearingHeight - 5])
        rotate([-90, 0, 0])
            hole3mm(h = 20);

    //middle
    translate([5, 0, 40])
        rotate([-90, 0, 0])
            hole3mm(h = 20);
    translate([20, 0, 40])
        rotate([-90, 0, 0])
            hole3mm(h = 20);
    translate([35, 0, 40])
        rotate([-90, 0, 0])
            hole3mm(h = 20);

    //bottom
    translate([5, 0, 5])
        rotate([-90, 0, 0])
            hole3mm(h = 20);
    translate([20, 0, 5])
        rotate([-90, 0, 0])
            hole3mm(h = 20);
    translate([35, 0, 5])
        rotate([-90, 0, 0])
            hole3mm(h = 20);
}