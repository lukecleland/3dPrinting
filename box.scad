// Resolution
$fn = 100;

// BOX
difference() {
    translate([0,0,0]) cube(20, center=true); // Outer
    translate([0,2,0]) cube(18, center=true); // Remove 
}

// LID
translate([0,20,0]) cube([20, 2, 20], center=true); // Cover
translate([0,18,0]) cube([18, 3, 18], center=true); // Inner
