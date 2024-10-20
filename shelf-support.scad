width=20;


difference() 
    {
union() {
difference() 
    {
        translate([-5, 0, 3]) cube([100, width, 45], true);
        translate([0, 0, -4]) cube([88, 40, 45], true);
    }
    
    translate([92/2-1.5, 0, 35]) cube([3, width, 110], true);
    
    translate([13, 0, 56]) rotate([0, 45, 0]) cube([3, width, 90], true);
}

translate([-69, 0, 0]) cube([100, 100, 100], true);
}