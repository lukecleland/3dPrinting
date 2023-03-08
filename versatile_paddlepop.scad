$fn=100; 

module pop() {
    translate([56.5,0,0]) {
        cube([100,9.35,2], true);
    }
}



module shaper() {
    translate([20,0,0]) {
        cube([15,45,26], true);
    }
}


module pops() {
    for(a =[0, 90, 180, 270]) {
        rotate([0,0,a]) {
            translate([0,0,0]) {
                pop();
            }
        }
        rotate([90,0,a]) {
            translate([0,0,0]) {
                pop();
            }
        }
        rotate([0,90,a]) {
            translate([0,0,0]) {
                pop();
            }
        }
        rotate([0,-90,a]) {
            translate([0,0,0]) {
                pop();
            }
        }
    } 
}

module hex_shaper() {
    for(a =[0, 72, 144, 216, 288]) {
        rotate([0,0,a]) {
            translate([0,0,0]) {
                shaper();
            }
        }
    } 
}

/*
for(a =[0, 72, 144, 216, 288]) {
    rotate([0,0,a]) {
        translate([0,25.5,0]) {
            button();
        }
    }
} */

/*for(a =[0, 72, 144, 216, 288]) {
    rotate([0,0,a]) {
        translate([10,45.1,0]) {
            button();
        }
    }
} */

/*rotate([0,0,35]) {
button();
}*/

button();

module button() {
    rotate([0,0,55]) {
        difference(){
            translate([0,0,0]) {
                sphere(14);
            }
            pops();
            /*
            translate([0,0,99]){
                cube([200,200,200], true);
            }
            translate([0,0,-109]){
                cube([200,200,200], true);
            }
            hex_shaper();
           */
        }
}
}