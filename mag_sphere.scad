$fn=200;
translate([0,0,17])  cylinder(10, 10, 0, true);
difference() {
    sphere(20);
    translate([0,0,-25]) cube(50, true);
    rotate([0,90,0]) cylinder(35, 5.25, 5.25, true);
}

