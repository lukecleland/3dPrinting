difference() {
union() {
    translate([12,0,0]) cube([160, 8.2, 8.2], true);
    rotate([0,90,0]) cylinder(160, 8, 8, true, $fn=100);
    
    translate([78,0,0]) rotate([0,90,0]) cylinder(4.5, 10, 10, true, $fn=100);
    
    translate([-70,0,0])
    rotate([0,90,0]) 
    linear_extrude(height = 140, center = false, convexity = 10, twist = 3060, $fn = 100)
    translate([10, 0, 0])
    circle(r = 10);
    
}

translate([-20,0,0]) rotate([0,90,0]) cylinder(140, 1.5, 1.5, true, $fn=100);

translate([50,0,0]) cube(100, true);

}