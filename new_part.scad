mountHeight = 60;
mountWidth = mountHeight/2;
mountDepth = tan(30)*mountWidth;
mountSize = mountWidth/6;
drillSize = 1.7;
gridUnit = mountWidth/3;

module strut() 
{   
    difference() {
        union() {
            translate([0, 0, 0])
                polyhedron(
                    points=[[0,0,0],[mountWidth,0,0], [mountWidth,0,mountHeight],[0,0,mountHeight],[0,-mountDepth,mountWidth], [mountWidth,-mountDepth,mountWidth]],
                    faces=[[0,4,3],[4,5,2,3],[1,2,5],[4,0,1,5],[0,3,2,1]], center = true
                );
            //translate([0, -mountSize, 5]) cube([mountWidth, mountSize, mountHeight]);
            translate([0, 0,10]) cube([mountWidth, mountWidth, mountSize]);
            
            // Frame supports
            translate([0, 0, mountSize+5]) cube([mountSize, mountSize, mountHeight]);
            translate([mountWidth-mountSize, 0, mountSize+5]) cube([mountSize, mountSize, mountHeight]);
            
            // Motor screw mounts
            translate([mountWidth/2, (mountWidth/2), 12.5]) cube([mountSize, mountWidth, mountSize], true);
            translate([mountWidth/2, 18, 12.5]) cube([mountWidth, mountSize, mountSize], true);
            
        }
        
        union() {

            /// Motor mount screw holes
            translate([mountWidth/2, 10, -mountSize/2]) cylinder(mountWidth, drillSize, drillSize);
            translate([mountWidth/2, 26, -mountSize/2]) cylinder(mountWidth, drillSize, drillSize);
            
            translate([mountWidth/2, 10, 7]) cylinder(5, drillSize*1.7, drillSize*1.7);
            translate([mountWidth/2, 26, 7]) cylinder(5, drillSize*1.7, drillSize*1.7);
            
            
            translate([(mountWidth/2)+9.75, 18, -mountSize/2]) cylinder(mountWidth, drillSize, drillSize);
            translate([(mountWidth/2)-9.75, 18, -mountSize/2]) cylinder(mountWidth, drillSize, drillSize);
            
            translate([(mountWidth/2)+9.75, 18, 7]) cylinder(5, drillSize*1.7, drillSize*1.7);
            translate([(mountWidth/2)-9.75, 18, 7]) cylinder(5  , drillSize*1.7, drillSize*1.7);
            
            
            // Cutaways
            translate([0, 30, -mountSize/2]) cylinder(mountWidth, drillSize*5, drillSize*5);
            translate([30, 30, -mountSize/2]) cylinder(mountWidth, drillSize*5, drillSize*5);
            
            // Rotary space
            translate([mountWidth/2, 18, -1]) cylinder(mountWidth, 4.6, 4.6);
            
            // Hollowing cube
            //translate([15, -5, 30]) cube([15, 50, 15], true);
            
            // Space for bearings
            translate([0, -mountDepth, mountHeight/2]) 
                rotate([0,90,0]) {
                    cylinder(mountWidth/3, 11, 11);
                }
                
            translate([20, -mountDepth, mountHeight/2]) 
                rotate([0,90,0]) {
                    cylinder(mountWidth/3, 11, 11);
                }
                
            // Space for Axle
            translate([0, -mountDepth, mountHeight/2]) 
                rotate([0,90,0]) {
                    cylinder(mountWidth+1, 8, 8);
                }
            
            // Flatten top
            translate([-1, -30, mountHeight-10]) 
                //rotate([0,0,0]) {
                    cube([mountWidth+2, mountHeight, mountHeight]);
                //}
            
            // Bevel top
            translate([-1, 20, mountHeight-24]) 
                rotate([60,0,0]) {
                    cube([mountWidth+2, mountHeight, mountHeight]);
                }
                
            // Flatten bottom
            translate([-1, -15, -5]) cube([mountWidth+2, mountWidth+20, 15]);
            
        }
        
        
        
        union() {
            
            ///  Frame fixtures
            
            // Through hole 1
            translate([gridUnit*2, gridUnit, 34]) 
                rotate([60,0,0]) {  
                    cylinder(mountSize*10, drillSize, drillSize); 
                }
            
            // Head gap 1
            translate([gridUnit*2, gridUnit, 34]) 
                rotate([60,0,0]) {  
                    cylinder(mountSize*3, drillSize*1.5, drillSize*1.5); 
                }
                
            // Through hole 2 
            translate([gridUnit, gridUnit, 34]) 
                rotate([60,0,0]) {  
                    cylinder(mountSize*10, drillSize, drillSize); 
                } 
            // Head gap 2
            translate([gridUnit, gridUnit, 34]) 
                rotate([60,0,0]) {  
                    cylinder(mountSize*3, drillSize*1.5, drillSize*1.5); 
                }
                
            // Through hole 3
            translate([gridUnit*2, gridUnit, 26]) 
                rotate([120,0,0]) {  
                    cylinder(mountSize*10, drillSize, drillSize); 
                }
           // Head gap 3  
           translate([gridUnit, gridUnit, 26]) 
                rotate([120,0,0]) {  
                    cylinder(mountSize*10, drillSize, drillSize); 
                }
            
            // Through hole 4
            translate([gridUnit, gridUnit, 26]) 
                rotate([120,0,0]) {  
                    cylinder(mountSize*3, drillSize*1.5, drillSize*1.5); 
                }
            // Head gap 4    
            translate([gridUnit*2, gridUnit, 26]) 
                rotate([120,0,0]) {  
                    cylinder(mountSize*3, drillSize*1.5, drillSize*1.5); 
                }
        }
        
    }
    
           
    
}

strut();