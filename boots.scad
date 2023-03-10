module track() {
    cube([1, 10, 5], true);
}

rotate_extrude(convexity=2) translate([91,0 ,0]) track();