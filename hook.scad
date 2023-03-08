difference(){
    union() {
        translate([0, 2, 0]) cube([30, 18, 30],true);
        translate([0, 20, 0]) cube([15, 50, 30],true);
        
    }
    cube([25.2, 17.5, 50],true);
    translate([0, 26, 5]) cube([35, 30, 30],true);
}

translate([0,33,-2]) rotate([0,90,180]) rotate_extrude(angle=-90, convexity=10, $fn=50) translate([10, 0, 0]) square(size=[4,15], center=true);

difference() {
translate([0,19,-2]) rotate([0,90,0]) rotate_extrude(angle=-90, convexity=10, $fn=50) translate([10, 0, 0]) square(size=[4,15], center=true);
    cube([31.5, 17.5, 50],true);
}

translate([-23,-4.5,0]) cube([20,5,30], true);