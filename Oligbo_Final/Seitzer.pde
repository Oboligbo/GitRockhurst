class Seitzer implements Sprite {
  boolean swordUp = false;
  boolean fastWheel = false;
  boolean eyeColor = false;
  float r = 0;
  float r2 = 45;
  float r3 = 25;
  int wspeed = 3;
  long mark = 0;
  long wait = 50;
  int numMarks = 0;
  int numSteps = 100;
  int step = 1;
  color black = color(0, 0, 0);
  color yellow = color(250, 247, 6);
  color gray = color(150);
  color blue = color(0, 0, 255);
  color red = color(255, 0, 0);
  color pink = color(255, 100, 200);
  int transparency = 127;
  color gray2 = color(100);
  color white = color(255, 255, 255);
  int x = 100;
  int y = 100;
  int speed = 2;
  int jspeed = 4;

  Seitzer(int x, int y, int transparency, color black, int wspeed) {
    this.x = x;
    this.y = y;
  }
  void display() {
    drawSprite();
  }
  void move() {
    x+=speed;
    if (x<width/12) {
      speed+=10;
    }
    if (x>width-75) {
      speed-=2;
    }
    y+=jspeed;
    if (y>height-75) {
      jspeed-=10;
    }
    if (y<height/6) {
      jspeed+=2;
    }
  }
  void drawSprite() {
    drawHead();
    drawBody();
    drawFace();
    rotateWheel();
    rotateSword();
    sequence();
    sequence2();
    eyeColor();
  }

  void drawHead() {
    strokeWeight(1);
    fill(yellow, transparency);
    rect(x-15, y-90, 30, 30);//face x=85, y=10
    rect(x-4, y-60, 8, 8);//neck x=96 y=40
  }
  void drawBody() {
    fill(black);
    ellipse(x, y-13, 40, 80);//body x=100, y=87
    noStroke();
    fill(black);
    quad(x+49, y-38, x+49, y-53, x+19, y-27, x+19, y-12);//right arm x1=149, y1=62, x2=149, y2=47, x3=119, y3=73, x4=119, y4=88
    fill(black);
    quad(x-52, y-58, x-52, y-43, x-20, y-10, x-18, y-27);//left arm x1=48, y1=42, x2=48, y2=57, x3=80, y3=90, x4=80, y4=73
  }
  void drawFace() {
    fill(black);
    rect(x-10, y-79, 5, 5);//eyes x=90, y=21
    rect(x+4, y-79, 5, 5);//eyes x=104, y=21
    fill(red);
    ellipse(x, y-67, 23, 9);//mouth x=100, y=33
    for (int t = x-10; t<x+10; t+=5){
      stroke(1);
    fill(white);
    rect(t,y-70,5,3);// teeth
    }
    noStroke();
    fill(gray2);
    rect(x-6, y+25, 13, 40);//leg x=94, y=125
  }
  void rotateWheel() {
    strokeWeight(3);
    fill(black);
    stroke(gray);
    //rotating wheel start
    pushMatrix();
    translate(x+1, y+77);
    rotate(radians(r3));
    ellipse(0, 0, 32, 37);//outside ring of wheel x=101, y=177
    ellipse(0, 0, 24, 27);//inner ring x=101, y=177
    point(0, -1);//center of wheel x=101, y=176
    line(0, -1, -12, -1);//line of wheel x1=101, y1=176, x2=89, y2=176
    line(0, -1, -4, -12);//line of wheel x1=101, y1=176, x2=97, y2=165
    line(0, -1, 9, -11);//line of wheel x1=101, y1=176, x2=110, y2=168
    line(10, 5, 0, -1);//line of wheel x1=111, y1=182, x2=101, y2=175
    line(0, -2, 0, 13);//line of wheel x1=101, y1=175, x2=101, y2=190
    line(0, -2, -9, 10);//line of wheel x1=101, y1=175, x2=92, y2=187
    popMatrix();//end of wheel rotation
    r3 += wspeed;
  }
  void rotateSword() {
    fill(gray2);
    noStroke();
    pushMatrix();
    translate(x+50, y-50);
    rotate(radians(r2));
    ellipse(0, 0, 8, 24);//bottom handle of sword x=150, y=50
    ellipse(0, 0, 24, 8);//crosspiece of sword x=150, y=45
    fill(gray);
    rect(-5, -42, 10, 38);//blade of sword x=145, y=8
    triangle(0, -48, 5, -42, -5, -42);//tip of sword x1=150, y1=2, x2=155, y2=8, x3=145, y3=8
    popMatrix();
    r = r+5;
  }
  void sequence() {
    for (int s = x-15; s<x+15; s+=8) {
      fill(25, 100, 125);
      triangle(s, y-90, s+2.5, y-105, s+5, y-90);
    }
  }
  void sequence2() {
    if (millis()-mark>wait) {
      step=step<numSteps ? step + 1 : 1;
      //numMarks++;
      mark=millis();
    }
    if (step < 40) {
      eyeColor = true;
      swordUp = false;
      wspeed = 30;
    } else if (step < 80) {
      eyeColor = false;
      swordUp = true;
      wspeed = 30;
    } else {
      eyeColor = true;
      swordUp = true;
      wspeed = 3;
    }

    if (swordUp) { //sword on left up
      fill(gray2);
      ellipse(x-50, y-45, 8, 24); //x=50, y=70
      ellipse(x-50, y-45, 24, 8);//x=50,y=70
      fill(gray);
      rect(x-54, y-50, 8, -50);//x=54,y=62,
      triangle(x-46, y-100, x-50, y-105, x-54, y-100);
    } else { //sword down
      ellipse(-10, 0, 8, 24);//bottom handle of sword x=150, y=50
      ellipse(-10, 0, 24, 8);//crosspiece of sword x=150, y=45
      fill(gray);
      rect(-5, -42, 10, 38);//blade of sword x=145, y=8
      triangle(0, -48, 5, -42, -5, -42);//tip of sword x1=150, y1=2, x2=155, y2=8, x3=145, y3=8
    }
  }
  void eyeColor() {
    if (eyeColor) {
      fill(0, 255, 255);
      rect(x-10, y-79, 5, 5);//eyes x=90, y=21
      rect(x+4, y-79, 5, 5);//eyes x=104, y=21
    } else {
      fill(black);
      rect(x-10, y-79, 5, 5);//eyes
      rect(x+4, y-79, 5, 5);
    }
  }

  void keyPressed() {
    if (key == 'a' || key =='A') {
      swordUp = !swordUp;
    } else if (key == 'c' || key == 'C') {
      eyeColor = !eyeColor;
    } else if (key == 'b' || key == 'B') {
      fastWheel = !fastWheel;
      if (fastWheel) {
        wspeed = 30;
      } else {
        wspeed = 3;
      }

    }
  }
}