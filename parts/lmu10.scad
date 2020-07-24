module lmu10(hollow = false)
{
    difference()
    {
        cylinder(d = 20, h = 29, $fn = 100);
        if (hollow == true)
        {
            cylinder(d = 10, h = 29, $fn = 100);
        }
    }
}