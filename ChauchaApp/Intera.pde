Text tx [][][] = new Text [5][2][5];  // era : type : maxq
Click cl [][][] = new Click [5][2][3];
Option op [][][]= new Option [5][2][3];
ArrayList <Click> cltrab;
PImage maleta;
PImage prof;
void setupin() {
  maleta=loadImage("prof.jpg");
  prof=loadImage("prof.jpg");

  cl[0][0][0] = new Click(new PVector (width*.5/scand-60, height*.5/scand-60), new PVector (120, 35), "Quiero Contratar", 20);
  cl[0][0][1] = new Click(new PVector (width*.5/scand-60, height*.5/scand), new PVector (120, 35), "Quiero Trabajar", 20);  


  cl[1][0][0] = new Click(new PVector (width*.5/scand-60, height*.5/scand), new PVector (120, 30), "Buscar", 20);
  cl[1][0][1] = new Click(new PVector (width*.5/scand-60, height*.9/scand), new PVector (120, 30), "Atras", 20);

  cl[2][0][0] = new Click(new PVector (width*.7/scand, 60), new PVector (90, 30), "Buscar", 20);
  cl[2][0][1] = new Click(new PVector (width*.5/scand-60, height*.9/scand), new PVector (120, 30), "Atras", 20);
  cl[2][1][0] = new Click(new PVector (width*.5/scand-60, height*.9/scand), new PVector (120, 30), "Atras", 20);
  cl[3][0][0] = new Click(new PVector (30, height*.9/scand), new PVector (120, 30), "Atras", 20);
  cl[3][0][1] = new Click(new PVector (width/scand-150, height*.9/scand), new PVector (120, 30), "Calificar", 20);
  cl[4][0][0] = new Click(new PVector (30, height*.5/scand), new PVector (120, 30), "Atras", 20);
  cl[4][0][1] = new Click(new PVector (width/scand-150, height*.5/scand), new PVector (120, 30), "Enviar", 20);


  cl[1][1][0] = new Click(new PVector (width*.5/scand-60, height*.5/scand+120), new PVector (120, 35), "Inscribir", 20);
  cl[1][1][1] = new Click(new PVector (width*.5/scand-60, height*.9/scand), new PVector (120, 30), "Atras", 20);
  cl[2][1][0] = new Click(new PVector (width*.5/scand-60, height*.9/scand), new PVector (120, 30), "Atras", 20);

  tx[1][0][0] = new Text(new PVector (width*.5/scand-100, height*.5/scand-120), new PVector (200, 30), "Que trabajador buscas?", 10);
  tx[1][0][1] = new Text(new PVector (width*.5/scand-100, height*.5/scand-70), new PVector (200, 30), "Sector del trabajo", 10);
  tx[2][0][0] = new Text(new PVector (10*scand, 10*scand+0*15*scand), new PVector (200, 30), "Que trabajador buscas?", 10);    //new PVector (30*scand, 30*scand+i*40*scand);
  tx[2][0][1] = new Text(new PVector  (10*scand, 10*scand+1*15*scand), new PVector (200, 30), "Sector del trabajo", 10);
  tx[1][1][0] = new Text(new PVector (width*.5/scand-100, height*.5/scand-180), new PVector (200, 30), "profesion", 10);
  tx[1][1][1]= new Text(new PVector (width*.5/scand-100, height*.5/scand-120), new PVector (200, 30), "ubicacion", 10);
  tx[1][1][2] = new Text(new PVector (width*.5/scand-100, height*.5/scand-60), new PVector (200, 30), "nombre", 10);
  tx[1][1][3] = new Text(new PVector (width*.5/scand-100, height*.5/scand-0), new PVector (200, 30), "cedula", 10);
  tx[1][1][4] = new Text(new PVector (width*.5/scand-100, height*.5/scand+60), new PVector (200, 30), "celular", 10);
  //String [] st = {"1", "2", "3", "4", "5"};
  //op[4][0][0] = new Option(new PVector (width*.5/scand-75, height*.5/scand-40), new PVector (30, 30), st, 31);

  for (int i=0; i<cl.length; i++) for (int j=0; j<cl[i].length; j++) for (int l=0; l<cl[i][j].length; l++) if (cl[i][j][l]!=null)  cl[i][j][l].textsize=14;
  for (int i=0; i<tx.length; i++) for (int j=0; j<tx[i].length; j++) for (int l=0; l<tx[i][j].length; l++) if (tx[i][j][l]!=null) tx[i][j][l].textsize=14;


  for (int i=0; i<cl.length; i++) for (int j=0; j<cl[i].length; j++) for (int l=0; l<cl[i][j].length; l++) if (cl[i][j][l]!=null)  cl[i][j][l].scaletoandroid(scand);
  for (int i=0; i<tx.length; i++) for (int j=0; j<tx[i].length; j++) for (int l=0; l<tx[i][j].length; l++) if (tx[i][j][l]!=null) tx[i][j][l].scaletoandroid(scand);
  for (int i=0; i<op.length; i++) for (int j=0; j<op[i].length; j++) for (int l=0; l<op[i][j].length; l++) if (op[i][j][l]!=null) op[i][j][l].scaletoandroid(scand);
}
void setupcltrab(Table seldetrab) {
  cltrab = new ArrayList <Click> ();
  for (int i=0; i<seldetrab.getRowCount(); i++) cltrab.add(new Click(new PVector (width*.5/scand-60, height*.5/scand), new PVector (120, 30), "", 20));
}
void drawin() {
  pushStyle();
  if (era==0) image(maleta, width/2-60*scand, height/2-200*scand, 120*scand, 100*scand);
  if (era==0) textAlign(CENTER, CENTER);
  if (era==0) fill(100);
  textSize(18*scand);
  if (era==0) text("chaucha", width/2, height/2-90*scand);
  for (int i=0; i<cl[era][tipo].length; i++) if (cl[era][tipo][i]!=null)  cl[era][tipo][i].display();
  for (int i=0; i<tx[era][tipo].length; i++) if (tx[era][tipo][i]!=null)  tx[era][tipo][i].display();
  for (int i=0; i<op[era][tipo].length; i++) if (op[era][tipo][i]!=null)  op[era][tipo][i].display();
  if (tipo==1) if (era==2) textSize(12*scand);
  if (tipo==1) if (era==2) fill(100);
  if (tipo==1) if (era==2)  textAlign(CENTER, CENTER);
  if (tipo==1) if (era==2) text("trabajador registrado con exito", width/2, height/2-90*scand);
  if (tipo==1) if (era==2) text("solo queda esperar", width/2, height/2-60*scand);
  popStyle();
}
void pressin() {
  for (int i=0; i<op[era][tipo].length; i++) if (op[era][tipo][i]!=null)  op[era][tipo][i].press();
  for (int i=0; i<tx[era][tipo].length; i++) if (tx[era][tipo][i]!=null)  tx[era][tipo][i].presson(); 
  for (int i=0; i<tx[era][tipo].length; i++) if (tx[era][tipo][i]!=null)  tx[era][tipo][i].pressoff();
  if (textisar(tx[era][tipo])&&!keybisopen) opkey();
  if (!textisar(tx[era][tipo])&&keybisopen) clkey();
  for (int i=0; i<cl[era][tipo].length; i++) if (cl[era][tipo][i]!=null)  cl[era][tipo][i].presson();   //apagar todos????? como apagar bien???
  {
    if (era==1&& cl[1][0][0].state) for (int i=0; i<tx[era][tipo].length; i++) if (tx[era][tipo][i]!=null) tx[era+1][tipo][i].itext = tx[era][tipo][i].itext;
    if (cl[1][1][0].state) {
      TableRow newRow = alltrab.addRow();        //downloadtableftp(boolean inandroid, String filename,String filetype,String filepathweb,String server, int port, String user, String pass){
      int idnum = alltrab.getRowCount();
      newRow.setInt("id", idnum);
      for (int i=0; i<tx[1][1].length; i++) newRow.setString(tx[1][1][i].name, tx[1][1][i].itext); // alltrab=downloadtableftp(inandroid, "trabajadores", "csv", "chaucha/", "files.000webhost.com", 21, "martinstacey", "elmascapo");
      uploadtableftp(alltrab, inandroid, "trabajadores", "csv", "chaucha/", "files.000webhost.com", 21, "martinstacey", "elmascapo");                            //uploadtableftp(Table table, boolean inandroid,String filename,String filetype, String filepathweb, String server, int port, String user, String pass) {
      era++;
    }
    if ( cl[4][0][1].state) {
      println("enviado");
      if (trabajadorselect !=-1) selper.get(trabajadorselect).cambiarcalif();
      if (trabajadorselect !=-1) selper.get(trabajadorselect).insertatabl();
      uploadtableftp(alltrab, inandroid, "trabajadores", "csv", "chaucha/", "files.000webhost.com", 21, "martinstacey", "elmascapo");
      era=1;
    }
    if ( cl[3][0][1].state)  era++;
    if (cl[1][0][0].state||cl[2][0][0].state) era=2;
    if (cl[1][0][0].state||cl[2][0][0].state) setupsel();
    if (cl[0][0][0].state) tipo = 0;
    if (cl[0][0][1].state) tipo = 1;
    if (cl[0][0][0].state||cl[0][0][1].state) era ++; //orden alreves

    if (cl[1][1][1].state||cl[2][1][0].state) tipo = 0;
    if (cl[1][1][1].state) era--;
    if (cl[1][0][1].state) era--;
    if ( cl[2][1][0].state)    era-=2;
    if (cl[2][0][1].state) era--;
    if ( cl[3][0][0].state) era --;
    if (cl[4][0][0].state) era--;
  }
  for (int i=0; i<cl.length; i++) for (int j=0; j<cl[i].length; j++) for (int l=0; l<cl[i][j].length; l++) if (cl[i][j][l]!=null)  cl[i][j][l].pressoff();
}
void typein() {
  for (int i=0; i<tx[era][tipo].length; i++) if (tx[era][tipo][i]!=null)  tx[era][tipo][i].type();
}
