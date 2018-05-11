Obi s1, s2, s3;
void setup() {
  size(500, 500);
  surface.setResizable(true);
  noStroke();
  s1= new Obi(100, 100, color(100, 100, 100), color(10, 101, 0), 14,70);
  s2 =new Obi(400, 400, color(1, 20, 300), color(0, 10, 200), 1,50);
  s3 =new Obi(200, 200, color(300, 90, 102), color(100, 100, 100), 10,30);
}

void draw() {
  background(0, 100, 100);
  s1.drawCreature();
  s2.drawCreature();
  s3.drawCreature();
}