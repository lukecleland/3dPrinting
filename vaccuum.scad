
difference() {

    union() {
        cylinder(10,5,5, true, $fn=100);
        translate([0,0,-3]) {
            cylinder(4,13,13, true, $fn=100);
        }
    }


    cube([6,6,16], true);

    for ( i = [0 : 8] ){
        rotate( i * 45, [0, 0, 1]) {
                translate([15, 0, -3]) {
                cube([20,2,2], true);
            }
        }
    }

}


/*
cube([1.9,10,1.9], false);
cube([30,1.9,1.9], false);
*/