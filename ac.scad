difference() {
    cylinder(2, 12, 12, true);
    union () {
        cube([5.1,6.8,10],true);
        cube([8.1,3.2,10],true);
        cube([3.2,8.1,10],true);
    }
}

