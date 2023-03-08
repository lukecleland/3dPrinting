$fn = 100;

h = 10;

difference() {
    cylinder(h,7,7, true); 
    cylinder(16,5,5, true); 
    cylinder(h/3+0.3,6.3,6.3, true); 
    
    translate([0, 0, -10]) rotate_extrude(angle= 120, convexity=50) translate([2, 0, 0]) square([20, 20]);
    
}

rotate([0, 0, 150]) translate([0,30,0]) difference() {
    cylinder(h,7,7, true); 
    cylinder(16,5,5, true); 
    cylinder(h/3+0.3,6.3,6.3, true); 
    
    rotate([0,0,30]) translate([0, 0, -10]) rotate_extrude(angle= 120, convexity=50) translate([2, 0, 0]) square([20, 20]);
}

cylinder(h,4.7,4.7, true); 
cylinder(h/3,6,6, true); 

translate([0, 30, 0]) cylinder(h,4.7,4.7, true); 
translate([0, 30, 0]) cylinder(h/3,6,6, true); 

translate([0,15,0]) cube([4, 25, h], true);

rotate([0, 0, 150]) translate([0,15,0]) cube([4, 18, h], true);

