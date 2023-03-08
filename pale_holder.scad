$fn = 100;
difference() {
    union() {
        translate([25,0,0]) cube([50,20,20],true);
        translate([45,0,-10]) cylinder(40,12,12,true);
        cylinder(20,12,12,true);
    }
    translate([45,0,-18]) cylinder(50,9,9,true);
    cylinder(30,9,9,true);
    translate([-10,0,0]) cylinder(50,9,9,true);
}