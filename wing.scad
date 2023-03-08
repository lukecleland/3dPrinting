$fn=100;

spar_width = 2;
ring1 = 8;
ring2 = 14;
ring3 = 5;

translate([25,-7,0])
cube([153, spar_width, spar_width], true);

rotate([0,0,13.5])
translate([-22,18.5,0])
cube([53, spar_width, spar_width], true);

rotate([0,0,-10.5])
translate([50,19,0])
cube([100, spar_width, spar_width], true);


translate([-50,0,0])
difference() {
    cylinder(spar_width, ring1, ring1, true);
    cylinder(spar_width+2, ring1-2, ring1-2, true);
}

translate([0,6,0])
difference() {
    cylinder(spar_width, ring2, ring2, true);
    cylinder(spar_width+2, ring2-2, ring2-2, true);
}

translate([100,-3,0])
difference() {
    cylinder(spar_width, ring3, ring3, true);
    cylinder(spar_width+2, ring3-2, ring3-2, true);
}

// 98 port hacking rd slyvania nsw 2224