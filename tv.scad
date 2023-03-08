use <dc_motor.scad>;

module mount() {
    difference() {
        
        
        translate([54,0,0]) rotate([0,90,0]) cylinder(2, 50, 50, true, $fn=300);
        
        for (i=[1:6])  {
            rotate([i*60,0,0]) translate([10,34,0]) rotate([0,90,0]) cylinder(130,10,10,true, $fn=100);
        }
        
        translate([45,0,0]) rotate([0,90,0]) cylinder(30, 20.25, 20.25, true, $fn=300);
        
    }
}


module stand() {
    difference() {
        union() {
            translate([40,0,0]) rotate([0,90,0]) cylinder(30, 20, 20, true, $fn=300);
            
        }
        
        union(){
            translate([45,0,0]) rotate([0,90,0]) cylinder(30, 18, 18, true, $fn=300);
            translate([52,0,0]) rotate([0,180,0]) hobby_dc_motor();
            
        } 
    }
}

module wheel() {

    

    difference() {
        translate([8,0,0]) rotate([0,90,0]) cylinder(24,49,49,true, $fn=300);
        translate([7,0,0]) rotate([0,90,0]) cylinder(24,48,48,true, $fn=300);
        
        for (i=[1:32])  {
            translate([0.22*i+3, 0, 0]) rotate([11.25*i,0,0]) cylinder(55, 0.6, 0.6, false, $fn=30);
        }
        
        translate([6,0,0]) rotate([0,90,0]) cylinder(30,1.6,1.6,true);
        
        for (i=[1:3])  {
            rotate([i*120,0,0]) translate([10,28,0]) rotate([0,90,0]) cylinder(30,20,20,true, $fn=100);
        }

       // for (i=[1:3])  {
        //    rotate([i*120+60,0,0]) translate([10,32,0]) rotate([0,90,0]) cylinder(30,10,10,true);
       // }
    }



    difference() {
        union() {
            for (i=[1:3])  {
                translate([17, 0, 0]) rotate([120*i-20,0,0]) cube([2, 2, 49], false);
            }

            //for (i=[1:3])  {
            //    translate([17, 0, 0]) rotate([120*i-50,0,0]) cube([2, 2, 49], false);
            //}
            translate([17,0,0]) rotate([0,90,0]) cylinder(5,5,5,true, $fn=100);
        }
        
        translate([14,0,0]) rotate([0,90,0]) cylinder(14,1,1,true, $fn=100);
        //translate([13,0,0]) rotate([90,90,0]) cylinder(14,1.4,1.4,true, $fn=100);
    }

}

//mount();
wheel();
//stand();
