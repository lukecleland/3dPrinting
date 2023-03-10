

module row(a) {   
    $fn = 100;
    difference() {
        translate([0,0,2]) cylinder(50, a*10+wall_thickness, a*10+wall_thickness, true);
        translate([0,0,10]) cylinder(50, a*10, a*10, true);
        rotate([0, 0, a*a*complexity]) translate([a*10+10, 0, 0]) cutouts(a);    
    }
}

for (a = [0:5:5*level_depth]) {
    row(a);
    if(a>2) { walls(a); }
}

module cutouts(a) {
    translate([0, 0, 10]) cube([50, gate_thickness, 50], true);
}

module walls(a) {
    rotate([0,0,a*level_depth*14.4+10.89*a]) translate([-24+a*level_depth*2, 0, 5])  rotate([90,0,0]) cube([52, 44, 5], true);
}

//walls();


complexity = 1;
gate_thickness = 38;
wall_thickness = 5;
level_depth = 5;


// and idea about crypto, artifical mechanical turk problem solving as currency
