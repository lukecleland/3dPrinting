$fn=100; 

module slat() {
    translate([78,0,0]) {
        cube([100,31.5,6.5], true);
    }
}

module slats_group() {
    for(a = [0, 60, 120, 180, 240, 300]) {
        rotate([0,0,a]) {
            slat();
        }
    }
}

difference() {
    cylinder(12, 45, 45, true);
    cylinder(15, 25, 25, true);
    tack_holes();
    slats_group();
}

module tack_holes() {
    for(a = [0, 60, 120, 180, 240, 300]) {
        rotate([0,0,a]) {
            translate([17,30,0]) {
                cylinder(20, 1, 1, true);
            }
        }
    }
}