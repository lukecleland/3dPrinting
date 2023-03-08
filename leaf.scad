 difference() {
     union() {
         
         //translate([0,0,-5.34]) cube([210, 5, 8], false);
         
         for(i=[0:24])
            translate([i*10,0,0])
                rotate([0, i, i*3])
                    cube([4,sin(i*10)*100+100, 10], true);
         
         rotate([180,0,0])
             for(i=[0:24])
                translate([i*10,0,0])
                    rotate([0, i, i*3])
                        cube([4,sin(i*10)*100+100, 10], true);

    }
    
    translate([0,0,-4.34]) cube([500, 500, 4], true);
}