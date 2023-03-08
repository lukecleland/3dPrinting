module triangle(o_len, a_len, depth)
{
    linear_extrude(height=depth)
    {
        polygon(points=[[0,0],[a_len,0],[0,o_len]], paths=[[0,1,2]]);
    }
}


difference() {
    
    
     equalateral();
    
    
    cutaway();

}

module equalateral() {
        triangle(60, 80, 10);

        mirror([0,90,0]) {
            triangle(60, 80, 10);
        }
    }
    
    module cutaway() {
     translate([70, 0, 5]) {
        cube([30, 50, 12], true);
    }
    
    translate([25,0,3]) {
        cylinder(10,4,4, true);
    }
   }