$fn = 100;
difference() {
    union() {
        translate([0,0,0]) cylinder(5,21,21,true);
        for ( i = [0 : 5] ){
            rotate( [0, 0, i*120])
            translate([0, 25, 0])
            cylinder(5,3,3,true);
        }
        for ( i = [0 : 5] ){
            rotate( [0, 0, i*120+60])
            translate([0, 25, 0])
            translate([0,-2,0]) cube([8,8,5], true);
        }
        for ( i = [0 : 5] ){
            rotate( [0, 0, i*120])
            translate([0, 25, 0])
            translate([0,-2,0]) cube([3,5,5], true);
        }
    }
    translate([0,0,0]) cylinder(100,19,19,true);
    for ( i = [0 : 5] ){
        rotate( [0, 0, i*120+60])
        translate([0, 25, 0])
        cylinder(30,3,3,true);
    }
    
}