module outer_ring(){
    difference() {

        translate([-21,0,7]) {
            //cube([110, 26, 27], true);
            rotate([0,90,0]) {
                cylinder(5, 26, 26, true);
            }
        }
        
        translate([-20,0,7]) {
            
            rotate([0,90,0]) {
                cylinder(10, 11, 11, true);
            }
        }
        
        translate([-20,-20,-7]) {
            cube([110, 126, 27], true);
        }
        
        translate([20,20,19]) {
            cube([110, 40, 30], true);
        }
        
    }
}

outer_ring();