$fn =100;

height = 10;
width = 9.525;
l_width = 12;
l_height = 3;
p_width = 14;
p_height = 2;


module main() {
    difference() {
        union() {
            cylinder(height, width/2, width/2);
            cylinder(p_height, p_width/2, p_width/2);
            translate([0,0,l_height+1]) { 
                cylinder(l_height, l_width/2, width/2);
            }
        }
        
        translate([0,0,-1]) cylinder(height+2, 3.5, 3.5);

    }
}



main();


module ring() {
    translate([0,0,6]) {
        difference() {
            cylinder(1, 3.5, 3.5);
            translate([0,0,-1]) cylinder(10, 3, 3);
        }
    }
}

ring();


// inner 9.525 mm
// outer 13.208 mm
// length 12.7 mm

//11.1325


// 68 x 48