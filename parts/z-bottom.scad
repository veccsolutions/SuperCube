zBottomWidth = 150;

module zBottomMotorMount()
{
    translate([3, 0, 0])
        nema17MotorPlate();

    cube([3, nema17PlateWidth, 2]);
    translate([2, 0, 2])
        triangle(out = 42.3, up = 18, thick = 2);

    translate([nema17PlateWidth + 2, 0, 0])
        cube([3, nema17PlateWidth, 2]);

    translate([nema17PlateWidth + 5, 0, 2])
        triangle(out = 42.3, up = 18, thick = 2);
}

module zBottom()
{
    motorMountWidth = nema17PlateWidth + 6;

    difference()
    {
        cube([zBottomWidth, 4, 40]);
        translate([21.5, -.1, 10])
            rotate([-90, 0, 0])
                hole5mm(h = 2.2);

        translate([zBottomWidth-21.5, -.1, 10])
            rotate([-90, 0, 0])
                hole5mm(h = 2.2);
    }

    translate([(zBottomWidth - motorMountWidth) / 2, 4, 0])
        zBottomMotorMount();

    translate([10, 11, 0])
        railClamp();
        
    translate([zBottomWidth - 10, 11, 0])
        railClamp();
}