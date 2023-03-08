/*difference() {
   sphere(14);
    translate([0,0,20]){
        cube([40, 40, 48], true);
    } 
    sphere(14);
    translate([0,5,20]){
        cube([40, 40, 48], true);
    } 
}*/

difference() {
    

    translate([0,0,7]) {
        cube([110, 26, 27], true);
    }
    
    cutaway();

}


module cutaway() {
    translate([-32,0,0]) {
        sphere(16);  
    }

    translate([32,0,0]) {
        sphere(16);  
    }

    translate([0,25,0]) {
        cube([120, 50, 57], true);
    }
    translate([0,0,18]) {
        cylinder(10,4,4, true);
    }
}
