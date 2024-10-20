$fn = 200;

module joiner() {
    cube([ 31, 6.5, 300 ], true);
}


module joiner_group() {
for (i = [0:2])
{
    rotate([ 0, 0, i * 120 ]) translate([ 30, 0, 0 ]) rotate([ 15, 0, 0 ]) joiner();
}
}



//difference() {
   
 translate([0,0,-120]) cylinder(1, 65, 65, true);
    cylinder(500, 25, 25, true);

joiner_group();
//}