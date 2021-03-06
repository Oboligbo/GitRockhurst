class Obi {
  color no = color(10, 100, 10);
  int transP = 200;
  color blue= color(0, 0, 255);
  color black= color(0, 0, 0);
  int red= color(255, 0, 0);
  color yellow= color(227, 227, 0);
  color green= color(0, 255, 0);
  color mycolor= color(255, 188, 0);
  int r1 = 10;
  boolean CHGCLR=false;
  boolean CHGCLR2=false;
  boolean hat=false;
  int mycolor2=color(200, 133, 120);
  int mycolor3=color(92, 12, 31);
  int scaleSize=3;
  float r=0;
  int step= 1;
  long mark = 0;
  long wait = 50;
  int moreColor = color(200, 226, 26);
  int numSteps = 100;
  int hiscolor = color(random(0, 255), random(0, 255), random(0, 255));
  int px, x, y;

  Obi(int x, int y, color c1, color moreColor, int step, int wait ) {
    this.x=x;
    this.y=y;
    no = c1;
    blue = moreColor;
  }
  void drawLegs() {
    fill(red);
    noStroke();
    pushMatrix();
    translate(x+50, y+99);
    rotate(radians(r1));
    rect(0, 0, 19, 55);//50,99,19,55
    popMatrix();

    pushMatrix();
    translate(x+131, y+99);
    rotate(radians(r1));
    rect(0, 0, 19, 55); //131,99,19,55
    popMatrix();
  }

  void drawBody() {
    noStroke();
    fill(no, transP);
    ellipse(x+100, y+96, 118, 54);//100,96,118,54
    fill(green, transP);
  }

  void drawEyes() {
    fill(green, transP);
    noStroke();
    pushMatrix();
    translate(x+125, y+100);
    rotate(radians(r-10));
    ellipse(0, 0, 20, 30);//125,100,20,20
    popMatrix(); 

    pushMatrix();
    translate(x+75, y+100);
    rotate(radians(-r));
    ellipse(0, 0, 20, 30);//75,100,20,20
    popMatrix();
  }

  void drawHat() {
    if (hat) {
      noStroke();
      fill(blue, transP);
      triangle(x+50, y+83, x+100, y-50, x+150, y+83);//50,83,100,15,150,83
    } else {
      noStroke();
      fill(blue, transP);
      triangle(x+50, y+83, x+100, y+15, x+150, y+83);//50,83,100,15,150,83
    }
  }

  void drawArms() {
    if (CHGCLR) {
      mycolor=hiscolor;
      strokeWeight(17);
      stroke(mycolor);
      line(x+180, y+150, x+151, y+100);//180,33,151,100
      line(x+30, y+150, x+48, y+100);//30,33,48,100
    } else {
      strokeWeight(17);
      stroke(mycolor);
      line(x+180, y+33, x+151, y+100);//180,33,151,100
      line(x+30, y+33, x+48, y+100);//30,33,48,100
    }
  }

  void drawCreature() {
    theHack();
    myScale();  
    drawLegs();
    drawBody();
    drawArms();
    drawHat();
    drawEyes();
    drawFeet();
    drawNose();
    Bauble();
  }

  void drawFeet() {
    fill(mycolor2);
    rect(x+50, y+141, 51, 15);//50,141,51,15
    rect(x+131, y+141, 51, 15);//131,141,51,15
  }

  void drawNose() {
    noFill();
    strokeWeight(4);
    stroke(mycolor3, transP);
    arc(x+110, y+120, 26, 47, 1, PI+QUARTER_PI, OPEN);//110,120,26,47,1
    r=r+10;
  }

  void theHack() {
    px = x;
    if (x != px) {
      x = x - 100;
      y = y - 100;
    }
  }

  void stoplight() {
    if (millis() - mark > wait) {
      step = step < numSteps ? step+ 1 : 1;
      mark = millis();
    }

    if (step<33) {
      CHGCLR=true;
      CHGCLR2=false;
      hat=false;
    } else if (step<66) {
      hat=true;
      CHGCLR=false;
      CHGCLR2=false;
    } else {
      CHGCLR2=true;
      hat=false;
      CHGCLR=false;
    }
  }
  void Bauble() {
    fill(mycolor2);
    ellipse(200, 116, 10, 10);
  }


  void myScale() {
    scale(scaleSize);
    if (CHGCLR2) {
      scaleSize=2;
    } else {
      scaleSize=1;
    }
    scale(1);
  }
  void land() {
    for (int i=y+176; i<y+195; i+=5) {
      for (int l=x-10; l<x+20; l+=5) {
        constrain(l, height, height);
        fill(moreColor);
        ellipse(l, i, 10000, 38);
      }
    }
  }
}