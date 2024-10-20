
difference() {
cube([2, 120, 16], true);

translate([0, 50, 12]) rotate([45, 0, 0]) cube([20, 20, 20], true);
translate([0, 0, 12]) rotate([45, 0, 0]) cube([20, 20, 20], true);
translate([0, -50, 12]) rotate([45, 0, 0]) cube([20, 20, 20], true);

translate([0, -20, 12]) cube([20, 170, 20], true);

}