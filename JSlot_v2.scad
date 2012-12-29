use <fillet_circle.scad>;

$fs=0.2;
$fa=2;
height=4.64+4.76;
fillet = 2;
bigR = 29.5;
littleR = 20;
punchHeight=20;
smooth = 100;

view = false;
printDual = false;


difference(){
  union(){
    if(view == false){
	  //translate([60,0,0]) J_Ring();
	}else{
	  translate([0,0,height+0.01]) J_Ring();
	}

	J_insert();
  }
  

}
module J_Ring(){
  difference(){
    	fil_polar_o(bigR, fillet, 4-fillet, angle=90);
	for(i=[0:60:360]){
		rotate([0,0,i]) translate([24.5,0,-6]) cylinder(r=2.1,h=20, $fn=smooth);
	}
	translate([-0.15,-10,-0.1]) cylinder(r=2.5, h=20, center=true, $fn=smooth);
	translate([-0.15,10,-0.1]) cylinder(r=2.5, h=20, center=true, $fn=smooth);
	translate([-0.15,0,-0.1]) cylinder(r=2.5, h=20, center=true, $fn=smooth);
	
	translate([-13.15,7.2,-0.1]) cylinder(h=punchHeight,r=1.7,center=true);
	translate([-13.15,-7.2,-0.1]) cylinder(h=punchHeight,r=1.7,center=true);
	translate([12.75,7.2,-0.1]) cylinder(h=punchHeight,r=1.7,center=true);
	translate([12.75,-7.2,-0.1]) cylinder(h=punchHeight,r=1.7,center=true);
	
	translate([-13.15,7.2,height-1.4]) cylinder(h=3,r=5.5/2,center=true, $fn=6);
	translate([-13.15,-7.1,height-1.4]) cylinder(h=3,r=5.5/2,center=true, $fn=6);
	translate([12.75,7.2,height-1.4]) cylinder(h=3,r=5.5/2,center=true, $fn=6);
	translate([12.75,-7.2,height-1.4]) cylinder(h=3,r=5.5/2,center=true, $fn=6);
  }
}

module J_insert(){
	color("red") difference(){
		cylinder(h=height-0.2,r=littleR-0.05);
		translate([-13.15,7.2,-0.1]) cylinder(h=punchHeight,r=1.5,center=true);
		translate([-13.15,-7.2,-0.1]) cylinder(h=punchHeight,r=1.5,center=true);
		translate([12.75,7.2,-0.1]) cylinder(h=punchHeight,r=1.5,center=true);
		translate([12.75,-7.2,-0.1]) cylinder(h=punchHeight,r=1.5,center=true);
		
		translate([-13.15,7.2,height-1.4]) cylinder(h=3,r=6.15/2,center=true, $fn=6);
		translate([-13.15,-7.1,height-1.4]) cylinder(h=3,r=6.15/2,center=true, $fn=6);
		translate([12.75,7.2,height-1.4]) cylinder(h=3,r=6.15/2,center=true, $fn=6);
		translate([12.75,-7.2,height-1.4]) cylinder(h=3,r=6.15/2,center=true, $fn=6);
		
		translate([-13.15,7.2,-0.1]) cylinder(h=3.1,r=6.15/2,center=true, $fn=6);
		translate([-13.15,-7.2,-0.1]) cylinder(h=3.1,r=6.15/2,center=true, $fn=6);
		translate([12.75,7.2,-0.1]) cylinder(h=3.1,r=6.15/2,center=true, $fn=6);
		translate([12.75,-7.2,-0.1]) cylinder(h=3.1,r=6.15/2,center=true, $fn=6);
		if(printDual == true){
		  translate([-0.15,-10,-0.1]) rotate([0,0,270]) J_hole();
		  translate([0.15,10,-0.1]) rotate([0,0,90]) J_hole();
		}else{
		  translate([0,1.29,-0.1]) rotate([0,0,270]) J_hole();
		}
	}
}

module J_hole() {
	if(printDual == true){
		translate([1.3,0,-0.1]) cylinder(h=punchHeight,r=12/2,center=true);
		translate([1.3,0,4.64]) cylinder(h=5,r=15.875/2);
		//translate([12,0,-0.1]) cylinder(h=punchHeight,r=17/2,center=true);
		translate([5.05,0,-0.1]) cube([10,11.35,punchHeight],center=true);
		translate([.8,-15.875/2,4.64]) cube([10,15.875,5]);	
	}else{
	  	translate([1.3,0,-0.1]) cylinder(h=punchHeight,r=12/2,center=true);
		translate([1.3,0,4.64]) cylinder(h=5,r=15.875/2);
		//translate([10,0,-0.1]) cylinder(h=punchHeight,r=15.875/2,center=true);
		translate([11.05,0,-0.1]) cube([22,11.35,punchHeight],center=true);
		translate([.8,-15.7/2,4.64]) cube([22,15.7,5]);
	}

}