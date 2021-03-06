color BG = color(255);

ArrayList<Sprite> list = new ArrayList<Sprite>();
Sprite s = new Obi(100, 100, color(100, 100, 100), color(10, 101, 0), 14, 70);

void setup() {
  size(500, 500);
  surface.setResizable(true);
  list.add(s);
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