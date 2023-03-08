difference() {
    translate([0,-8,0])
    import("/Users/lukecleland/Automatic-Wifi-Turntable-with-Esp8266/3D-Files/Top Shell.stl", convexity=3, center=true);

    translate([0,0,20])
    rotate_extrude(convexity = 10, $fn = 100)
    translate([45, 0, 0])
    circle(r = 1.5, $fn = 100);
}

/*
difference() {
    translate([0,-8,-8])
    import("/Users/lukecleland/Automatic-Wifi-Turntable-with-Esp8266/3D-Files/Turntable.stl", convexity=3, center=true);

    translate([0,0,20])
    rotate_extrude(convexity = 10, $fn = 100)
    translate([45, 0, 0])
    circle(r = 1.5, $fn = 100);
}*/