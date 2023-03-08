
module servo(){
	difference(){			
		union(){
			color("blue") cube([23,13,22], center=true);
			color("blue") translate([0,0,5]) cube([32,12,2], center=true);
			color("blue") translate([5.5,0,2.75]) cylinder(r=6, h=25.75, $fn=20, center=true);
			color("blue") translate([-.5,0,2.75]) cylinder(r=1, h=25.75, $fn=20, center=true);
			color("blue") translate([-1,0,2.75]) cube([5,5.6,24.5], center=true);		
			color("white") translate([5.5,0,3.65]) cylinder(r=2.35, h=29.25, $fn=20, center=true);	

        for ( hole = [14,-14] ){
                translate([hole,0,5]) cylinder(r=1.2, h=8, $fn=20, center=true);
           }				
		}
		translate([10,0,-11]) rotate([0,-30,0]) cube([8,13,4], center=true);
		
	}
}

module knee_joint(){
    translate([0,30,0]) {
        cube([30, 30, 11], true);
    }
    cylinder(11, 25, 25, true);
    
    
}


module knee() {
    difference() {

        knee_joint();
        translate([-5.5,0,-9.5]) {
            servo();
        }

    }
}

module thigh() {
    
    translate([0,-50,0]) {
        cube([10,47,10], true);
    }
    
    
    
   difference() {
       
       thigh_joint();
    
    
       translate([-8,20,4]) {
            cube([30, 30, 20], true);
        }
        
        rotate(115) {
            translate([10,20,4]) {
                cube([30, 30, 20], true);
            }
        }
        
        rotate(50) {
            translate([0,20,4]) {
                cube([30, 30, 20], true);
            }
        }
        
        
        cylinder(12, 26, 26, true);
        
        
        
        translate([0,0,10]) {
            cylinder(15, 20, 20, true); 
        }
        
        translate([0,-80,16]) {
            cube([30,30,10], true);
        }
        
        translate([0,-80,-16]) {
            cube([30,30,10], true);
        }
        
        translate([0,0,-8]) {
            cylinder(4.2, 4, 4, true);
        }
        
        translate([0,-7.5,-8]) {
            cube([7,15,4.2], true);
        }
    }
}



module thigh_joint() {
    
    
    
    translate([0,-80,0]) {
        sphere(14.5, true);
    }
           cylinder(22, 30, 30, true); 
            //translate([-10,-26,0]) {
            //    cylinder(18, 10, 10, true);
            //}
       }

thigh();
//knee();