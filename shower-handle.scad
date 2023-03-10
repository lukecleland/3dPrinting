/*module faucet() {

$fn = 50;
cylinder(20, 20, 20);
translate([0,0,20]) sphere(20);
for ( i = [0 : 4] ){
    rotate([0, 0, i * 90]) translate([-2.5, 10, 0]) cube([5,10,37]);
}

}


module handle() {
cylinder(25, 25, 25);
//translate([-15,0,15]) cube([30,80,10]);
    
}

difference() {
    
    translate([0,0,10]) handle();
    scale([1.02,1.02]) faucet();
    
}
*/

$fn = 100;

difference() {
    union() {
        cylinder(24, 26, 26, true);
        minkowski() {
            translate([-10,5,-10]) cube([20,50,10]);
            sphere(2);
        }
    }

    cylinder(30, 20, 20, true);

    translate([0,0,44]) union() {
        cube([49, 5, 100], true);
        cube([5, 49, 100], true);
    }
}

