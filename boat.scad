$fn =100;

difference() {
    
   union() {
       linear_extrude(height=1) {
        circle(10);
       }
linear_extrude(height=95) {
circle(8);
    
}
}

translate([0,0,-10]) {
linear_extrude(height=120) {
circle(7);
    
}
}
}
