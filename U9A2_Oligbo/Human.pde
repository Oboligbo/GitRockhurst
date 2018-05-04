class Human {
  color darkskin;
  float xpos;
  float ypos;
  float position;
  int half=width/2;

  Human() {
    darkskin= color(#53290B);
    xpos=width/2;
    ypos= height/2;
    position=1;
  }
  void newBoy() {
    LayDown();
    StandUp();
  }
  void LayDown(){
  }
  void StandUp() {
    background(255);
    rectMode(CENTER);
    fill(0);
    ellipse(width/2, 90, 124, 115);
    noStroke();
    fill (darkskin);
    rect(width/2, 234, 38, 168);
    fill(0);
    ellipse(width/2, 101, 164, 98);
    fill(darkskin);
    ellipse(width/2, 125, 101, 101);
    pushMatrix();
    translate(width/2, height/2);
    rotate(15);
    ellipse(-82, 0, 203, 35);
    ellipse(81, 10, 203, 35);
    rect(97, -42, 23, 208);
    popMatrix();
    pushMatrix();
    translate(width/2, 50+height/2);
    rect(97, -52, 23, 208);
    //  ellipse(width/2,250,10,10);
  }
}