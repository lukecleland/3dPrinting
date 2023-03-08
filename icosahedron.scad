$fn=100; 

module slat() {
    translate([75,0,0]) {
        cube([100,31.9,6.9], true);
    }
}


module slat2() {
    translate([85,0,-20]) {
        cube([100,31.9,6.9], true);
    }
}




module point() {
    translate([0,0,-132]){
        cube([200,200,200], true);
    }
    
    for(a =[0, 72, 144, 216, 288]) {
        rotate([0,30,a]) {
            translate([0,0,0]) {
                slat();
            }
        }
    }
    
    for(a =[0, 72, 144, 216, 288]) {
        rotate([0,0,a]) {
            translate([0,0,0]) {
                slat2();
            }
        }
    }
}



difference(){
    
    union() {
    
        translate([0,0,-38]){
            sphere(45);
        }
    
    }
    
    point();
    
    translate([0,0,95], true){
        cube([200,200,200], true);
    }
    
    translate([0,0,-60]){
        cylinder(80,20,20, true);
    }
    
}