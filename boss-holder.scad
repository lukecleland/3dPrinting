$fn = 100;


difference() {
    cube([70, 125, 10], true);
    translate([0, 0, 1]) cube([65.5, 121.5, 9], true);
    /*translate([-40, 17.5, 15]) rotate([0, 90, 0]) cylinder(80, 7, 7, true);
    translate([40, 19.5, 15]) rotate([0, 90, 0]) cylinder(80, 7, 7, true);
    translate([0, -24, 20]) cube([72, 60, 50], true);*/
    translate([0, -74, 0]) cube([18, 30, 50], true);
}

/*
difference() {
    union() {
translate([0, 0, 12]) cylinder(4, 18, 18, true);
cylinder(28, 0, 10, true);
    }
cylinder(100, 3, 3, true);
    
}
*/



