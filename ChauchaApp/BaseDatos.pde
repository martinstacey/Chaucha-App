Table alltrab;
Table seltrab;
boolean setuplist = true;
PVector trabpos = new PVector (20, 140);
ArrayList <Perfil> selper;
int trabajadorselect = -1;
void setupba() {
  //alltrab=downloadtableftp(inandroid, "trabajadores", "csv", "chaucha/", "files.000webhost.com", 21, "martinstacey", "elmascapo");
}
void setupsel() {
  seltrab = new Table();
  selper = new ArrayList<Perfil>();
  for (int i=0; i<alltrab.getColumnCount(); i++) seltrab.addColumn(alltrab.getColumnTitle(i));
  for (int i=0; i< alltrab.getRowCount(); i++) if (txequal(alltrab.getString(i, "profesion"), tx[era][0][0].itext)) if (txequal(alltrab.getString(i, "ubicacion"), tx[era][0][1].itext)) seltrab.addRow(alltrab.getRow(i));
  //agregar buscqueda de ubicacion
  for (int i=0; i< seltrab.getRowCount(); i++)selper.add(new Perfil(i, seltrab.getRow(i), new PVector (trabpos.x, trabpos.y+40*i), new PVector (width/scand-50, 40)));
  for (int i=0; i< selper.size(); i++) selper.get(i).scaletoandroid(scand);
}
void drawsel() {
  if (tipo==0)if (era==2) for (Perfil p : selper) p.displaylist();
  if (tipo==0)  if (era==3) if (trabajadorselect !=-1) selper.get(trabajadorselect).displaydetail();
  if (tipo==0)  if (era==4)  if (trabajadorselect !=-1) selper.get(trabajadorselect).displaycalif();
}
void presssel() {
  if (tipo==0) if (era==2)for (Perfil p : selper) p.press();
    if (tipo==0) if (era==4)for (Perfil p : selper) p.presscalif();
}
class Perfil {
  int num;
  String profesion, ubicacion, nombre, cedula, celular;
  int numtrab,id;
  float estrellas;
  PVector pos, mid, size;
  Click but;
  Option cal;
  PImage profimg;
  Perfil(int _num, TableRow perfilDATA, PVector _pos, PVector _size) {
    num=_num;
    id =perfilDATA.getInt("id"); 
    profesion=perfilDATA.getString("profesion");
    ubicacion=perfilDATA.getString("ubicacion");
    nombre=perfilDATA.getString("nombre");
    cedula=perfilDATA.getString("cedula");
    celular=perfilDATA.getString("celular");
    estrellas=perfilDATA.getFloat("estrellas");
    numtrab=perfilDATA.getInt("numtrab");

    pos = _pos;
    size = _size;
    mid = new PVector(pos.x+size.x*.5, pos.y+size.y*.5);
    but = new Click(pos, size, "", 41);
    String [] st = {"1", "2", "3", "4", "5"};
    cal = new Option(new PVector (width*.5/scand-75, height*.5/scand-70), new PVector (30, 30), st, 31);
    profimg = prof;
  }
  void scaletoandroid(float scand) {
    pos = new PVector (pos.x*scand, pos.y*scand);
    size = new PVector (size.x*scand, size.y*scand);
    mid = new PVector (mid.x*scand, mid.y*scand);
    but = new Click(pos, size, "", 41);
    cal.scaletoandroid(scand);
  }
  void displaylist() {
    pushStyle();
    textAlign(LEFT, CENTER);
    textSize(13*scand);
    fill(100);
    text (nombre, pos.x, mid.y);
    noStroke();
    starsys(new PVector(pos.x+100*scand, mid.y-7.5*scand), new PVector (100*scand, 15*scand), int(estrellas), 200, 100);
    but.display();

    popStyle();
  }
  void displaydetail() {
    pushStyle();
    image(profimg, 0, 0, width, height*.45);
    textAlign(LEFT, CENTER);
    textSize(13*scand);
    fill(100);
    text ("Nombre:     " + nombre, 30*scand, height*.5);
    text ("Profesion   " + profesion, 30*scand, height*.5+20*scand);
    text ("Ubicacion:  "+ubicacion, 30*scand, height*.5 +40*scand);
    text ("ID:              "+cedula, 30*scand, height*.5+60*scand);
    text ("cel:             "+celular, 30*scand, height*.5 + 80*scand);
    noStroke();
    starsys(new PVector(230*scand, -7.5*scand+height*.5), new PVector (100*scand, 15*scand), int(estrellas), 200, 100);
    popStyle();
  }
  void displaycalif() {
    pushStyle();
    textSize(13*scand);
    fill(100);
    textAlign(CENTER,CENTER);
    text("Calificacion Actual "+nombre+":" + nf(estrellas,0,2),width/2,height/2-140*scand);
    text("Trabajos Realizados: "+numtrab,width/2,height/2-120*scand);
    cal.display();
    popStyle();
  }
  void press() {
    but.presson();
    if (but.state) trabajadorselect = num;
    if (but.state) era =3; 
    but.pressoff();
  }
  void presscalif() {

    if (era==4) {
      cal.press();
    }
  }
  void cambiarcalif(){
    if (numtrab==0) {
      estrellas=3;
      numtrab=0;
    }
    numtrab++;
    //estrellas = cal.namei+1;
    float frac1 = float(numtrab-1)/numtrab;
    float frac2 = float(1)/numtrab;
    float calif1 = estrellas*frac1;
    float calif2 = (cal.namei+1)*frac2;
    estrellas = calif1+calif2;
  }
  void insertatabl(){
    alltrab.setFloat(id-1,"numtrab",numtrab);
    alltrab.setFloat(id-1,"estrellas",estrellas);
  }
}
