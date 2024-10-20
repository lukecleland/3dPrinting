
for ( i = [0 : 2] ){
    difference() {
        rotate([0, 0, 120*i]) translate([30, 0, 0]) cube([50, 50, 10], true);
        rotate([0, 0, 120*i]) translate([60, 0, 0]) cube([60, 35.7, 20], true);
        cylinder(30, 22, 22, true);
    }
}