import java.util.*;
//VARIABLES
int startx, starty;
Boolean press;
Turtle t1, t2, t3, t4, t5;
List<Turtle> turtleList;
int tile, page;
class Turtle{
  public String name;
  public PImage image;
  public PImage map;
  public PImage more;
  public String description;
  public String latin;
  public String occurrence;
  public String food;
  public String life;
  
  Turtle(String _name, String path, String path_more, String _d , String _l, String path_map, String _o, String _f, String _li){
    name = _name;
    image = loadImage(path);
    map = loadImage(path_map);
    more = loadImage(path_more);
    description = _d;
    latin = _l;
    occurrence = _o;
    food = _f;
    life = _li;
  }
  void displayIcon(){
       image.resize(990,480);
       image(image, 50,800);
     }
  void displayMap(){
       map.resize(990,480);
       image(map, 50,600);
     }
   void displayMore(){
     fill(#FFDCF7);
     rect(20, 570, 1050, 635,30);
     more.resize(990,580);
     image(more, 50,600);
   }
  
}
void initTurtleList(){
  t1 = new Turtle("Horsfield's \ntortoise", "stepowy.png" ,"stepowy_more.jpg", "Tortoise of size around \n13-15cm. Light brown \nshell with darker spots. \nFour claws on each leg.", "(Testudo horsfieldii)","stepowy_map.png", "Eurasian Steppe", "grass,\ntwigs and flowers", "~50 years");
  t2 = new Turtle("European \npond turtle", "blotny.png" ,"pond_more.jpg", "Olive, brown or black \nin colour with yellow spots \nand streaks on the shell \nand skin. Medium sized, \n12-38cm.", "(Emys orbicularis)","blotny_map1.png", "South and middle Europe,\nwestern Asia and north \nAfrica", "\nwater insects, snails, \nsmall fish", "~100 years");
  t3 = new Turtle("Flatback \nsea turtle", "flatback.png","flatback_more.jpg", "Smooth flat-domed shell \nof length ranging from 76 to \n96 cm and weighs from \n70 to 90 kg.", "(Natator depressus)", "flatback_map.png", "Sandy beaches and shallow \ncoastal waters of the \nAustralian continental shelf", "Soft corals, \nsea cucumbers, shrimp, \njellyfish and mollusks", "~80 years");
  t4 = new Turtle("Pig-nosed \nturtle", "pignose.png", "pig_more.jpg", "The feet are flippers, \nthe nose looks like that of \na pig. The carapace is grey \nor olive, with a leathery \ntexture.", "(Carettochelys insculpta)", "pignose_map.png", "Freshwater of Northern \nAustralia and southern \nNew Guinea", "Flowers, \nfruit and leaves of figs, \nmolluscs and insects", "25-30 years");
  t5 = new Turtle("West African \nmud turtle", "mud.png","west_more.jpg", "Beige, brown or black shell \nof length up to 25cm. \nEndearing expression due \nto its smile :)", "(Pelusios castaneus)", "west_map.png", "Freshwater species \nendemic to West and \nCentral Africa", "Crayfish, \nmollusks, aquatic insects \nand seeds", "40-50 years");
  turtleList = Arrays.asList(t1,t2,t3,t4, t5);
}
void setup() {
  fullScreen();
  noStroke();
  fill(255);
  initTurtleList();
  press = false;
  tile = 0;
  page = 0;
  
}

void draw() {
  background(#73C3BC);
  Turtle current = turtleList.get(tile);
  if(page == 0){
    textSize(150);
    text(current.name, 70, 300);
    textSize(80);
    text(current.latin, 70, 650);
    current.displayIcon();
    textSize(80);
    text(current.description,50, 1600);
  }
  else if(page == 1){
    textSize(150);
    text("Occurrence", 50, 300);
    current.displayMap();
    textSize(80);
    text(current.occurrence,50,1600);
  }
  else if(page == 2){
    textSize(150);
    text("More info", 70, 300);
    current.displayMore();
    fill(255);
    textSize(80);
    text("Favourite food: " + current.food,50,1500);
    text("Lifespan: " + current.life,50,1800);
  }
}

void mousePressed(){
  if(press == false){
      startx = mouseX;
      starty = mouseY;
      press = true;
      }
    circle(mouseX, mouseY, 10);
}

//DETECTING SWIPES
void mouseReleased(){
  if(startx - mouseX< -300){
    if(tile == 0){
      tile =4;
    }
    else{
      tile -=1;
    }
    page = 0;
  }
  else if(startx - mouseX > 300){
    if(tile == 4){
      tile = 0;
    }
    else{
      tile +=1;
    }
    page = 0;
  }
  else if(starty - mouseY< -300){ //w dol
    if(page == 0){
      page = 2;
    }
    else{
      page -=1;
    }
  }
  else if(starty - mouseY > 300){ //w gore
    if(page == 2){
      page = 0;
    }
    else{
      page +=1;
    }
  }
  press = false;
}
