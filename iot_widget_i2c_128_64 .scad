length = 30;
width = 30;
depth = 5;
prodWidth = 2;

outerLength = length + (prodWidth*2);
outerWidth = width + (prodWidth*2);
outerDepth = depth + (prodWidth);

module main()  {  
   casing_offset = 1; 
    
    //sub cover
                translate([12, 0, depth/2]) {
                    cube([6, outerWidth, prodWidth], true); 
                } 
                
                 translate([-11, 0, depth/2]) {
                    cube([8, outerWidth, prodWidth], true); 
                } 
                
     module lid() {   
        ///  lid
        difference() {
            union() {
                 
                
                //backing inner
                translate([0, 0, prodWidth-depth]) {
                    cube([length, width, prodWidth*2], true);  
                }  
                //backing
                translate([0, 0, -depth]) {
                    cube([outerLength, outerWidth, prodWidth], true); 
                } 
            }
           
        }
    }
    
    module case() {    
        difference() {
            union() {
                
                //main
                cube([outerLength, outerWidth, outerDepth], true);  
                
                
                
            }
            
            union() {
                
                // logo
//                translate([50, prodWidth+15.5, prodWidth+height+4]) {
//                    scale([0.08, 0.08, 0.01]) {
//                        surface(file = "falcon.png", center = true, invert = true);
//                    }
//                }
                
                // cavity
                translate([0, 0, 0]) {
                    cube([length, width, depth+5], true);  
                }  
                
                translate([10, 0, -4]) {
                    cube([length+10, width/2, depth+5], true);  
                }  
                
            }
            
        }
    }
   

   case();
   //lid();

}

main();