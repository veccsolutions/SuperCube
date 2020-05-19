nema17PlateWidth = 42.3;

module nema17MotorPlate()
{
    difference()
    {
        cube([42.3, 42.3, 2]);

        translate([42.3 / 2, 42.3 / 2, -.1])
            polyhole(d = 22.5, h = 2.2);
        
        o = (42.3 - 31) / 2;

        translate([o, o, -.1])
            polyhole(d = 3, h = 2.2);
        translate([o, 42.3 - o, -.1])
            polyhole(d = 3, h = 2.2);
        translate([42.3 - o, o, -.1])
            polyhole(d = 3, h = 2.2);            
        translate([42.3 - o, 42.3 - o, -.1])
            polyhole(d = 3, h = 2.2);
    }
}