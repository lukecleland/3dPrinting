$fn = 100;

module flywheel() {
    height = 10;
    radius = 13;
    cylinder(height, radius, radius, true);
}

module magnet_5mm() {
    height = 1.65;
    diameter = 10.1;
    cylinder(height, diameter/2, diameter/2, true);
}

module magnet_5mm_reccess() {
    magnet_5mm();
    translate([5,0,0]) cube([10.1, 10.1, 1.65], true);
}

module create_recesses_for_magnet(radius) {
    points = 4;
    module recesses() { 
        for ( i = [0 : points-1] ){
            rotate([90, i*(360/points), 0]) translate([9.5, 0, 0]) rotate([0, 90, 0]) magnet_5mm_reccess();
        }
    }
    rotate([90, 0, 0]) recesses();
}


module airhole_recesses_for_magnet(radius) {
    points = 4;
    module recesses() { 
        for ( i = [0 : points-1] ){
            rotate([90, i*(360/points)-(360/points)/2.3, 0]) translate([7, 0, 0]) rotate([20, 0, 0]) cylinder(20, 2.5, 2, true);
        }
    }
    rotate([90, 0, 0]) recesses();
}


module flywheel_bearing_recess() {
    height = 10.1;
    diameter = 10.8;
    cylinder(height, diameter/2, diameter/2, true);
    cylinder(height*1.5, diameter/2.6, diameter/2.6, true);
}


module spinner() {
    difference() {
        flywheel();
        create_recesses_for_magnet(10);
        translate([0, 0, 2.5]) flywheel_bearing_recess();
        airhole_recesses_for_magnet(10);
    }
}

//spinner();

module spinners() {
    for ( i = [1 : 3] ){
        rotate([90, 0, i*(360/3)]) translate([27, 0, 0]) spinner();
    }
}


module inner_bracket_head() {
    difference() {
        union() {
            for ( i = [1 : 3] ){
         
                // bearing axis
                rotate([0,0,i*120]) translate([27,0,0]) rotate([0,90,90]) cylinder(24, 2.45, 2.45, true);
                
                // squared arm
                rotate([0,0,i*120]) translate([14.5,-9,0]) cube([25, 6, 6], true);
                //rotate([0,0,i*45]) translate([10,7,0]) cube([15, 7, 9], true);
                // arm supports
                //rotate([0,0,i*45]) translate([20,-6, 10]) cube([35, 3, 12], true);
                
                // rounded ends of arm
                rotate([0,0,i*120]) translate([27,-7,0]) rotate([0,90,90]) cylinder(10, 3, 3, true);
                //pusher cyliner
                //rotate([0,0,i*45]) translate([37, -5,0]) rotate([0,90,90]) cylinder(2.5, 4.5, 4.5, true);
                
                // support test for arms
                /*hull() {
                    for ( j = [1 : 5] ){
                        rotate([0,0,i*120-(8*j)]) translate([28,-5.5,0]) sphere(3);
                    }
                }*/
                
            }
            
            // inner cylinder to cover arms in middle
           // cylinder(6, 10, 10, true);
            
            // 8 sided circle for 90 degree bracket to arm
            union() {
                $fn = 6;
                difference() {
                    rotate([0,0,30]) cylinder(6, 13.5, 13.5, true);
                    //rotate([0,0,22.5]) cylinder(12, 8, 8, true);
                }
            }
            
            // center bearing holder
           // translate([0, 0, 8]) cylinder(12, 12.5, 12.5, true);
        }
        
        
        
        // arm cutouts
        for ( i = [1 : 8] ){
            // arm support cutout
            //rotate([i*45, 90, 0]) translate([-29.7, 30.5, 4.4]) cylinder(4, 26, 26);
            //rotate([0,0,i*45]) translate([8,9,0]) rotate([0,0,45]) translate([8.5,0,0]) cube([7, 5, 10], true);
        }
        
        // inner-most motor mount hole
        cylinder(30, 2.7, 2.7, true);
        
        // bearing holder cutout - full
        //translate([0, 0, 9]) cylinder(12, 10.5, 10.5, true);
        // bearing holder cutout - partial, just for actual bearing
        //translate([0, 0, 18]) cylinder(12, 11.04, 11.04, true);
    }
    
    difference() {
        // center bearing holder
        translate([0, 0, 9.5]) cylinder(15, 11.7, 11.7, true);
        // bearing holder cutout - full
        translate([0, 0, 9]) cylinder(15, 10.5, 10.5, true);
        // bearing holder cutout - partial, just for actual bearing
        translate([0, 0, 18]) cylinder(10, 11.04, 11.04, true);   
    }
    //spinners();
}


module avoiders() {
    for ( i = [1 : 6] ){
        //rotate([0, 0, i*22.5+10]) translate([0, 61, 0]) rotate([90,0,0]) rotate([0, 0, 90]) magnet();
        rotate([0, 0, i*(360/6)-25]) translate([0, 45.5, -7]) rotate([75,0,0]) rotate([0, 0, 90]) magnet();
        rotate([0, 0, i*(360/6)]) translate([0, 35, -20]) rotate([25,0,0]) rotate([0, 0, 90]) magnet();
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

//avoiders();

module magnet() {
    cube([10.5, 10.5, 4.5], true);
}

module cutaways() {
    a = 150;
    translate([0,0,20]) cube([a, a, a/4], true);
    cylinder(160, 25, 25, true);
    avoiders();
    //translate([0,0,14]) cube(70, true);
    //translate([0,0,-77]) cube(100, true);
}

module main(d=0) {
    
    difference() {
        union() {
            donut(d, d-2);
            
        }
        translate([0, 0, 0]) donut(d-2, d-8); // cutaway inside dount
        cutaways(); // cutaway half
    }
}

//main(46);

/*
difference() {
    union() {
        cylinder(10, 27, 27, true);
        translate([0, 0, 5]) cylinder(5, 40, 40, true);
    }
    cylinder(40, 25, 25, true);
    cylinder(60, 20, 20, true);
}*/

inner_bracket_head();


module top() {
    difference() {
        union() {
            difference() {
                sphere(46);
                translate([0, 0, 28]) cube([100, 100, 100], true);
            }
            difference() {
                sphere(46);
                sphere(45);
                translate([0, 0, 50]) cube([100, 100, 100], true);
                
            }
            translate([0, 0, -45]) cylinder(26, 4.1, 4.1);
            translate([0, 0, -46.5]) cylinder(26, 5, 5);
        }
        translate([0, 0, -73]) cube([100, 100, 100], true);
        
        /*
        // viewing holes
        for ( i = [1 : 12] ){
            translate([0, 0, -12]) rotate([0, 90, i*30]) translate([0, 60, 0]) rotate([90, 0, 0]) cylinder(40, 7, 7, true);
        }
        
        for ( i = [1 : 6] ){
            translate([0, 0, -16]) rotate([0, 90, i*60]) translate([0, 25, 0]) rotate([90, 0, 90]) cylinder(50, 9, 9, true);
        }
        */
        
        
    }
    difference() {
        cylinder(2, 47, 47);
        translate([0,0,-2]) cylinder(15, 46, 46);
       
    }
    
}

//top();


module _90_mount() {
    difference() {
        union() {
            cylinder(13, 29, 29, true);
            translate([25, 0, 0]) cube([30, 40, 13], true);
        }
        cylinder(15, 26.5, 26.5, true);
        translate([-50, 0, 0]) cube([100, 100, 100], true);
    }
}

//_90_mount();


module wheel_brackets() {
    difference() {
        union() {
            cylinder(20, 4.2, 4.2);
            translate([0, 0, 0]) cylinder(10, 5, 5);
            translate([10, 0, 0]) cylinder(8, 15, 15);
        }
        translate([40, 0, 0]) cube([50, 50, 50], true);
    }
}

//wheel_brackets();

