$fn = 100;

module magnet() {
    cube([10.5, 10.5, 4.5], true);
}

module spinner_magnet() {
    cube([10.5, 5.5, 2.5], true);
}

module bearing(){
    color("yellow") 
    difference() {
        cylinder(7.5, 11, 11, true);
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

module fan(a) {
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

module fans() {
    union(){
        spinner(0);
        rotate([0, 0, 0]) {
            fan(0);
        }
    }
}

translate([40, 0, 40]) rotate([0, 90, 0]) fans();
translate([11, 0, 28]) rotate([0, 45, 0]) fans();
translate([68, 0, 28]) rotate([0, 135, 0]) fans();
fans();





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
        for (i = [1:8]) {
            rotate([0,90,i*45]) translate([0,14.8,0]) rotate([90,0,0]) spinner_magnet();
        }
    }
}

module spinners() {
    for ( i = [1 : 8] ){
        spinner(i*45);
    }
}

module fixtures() {
    for ( i = [1 : 4] ){
        difference() {
            rotate([0, 0, i*90]) translate([17, 0, -28]) cylinder(10, 3, 3);
            rotate([0, 0, i*90]) translate([17, 0, -35]) cylinder(25, 1.5, 1.5);
        }
    }
}



module avoiders() {
    for ( i = [1 : 16] ){
        rotate([0, 0, i*22.5+10]) translate([0, 61, 0]) rotate([90,0,0]) rotate([0, 0, 90]) magnet();
        rotate([0, 0, i*22.5+5]) translate([0, 54.5, -16.5]) rotate([45,0,0]) rotate([0, 0, 90]) magnet();
        rotate([0, 0, i*22.5]) translate([0, 39, -22]) rotate([0,0,0]) rotate([0, 0, 90]) magnet();
    }
}


//fixtures();

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
    cylinder(60, 14, 14, true);
    translate([0,0,20]) cube(60, true);
    translate([0,0,-78]) cube(100, true);
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
    //spinners();
}

module main(d=0) {
    difference() {
        donut(d, d-3);
        donut(d-3, d-17); // cutaway inside dount
        cutaways(); // cutaway half
    }
}

size = 65;

//main(size);
//rotate([180,0,0]) main();

//rotate([0,0,$t*(360/8)]) inner_bracket_head();



//avoiders();

spinner(0);





























//