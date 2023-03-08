module leg1() {
    rotate(10) {
        translate([0, -23, 0])
            cube([40, 10, 2], false);
    }
}

module leg2() {
    rotate(-10) {
        translate([0, 23, 0])
            cube([40, 10, 2], false);
    }
}

module leg_strut() {
    translate([10, -5, 0])
        cube([10, 20, 20], false);
}

module base() {
    translate([10, -17, 0])
        cube([10, 40, 2], false);
}

module combine() {
    leg1();
    leg2();
    base();
    leg_strut();
}

combine();