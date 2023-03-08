




module cutaway() {
 
    translate([0,0,-14.5]) {
        rotate([90, 0, 0]){
            difference() {
                cylinder(90,50,50, true);
                cylinder(100,25,25, true);
            }
        }
    }
    
    translate([0,2,26]) {
        rotate([0, 90, 0]){
            difference() {
                cylinder(90,70,70, true);
                cylinder(100,50,50, true);
            }
        }
    }
    /*
    translate([46,4,26]) {
        rotate([0, 0, 90]){
            difference() {
                cylinder(90,90,90, true);
                cylinder(100,70,70, true);
            }
        }
    }
    
    translate([-46,4,26]) {
        rotate([0, 0, 90]){
            difference() {
                cylinder(90,90,90, true);
                cylinder(100,70,70, true);
            }
        }
    }*/
    
    

    
    translate([0, 10, 5.5]) {

        sphere(14.1, true);
        
    }
    
   /* translate([0,2,-75]) {
        rotate([0, 90, 0]){
            difference() {
                cylinder(90,70,70, true);
                cylinder(100,50,50, true);
            }
        }
    }*/
    
    
    translate([0,2,-32]) {
        rotate([0, 90, 0]){
            difference() {
                cylinder(90,70,70, true);
                cylinder(100,50,50, true);
            }
        }
    }
    
    translate([0,-38,70]) {
        rotate([0, 90, 0]){
            difference() {
                cylinder(90,70,70, true);
                cylinder(100,40,40, true);
            }
        }
    }
    /*
    translate([11,30,4]) {
        rotate([0, 0, 90]){
            difference() {
                cylinder(30,5,5, true);
                
            }
        }
    }

translate([-11,30,4]) {
        rotate([0, 0, 90]){
            difference() {
                cylinder(30,5,5, true);
                
            }
        }
    }
    
    translate([8,-22,4]) {
        rotate([0, 0, 90]){
            difference() {
                cylinder(30,8,8, true);
                
            }
        }
    }*/
    
}






translate([-5,-28,1.5]) {
        rotate([0, 90, 0]){
            difference() {
                cylinder(2,4,4, true);
                cylinder(4,1,1, true);
            }
        }
    }
    
    translate([5,-28,1.5]) {
        rotate([0, 90, 0]){
            difference() {
                cylinder(2,4,4, true);
                cylinder(4,1,1, true);
            }
        }
    }
    
    translate([-23,15,-4]) {
        rotate([90, 0, 0]){
            difference() {
                cylinder(2,4,4, true);
                cylinder(4,1,1, true);
            }
        }
    }
    
    translate([-23,5,-4]) {
        rotate([90, 0, 0]){
            difference() {
                cylinder(2,4,4, true);
                cylinder(4,1,1, true);
            }
        }
    }









difference() {

    cube([60, 80, 17.5], true);

    cutaway();
    
}