//$fn = 50;

difference() {
union() {
hull() {
cylinder(7.8, 8, 8, true);
translate([16, 0, 0]) cylinder(7.8, 11.5, 11.5, true);
}
translate([19,4,0]) rotate([0, 0, 45]) cube([5, 21, 13.5], true);

hull() {
translate([29,1,0]) sphere(7, true);
translate([17,12,0]) sphere(7, true);
translate([25,80,0]) sphere(7, true);
}

}

cylinder(17.8, 4.7, 4.7, true);
translate([28, 4.5, -6]) cylinder(20, 4.7, 4.7, true);

translate([32, 0 ,0]) cube([20, 30, 4], true);
translate([36, 5 , -15]) cube([20, 4, 30], true);

}


//translate([-15, 47, 0]) cylinder(30, 40, 40, true);
