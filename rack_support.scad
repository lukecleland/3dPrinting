module bracket() {
    difference() {
        union() {
            translate([0, 0, 15]) cube([135, 30, 3], true);
            translate([0, 0, 6]) cube([120, 3, 20], true);
            translate([0, 0, 6]) cube([32, 30, 20], true);
        }

        cube([26, 100, 27], true);    
    }
}

translate([0, -60, 0], true){
    bracket();
}

translate([0, 60, 0], true){
    bracket();
}

translate([0, 0, 15]) cube([10, 130, 3], true);