$fn = 100;

module main() {
difference() {
    cylinder(60, 36, 36);
    translate([0, 0, 2]) cylinder(60, 35, 35);  
   translate([0, 0, -5]) cylinder(60, 20, 20);  
}


difference() {
    cylinder(6, 27, 27);
    translate([0, 0, -1]) cylinder(12, 26, 26);   
}

}

module top() {
difference() {
    cylinder(10, 37, 37);
translate([0, 0, 2]) cylinder(10, 36.1, 36.1);
}

}

top();