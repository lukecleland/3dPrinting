



difference() {
    union() {
        
        cube([78,55,2],true);
        cube([27,85,2],true);
        //cube([4,110,2],true);
        
        translate([0,-34,2])
            cube([27,5,5],true);
        translate([0,34,2])
            cube([27,5,5],true);
        
        translate([0,-42,13])
            rotate([0,90,0])
                cylinder(27,14,14,true);
        translate([0,42,13])
            rotate([0,90,0])
                cylinder(27,14,14,true);
        
     }
            
     union() {
         
         cube([50,30,5],true);
         
         translate([0,-42,13])
            rotate([0,90,0])
                cylinder(30,12,12,true);
        
         translate([0,-42,26])
            rotate([0,90,0])
                cylinder(30,12,12,true);
                

        
         
        translate([0,42,13])
            rotate([0,90,0])
                cylinder(30,12,12,true);
         
        translate([0,42,26])
            rotate([0,90,0])
                cylinder(30,12,12,true);
                
         
         
         
                
        translate([31.5,20.5,0])
            rotate([0,0,90])
                cylinder(22,2.5,2.5,true);
              
        translate([-31.5,-20.5,0])
            rotate([0,0,90])
                cylinder(22,2.5,2.5,true);
                
                
        translate([31.5,-20.5,0])
            rotate([0,0,90])
                cylinder(22,2.5,2.5,true);
                
        translate([-31.5,20.5,0])
            rotate([0,0,90])
                cylinder(22,2.5,2.5,true);
     }
}