module polyhole(h, d)
{
    n = max(round(20 * d), 3);

    rotate([0,0,180])
    {
        cylinder(h = h, r = (d / 2) / cos (180 / n), $fn = n);
    }
}

module triangle(out, up, thick, center=false)
{
    centroid = center ? [-a_len/3, -o_len/3, -depth/2] : [0, 0, 0];
    rotate([0, -90, 0])
    translate(centroid) linear_extrude(height=thick)
    {
        polygon(points=[[0,0],[0,out],[up,0]], paths=[[0,1,2]]);
    }
}