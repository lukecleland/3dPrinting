for ( i = [0 : 360] ){
    rotate([0,0,i*5]) {
        translate([0,30,0]) rotate([-20,0,90]) cube([10,1,180]);
    }
    rotate([0,0,-i*5]) {
        translate([0,30,0]) rotate([20,0,90]) cube([10,1,180]);
    }
}