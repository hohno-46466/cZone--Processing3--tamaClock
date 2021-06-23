// Prev update: 3/9/2016 by hohno
// Prev update: 4/6/2016 by hohno
// Prev update: Sat Mar 24 13:19:14 JST 2018 by @hohno_at_kuimc
// Last update: Sun Jun 20 17:29:05 JST 2021 by @hohno_at_kuimc

// Originai: http://yoppa.org/proga10/1419.html

// Build with:
// $ processing-java --sketch=`pwd` --output=`pwd`/output --force --present

// ---------------------------------------------------------

final int screen_w = 640; // 320; // 640; // 320; // 640;
final int screen_h = 400; // 240; // 400; // 200; // 400;

// ---------------------------------------------------------

boolean debugflag = false;

PImage img;

int tama_w = screen_w * 3 / 8;		// 120; // 360;
int tama_h = screen_h * 3 / 4;		// 150; // 450;
int hands_cx = screen_w * 5 / 16;
int hands_cy = screen_h / 2;
int hands_len = int(screen_h * 0.4);

int MARGIN = 10; // 20;

// ---------------------------------------------------------

void settings() {
  size(screen_w, screen_h);
}

// ---------------------------------------------------------

void setup() {
  background(0);
  stroke(255);
  smooth();
  frameRate(30);
  img = loadImage("data/tamahime-360x450.png");
  colorMode(RGB, 256);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);
}

// ---------------------------------------------------------

void sub2() {

  int sub2_cx = screen_w - tama_w /2 - MARGIN;
  int sub2_cy = screen_h /2 ;
  int sub2_w = tama_w;
  int sub2_h = tama_h;
  int sub2_tw = 135;	// text width
  int sub2_th = 14;	// text height

  if (debugflag) {strokeWeight(1); rect(sub2_cx, sub2_cy, sub2_w, sub2_h);}
  image(img, sub2_cx, sub2_cy, sub2_w, sub2_h);

  if (debugflag) {strokeWeight(1); rect(sub2_cx, sub2_cy + sub2_h *0.45,  sub2_tw, sub2_th);}
  textSize(sub2_th);
  text("(c) Tamahime-chan", sub2_cx, sub2_cy + sub2_h *0.45);

}

// ---------------------------------------------------------

void sub1(int YY, int MM, int DD, int hh, int mm, int ss) {

  int sub1_th = int(screen_h * 0.06); // 20;	// text height
  int sub1_tw = sub1_th * 14; // 280;	// text width
  int sub1_cx = hands_cx;
  int sub1_cy = int(screen_h * 0.975 - sub1_th /2);

  char data[] = {'2', '0', '1', '6', '-', '0', '3', '-', '1', '0', ' ', '(', 'w', 'w', 'w', ')', ' ','1', '2', ':', '3', '4', ':', '5', '6'};
  String wodstr[] = { "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "xxx" };
  int wod = 5;
  int dom[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

  if (YY >= 2000) {
    wod += 365*(YY-2000);
    wod += (int)(((YY + 3) - 2000) / 4);
    for(int i = 0; i < (MM - 1); i++) {
      wod += dom[i];
      if ((i == 1) && ((YY % 4) == 0)) { wod++; }
    }
    wod += DD;
    wod %= 7;
  }
  data[0] = char (int('0') + (int)(YY / 1000));
  data[1] = char (int('0') + (int)((YY % 1000)/100));
  data[2] = char (int('0') + (int)((YY % 100) / 10));
  data[3] = char (int('0') + (int)(YY % 10));

  data[5] = char (int('0') + (int)(MM / 10));
  data[6] = char (int('0') + (int)(MM % 10));

  data[8] = char (int('0') + (int)(DD / 10));
  data[9] = char (int('0') + (int)(DD % 10));

  data[12] = wodstr[wod].charAt(0);
  data[13] = wodstr[wod].charAt(1);
  data[14] = wodstr[wod].charAt(2);

  data[17] = char (int('0') + (int)(hh / 10));
  data[18] = char (int('0') + (int)(hh % 10));

  data[20] = char (int('0') + (int)(mm / 10));
  data[21] = char (int('0') + (int)(mm % 10));

  data[23] = char (int('0') + (int)(ss / 10));
  data[24] = char (int('0') + (int)(ss % 10));

  textSize(sub1_th);
  String str = new String(data);

  if (debugflag) {strokeWeight(1); rect(sub1_cx, sub1_cy, sub1_tw, sub1_th);}
  text(str, sub1_cx, sub1_cy);

}

// ---------------------------------------------------------

void sub3(int YY, int MM, int DD, int hh, int mm, int ss) {

  int r = hands_len;

  float s = ss;
  float m = mm + (s/60.0);
  float h = (hh % 12) + (m/60.0);

  int colTable[] = {
  #f70f1f, // haruka (y)
  #0775c4, // chihaya (D)
  #aececb, // yukiho (f)
  #f29047, // yayoi (l)
  #00a752, // ritsuko (r)
  #7e51a6, // Azusa (C)
  #fa98bf, // iori (o)
  #464b4f, // makoto (u)
  #fcd424, // amimami (a)
  #a1ca62, // miki (s)
  #00b1bb, // hibiki ()
  #b51d66 // takane ()
  };

  String nameTable[] = {
  "Haruka"  , "Chihaya" , " Yukiho" , "Yayoi"   ,
  "Ritsuko" , "Azusa"   , "Iori"    , "Makoto"  ,
  "Ami/Mami", "Miki"    , "Hibiki"  , "Takane " , "12345678",
  };


  translate(hands_cx, hands_cy);
  int sub3_cx = 0;
  int sub3_cy = 0;
  int sub3_w = int(screen_h * 0.95);
  int sub3_h = int(screen_h * 0.95);
  int sub3_th = int(screen_h * 0.06); // 20;	// text height
  int sub3_tw = sub3_th *4;

  textSize(sub3_th);

  if (debugflag) {strokeWeight(1); rect(0, 0, sub3_w, sub3_h); rect(sub3_cx, sub3_cy + hands_len * 0.25, sub3_tw, sub3_th);}

  fill(colTable[(ss / 5) % 12]);
  text(nameTable[(ss / 5) % 12], sub3_cx, sub3_cy + hands_len * 0.25);

  rotate(radians(180));

  pushMatrix();
    noStroke();
    // draw stones.
    fill(colTable[(ss / 5) % 12]);
    for(int i = 0; i < 60; i++){
      if ((i % 5) == 0) {
        // fill(colTable[(ss / 5) % 12]);
        ellipse(r-MARGIN,0,10,10);
      } else {
        // fill(127);
        ellipse(r-MARGIN,0,3,3);
      }
      rotate(radians(6));
    }
    fill(255);
  popMatrix();

  noFill();
  stroke(255); // stroke with white

  // sec hand
  pushMatrix();
    rotate(radians(s * 6));
    strokeWeight(1);
    line(0, 0, 0, r - MARGIN);
  popMatrix();

  // minute hand
  pushMatrix();
    rotate(radians(m * 6));
    strokeWeight(4);
    line(0, 0, 0, r * 0.85 - MARGIN);
  popMatrix();

  // hour hand
  pushMatrix();
    rotate(radians(h * 30));
    strokeWeight(8);
    line(0, 0, 0, r * 0.7 - MARGIN);
  popMatrix();
}

// ---------------------------------------------------------

int maxFrames = 900;
int currentFrame = 0;

void draw() {

  int ss = second();
  int mm = minute();
  int hh = hour();
  int YY = year();
  int MM = month();
  int DD = day();

  background(0);
  // draw digital clock part
  sub1(YY, MM, DD, hh, mm, ss);
  // draw tamahime-chan
  sub2();
  // draw analog clock part
  sub3(YY, MM, DD, hh, mm, ss);

  if (currentFrame < maxFrames) {
    // saveFrame("image-####.png");
    currentFrame++;
  }
}

// ---------------------------------------------------------

void keyPressed() {
  if (key == ' ') {
    exit();
  }
}

// ---------------------------------------------------------
