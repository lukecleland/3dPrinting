$fn = 100;

difference() {


    union() {

        //cube([15, 15, 40], true);
        cylinder(100, 40, 40, true);
       
        translate([0, 20, 20]) rotate([90, 0 ,0]) cylinder(50, 20, 20, true);
        translate([0, 20, 0]) rotate([90, 0 ,0]) cylinder(50, 20, 20, true);
        // cylinder(20, 40, 40, true);
       
    }

    union() {
        difference() {
            cylinder(110, 60, 60, true);
            cylinder(120, 45, 45, true);
        }
    }


}

 translate([0, 150, 150]) cube([60, 50, 0], true);