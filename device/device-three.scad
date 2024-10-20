$fn = 50;

module magnet() {
    cube([10.5, 10.5, 4.5], true);
}

module spinner_magnet() {
    //cube([10.5, 5.5, 2.5], true);
    cylinder(6, 3.2, 3.2, true);
}

module bearing(){
    color("yellow") 
    difference() {
        cylinder(7.5, 11.15, 11.15, true);
        cylinder(10, 4, 4, true);
    }
}

module spinner2(a, r) {
    difference() {
        rotate([0,0,a]) translate([r,0,0]) rotate([90,0,0]) rotate([0, 0, -$t*360]) bearing_spinner_enclosure();
        rotate([0,0,a]) translate([r,0,0]) rotate([90,0,0]) bearing();
        rotate([0,0,a]) translate([r,3,0]) rotate([90,0,0]) bearing();
        rotate([0,0,a]) translate([r,10,0]) rotate([90,0,0]) cylinder(30, 6, 6);
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

module bearing_spinner_enclosure() {
    difference() {
        color([0,1,1,0.5]) cylinder(8, 21, 21, true);
        for (i = [1:8]) {
            rotate([0,90,i*45]) translate([0,18,0]) rotate([90,0,0]) spinner_magnet();
        }
    }
}

module spinners() {
    for ( i = [1 : 8] ){
        spinner2(i*45, 37);
        //spinner2(i*45+22.5, 55);
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
            
            // mount holes
            
            
                        
            
            difference() {
                union() {
                    for ( i = [1 : 4] ){
                        rotate([0, 0, i*90]) translate([29, 0, -35]) cylinder(5, 3, 3);
                    }
                    difference() {
                        translate([0, 0, -35]) cylinder(4, 32, 32);
                        translate([0, 0, -40]) cylinder(40, 23, 23);
                    }
                }
                for ( i = [1 : 4] ){
                    rotate([0, 0, i*90]) translate([29, 0, -36]) cylinder(25, 1.45, 1.45);
                }
            }
            
            
            
            difference() {
                // bottom plate
                translate([0, 0, -35]) cylinder(10, 24, 24);
                translate([0, 0, -36]) cylinder(14, 16.5, 16.5);
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
        rotate([0, 90, 360/8]) translate([35, 0, -35]) cylinder(40, 8, 8);
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



module inner_bracket_head() {
    difference() {
        union() {
            for ( i = [1 : 3] ){
         
                // bearing axis
                rotate([0,0,i*120]) translate([37,0,0]) rotate([0,90,90]) cylinder(8, 3.9, 3.9, true);
                
                // squared arm
                rotate([0,0,i*120]) translate([20,-6,0]) cube([35, 3, 9], true);
                //rotate([0,0,i*45]) translate([10,7,0]) cube([15, 7, 9], true);
                // arm supports
                rotate([0,0,i*120]) translate([20,-6, 10]) cube([35, 3, 12], true);
                
                // rounded ends of arm
                rotate([0,0,i*120]) translate([37,-5.5,0]) rotate([0,90,90]) cylinder(4, 4.5, 4.5, true);
                //pusher cyliner
                //rotate([0,0,i*45]) translate([37, -5,0]) rotate([0,90,90]) cylinder(2.5, 4.5, 4.5, true);
                
                
            }
            
            // inner cylinder to cover arms in middle
            cylinder(9, 10, 10, true);
            
            // 8 sided circle for 90 degree bracket to arm
//            union() {
//                $fn = 8;
//                difference() {
//                    rotate([0,0,22.5]) cylinder(9, 16, 16, true);
//                    rotate([0,0,22.5]) cylinder(12, 8, 8, true);
//                }
//            }
            
            // center bearing holder
            translate([0, 0, 10]) cylinder(12, 12.5, 12.5, true);
        }
        
        
        
        // arm cutouts
        for ( i = [1 : 8] ){
            // arm support cutout
            rotate([i*45, 90, 0]) translate([-29.7, 30.5, 4.4]) cylinder(4, 26, 26);
            //rotate([0,0,i*45]) translate([8,9,0]) rotate([0,0,45]) translate([8.5,0,0]) cube([7, 5, 10], true);
        }
        
        // inner-most motor mount hole
        cylinder(30, 2.7, 2.7, true);
        
        // bearing holder cutout - full
        translate([0, 0, 9]) cylinder(12, 10.5, 10.5, true);
        // bearing holder cutout - partial, just for actual bearing
        translate([0, 0, 18]) cylinder(12, 11.04, 11.04, true);
    }
    
    difference() {
        // center bearing holder
        translate([0, 0, 10]) cylinder(12, 12.5, 12.5, true);
        // bearing holder cutout - full
        translate([0, 0, 9]) cylinder(12, 10.5, 10.5, true);
        // bearing holder cutout - partial, just for actual bearing
        translate([0, 0, 18]) cylinder(12, 11.04, 11.04, true);   
    }
    //spinners();
}


module cutaways() {
    a = 150;
    translate([0,0,26]) cube([a, a, a/4], true);
    cylinder(160, 25, 25, true);
    translate([0,0,14]) cube(70, true);
    translate([0,0,-77]) cube(100, true);
}


module cutaways_top() {
    a = 150;
    translate([0,0,-68]) cube([a, a, a], true);
    //cylinder(160, 25, 25, true);
    translate([0,0,-7]) cylinder(60, 35, 35, true);
    translate([0,0,41]) cube([120, 120, 30], true);
    //translate([0,0,-77]) cube(-100, true);
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


module top(d=0) {
    
    difference() {
        union() {
            donut(d, d-2);
            translate([0, 0, 24.5]) cylinder(3, 16, 16, true);
            
            
            
        }
        translate([0, 0, 0]) donut(d-2, d-18); // cutaway inside dount
        cutaways_top(); // cutaway half
        
        // viewing holes
        for ( i = [1 : 20] ){
            translate([0, 0, 16]) rotate([0, 90, i*20]) translate([0, 60, 0]) rotate([90, 0, 0]) cylinder(40, 7.5, 7.5, true);
        }
        
        for ( i = [1 : 6] ){
            translate([0, 0, 16]) rotate([0, 90, i*60]) translate([0, 25, 0]) rotate([90, 0, 90]) cylinder(50, 9, 9, true);
        }
        for ( i = [1 : 6] ){
            translate([0, 0, 16]) rotate([0, 90, i*60+30]) translate([0, 40, 0]) rotate([90, 0, 90]) cylinder(50, 9, 9, true);
        }
        for ( i = [1 : 6] ){
            translate([0, 0, 16]) rotate([0, 90, i*60]) translate([0, 43, 0]) rotate([90, 0, 90]) cylinder(50, 6, 6, true);
        }
        // cutout again
        translate([0, 0, 22]) cylinder(19, 5.2, 5.2, true);
        cylinder(23.5, 68, 53);
    }
    
    difference() {
        union() {
            translate([0, 0, 23.5]) cylinder(5, 7, 7, true);
            translate([0, 0, 20]) cylinder(7, 6.1, 6.1, true);
        }
        translate([0, 0, 22]) cylinder(19, 5, 5, true);
    }
    
    difference() {
        cylinder(8.5, 67, 67);
        translate([0,0,-2]) cylinder(15, 65.5, 65.5);
        main(65.5);
    }
    
    

}


//main(65);

//color("blue") top(66.6);

//translate([0, 0, -18]) fixtures();

//color("red") inner_bracket_head();



//avoiders();

spinner2(0);





























//