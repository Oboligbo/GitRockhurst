color BG = color(255);

ArrayList<Sprite> list = new ArrayList<Sprite>();
Sprite s = new Obi(width/2, height/2, color(100, 100, 100), color(10, 101, 0), 14, 70);
Sprite s1 = new Seitzer(width,height,100,color(250),1);
void setup() {
  size(1200, 1000);
  surface.setResizable(true);
  list.add(s);
  list.add(s1);
}

void draw() {
  background(BG);
  restoreDefaults();
  for (Sprite s : list) {
    s.move();
    s.display();
  }
}

void restoreDefaults() {
  noStroke();
  fill(0);
  strokeWeight(1);
  rectMode(CORNER);
  ellipseMode(CENTER);
}