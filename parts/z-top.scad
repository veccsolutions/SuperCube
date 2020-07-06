zTopWidth = 150;
module zTop()
{
    difference()
    {
        cube([zTopWidth, 4, 20]);

        translate([21.5, -.1, 10])
            rotate([-90, 0, 0])
                hole5mm(h = 4.2);

        translate([zTopWidth-21.5, -.1, 10])
            rotate([-90, 0, 0])
                hole5mm(h = 4.2);
    }

    translate([10, 11, 0])
        railClamp();
    translate([zTopWidth - 10, 11, 0])
        railClamp();
}