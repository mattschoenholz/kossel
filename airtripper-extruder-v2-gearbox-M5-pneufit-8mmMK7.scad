// Airtripper's Bowden 3D Printer Extruder
// by Airtripper May  � 2012
// airtripper.com
// It is licensed under the Creative Commons - GNU GPL license. 

// Printable extruder parts

use <fillet_circle.scad>;
use <fillet_cube.scad>;

translate([0,0,0]) rotate([0,0,90]) extruder_block();
mirror([0,1,0]) translate([0,60,0]) rotate([0,0,90]) extruder_block();
translate([-42, 10, 0]) extruder_idler_608z();
translate([-42, -35, 0]) extruder_idler_608z();
translate([-6, 25, 0]) support_strut();
translate([-6, 45, 0]) support_strut();
//translate([-35, 25, 0]) axle_8mm();


// Assembled components

//extruder();
//idler_608z();
//stepper_kit();


// Non printable hardware components

//nema17();
//insert();
//bearing(5, 10, 4);
//bearing(8, 22, 7);
//m4_bolt(40);



nema_l=71.5; // Stepper total length
nema_x=42;
nema_y=42;
nema_z=47.4;
screw_l=30;
insert_l=15; // Filament gripper insert length



// ##########################################################

module axle_8mm() {
	cylinder(16,r=3.80, $fn=40);
	// Support flange while printing
	translate([-5,-0.5,0]) cube([10,1,1]);
	translate([-0.5,-5,0]) cube([1,10,1]);
	difference() {
		cylinder(1,r=10, $fn=40);
		translate([0,0,-1]) cylinder(3,r=5, $fn=40);
	}
}


// ##########################################################

module extruder_idler_608z() {
	//translate([0,0,6]) rotate([0,90,0]) bearing(8, 22, 7);
	difference() {
		union() {
			difference() {
				translate([0,0,7]) cube([20,42,14], center = true);
				// Bearing housing
				//translate([-6,0,8]) cube([10,50,20], center = true);
				translate([0,0,1]) cube([10,24,10], center = true);
				translate([-5,0,6]) rotate([0,90,0]) cylinder(10,r=12, $fn=60);
			}
			// Axle spacer
			translate([-8,0,6]) rotate([0,90,0]) cylinder(16,r=6, $fn=40);
			translate([0,0,3]) cube([16,12,6], center = true);
		}
		union() {
			// Bearing axle cut-out
			translate([-8,0,6]) rotate([0,90,0]) cylinder(16,r=4.25, $fn=40);
			translate([0,0,2]) cube([16,8.5,8], center = true);
			translate([-3.6,0,6]) rotate([0,90,0]) cylinder(7.2,r=12, $fn=60);
			// hook
			translate([-9,-15.5,6]) rotate([0,90,0]) cylinder(22,r=2, $fn=25);
			translate([0,-18.5,11]) cube([22,10,10], center = true);
			translate([9,-17,1]) cube([3,16,16], center = true);
			translate([-9,-17,1]) cube([3,16,16], center = true);
			translate([0,-21,0]) rotate([45,0,0]) cube([24,6,10], center = true);
			translate([-11,-12,9.6]) rotate([0,135,0]) cube([4,6,6], center = true);
			translate([11,-12,9.6]) rotate([0,45,0]) cube([4,6,6], center = true);
			// Bolt slots
			translate([6,20,7]) cube([3.5,10,16], center = true);
			translate([-6,20,7]) cube([3.5,10,16], center = true);
			translate([0,24,7]) rotate([154,0,0]) cube([22,10,26], center = true);
			translate([0,25.5,7]) cube([22,10,16], center = true);
			//Padding
			//translate([-9,-17,7]) cube([6,10,16], center = true);
		}
	}

}


// #########################################################

// Revision 4

module extruder_block() {
	difference() {
		union() {
			// Extruder base
			//translate([0,0,1.5]) cube([42,42,3], center = true);
			translate([0,0,0]) fil_polar_o(18, 1, 2, angle=90);
			rotate([0,0,70]) translate([-14.7,0,10]) cube_fillet([3,15,20],1,[2,2,2,2],[1,1,1,1],0,center=true,$fn=60);

			// Base idler mount
			translate([17.5, -15.5, 0])
				rotate([0, 0, -12]) {
					cylinder(r=4.5, h=4.5, $fn=30);
					translate([-10.2,-4.5,0]) cube([10.2, 9, 4.5]);
				}

			/*
			difference() {
				translate([-3,0,22]) cylinder(8,r1=4, r2=4, $fn=50, center = true);
				rotate([0,90,0]) translate([-17,0,-10]) cylinder(8,r=4, $fn=50);
			}
			*/
			// M3 Screw columns for stepper attachment
			hull(){
				translate([-10,10,0]) cylinder(29,r=4.8, $fn=30);
				translate([-10,-10,0]) cylinder(23.5,r=4.8, $fn=30);
			}

			/*
			// 608ZZ
			%translate([0, 0, 18.5])
			difference() {
				cylinder(r=22/2, h=7, $fn=50);
				translate([0, 0, -0.1]) cylinder(r=7/2, h=7.2, $fn=30);
			}
			*/
			
			// Mounting brackets
			difference(){
			  union(){
				translate([-22.5,-1,7.5]) cube_fillet([3,48,15],1,[2,2,2,2],[1,1,1,1],[1,1,1,1],center=true,$fn=60);
				translate([-23,6,0]) cube_fillet([11.75,6,15],2,[2,2,2,2],[2,2,2,2],0,center=false,$fn=60);
				translate([-23,-13,0]) cube_fillet([11.75,6,15],2,[2,2,2,2],[2,2,2,2],0,center=false,$fn=60);
				difference(){
	  				translate([-22,-24,0]) cube([7,46,3],center=false);
	  				translate([-22,-25.5,-0.1]) rotate([0,0,-30]) cube([10,20,3.5],center=false);
	  				translate([-11.5,5.3,-0.1]) rotate([0,0,30]) cube([10,20,3.5],center=false);
				}
			  }
				translate([-26, 16, 7.5]) rotate([0, 90, 0]) cylinder(r=1.8, h=12, $fn=12);
				translate([-26, -17, 7.5]) rotate([0, 90, 0]) cylinder(r=1.8, h=12, $fn=12);
			}

		}
		// Insert and idler clearance
		translate([0,0,3]) cylinder(h=30, r1=22.4/2, r2=5, $fn=50);

		// Base centre hole
		translate([0,0,-1]) cylinder(r=22.4/2, h=4.01, $fn=50);

		// Reduce wall and screw shaft for strut placement
		translate([-10,-10,23.5]) cylinder(5,r=6, $fn=30);

		// M3 screw holes
		for(r=[1:4]) {
			rotate([0,0,r*360/4]) translate([10,10,-1]) cylinder(40,r=1.75, $fs=.1);
		}
		translate([-10,10,26]) cylinder(4,r=5.6/2, $fn=30);
		translate([10,10,1]) cylinder(4,r=5.6/2, $fs=.1);
		translate([10,-10,1]) cylinder(4,r=5.6/2, $fs=.1);
		
		// Base idler holder hole
		translate([17.5,-15.5,-1]) cylinder(r=1.5, h=7, $fs=.1);
		translate([17.5,-15.5,2.6]) rotate([0,0,15]) cylinder(r=3.07, h=3, $fn=6);
	}

	// Filament in-feed bracket
	difference() {
         hull(){
		  union() {
			translate([5.7,-16,10]) cube_fillet([11,4,20],1,[2,2,2,2],[1,1,1,1],0,center=true,$fn=60);
			//translate([5.7,-16,10]) cube([10,4,20], center = true);
			translate([4.9,-14,8]) cube([5.0,6,16], center = true);
			translate([5.8,-11,15]) rotate([90,0,0]) cylinder(4, r=3.5, $fn=50);
		  }
		}
		translate([5.8,-8,15]) rotate([90,0,0]) cylinder(18, r=1.5, $fn=25);
		translate([5.8,-16,15]) rotate([90,0,0]) cylinder(4, r1=1.1, r2=4, $fn=25);
	}
	// Bowden out-feed tube holder
	difference() {
		union() {
			translate([4.8,14,13]) cube([8,13,26], center = true);
              translate([3.6,24.5,13]) cube_fillet([13,9,26],2,[2,2,2,2],[2,2,0,2],[1,1,0,1],center=true,$fn=60);
			translate([-4.5,12.5,13]) cube([11,3,26], center = true);
		}
		// clean the bottom left holes
		translate([-10,10,-1]) cylinder(40,r=1.75, $fs=.1);

		// clean the top left hole
		translate([10,10,-1]) cylinder(5,r=1.75, $fs=.1);
		translate([10,10,1]) cylinder(5,r=5.6/2, $fs=.1);
		translate([10,10,6]) cylinder(4,r1=5.6/2, r2=2/2, $fs=.1);

		// Base centre hole
		translate([0,0,-1]) cylinder(r=22.4/2, h=4.01, $fn=50);
	
		// Pneufit hole - the subtracted value is hole depth
		translate([5.8,44-4,15]) rotate([90,0,0]) cylinder(16, r=4.5/2, $fn=25);
	
      	// Tube and filament holes
		translate([5.8,30,15]) rotate([90,0,0]) cylinder(30, r=1.5, $fn=25);
		translate([5.7,10,15]) rotate([90,0,0]) cylinder(4, r1=0.4, r2=4, $fn=25);

		// Insert and idler clearance
		translate([0,0,-1]) cylinder(13, r1=27.6/2, r2=4.3, $fn=50);

		// M3 bolt holes
		translate([3,17,20.5]) rotate([0,90,0]) cylinder(10, r=2.75, $fn=25);
		translate([3,17,9.5]) rotate([0,90,0]) cylinder(10, r=2.75, $fn=25);
		translate([-0.5,17,20.5]) rotate([0,90,0]) cylinder(10, r=2, $fn=25);
		translate([-0.5,17,9.5]) rotate([0,90,0]) cylinder(10, r=2, $fn=25);


		// just a hole
		translate([-3.5,16,9.5]) rotate([90,0,0]) cylinder(6, r=3.5, $fn=25);
		translate([-3.5,16,20.5]) rotate([90,0,0]) cylinder(6, r=3.5, $fn=25);

		// Bowden filament guide in-feed Cut off
		translate([9.5,7.5,14]) rotate([0,0,35]) cube([8,4,28], center = true);
	}
	
}

// #########################################################

//support_strut();

module support_strut() {
  color("red"){
	difference() {
		union() {
			translate([-14,0,0]) color("red") cylinder(6, r=4.3, $fn=30);
			translate([14,0,0]) color("red") cylinder(6, r=4.3, $fn=30);
			translate([-13,-3.5,0]) color("red") cube([28,7,6]);
		}
		union() {
			// Screw holes
			translate([-14,0,-1]) color("red") cylinder(5, r=1.75, $fn=30);
			translate([14,0,-1]) color("red") cylinder(5, r=1.75, $fn=30);
			translate([-14,0,3]) color("red") cylinder(5, r=3, $fn=30);
			translate([14,0,3]) color("red") cylinder(5, r=3, $fn=30);
		}
	}
  }
}


// #########################################################

module extruder() {
	translate([0,0,-nema_z]) stepper_kit();
	extruder_block();
	translate([10,0,15]) rotate([0,90,-2]) idler_608z();
	translate([0,-15.5,23.5]) support_strut();
	translate([15.5,-15.5,4]) spacer(3,6.5,3);
	translate([-1.4,17,20.5]) rotate([0,90,0]) m3_bolt(40);
	translate([-1.4,17,9.5]) rotate([0,90,0]) m3_bolt(40);
}

// #########################################################

module idler_608z() {
	translate([0,0,6]) rotate([0,90,0]) bearing(8, 22, 7);
	extruder_idler_608z();
}


// #########################################################


// stepper_kit();

module stepper_kit() {
	union() {
		nema17();
		translate([0,0,nema_l-2]) bearing(5, 10, 4);
		translate([0,0,nema_l-insert_l-4]) insert();
		// translate([13.57,0,nema_l-9]) bearing(4, 17.5, 8);
		rotate([90,0,0]) translate([4.825,nema_l-9,0]) color("blue") cylinder(100, r=0.875, center = true, $fs=.1);
	}

}


// #########################################################

//bearing(6, 19, 6);
module bearing(id, od, w) {
	difference() {
		union() {
			translate([0,0,0]) color("red") cylinder(w,r=od/2, center = true, $fs=.1);
		}
		union() {
			translate([0,0,0]) cylinder(w+2,r=od/2-1, center = true, $fs=.1);
		}
	}
	difference() {
		union() {
			translate([0,0,0]) color("red") cylinder(w,r=id/2+1, center = true, $fs=.1);
			translate([0,0,0]) color("black") cylinder(w-0.5,r=od/2-1, center = true, $fs=.1);
		}
		union() {
			translate([0,0,0]) cylinder(w+2,r=id/2, center = true, $fs=.1);
		}
	}
}

// #########################################################

//insert();
module insert() {
//insert_l=15; // Filament gripper insert length
	difference() {
		union() {
			translate([0,0,0]) color("gold") cylinder(5.3,r=6.25, $fa=60); // Nut part of insert
			translate([0,0,5.3]) color("gold") cylinder(9.7,r=3.95, $fs=.1); // Teeth part
		}
		union() {
			translate([0,0,-1]) cylinder(17,r=2.5, $fs=.1); // Insert bore
		}
	}
}

// #########################################################

module nema17() {
// Stepper body size
//nema_x=42;
//nema_y=42;
//nema_z=47.4;
//screw_l=16;
// Stepper body silver end caps z length
body = nema_z/100*50;
cap = nema_z/100*25;

	difference() {
		union() {
			translate([-nema_x/2,-nema_y/2,cap]) color("black") cube([nema_x,nema_y,body]);
			translate([-nema_x/2,-nema_y/2,0]) color("silver") cube([nema_x,nema_y,cap]);
			translate([-nema_x/2,-nema_y/2,cap+body]) color("silver") cube([nema_x,nema_y,cap]);
			translate([0,0,cap*2+body]) color("grey") cylinder(1.7,r=11, $fs=.1);
			translate([0,0,cap*2+body+1.7]) color("silver") cylinder(22.5,r=2.5, $fs=.1);
		}
		union() {
			for(r=[1:4]) {
				rotate([0,0,r*360/4]) translate([15.5,15.5,cap*2+body-5]) cylinder(6,r=1.5, $fs=.1);
			}

		}
	}
	for(r=[1:4]) {
		rotate([0,0,r*360/4]) translate([15.5,15.5,cap*2+body-5]) color("Goldenrod") cylinder(screw_l,r=1.5, $fs=.1);
		// rotate([0,0,r*360/4]) translate([15.5,15.5,cap*2+body-5+screw_l]) color("Goldenrod") cylinder(1.8,r=2.8, $fs=3);
	}
}

// #########################################################

module screw() {
	for(r=[1:4]) {
		rotate([0,0,r*360/4]) translate([15.5,15.5,cap*2+body-5]) color("Goldenrod") cylinder(screw_l,r=1.5, $fs=.1);
		rotate([0,0,r*360/4]) translate([15.5,15.5,cap*2+body-5+screw_l]) color("Goldenrod") cylinder(1.8,r=2.8, $fs=3);
	}
}

// #########################################################

//spacer();

module spacer(h, od, id) {
	difference() {
		translate([0,0,0]) color("black") cylinder(h,r=od/2, $fs=.1);
		translate([0,0,-1]) color("black") cylinder(h+2,r=id/2, $fs=.1);
	}

}

// #########################################################

//m3_bolt();

module m3_bolt(l) {

		translate([0,0,2.2]) color("silver") cylinder(l,r=1.5, $fs=.1); // Bolt
		translate([0,0,0]) color("silver") cylinder(2.2,r=2.75, $fa=60); // Head


}
// #########################################################

//module_name();

module module_name() {
	difference() {
		union() {
			// Code1
		}
		union() {
			// Code 2
		}
	}
}
