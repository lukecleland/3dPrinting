// Write EisenScript code here...

#define angle 2

set maxdepth 100
set background black

18 * { rx 20 x 0 sat 1 } R

rule R { R1 }

rule R1 {
	{  x 1 rz 15 ry 55 rz 1 hue 1 a 0.99} R1
	{ s 1 1 1 } sbox
}

rule sbox {
 { color black } grid
{ b 0.8 hue 67 } box
}