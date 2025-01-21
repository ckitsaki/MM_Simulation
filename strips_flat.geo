Mesh.Optimize = 1;

ampl=113; r=15; wire_dist=101; drift_dist=5000; lc=50; lc1=50; lc2=50;
strp_dist=100; strp_width=300;

ampl0=113; //ampl=128um
//guided circle’s points (amp_gap = 128um)
x1=7.5; y1=13.2;
x2=13;  y2=6;
     
        y3=-13.2;
        y4=-8.8;

Point(1) = { 0, ampl, 0, lc};
Point(2) = { 0, ampl+2*r, 0, lc};
Point(3) = { 0, ampl+r, 0, lc}; //center


Point(6) = { 0, ampl+2*r, wire_dist, lc};
Point(7) = { r, ampl+r, wire_dist-r, lc};
Point(8) = { 0, ampl, wire_dist, lc};
Point(9) = { 0, ampl+r, wire_dist, lc}; //center
Point(10)= { x1, ampl+r+y1, wire_dist-x1, lc};
Point(101)= { x2, ampl+r+y2, wire_dist-x2, lc};
Point(102)= {x1,ampl+r+y3,wire_dist-x1,lc};
Point(103)= {x2,ampl+r+y4,wire_dist-x2,lc};


Point(11) = {wire_dist, ampl+2*r, 0, lc};

Point(13) = {wire_dist, ampl, 0, lc};
Point(14) = {wire_dist , ampl+r, 0, lc};//center


Point(15) = {wire_dist-r, ampl+r, r, lc};

Point(16)={r, ampl+r, r, lc};
Point(21)={wire_dist-x1,ampl+r+y1,x1,lc};
Point(22)={wire_dist-x2,ampl+r+y2,x2,lc};
Point(23)={wire_dist-x1,ampl+r+y3,x1,lc};
Point(24)={wire_dist-x2,ampl+r+y4,x2,lc};

Point(17)={x1,ampl+r+y1,x1,lc};
Point(18)={x2,ampl+r+y2,x2,lc};
Point(19)={x1,ampl+r+y3,x1,lc};
Point(20)={x2,ampl+r+y4,x2,lc};


Point(30) = { wire_dist, ampl+2*r, wire_dist, lc};
Point(31) = { wire_dist, ampl, wire_dist, lc};
Point(32) = { wire_dist, ampl+r, wire_dist, lc}; //center
Point(33) = { wire_dist-r, ampl+r, wire_dist-r, lc};
Point(34)= { wire_dist-x1, ampl+r+y1, wire_dist-x1, lc};
Point(35)= { wire_dist-x2, ampl+r+y2, wire_dist-x2, lc};
Point(36)= {wire_dist-x1,ampl+r+y3,wire_dist-x1,lc};
Point(37)= {wire_dist-x2,ampl+r+y4,wire_dist-x2,lc};


// mesh
Line(100)={6,2};
Line(102)={7,16};
Line(103)={8,1};
Line(104)={15,16};
Line(105)={13,1};
Line(106)={11,2};
Line(107)={2,3};
Line(108)={3,1};
BSpline(109)={2,17,18,16};
BSpline(110)={16,20,19,1};
BSpline(117)={6,10,101,7};
BSpline(118)={7,103,102,8};
BSpline(119)={11,21,22,15};
BSpline(120)={15,24,23,13};
BSpline(121)={30,34,35,33};
BSpline(122)={33,37,36,31};

Line(111)={11,14};
Line(112)={14,13};
Line(113)={6,9};
Line(114)={9,8};
Line(115)={3,9};
Line(116)={14,3};
Line(123)={30,32};
Line(124)={32,31};
Line(125)={7,33};
Line(126)={6,30};
Line(127)={8,31};
Line(128)={9,32};
Line(129)={30,11};
Line(130)={32,14};
Line(131)={31,13};
Line(132)={15,33};

Line Loop(200)={100,109,-102,-117};
Ruled Surface(1)={200};
Line Loop(201)={102,110,-103,-118};
Ruled Surface(2)={201};
Line Loop(202)={-114,-115,108,-103};
Plane Surface(3)={202};
Line Loop(203)={100,107,115,-113};
Plane Surface(4)={203};
Line Loop(204)={117,118,-114,-113};
Plane Surface(5)={204};
Line Loop(205)={109,110,-108,-107};
Plane Surface(6)={205};
Line Loop(206)={106,109,-104,-119};
Ruled Surface(7)={206};
Line Loop(207)={104,110,-105,-120};
Ruled Surface(8)={207};
Line Loop(208)={106,107,-116,-111};
Plane Surface(9)={208};
Line Loop(209)={116,108,-105,-112};
Plane Surface(10)={209};
Line Loop(210)={119,120,-112,-111};
Plane Surface(11)={210};
Line Loop(211)={129,119,132,-121};
Ruled Surface(12)={211};
Line Loop(212)={132,122,131,-120};
Ruled Surface(13)={212};
Line Loop(213)={129,111,-130,-123};
Plane Surface(14)={213};
Line Loop(214)={126,121,-125,-117};
Ruled Surface(15)={214};
Line Loop(215)={125,122,-127,-118};
Ruled Surface(16)={215};
Line Loop(216)={126,123,-128,-113};
Plane Surface(17)={216};
Line Loop(217)={121,122,-124,-123};
Plane Surface(18)={217};
Line Loop(218)={130,112,-131,-124};
Plane Surface(19)={218};
Line Loop(219)={128,124,-127,-114};
Plane Surface(20)={219};

Surface Loop(1000)={1,2,3,4,5,6};
Volume(1)={1000};

Surface Loop(1001)={5,15,16,17,20,18};
Volume(2)={1001};

Surface Loop(1002)={6,7,8,9,10,11};
Volume(3)={1002};

Surface Loop(1003)={11,12,13,18,14,19};
Volume(4)={1003};




Translate{wire_dist,0,0}{Duplicata{Volume{1,2,3,4};}}
Translate{-wire_dist,0,0}{Duplicata{Volume{1,2,3,4};}}



Translate{2*wire_dist,0,0}{Duplicata{Volume{1,3,2,4};}}
//Translate{-2*wire_dist,0,0}{Duplicata{Volume{1,4,3,2};}}
//=============================================================

vol_all_wires[] = Volume '*';
surf_all_wires[] = CombinedBoundary{Volume{vol_all_wires[]};};




//=============================================================


//strip
Point(100)={-47-4,0,101,lc2};
Point(200)={-116+20+strp_width+1-2+50,0,101,lc2};
Line(1000)={100,200};
Extrude{0,0,-101}{Line{1000};}

Point(300)={-47-4,20,101,lc2};
Point(301)={-116+20+strp_width+1-2+50,20,101,lc2};
Line(1001)={100,300};
Line(1002)={300,301};
Line(1003)={301,200};
Line Loop(1000)={1001,1002,1003,-1000};
Plane Surface(100)={1000};
Extrude{0,0,-101}{Surface{100};}

Point(400)={-101,0,101,lc2};
Point(401)={303,0,101,lc2};
Line(1004)={400,100};
Extrude{0,0,-101}{Line{1004};}
Line(1005)={200,401};
Extrude{0,0,-101}{Line{1005};}



//down boundaries
Line(1006)={400,429};
Line(1011)={977,425};
Line(1010)={401,950};
Line(1013)={842,979};

Line Loop(5000)={1006,-1169,127,-1049,-1305,-1010,-1005,-1003,-1002,-1001,-1004};
Plane Surface(500)={5000};
Line Loop(5001)={1010,1336,1013,-1381};
Plane Surface(501)={5001};
Line Loop(5002)={-1013,-1274,-1080,105,-1200,-1011,1375,1354,1355,1356,1379};
Plane Surface(502)={5002};
Line Loop(5003)={1011,1133,-1006,1376};
Plane Surface(503)={5003};


//up boundaries
Point(9000)={-101,ampl+drift_dist+r,0,lc1};
Point(9001)={-101,ampl+drift_dist+r,101,lc1};
Point(9002)={303,ampl+drift_dist+r,0,lc1};
Point(9003)={303,ampl+drift_dist+r,101,lc1};

Line(5010)={9000,9001};
Line(5011)={9001,9003};
Line(5012)={9003,9002};
Line(5013)={9002,9000};
Line Loop(5004)={5010,5011,5012,5013};
Plane Surface(504)={5004};      //cathode

Line(5014)={398,9001};
Line(5015)={399,9000};
Line(5016)={811,9002};
Line(5017)={924,9003};

Line Loop(5005)={5014,5011,-5017,-1298,-1042,-126,-1162};
Plane Surface(505)={5005};
Line Loop(5006)={5012,-5016,-1329,5017};
Plane Surface(506)={5006};
Line Loop(5007)={5016,5013,-5015,-1193,-106,-1073,-1267};
Plane Surface(507)={5007};
Line Loop(5008)={5010,-5014,1126,5015};
Plane Surface(508)={5008};



surf_bnd_down[] += {500:503};

surf_bnd_up[] += {505:508};


//PHYSICAL SURFACES
Physical Surface(1)={504};  //cathode


Line Loop(10000)={1360,1355,-1364,-1002};
Plane Surface(509)={10000};
Line Loop(10001)={1360,-1354,-1350,1001};
Plane Surface(510)={10001};
Line Loop(10002)={1364,1356,-1351,-1003};
Plane Surface(511)={10002};

Physical Surface(2)={509:511};

surf_strips_cut[]={1382,511,509,510,1378};
Physical Surface(3)={surf_strips_cut[]};


surf_all_wires_side[] = {1281,1276,1082,1087,9,10,1202,1207,1135,1140,1171,1176,17,20,1051,1056,1307,1312,1343,1348};



surf_all_wires[] -= surf_all_wires_side[];
Physical Surface(4) = surf_all_wires[];


Physical Surface(5) = surf_bnd_down[];
Physical Surface(6) = surf_bnd_up[];






//------- Define Volumes
//gas
slgas = newsl; Surface Loop(slgas) = {504,surf_bnd_up[],surf_bnd_down[],surf_strips_cut[],surf_all_wires[]};
volgas = newv ;  Volume(volgas) = {slgas};




//---------PHYSICAL VOLUMES
//MESH
Physical Volume(1) = vol_all_wires[];


//Gas
Physical Volume(2)={volgas};
//Strips
Physical Volume(3) = {1323};


