$fn=100; 

module shish() {
    translate([0,0,0]) {
        cylinder(80,1.6,1.6, true);
    }
}

module shish_sheath() {
    translate([0,0,0]) {
        cylinder(80,2.8,2.8, true);
    }
}

module slats_group() {
    for(a = [0, 60, 120, 180, 240, 300]) {
        rotate([0,90,a]) {
            translate([0,0,50]) {
                shish();
            }
        }
    }
}


module turner() {
    cylinder(10, 12, 12, true);
}

translate([0, 2.9,0]) {
    difference() {
        turner();
        translate([0,0,20]) {
            turny();
        }
}
}

/**
module turning_thing() {
    
    difference() {
        hull() {
            translate([0,50,0]) circle(30);
            circle(30);
        }

}

}**/

//turning_thing();



module turny() {

rotate([0,0,90]) {
    
    translate([-3,0,0]) {
    difference() {
        cylinder(100, 2.6, 2.6, true) {
            
        }

        drivers();

    }
    
}


}

}

//turny();


module drivers() {
    translate([26.6,0,0]) {
    cube([50,50,50], true);
    }
    translate([-26.6,0,0]) {
    cube([50,50,55], true);
    }
    
    
}

/**
difference() {
    cylinder(5, 25, 25, true);
    cylinder(10, 15, 15, true);
    tack_holes();
    slats_group();
    
    
}**/

module tack_holes() {
    for(a = [0, 60, 120, 180, 240, 300]) {
        rotate([0,0,a]) {
            translate([17,10,0]) {
                cylinder(20, 1.5, 1.5, true);
            }
        }
    }
}



