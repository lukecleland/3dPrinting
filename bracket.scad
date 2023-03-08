$fa=5; 
$fn=100;

translate([0,0,0]) {
difference() {
    union(){
        
        translate([0,0,0]) {
        cube([38, 110, 2], true);
        }


        translate([0,45,4]){
            rotate([0,90,0]) {
                cylinder(30, 5, 5, true);
            }
        }

        translate([0,-45,4]){
            rotate([0,90,0]) {
                cylinder(10, 5, 5, true);
            }
        }
    }


    union() {
        
        
        
        translate([0,45,8]){
            rotate([0,90,0]) {
                cylinder(100, 3, 3, true);
            }
        }


        translate([0,-45,8]){
            rotate([0,90,0]) {
                cylinder(100, 3, 3, true);
            }
        }
        
        

        translate([0,45,4]){
            rotate([0,90,0]) {
                cylinder(100, 3, 3, true);
            }
        }


        translate([0,-45,4]){
            rotate([0,90,0]) {
                cylinder(100, 3, 3, true);
            }
        }

    }
}
}