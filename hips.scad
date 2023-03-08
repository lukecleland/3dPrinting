/*difference() {
   sphere(14);
    translate([0,0,20]){
        cube([40, 40, 48], true);
    } 
    sphere(14);
    translate([0,5,20]){
        cube([40, 40, 48], true);
    } 
}*/


module outer_ring(){
    difference() {

        translate([-21,0,7]) {
            //cube([110, 26, 27], true);
            rotate([0,90,0]) {
                cylinder(5, 26, 26, true);
            }
        }
        
        translate([-20,0,7]) {
            
            rotate([0,90,0]) {
                cylinder(10, 11, 11, true);
            }
        }
        
        translate([-20,-20,-7]) {
            cube([110, 126, 27], true);
        }
        
        translate([20,20,19]) {
            cube([110, 40, 30], true);
        }
        
    }
}



module inner_ring(x1, x2){
    difference() {

        translate([x1,0,7]) {
            //cube([110, 26, 27], true);
            rotate([0,90,0]) {
                cylinder(5.5, 30, 30, true);
            }
        }
        
        translate([x2,0,7]) {
            //cube([110, 26, 27], true);
            rotate([0,90,0]) {
                cylinder(10, 10, 10, true);
            }
        }
        
        translate([x2,0,-10]) {
            cube([30, 66, 27], true);
            
        }
        
    }
}



difference() {
    

    translate([0,0,7]) {
        //cube([110, 26, 27], true);
        rotate([0,90,0]) {
            cylinder(110, 14, 14, true);
        }
    }
    
    cutaway();

}


module cutaway() {
    inner_ring(-25, -24);
    inner_ring(25, 24);
    
    translate([-39.5,0,0]) {
        sphere(15.5);  
    }

    translate([39.5,0,0]) {
        sphere(15.5);  
    }

    //translate([0,25,0]) {
    //    cube([120, 50, 57], true);
    //}
    translate([0,0,18]) {
        cylinder(10,4,4, true);
    }
    
    translate([-14,-5,13.5]) {
        rotate([0,0,90]) {
            9g_motor1();
        }
    }

    translate([14,-5,13.5]) {
        rotate([0,0,90]) {
            9g_motor1();
        }
    }
    
    translate([50,0,0]) {
        cube([100,100,100], true);
    }
    
}

translate([50,0,0]){
   outer_ring(-25, -24.5);
}


 //9g_motor1();

module 9g_motor1(){
	difference(){			
		union(){
			color("steel blue") cube([23,13,22], center=true);
			color("steel blue") translate([0,0,5]) cube([32,12,2], center=true);
			color("steel blue") translate([5.5,0,2.75]) cylinder(r=6, h=25.75, $fn=20, center=true);
			color("steel blue") translate([-.5,0,2.75]) cylinder(r=1, h=25.75, $fn=20, center=true);
			color("steel blue") translate([-1,0,2.75]) cube([5,5.6,24.5], center=true);		
			color("white") translate([5.5,0,3.65]) cylinder(r=2.35, h=29.25, $fn=20, center=true);				
		}
		//translate([10,0,-11]) rotate([0,-30,0]) cube([8,13,4], center=true);
		//for ( hole = [14,-14] ){
		//	translate([hole,0,5]) cylinder(r=2.2, h=4, $fn=20, center=true);
		//}	
	}
}
