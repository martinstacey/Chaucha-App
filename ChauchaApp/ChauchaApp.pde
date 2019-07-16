import java.util.Date;
boolean inandroid = false;
int era = 0;
int tipo = 0;
boolean contratante = false;
float scand = 1;
boolean keybisopen = false;
void opkey() {
  //openKeyboard();
  keybisopen = true;
}
void clkey() {
  //closeKeyboard();
  keybisopen = false;
}
Text a;
void setup() {
  size(360, 640);
  //fullScreen();
 inandroid=true;
  //orientation(PORTRAIT);
  //scand = displayDensity;
  setupin();
  //createfile("SIGNIN.pde","SIGIN.pde",sketchPath("")+"data/");
  setuplo();
  setupba();
}
void draw() {
  background(255);
  fill(0);


  drawin();
  drawlo();
  drawsel();
  //fill(255, 0, 0);
  //text(era, 20, 20);
  //text(tipo, 40, 20);
}
void mousePressed() {
  pressin();
  presslo();
  presssel();
}

void keyPressed() {
  typein();
  typelo();
}
