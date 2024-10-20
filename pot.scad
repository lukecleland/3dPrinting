//rotate_extrude(convexity = 10) 
    //translate([0, 10, 0]) 
$fn = 100;

module pot() {
$rings = 40;

for (i = [ 0 : 360/$rings : 360 ]) {
    rotate([0, 0, i])
    linear_extrude(height = 50, center = false, convexity = 10, twist = -77.5)
    translate([50, 0, 0])
        square([7, 3]);
}

for (i = [ 0 : 360/$rings : 360 ]) {
    rotate([0, 0, i])
    linear_extrude(height = 50, center = false, convexity = 10, twist = 60)
    translate([50, 0, 0])
        square([6, 3]);
}
}


difference(){
pot();

//translate([61, 0, 0]) cube([100, 100, 100], true);
}

module ring(h) {
    difference() {
        cylinder(2, 57, 57);
        translate([0, 0, -1]) cylinder(5, h, h);
    }
    
}

ring(15);

translate([0, 0, 50]) ring(50);

module container() {
    difference() {
        cylinder(50, 51, 51);
        translate([0,0,-1]) cylinder(110, 50, 50);
    }
}

container();