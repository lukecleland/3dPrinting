$fn = 100;

difference() {
    translate([5, 0, 2]) cylinder(104, 11, 11, true);
    for ( i = [1 : 20] ){ 
       translate([0, 0, i*5-50]) rotate([0, 0, 0]) cylinder(3.1, 10.05, 10.05, true);
    }
translate([63, 0, 0]) cube(110, true);
}