$fn =100;

height = 15;
width = 9.525;
l_width = 12;
l_height = 3;
p_width = 14;
p_height = 2;


module bushing() {
    difference() {
        
        
        union() {
            difference() {
                translate([0,0,2]) sphere(8.25);
                translate([0,0,-8.5]) cube(20, true);
            }
        }


        union() {
            translate([0,0,10.5]) sphere(3.6);
            cylinder(10,3.11,3.11);// snaps on!
            cylinder(7.5,4,4);
            cylinder(1.5,7.5,7.5);
        }



    }
}


module ring() {
    translate([0,0,5]) {
        difference() {
            cylinder(2, 10, 10);
            translate([0,0,-1]) cylinder(10, 5.5, 5.5);
        }
    }
}


difference() {
    bushing();
    ring();
    
}

