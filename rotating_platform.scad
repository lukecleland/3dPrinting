$fn=360;

difference() {
    cylinder(6,90,90,true);
    
    difference() {
        cylinder(99,4,4,true);
        union() {
            translate([0, 11.5, 5]) {
               cube([20,20,20], true); 
            }

            translate([0, -11.5, 5]) {
               cube([20,20,20], true); 
            }
        }
    }

    //union() {
        
      //  translate([0,0,-4]) {
        //    cylinder(22,16,16,true);
        //}   
   // }
    
}


