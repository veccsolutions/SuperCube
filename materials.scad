module extrusionVertical(x = 20, y = 20, l)
{
    difference()
    {
        cube([x, y, l]);

        translate([x-10 - 5/2, -.1, -.1])
            cube([5, 2, l+.2]);

        translate([x-10 - 5/2, y - 2, -.1])
            cube([5, 2.1, l+.2]);

        translate([x - 3, 10 - 5/2, -.1])
            cube([3.1, 5, l+.2]);

        translate([-0.1, 10-5/2, -.1])
            cube([3.1, 5, l+.2]);
    }
}

module extrusionHorizontalY(x = 20, y = 20, l)
{
    difference()
    {
        cube([x, l, y]);

        translate([x-10 - 5/2, .1, -.1])
            cube([5, l + .2, 2]);

        translate([x-10 - 5/2, -.1, y-2])
            cube([5, l + .2, 2.1]);

        translate([-.1, -.1, 10 - 5/2])
            cube([2.1, l + .2, 5]);
        translate([-.1, -.1, y - 10 - 5/2])
            cube([2.1, l + .2, 5]);

        translate([x - 3, -1, 10 - 5/2])
            cube([3.1, l + .2, 5]);
        translate([x - 3, -1, y - 10 - 5/2])
            cube([3.1, l + .2, 5]);
    }
}

module extrusionHorizontalX(x = 20, y = 20, l)
{
    difference()
    {
        cube([l, x, y]);

        translate([-.1,x-10 - 5/2, -.1])
            cube([l + .2, 5, 2]);

        translate([-.1, x-10 - 5/2, y-2])
            cube([l + .2, 5, 2.1]);

        translate([-.1, -.1, 10 - 5/2])
            cube([l + .2, 2.1, 5]);
        translate([-.1, -.1, y - 10 - 5/2])
            cube([l + .2, 2.1, 5]);

        translate([-.1, x - 3, 10 - 5/2])
             cube([l + .2, 3.1, 5]);
        translate([-.1, x - 3, y - 10 - 5/2])
             cube([l + .2, 3.1, 5]);
    }
}

module tenMMBar(l)
{
    cylinder(d = 10, h = l, $fn = 100);
}

module pomNutMount(h = 3.5)
{
    polyhole(d = 10.5, h = h);
    pomNutHoles(h = h);
}

module pomNutHoles(h) {
    translate([-7.75, 0, 0])
        hole3mm(h = h);
    translate([0, -7.75, 0])
        hole3mm(h = h);
    translate([7.75, 0, 0])
        hole3mm(h = h);
    translate([0, 7.75, 0])
        hole3mm(h = h);
}

module pomNut() {
    difference() {
        union() {
            polyhole(d = 10.5, h = 10.5);
            translate([0, 0, 1.5])
                polyhole(d = 22, h = 3.5);
        }

        translate([0, 0, -.1])
            polyhole(d = (10.5 - (1.8*2)), h = 10.7);

        translate([0, 0, 1.4]) {
            pomNutHoles(h = 3.7);
        }
    }
}

module bearings12mm()
{
    difference() {
        union() {
            polyhole(d = 15, h = 1.5);
            polyhole(d = 12, h = 10);
            translate([0,0,8.5])
                polyhole(d = 15, h = 1.5);
        }
        translate([0, 0, -.1])
            polyhole(d = 4, h = 10.2);
    }
}