$fn = 100;

difference() {
union() {
    translate([0,0,10]) cube([10,30,7], true);
    //translate([0,0,7.5]) cube([10,10,10], true);
}

translate([0,0,14]) cube([7,35,5], true);
cylinder(20, 1.5, 1.5, true);
}