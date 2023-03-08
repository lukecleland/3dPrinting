/*
 * Model a hobby DC motor - "130 Size"
 *
 * Copyright 2019 Craig Ringer <ringerc@ringerc.id.au>
 *
 * BSD Licensed
 *
 * This isn't particularly modular or reusable, you have to edit the script to
 * set parameters. I couldn't be bothered coming up with a sensible way to load
 * the measurement configuration in openscad and didn't have a different shaped
 * motor to do tests with anyway.
 *
 * May optionally generate axle as separate part separated by tiny sleeve hollow.
 *
 * May optionally generate masking-out blocks for wiring, in case you're
 * subtracting this model from another one like I did.
 */


// Motor body excluding nylon back housing, the front protrusion and the protrusion from the back housing
motor_body_x = 20.25;
motor_body_y = 20.25;
motor_body_z = 15.25;
// Width of flattened part of motor body. Not strictly required since it's determined by motor_body_z; could be used for measurement check later.
motor_body_y_flat_top = 13;
// How far axle sticks out front
motor_axle_outset_length_front = 8;
// Size of axle bearing/protrusion from front of body
motor_front_protrusion_x = 2;
motor_front_protrusion_diameter = 4.95;
// front notch, distance from front of motor
motor_front_side_notch_x_inset_from_front = 3.5; // To back of notch
motor_front_side_notch_x_length = 2; // approx: real one has rounded end
motor_front_side_notch_y_depth = 1; // very approx; real shape is deeper at back and shallower toward edges
motor_front_side_notch_z_height = 2;
// Nylon motor back part, excluding round protrusion.
motor_back_x = 5;
motor_back_y = motor_body_y;
motor_back_z = 16.5;
// Width of flat top area projecting above motor back where wiring connects
motor_back_top_flat_y = 8.5;
// Nylon protrusion from nylon motor back
motor_back_protrusion_x = 2;
motor_back_protrusion_diameter = 10;
motor_back_axle_outset_length = 1;
motor_back_protrusion_flat_bottom_zoff_from_bottom = 3.5;
// Length of flat area on bottom back protrusion. Measurement check var.
motor_back_protrusion_flat_bottom_width = 6;
// Back side notches
motor_back_side_notch_length_x = 6;
motor_back_side_notch_depth_y = 3;
motor_back_side_notch_height_z = 3;
// Axle
motor_axle_diameter = 2;
// Total axle length, used as a check measure
motor_axle_total_length = 38;

// Horizontal slot in rear housing:
// Bottom of motor to bottom of slot
motor_back_slot_zoff_from_bottom = 9.6;
motor_back_slot_height_z = 1;
motor_back_slot_width_y = 5.7;
motor_back_slot_depth_x = 1;
// Check measurement: top of motor back to top of slot
motor_back_slot_zoff_from_top = 5.8;

render_axle_separately = false;
// Clearance above body back area for wiring to mark out as a solid for subtractive use.
generate_wiring_clearance_blocks = false;
wiring_clearance_y = 4;
wiring_clearance_z = 4;
wiring_clearance_x = motor_back_protrusion_x+motor_back_x;

/* [Hidden] */

$fs = 0.1;
$fa = 4;

/* Expose motor length to "use" includes */
function motor_axle_length() = motor_axle_total_length;
function motor_length() = motor_axle_total_length - motor_back_axle_outset_length - motor_axle_outset_length_front;
function motor_body_height() = motor_body_z;
function motor_back_height() = motor_back_z;
function motor_axle_outset_back() = motor_back_axle_outset_length;
function motor_axle_outset_front() = motor_axle_outset_length_front;
function motor_back_start_x() = motor_back_axle_outset_length + motor_back_protrusion_x;
function motor_side_notch_length() = motor_back_side_notch_length_x;

measurement_tolerance = 0.2;
// Guestimated shaft diameter
motor_axle_shaft_diameter = motor_axle_diameter + 0.2;

module measurement_check(measure1, description1, measure2, description2,tolerance=measurement_tolerance)
{
    let(diff = abs(measure1 - measure2))
    {
        echo(str("measurement_check with tolerance=", tolerance, " ", (diff <= tolerance ? "OK" : "FAILED"), " m1=", measure1, ", m2=", measure2, " d=", diff, " (m1: ", description1, ", m2: ", description2, ")"));

        if (diff > tolerance)
        {
        };
        assert(diff <= tolerance);
    };
};
    
// Slot measurements make sense vs back housing
if (!is_undef(motor_back_slot_zoff_from_top))
{
    measurement_check(
          motor_back_slot_zoff_from_top
           + motor_back_slot_zoff_from_bottom
           + motor_back_slot_height_z,
          "back slot measurements",
          motor_back_z,
          "back total height");
}

// Axle length adds up with protrusions and lengths of parts. Measurement addition order is order of parts in motor along x axis.
measurement_check(
    motor_axle_outset_length_front + motor_front_protrusion_x + motor_body_x + motor_back_x + motor_back_protrusion_x + motor_back_axle_outset_length,
    "sum of measurements along x axis",
    motor_axle_total_length,
    "total axle length");

// Does flat bottom region make sense given zoff?
if (!is_undef(motor_back_protrusion_flat_bottom_width))
{
    measurement_check(
        // Compute length of bottom flat area by deriving from
        // protrusion radius (tangent) and distance of flat bottom
        // from origin along y axis
        sqrt(
            pow(motor_back_protrusion_diameter/2,2)
            -
            pow(motor_body_z/2 - motor_back_protrusion_flat_bottom_zoff_from_bottom, 2)
        ) * 2,
        "bottom flat area width computed from back projection bottom back area height above motor base",
        motor_back_protrusion_flat_bottom_width,
        "back projection bottom flat area width");
}

float_slop = 0.001;

alpha = "77";
trim_alpha = "33";
clipping_color = str("#FF0000",trim_alpha);
motor_axle_color = str("#EEEEEE", alpha);
motor_body_color = str("#CCCCCC", alpha);
clearance_area_color = str("#CC00CC", alpha);

/*
 * Layout conventions used;
 *
 * Axle along x axis, protruding driven part of axle is "front",
 * so power connectors etc are "back". Motor projects out along
 * X axis with x(0) the back of the rear protrusion of the motor.
 *
 * Axle origin is (0,0,0) and it proceeds along Y axis.
 *
 * Motor is constructed by translating the origin along the x axis
 * as parts are added.
 */
 
module hobby_dc_motor()
{
    translate([motor_back_axle_outset_length,0,0])
    difference()
    {
        union()
        {
            
            // Rear protrusion
            difference() {
                // Rear protrusion base cylinder
                color(motor_body_color)
                rotate([0,90,0])
                cylinder(d1=motor_back_protrusion_diameter,d2=motor_back_protrusion_diameter,h=motor_back_protrusion_x + float_slop);
                
                // Rear protrusion bottom flat clipping
                color(clipping_color)
                let(mask_zoff = motor_body_z/2 - motor_back_protrusion_flat_bottom_zoff_from_bottom,
                    mask_height = motor_body_z/2 - mask_zoff)
                translate([-float_slop,-motor_back_protrusion_diameter/2,-mask_zoff-mask_height])
                cube([motor_back_protrusion_x, motor_back_protrusion_diameter, mask_height], center=false);
            
                color(clipping_color)
                translate([-float_slop,
                           -motor_back_slot_width_y/2,
                           -motor_body_z/2 + motor_back_slot_zoff_from_bottom])
                cube([motor_back_slot_depth_x+float_slop,
                      motor_back_slot_width_y,
                      motor_back_slot_height_z]);
                
            };  
            
            // Motor body (main and back housing)
            translate([motor_back_protrusion_x,0,0])
            {
                difference()
                {
                    // Motor body (main and back)
                    color(motor_body_color)
                    rotate([0,90,0])
                    cylinder(d1=motor_body_y,d2=motor_body_y,h=motor_body_x + motor_back_x);
                    
                    color(clipping_color)
                    translate([0,-motor_body_y/2, -motor_body_y/2])
                    let(trim_cube_thickness_main = (motor_body_y - motor_body_z)/2)
                    {
                        // Clip bottom, whole motor
                        translate([-float_slop, 0, -float_slop])
                        cube([motor_body_x+motor_back_x+float_slop*2,
                              motor_body_y,
                              trim_cube_thickness_main + float_slop]);
                        
                        // Clip top, whole motor. Top back protrusion will be added in later.
                        translate([-float_slop,
                                   0,
                                   motor_body_z + trim_cube_thickness_main + float_slop])
                        cube([motor_back_x + motor_body_x + float_slop*2,
                              motor_body_y,
                              trim_cube_thickness_main + float_slop*2]);
                    };
                    
                    // Side back alignment slots/notches and small side front notches
                    color(clipping_color)
                    for (side = [-1, 1])
                    {
                        // Side notch: rectangular cut
                        translate([
                            -float_slop + motor_back_side_notch_length_x/2, 
                            side * (-motor_body_y/2 + motor_back_side_notch_depth_y/4), 
                            -motor_back_side_notch_height_z/2 + motor_back_side_notch_height_z/2])
                        cube([motor_back_side_notch_length_x+float_slop,
                              motor_back_side_notch_depth_y/2,
                              motor_back_side_notch_height_z],
                              center=true);
                        
                        // Side notch: rounded bottom
                        translate([
                            -float_slop,
                            side * (-motor_body_y/2 + motor_back_side_notch_height_z - motor_back_side_notch_depth_y/2),
                            0])
                        rotate([0,90,0])
                        cylinder(d1=motor_back_side_notch_height_z,
                                 d2=motor_back_side_notch_height_z,
                                 h=motor_back_side_notch_length_x+float_slop);
                        
                        // Small side front notch. Modeled as cube, not worth the hassle of properly modelling the punched-in form.
                        translate([
                            -float_slop + motor_body_x + motor_back_x - motor_front_side_notch_x_inset_from_front, 
                            side * (-motor_body_y/2 + motor_front_side_notch_y_depth/4), 
                            -motor_front_side_notch_z_height/2 + motor_back_side_notch_height_z/2])
                        cube([motor_front_side_notch_x_length+float_slop,
                              motor_front_side_notch_y_depth/2,
                              motor_front_side_notch_z_height],
                              center=true);
                        
                    };
                };
                
                // Front protrusion/axle bearing
                translate([motor_body_x + motor_back_x - float_slop, 0, 0])
                color(motor_body_color)
                rotate([0,90,0])
                cylinder(d1=motor_front_protrusion_diameter,d2=motor_front_protrusion_diameter,h=motor_front_protrusion_x + float_slop);
            };
            
            // Back top protrusion for wiring
            translate([motor_back_protrusion_x,
                       -motor_back_top_flat_y/2,
                        motor_body_z/2])
            color(motor_body_color)
            cube([motor_back_x,
                  motor_back_top_flat_y,
                  (motor_back_z - motor_body_z)],
                 center=false);
        };
        
        // Subtract axle shaft from whole motor
        if (render_axle_separately)
        {
            color(clipping_color)
            translate([-float_slop,0,0])
            rotate([0,90,0])
            cylinder(d1=motor_axle_shaft_diameter,
                     d2=motor_axle_shaft_diameter,
                     h=motor_axle_total_length 
                       - motor_back_axle_outset_length
                       - motor_axle_outset_length_front
                       + 2*float_slop);
        }
    };
    
    // Axle
    color(motor_axle_color)
    translate([0,0,0])
    rotate([0,90,0])
    cylinder(d1=motor_axle_diameter,d2=motor_axle_diameter,
             h=motor_axle_total_length);

    // Clearance area for motor wiring, if requested
    if (!is_undef(generate_wiring_clearance_blocks)
        && generate_wiring_clearance_blocks)
    {
        
        for (side = [-1, 1])
        {
            color(clearance_area_color)
            translate([
                // Leave extra room behind motor for wires
                motor_back_axle_outset_length,
                // 
                -wiring_clearance_y/2 + side * (motor_back_top_flat_y/2 + wiring_clearance_y/2),
                motor_body_z/2])
            cube([
                wiring_clearance_x,
                wiring_clearance_y,
                wiring_clearance_z]);
        }
    }
};

//hobby_dc_motor();