$fn = 100;

module magnet() {
    cube([10.5, 10.5, 4.5], true);
}

module spinner_magnet() {
    //cube([10.5, 5.5, 2.5], true);
    cylinder(3, 5.15, 5.15, true);
}

module bearing(){
    color("yellow") 
    difference() {
        cylinder(7.5, 11.15, 11.15, true);
        cylinder(10, 4, 4, true);
    }
}

module spinner2(a) {
    
    difference() {
        rotate([0,0,a]) translate([40,0,0]) rotate([90,0,0]) rotate([0, 0, -$t*360]) bearing_spinner_enclosure();
        rotate([0,0,a]) translate([40,0,0]) rotate([90,0,0]) bearing();
        rotate([0,0,a]) translate([40,3,0]) rotate([90,0,0]) bearing();
        rotate([0,0,a]) translate([40,10,0]) rotate([90,0,0]) cylinder(30, 6, 6);
    }
    
}

module fan() {
    rotate([0, 0, 0]);
    difference() {
        union() {
            translate([24, -6, -4]) 
            rotate([45, 0, 0])
            cube([5, 10, 1]);
            
            translate([51, -6, 3]) 
            rotate([-45, 0, 0])
            cube([5, 10, 1]);
        }
        
        translate([20, 0, -5]) 
        cube([55, 10, 15]);
        translate([20, -15, -5]) 
        cube([55, 10, 15]);
    }
}



//rotate([90, 0, 0]) fan();




module spinner(a) {
    difference() {
        rotate([0,0,a]) translate([40,0,0]) rotate([90,0,0]) cylinder(5, 12, 12);
        rotate([0,0,a]) translate([40,0,0]) rotate([90,0,0]) bearing();
        rotate([0,0,a]) translate([40,3,0]) rotate([90,0,0]) bearing();
        rotate([0,0,a]) translate([40,10,0]) rotate([90,0,0]) cylinder(30, 6, 6);
    }
}

module bearing_spinner_enclosure() {
    difference() {
        color([0,1,1,0.5]) cylinder(10, 16, 16, true);
        for (i = [1:6]) {
            rotate([0,90,i*60]) translate([0,14.8,0]) rotate([90,0,0]) spinner_magnet();
        }
    }
}

module spinners() {
    for ( i = [1 : 8] ){
        spinner2(i*45);
    }
}

module fixtures() {
    
    difference() {
        union() {
            
            // screw holes
            for ( i = [1 : 4] ){
                difference() {
                    rotate([0, 0, i*90]) translate([16.5, 0, -35]) cylinder(10, 3, 3);
                    rotate([0, 0, i*90]) translate([16.5, 0, -36]) cylinder(25, 1.45, 1.45);
                }
            }
            
            difference() {
                // bottom plate
                translate([0, 0, -35]) cylinder(2, 24, 24);
                translate([0, 0, -36]) cylinder(4, 16.5, 16.5);
                for ( i = [1 : 4] ){
                    rotate([0, 0, i*90]) translate([16.5, 0, -36]) cylinder(25, 1.4, 1.4);
                }
            }
            
            // main cylinder inner
            difference() {
                translate([0, 0, -35]) cylinder(30, 24.75, 24.75);
                translate([0, 0, -40]) cylinder(40, 23, 23);
            }
            
            // main cylinder outer
            difference() {
                translate([0, 0, -35]) cylinder(25, 26, 26);
                translate([0, 0, -40]) cylinder(40, 23, 23);
            }
        }
        
        // lead cutaway
        rotate([0, 90, 360/8]) translate([35, 0, -30]) cylinder(40, 12.5, 5);
    }
}



module avoiders() {
    for ( i = [1 : 16] ){
        rotate([0, 0, i*22.5+10]) translate([0, 61, 0]) rotate([90,0,0]) rotate([0, 0, 90]) magnet();
        rotate([0, 0, i*22.5+5]) translate([0, 54.5, -16.5]) rotate([45,0,0]) rotate([0, 0, 90]) magnet();
        rotate([0, 0, i*22.5]) translate([0, 39, -22]) rotate([0,0,0]) rotate([0, 0, 90]) magnet();
    }
}




module donut(a=0, b=0) {
    
    wheel_radius = a;
    tyre_diameter = b;
    difference() {
        color("blue") rotate_extrude(angle=360) {
         translate([wheel_radius - tyre_diameter/2, 0, 0]) circle(d=tyre_diameter);
        }
        avoiders();
    }
    
}

module cutaways() {
    a = 150;
    translate([0,0,26]) cube([a, a, a/4], true);
    cylinder(160, 25, 25, true);
    translate([0,0,14]) cube(70, true);
    translate([0,0,-77]) cube(100, true);
}

module inner_bracket_head() {
    difference() {
        union() {
            // holding clyinder
            for ( i = [1 : 8] ){
                // bearing axis
                color("red")  rotate([0,0,i*45]) translate([40,0,0]) rotate([0,90,90]) cylinder(7.5, 3.85, 3.85, true);
                // squared arm
                color("red")  rotate([0,0,i*45]) translate([20,-8,0]) cube([40, 4, 9], true);
                color("red")  rotate([0,0,i*45]) translate([40,-8,0]) rotate([0,90,90]) cylinder(4, 4.5, 4.5, true);
                //pusher cyliner
                color("red")  rotate([0,0,i*45]) translate([40, -4.5,0]) rotate([0,90,90]) cylinder(3, 4.5, 4.5, true);
            }
            
            color("red") cylinder(9, 10, 10, true);
            union() {
                $fn = 8;
                difference() {
                    color("red") rotate([0,0,22.5]) cylinder(9, 23, 23, true);
                    rotate([0,0,22.5]) cylinder(12, 19, 19, true);
                }
            }
        }
        color("black") cylinder(30, 3, 3, true);
    }
    spinners();
}

module main(d=0) {
    
    difference() {
        union() {
            donut(d, d-2);
            
        }
        translate([0, 0, 0]) donut(d-2, d-18); // cutaway inside dount
        cutaways(); // cutaway half
    }
}

size = 65;

//main(size);

translate([0, 0, -18]) fixtures();

//rotate([180,0,0]) main();

//rotate([0,0,$t*(360/8)]) inner_bracket_head();



//avoiders();

//spinner2(0);





























//