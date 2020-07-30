module lmu10(hollow = false)
{
    difference()
    {
        cylinder(d = lmu10Diameter, h = lmu10Length, $fn = 100);
        if (hollow == true)
        {
            cylinder(d = 10, h = 29, $fn = 100);
        }
    }
}