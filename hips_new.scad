
difference(){
translate([0,0,-5]){
    cube([120,38,50], true);
}
cutaway();
}

module cutaway() {
    
    translate([-39.5,0,0]) {
        sphere(15.5);  
    }

    translate([39.5,0,0]) {
        sphere(15.5);  
    }
    
    translate([39.5,5,-22]){
        cube([10.5,30,50], true);
    }

    translate([-39.5,5,-22]){
        cube([10.5,30,50], true);
    }
    
    
translate([0,-25,0]){
    cube([130, 50, 80], true);
}

}

