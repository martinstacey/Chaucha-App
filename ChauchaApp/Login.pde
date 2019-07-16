Mlogin login;
String [] txlogintx = {"", ""};

void setuplo() {
  //Table users=downloadtableftp(inandroid,"users","csv","Usuarios/","files.000webhost.com", 21, "martinstacey", "elmascapo");
  //login = new Mlogin(users,inandroid);
  //login.scaletoandroid();
}
void drawlo() {
  //if (era==0) login.display();
}
void presslo() {
  //if (era==0) login.press();
}
void typelo() {
  //if (era==0) login.type();
}
class Mlogin {
  ArrayList <Text> txlogin  ;
  ArrayList <Click> bulogin  ;
  ArrayList <Text> txsign  ;
  ArrayList <Click> busign ;
  int logsign;
  Table users;
  boolean inandroid = false;

  Mlogin(Table _users,boolean _inandroid) {
    txlogin = new ArrayList <Text> ();
    bulogin = new ArrayList <Click> ();
    txsign = new ArrayList <Text> ();
    busign = new ArrayList <Click> ();
    inandroid = _inandroid;
    logsign = 0;
    users = _users;
    txlogin.add(new Text(new PVector((width*.5)/scand-100, (height*.4)/scand-30), new PVector(200, 15), "email",   10));
    txlogin.add(new Text(new PVector((width*.5)/scand-100, ((height*.4)/scand)), new PVector(200, 15), "password",  20));
    bulogin.add(new Click (new PVector((width*.5)/scand-65, ((height*.4)/scand)+50), new PVector (130, 30), "log in", 21));
    bulogin.add(new Click (new PVector((width*.5)/scand-65, height*.9/scand), new PVector (130, 30), "sign up", 40));
    txsign.add(new Text(new PVector((width*.5)/scand-100, ((height*.2)/scand)-10), new PVector(200, 15), "email", 10));
    txsign.add(new Text(new PVector((width*.5)/scand-100, ((height*.2)/scand)+20), new PVector(200, 15),  "nickname",  10));
    txsign.add(new Text(new PVector((width*.5)/scand-100, ((height*.2)/scand)+50), new PVector(200, 15),  "password", 20));
    txsign.add(new Text(new PVector((width*.5)/scand-100, ((height*.2)/scand)+80), new PVector(200, 15),  "repeat password",  20));
    busign.add(new Click (new PVector((width*.5)/scand-65, ((height*.2)/scand)+130), new PVector (130, 30), "sign in",  40));
    busign.add(new Click (new PVector((width*.1)/scand-65, height*.9/scand), new PVector (130, 30), "back", 40));
  }
  void scaletoandroid() {
    for (int i=0; i<txlogin.size(); i++) txlogin.get(i).scaletoandroid(scand);
    for (int i=0; i<bulogin.size(); i++) bulogin.get(i).scaletoandroid(scand);
    for (int i=0; i<txsign.size(); i++) txsign.get(i).scaletoandroid(scand);
    for (int i=0; i<busign.size(); i++) busign.get(i).scaletoandroid(scand);
  }
  void display() {
      if (logsign==0) for (Text t : txlogin) t.display();
      if (logsign==0) for (Click c : bulogin) c.display();
      if (logsign==1) for (Text t : txsign) t.display();
      if (logsign==1) for (Click c : busign) c.display();
  }
  void press() {
      if (logsign==0) {
        for (Text t : txlogin) t.pressoff();
        for (Text t : txlogin) t.presson();
        if (textis(txlogin)&&!keybisopen) opkey();
        if (!textis(txlogin)&&keybisopen) clkey();
        for (Click c : bulogin) c.presson();
        if (bulogin.get(0).state) if (checkontable()) era =1;
        if (bulogin.get(1).state) logsign=1;
      }
      if (logsign==1) {
        for (Text t : txsign) t.pressoff();
        for (Text t : txsign) t.presson();
        if (textis(txsign)&&!keybisopen) opkey();
        if (!textis(txsign)&&keybisopen) clkey();
        for (Click c : busign) c.presson();
        if (busign.get(0).state) {
          if (txequal(txsign.get(2).itext, txsign.get(3).itext)) if (!useralreadyexists(users, txsign.get(0).itext)) {
            addtotable();
            savetotable();
            era =1;
          }
        }
        if (busign.get(1).state) logsign =0;
      }
      for (Click c : bulogin) c.pressoff();
      for (Click c : busign) c.pressoff();
  }
  void type() {
      for (Text t : txlogin) t.type();
      for (Text t : txsign) t.type();
  }

  boolean checkontable() {
    boolean bout = false;
    for (int i=0; i<users.getRowCount(); i++) {
      if (txequal(users.getString(i, "email"), txlogin.get(0).itext)) {
        if (txequal(users.getString(i, "password"), txlogin.get(1).itext)) bout =true;
      }
    }
    return bout;
  }
  void addtotable() {
    TableRow newRow = users.addRow();
    newRow.setString("email", txsign.get(0).itext);
    newRow.setString("nickname", txsign.get(1).itext);
    newRow.setString("password", txsign.get(2).itext);
  }
  void savetotable() {
    uploadtableftp(users,inandroid,"users","csv","Usuarios/","files.000webhost.com", 21, "martinstacey", "elmascapo");
  }
  boolean txequal(String a, String b) {
    int al= a.length();
    int bl= b.length();
    int minl;
    boolean bout = true;
    if (al!=bl) bout = false;
    if (al<bl) minl = al;
    else minl = bl;
    for (int i=0; i<minl; i++) if (a.charAt(i)!=b.charAt(i)) bout = false; 
    return bout;
  }
  boolean useralreadyexists(Table usersin, String newemail) {
    boolean bout = false;
    for (int i=0; i<usersin.getRowCount(); i++) if (txequal(usersin.getString(i, "email"), newemail)) bout=true;  
    return bout;
  }
}
