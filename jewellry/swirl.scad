
use <wedge.scad>;

module torus(r1=1, r2=2, angle=360, endstops=0, $fn=50){
    if(angle < 360){
        intersection(){
            rotate_extrude(convexity=10, $fn=$fn)
            translate([r2, 0, 0])
            circle(r=r1, $fn=$fn);
            
            color("blue")
            wedge(h=r1*3, r=r2*2, a=angle);
        }
    }else{
        rotate_extrude(convexity=10, $fn=$fn)
        translate([r2, 0, 0])
        circle(r=r1, $fn=$fn);
    }
    
    if(endstops && angle < 360){
        rotate([0,0,angle/2])
        translate([0,r2,0])
        sphere(r=r1);
        
        rotate([0,0,-angle/2])
        translate([0,r2,0])
        sphere(r=r1);
    }
}

module rounded_cylinder(d=1, h=1, r=0.1, center=true, $fn=100){
    translate([0,0,(center==true)?-h/2:0]){
        union(){
            // bottom edge
            translate([0,0,r])torus(r1=r, r2=(d-r*2)/2, $fn=$fn);
            // top edge
            translate([0,0,h-r])torus(r1=r, r2=(d-r*2)/2, $fn=$fn);
            // main cylinder outer
            translate([0,0,r])cylinder(d=d, h=h-r*2, center=false, $fn=$fn);
            // main cylinder inner
            translate([0,0,0])cylinder(d=d-r*2, h=h, center=false, $fn=$fn);
        }
    }
}


difference() {
for (i=[0:30]) {
    j = i*40;
    k = i;
    translate([sin(j), cos(j), 0])
        torus(r1=0.5, r2=k);
}
translate([0,0,-2]) cube([70, 70, 4], true);

}



/*
for (i=[0:30]) {
    j = i*20;
    k = i/10;
    translate([-sin(j), -cos(j), 0])
        torus(r1=0.07, r2=k);
}
*/
