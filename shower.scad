$fn = 100;


module female() {
difference() {
union () {
color("red") translate([50, 30, 0]) rotate([0, 90, 0]) cylinder(12, 20, 12, true);
color("blue") translate([62, 30, 0]) rotate([0, 0, 0]) cylinder(27, 13, 13, true);
}
translate([64, 30, 0]) cube([30, 40, 12], true);
// hole
translate([62, 30, 0]) rotate([0, 0, 0]) cylinder(100, 5, 5, true);
}



}


female();


module male() {
difference() {
union() {
color("red") translate([87, 30, 0]) rotate([0, 90, 0]) cylinder(20, 14, 14, true);
translate([70, 30, 0]) cube([16, 23, 11.5], true);
color("blue") translate([62, 30, 0]) rotate([0, 0, 0]) cylinder(11.5, 11.5, 11.5, true);
    
    //translate([88, 30, -19]) cube([26, 33, 11.5], true);
}

translate([132, 30, 0]) rotate([0, 90, 0]) cylinder(100, 11.1, 11.1, true);
// hole
translate([62, 30, 0]) rotate([0, 0, 0]) cylinder(100, 5, 5, true);
}
}

male();

module mount() {
difference() {
color("red") translate([-48, 0, 0]) rotate([0, 90, 0]) cylinder(12, 20, 15, true);

rotate([0, 90, 0]) cylinder(100, 11.5, 11.5, true);
translate([-45, -15, 0]) cube([10, 30, 23], true);
}
}

mount();

module pin() {
translate([62, 30, 16]) rotate([0, 0, 0]) cylinder(3, 7.5, 7.5, true);
translate([62, 30, 0]) rotate([0, 0, 0]) cylinder(33, 4.75, 4.75, true);
}

//hook();


module hook() {
//    translate([-40, 18, 0]) cube([20, 4, 16], true);
difference() {
color("red") translate([-48, 0, 0]) rotate([0, 90, 0]) cylinder(4, 19, 19, true);

rotate([0, 90, 0]) cylinder(120, 11.2, 11.2, true);

}
}




