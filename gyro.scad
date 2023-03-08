

module 9g_motor(){
	difference(){			
		union(){
			color("steel blue") cube([23,12.5,22], center=true);
			color("steel blue") translate([0,0,5]) cube([32,12,2], center=true);
			color("steel blue") translate([5.5,0,2.75]) cylinder(r=6, h=25.75, $fn=20, center=true);
			color("steel blue") translate([-.5,0,2.75]) cylinder(r=1, h=25.75, $fn=20, center=true);
			color("steel blue") translate([-1,0,2.75]) cube([5,5.6,24.5], center=true);		
			color("white") translate([5.5,0,3.65]) cylinder(r=2.35, h=29.25, $fn=20, center=true);				
		}
		translate([10,0,-11]) rotate([0,-30,0]) cube([8,13,4], center=true);
		for ( hole = [14,-14] ){
			translate([hole,0,5]) cylinder(r=2.2, h=4, $fn=20, center=true);
		}	
	}
}



//rotate([0,90,0]) 9g_motor();

//keep
difference() {

union() {

// arms
translate([0,0,28]) rotate([0,45,0]) cube([100,10,100], true);

// platform
translate([0,0,-37]) cube([20,20,3], true);


}
// remove

// main groove
translate([0,0,12]) cube([100,4,10], true);

// end bits
translate([-55,0,10]) cube([16,16,16], true);
translate([55,0,10]) cube([16,16,16], true);

// flatten top
translate([0,0,31]) cube([200,100,40], true);

// v cutaway
translate([0,0,36]) rotate([0,45,0]) cube([100,12,100], true);

// flat bottom
translate([0,0,-42]) cube([32,32,10], true);

}





// Draws a ruler of specified length.
// Origin of the ruler is at 0, and it is laid out along the X axis.
// Call with: ruler(length);
module ruler(length){
    difference(){
        //draw ruler
        union(){
            offset=0;
            for(n=[1:4]){
                offset=pow(2,n+1)-2;
                translate([0,-offset,0])
                drawscale(length,pow(10,n-1),pow(2,n));
            }
        }
        //cut of protruding end bits
        color([0,0,0])
        translate([length,-38,-1])
        cube([1000,38,3]);
    }
}

//Draws the different scales, as needed. Don't call directly.
module drawscale(length,step,width){
    if(length>step){    
        for(n=[0:step:length-1]){
            if(n%(2*step)==0){
                 color([0,0,0])
                 translate([n,0,0])
                 cube([step,width,1]);  
            }else{
                 color([1,1,1])
                 translate([n,0,0])
                 cube([step,width,1]);  
            }
        }
    }
}

//Test
//rotate([0,0,0]) translate([-29,-2,-5]) ruler(200);