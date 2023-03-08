$fn=500;

module main() {
    intersection() {
        translate([-91.5,0,0]) cylinder (h = 30, r=100, center = true);
        translate([91.5,0,0]) cylinder (h = 30, r=100, center = true);
        
        
        translate([0,-15.5,0]) cylinder (h = 30, r=30, center = true);
        translate([0,15.5,0]) cylinder (h = 30, r=30, center = true);
    }
}

module top() {
    intersection() {
        translate([-55,0,0]) cylinder (h = 14, r=61, center = true);
        translate([55,0,0]) cylinder (h = 14, r=61, center = true);
        
        translate([0,-3.5,0]) cylinder (h = 14, r=15, center = true);
        translate([0,3.5,0]) cylinder (h = 14, r=15, center = true);
    }
}

translate([0,0,22]) top();
main();







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

//Ruler
//rotate([0,0,0]) translate([-6,11.5,20]) ruler(200);