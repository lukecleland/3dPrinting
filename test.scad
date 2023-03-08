difference() {
    union(){
        cube([38, 130, 3], true);



        translate([0,60,4]){
            rotate([0,90,0]) {
                cylinder(30, 5, 5, true);
            }
        }

        translate([0,-20,4]){
            rotate([0,90,0]) {
                cylinder(10, 5, 5, true);
            }
        }
    }


    union() {
        
        translate([0,-45,19]){
            cube([35, 38, 38], true);
        }
        
        translate([0,20,0]){
            cube([20, 50, 25], true);
        }
        
        translate([0,60,8]){
            rotate([0,90,0]) {
                cylinder(100, 3, 3, true);
            }
        }


        translate([0,-20,8]){
            rotate([0,90,0]) {
                cylinder(100, 3, 3, true);
            }
        }
        
        

        translate([0,60,4]){
            rotate([0,90,0]) {
                cylinder(100, 3, 3, true);
            }
        }


        translate([0,-20,4]){
            rotate([0,90,0]) {
                cylinder(100, 3, 3, true);
            }
        }

    }
}