module nema17motor()
{
    cube([42.3, 42.3, 45]);

    translate([42.3 / 2, 42.3 / 2, 45])
    {
        polyhole(d = 22, h = 2);
        polyhole(d = 5, h = 22);
    }
}