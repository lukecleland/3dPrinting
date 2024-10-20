$fn=100;



/**
for ( i = [0 : 7] ){
    rotate( i * 45, [0, 0, 1])
    translate([29, 0, 0]) cube([1.5, 8, 70], true);
    translate([0, 0, i * 10 - 35]) ring();
}

module ring() {
    difference() {
            
        cylinder(4, 30, 30, true);
        cylinder(6, 28.5, 28.5, true);
    }
    
}

difference() {
translate([0, 0, 37]) cylinder(1, 30, 30, true);
    translate([0, 0, 36]) cylinder(4, 10, 10, true);
}

*/

linear_extrude(height = 10, center = true, convexity = 10, twist = -100)
translate([2, 0, 0])
circle(r = 1);