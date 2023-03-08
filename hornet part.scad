
difference () {
    union() {
        cylinder(4, 9, 9, false);
        cylinder(12, 7, 7, false);
        translate ([0,0,-4]) {
            cylinder(4, 6, 9, false);
        }
    }
    
    union() {
        cylinder(50, 2, 2, true);
        cylinder(12, 4, 4, true);
        translate([0, 12.5 ,0]) {
            cube([3, 25, 45], true);
        }
        
    }
    
    
    
}
