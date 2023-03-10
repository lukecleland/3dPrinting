shaftDiameter = 23 ;
clampWidth = 20 ;
clampThickness = 2.6 ;
clampLegLengthFromShaft = 12 ;
clampLegThickness = clampThickness + 1.6 ; // default is 'clampThickness' to keep it the same thickness as the clamp
clampLegGap = 16 ;
clampToClampScrewCenter = (clampLegLengthFromShaft - clampThickness) / 2 - 3 ; //using '(clampLegLengthFromShaft - clampThickness) / 2' nearly centres this hole on the clamp leg
clampScrewDiameter = 6 ;
shaftToMountPlate = 0 ;
mountPlateThickness = 5.7 ;
mountPlateLength = 38 ;
mountHoleSpacing = 30 ;
mountHoleDiameter = 3.5 ;
screwHoleSmoothness = 50 ; //6 = printable vertically. Applies to mount plate screw holes and clamp leg screw holes
clampSmoothness = 100 ;

//clampWithMountPlate();

clamp();

module clampWithMountPlate(){
    clamp();
	union(){
		translate([0,shaftDiameter / 2 + shaftToMountPlate + mountPlateThickness / 2,clampWidth / 2])
			difference(){
				translate([18,-1,0]) cube([mountPlateLength,mountPlateThickness,clampWidth], center = true);
				translate([-mountHoleSpacing / 2,0,0]) rotate([90,0,0]) cylinder(r = mountHoleDiameter / 2, h = mountPlateThickness + 2, center = true, $fn = screwHoleSmoothness);
				translate([mountHoleSpacing / 2,0,0]) rotate([90,0,0]) cylinder(r = mountHoleDiameter / 2, h = mountPlateThickness + 2, center = true, $fn = screwHoleSmoothness);
			}
		
	}
}

module clamp(){
    $fn=50;
    
	difference(){
		union(){
			cylinder(r = shaftDiameter / 2 + clampThickness, h = clampWidth, $fn = clampSmoothness);
			translate([0,-(shaftDiameter / 2 + clampLegLengthFromShaft) / 2,clampWidth / 2]) cube([clampLegThickness * 2 + clampLegGap, shaftDiameter / 2 + clampLegLengthFromShaft,clampWidth], center = true);
            difference() {
        translate([-2,7,0]) cube([35,7,20], false);
    translate([22,20,10]) rotate([90,0,0]) cylinder(20,3,3);
    
    }
		}
			translate([0,0,-1]) cylinder(r = shaftDiameter / 2,h = clampWidth + 2, $fn = clampSmoothness);			
			translate([0, -(shaftDiameter / 4 + clampLegLengthFromShaft ) + 0.1, clampWidth / 2]) cube([clampLegGap, shaftDiameter / 2 + clampLegLengthFromShaft * 2, clampWidth + 2], center = true);
			translate([0, -(shaftDiameter / 2 + clampThickness + clampToClampScrewCenter ), clampWidth / 2]) rotate([0, 90, 0]) cylinder(r = clampScrewDiameter / 2, h = clampLegThickness * 2 + clampLegGap + 2,center = true, $fn = screwHoleSmoothness);
        
	}
}