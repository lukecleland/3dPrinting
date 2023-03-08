
r = 20;
t = 360;


translate([-10,0,-60]) {
    cube([80, 4, 6], true);

    rotate([0,0,90]) {
        cube([80, 4, 6], true);
    }
}


rotate([0,-90,0]) {
    for (i=[0:t]) {
        difference() {
            union() {
                rotate([0,i,0]) {
                    translate([r,0,0]) {
                        rad=i/r*4.5;
                        cylinder(1.8,rad,rad, true);
                    }
                }
            }
            union() {
                rotate([0,i,0]) {
                    translate([r,0,0]) {
                        rad=(i/r*4.5)-2;
                        cylinder(2,rad-1,rad-1, true);
                    }
                }
            }
            
        }
        
    }

}

    
    
    
    
