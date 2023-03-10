$fn = 50;

difference() {
    union() {
        // circular brackets
        rotate([0, 0, -45]) translate([0, 70, -6]) cylinder(15, 6, 6, true);
        translate([0, 75, -6]) cylinder(15, 6, 6, true);

        hull() {
            translate([0, 0, -2]) rotate([5, -5, 0]) cylinder(3, 12, 12, true);
            translate([-9, 20, 0]) cylinder(3, 1, 1, true);
            translate([20, 6, 0]) cylinder(3, 1, 1, true);
        }
        
        hull() {
            translate([-9, 20, 0]) cylinder(3, 1, 1, true);
            translate([20, 6, 0]) cylinder(3, 1, 1, true);
            rotate([0, 0, -45]) translate([0, 70, 0]) cylinder(3, 6, 6, true);
            translate([0, 75, 0]) cylinder(3, 6, 6, true);
        }
        
        
    }

    cylinder(30, 5.5, 5.5, true);
    translate([0, 75, 0]) cylinder(30, 3.5, 3.5, true);
    rotate([0, 0, -45]) translate([0, 70, 0]) cylinder(30, 3.5, 3.5, true);
    
    //cutout
    rotate([0, 0, -22.5]) translate([0, 41, 0]) cylinder(30, 14, 14, true);
    
}