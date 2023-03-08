$fn=100; 

module slat() {
    translate([75,0,0]) {
        cube([100,31.5,6.5], true);
    }
}


module slat2() {
    translate([35,0,0]) {
        cube([26,37,11.5], true);
    }
}


module slat3() {
    translate([38,0,0]) {
        cube([15,45,26], true);
    }
}

module slat4() {
    translate([52,0,0]) {
        cube([25,45,32], true);
    }
}





module point() {
    
    for(a =[0, 72, 144, 216, 288]) {
        rotate([0,30,a]) {
            translate([0,0,0]) {
                slat();
            }
        }
    }
   
}

module point2() {
    for(a =[0, 72, 144, 216, 288]) {
        rotate([0,30,a]) {
            translate([0,0,0]) {
                slat2();
            }
        }
    }
}

module point3() {
    for(a =[0, 72, 144, 216, 288]) {
        rotate([0,30,a]) {
            translate([0,0,10]) {
                slat3();
            }
        }
    }
}


module point4() {
    for(a =[0, 72, 144, 216, 288]) {
        rotate([0,30,a]) {
            translate([0,0,10]) {
                slat4();
            }
        }
    }
}


module point5() {
    for(a =[0, 72, 144, 216, 288]) {
        
        rotate([0,30,a]) {
            translate([2,0,50]) {
                cylinder(10,1,1, center=true);
            }
        }
        
    }
}



module rounder() {
    difference() {
        cylinder(30, 50, 50, true);
        cylinder(40, 31, 31, true);
        
    }
    
}




difference(){
    point2();
    point();
    translate([0,0,92]){
        cube([200,200,200], true);
    }
    translate([0,0,-130]){
        cube([200,200,200], true);
    }
    //point3();
    //point4();
    
    translate([0,0,-60]) {
        point5();
    }
    
    translate([0,0,-20]) {
        rounder();
    }
    //difference(){
    //    cylinder(80, 60, 60, true);
    //    cylinder(100, 40, 40, true);
    //}
}