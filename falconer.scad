length = 110;
width = 35;
height = 15;
prodWidth = 2;
aerial = 5;
innerLength = length - (prodWidth*2);
innerWidth = width - (prodWidth*2);
innerHeight = height - (prodWidth);

module falconer()  {  
   casing_offset = 1; 
    module case() {
        difference() {
            union() {
                
                //main
                //cube([length, width, height], false);  
                
                
                
                // top inner
                translate([prodWidth, prodWidth, prodWidth+height]) {
                    cube([innerLength, innerWidth, 2], false);  
                }  
                // top 
                translate([0, 0, prodWidth+height+1.5]) {
                    cube([length, width, 2], false);  
                }  
                
            }
            
            union() {
                
                // logo
                translate([50, prodWidth+15.5, prodWidth+height+4]) {
                    scale([0.08, 0.08, 0.01]) {
                        //surface(file = "falcon.png", center = true, invert = true);
                    }
                }
                
                // cavity
                translate([prodWidth, prodWidth, prodWidth*2]) {
                    cube([innerLength, innerWidth, innerHeight], false);  
                }  
                
                // usb
                translate([0, prodWidth+15.5, 11]) {
                    cube([10, 15, 9], true);  
                } 
                
                // aerial
                translate([100, prodWidth+15.5, 15]) {
                    cylinder(20, aerial, aerial, true);  
                }      
            }
            
        }
    }
    
    module bevel() {
        difference() {
            union() {
                
               translate([55, prodWidth+15.5, 8]) {
                    sphere(60, true);  
               }
               
            }
            union() {
                translate([55, prodWidth+15.5, 3]) {
                    sphere(58, true);  
                }
            }
        }
    }
    
    module bevel2() {
        difference() {
            union() {
                
               rotate ([90,90,90]) {
                    translate([-10, prodWidth+15.5, 5]) {
                        cylinder(220, 30, 30, true);  
                    }    
                }
               
            }
            union() {
                rotate ([90,90,90]) {
                    translate([-10, prodWidth+15.5, 5]) {
                        cylinder(220, 19, 19, true);  
                    }    
                }
            }
        }
    }
    
    difference() {
        case();
        bevel();
        bevel2();
    }
    
}

falconer();