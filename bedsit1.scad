$fn = 100;

module joiner()
{
    difference()
    {
        cube([ 40, 25, 45 ], true);

        translate([ 0, 5, -5 ]) cube([ 31, 6.5, 40 ], true);
        translate([ 0, -5, 5 ]) cube([ 31, 6.5, 40 ], true);

        translate([ 0, 60, 0 ]) rotate([ 14, 0, 0 ]) cube([ 100, 100, 100 ], true);
        translate([ 0, -60, 0 ]) rotate([ 14, 0, 0 ]) cube([ 100, 100, 100 ], true);
    }
}

// translate([ 0, 0, 20.5 ]) cylinder(r = 60, h = 4, center = true);

for (i = [0:2])
{
    rotate([ 0, 0, i * 120 ]) translate([ 30, 0, 0 ]) rotate([ 15, 0, 0 ]) joiner();

    rotate([ 0, 0, i * 120 ]) translate([ 30, -10, 20.5 ]) cube([ 90, 20, 4 ], true);
}