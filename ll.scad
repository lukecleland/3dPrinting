$fn=25;

difference() {
    union() {
        
        
        cube([30,9,1.5],true);

        translate([0,0,12.5])
            rotate([90,0,0])
                cube([19,25,3],true);

        translate([15,0,0])
            cylinder(1.5,4.5,4.5,true);
            
         translate([-15,0,0])
            cylinder(1.5,4.5,4.5,true);
    }
        
    union() {
        translate([12.3,0,0])
            cylinder(10,2.5,2.5,true);
            
         translate([-12.3,0,0])
            cylinder(10,2.5,2.5,true);
            
         translate([0,0,8])
            cube([14,30,8],true);
        
    }
}
        
    
 