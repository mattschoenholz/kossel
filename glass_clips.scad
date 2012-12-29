$fn=30;


difference(){
  hull(){
    translate([0,0,0])cylinder(r=2, h=6);
    translate([15,0,0])cylinder(r=2, h=6);
    translate([0,15,0])cylinder(r=2, h=6);
  }
  translate ([5,3,3]) cube([12,12,3]);
  translate ([2,6,0]) cylinder(r=1.5,h=6);
}

translate([40,0,0])rotate([0,0,90]) 
difference(){
  hull(){
    translate([0,0,0])cylinder(r=2, h=6);
    translate([15,0,0])cylinder(r=2, h=6);
    translate([0,15,0])cylinder(r=2, h=6);
  }
  translate ([3,5,3]) cube([12,12,3]);
  translate ([6,2,0]) cylinder(r=1.5,h=6);
}

translate([40,40,0])rotate([0,0,180]) 
difference(){
  hull(){
    translate([0,0,0])cylinder(r=2, h=6);
    translate([15,0,0])cylinder(r=2, h=6);
    translate([0,15,0])cylinder(r=2, h=6);
  }
  translate ([5,3,3]) cube([12,12,3]);
  translate ([2,6,0]) cylinder(r=1.5,h=6);
}

translate([0,40,0])rotate([0,0,270]) 
difference(){
  hull(){
    translate([0,0,0])cylinder(r=2, h=6);
    translate([15,0,0])cylinder(r=2, h=6);
    translate([0,15,0])cylinder(r=2, h=6);
  }
  translate ([3,5,3]) cube([12,12,3]);
  translate ([6,2,0]) cylinder(r=1.5,h=6);
}
