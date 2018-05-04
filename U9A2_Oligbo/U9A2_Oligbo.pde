Human myBoy;
void setup() {
  size(500, 500);
  myBoy=new Human();
}
void draw() {
  
  //myBoy.LayDown();
  myBoy.StandUp();
  println(mouseX);
}
void keyPressed() {
  if (key== '1' || key == '!') {
    myBoy.LayDown();
  }
  if (key== '2' || key == '@') {
    myBoy.StandUp();
  }
}