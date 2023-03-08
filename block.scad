$fn = 100;




module cutaway() {
translate([18.5, 0, 0]) {
cube([22, 4, 22], true);
translate([0,9,-9]) cube([22, 22, 4], true);
}

translate([-18.5, 0, 0]) {
cube([22, 4, 22], true);
translate([0,9,-9]) cube([22, 22, 4], true);
}
}


difference() {
translate([0, 0, 9.5]) cube([100,35,40], true);
translate([0,15,20]) rotate([38,0,0]) cube([105,30,60], true);
cutaway();
}


