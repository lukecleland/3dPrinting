$fn = 50;

rotate([90,0,0]) {
difference() {
translate([0,1,0]) cube([6, 7, 12], true);
cylinder(100,1.55,1.55, true);
translate([0, 5, 0]) rotate([90,0,0]) cylinder(10,1.55,1.55, true);
}
}