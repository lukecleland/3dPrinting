 difference() {
     union() {
         
         //translate([0,0,-5.34]) cube([210, 5, 8], false);
         
         for(i=[0:23])
            translate([i*10,0,0])
                rotate([0, i, i*4])
                    cube([4,sin(i*10)*100+150, 10], true);
         
         rotate([180,0,0])
             for(i=[0:23])
                translate([i*10,0,0])
                    rotate([0, i, i*4])
                        cube([4,sin(i*10)*100+150, 20], true);

    }
    
    translate([0,0,-15]) cube([700, 700, 20], true);
}