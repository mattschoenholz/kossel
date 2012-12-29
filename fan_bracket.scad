use <fillet_cube.scad>;

rotate([90,0,0]) difference(){
  union(){
    translate([-41,0,0]) cube_fillet([82,3,22],1,[2,2,2,2],[1,1,1,1],[1,1,1,1],0,$fn=60);
    translate([-41,0,0]) cube_fillet([11,20,3],1,[2,2,2,2],[1,1,1,1],[1,1,1,1],$fn=60);
    translate([-41,0,9]) cube_fillet([11,20,3],1,[2,2,2,2],[1,1,1,1],[1,1,1,1],$fn=60);
    translate([30,0,0]) cube_fillet([11,20,3],1,[2,2,2,2],[1,1,1,1],[1,1,1,1],$fn=60);
    translate([30,0,9]) cube_fillet([11,20,3],1,[2,2,2,2],[1,1,1,1],[1,1,1,1],$fn=60);
  }
  translate([-36,4,17]) rotate([90,0,0]) cylinder(r=2, h=8, $fn=20); 
  translate([36,4,17]) rotate([90,0,0]) cylinder(r=2, h=8, $fn=20);
  //translate([-30,3,-1]) cube([60,20,20]);
  translate([-30,-1,-1]) cube([60,25,10.1]);
}