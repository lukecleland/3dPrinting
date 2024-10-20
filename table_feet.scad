
$fn = 100;
rotate([-6, 0, 0]) difference() {
    union() {
translate([0, 0, -10]) cube([ 34, 10, 20 ], true);
translate([0, 0, -20]) rotate([6, 0, 0]) cylinder(4, 30, 30, true);
    }
    cube([ 31, 6.5, 40 ], true);
}