ArrayList<Items> Backpack;
 int[] BACKPACK = new int[15];
PrintWriter OUTPUT;
PImage BPIMAGE, NEGIMAGE;
DATA D = new DATA();

void setup() {
  size(1000, 1000);
  Backpack = new ArrayList<Items>();
  BPIMAGE = loadImage("matrixBp.png");
  BPIMAGE.resize(650,650);
  NEGIMAGE = loadImage("redMatrixBp.png");
  NEGIMAGE.resize(650,650);
  OUTPUT = createWriter("data.txt");
  textAlign(CENTER);
  frameRate(5);
  
  D.loadData();
  
}

void draw() {
    background(0);
    imageMode(CENTER);
    D.calcFitness();
    if (D.MASS < D.MAXWEIGHT) {
    image(BPIMAGE, width/2, height/2);
    } else {
    image(NEGIMAGE, width/2, height/2);
    }
    
}

class DATA {
  String[] ROWS = new String[BACKPACK.length-2 ];
  String[] HEADERS;
  
 String[] ITEM = new String[ROWS.length];
 int[] WEIGHT = new int[ROWS.length];
 int[] PRICE = new int[ROWS.length];
 
 int MAXWEIGHT;
 int FITNESS;
 int MASS;
 int BPNUM;
 
 DATA() {
  MAXWEIGHT = 5000;
  FITNESS = 0;
  MASS = 0;
  BPNUM = 0;
 }

 void loadData() {
        ROWS = loadStrings("items.csv");
        HEADERS = ROWS[0].split(";");
        for (int i = 1; i < BACKPACK.length-2; i++) {
            String[] CELLS = ROWS[i].split(";");
            ITEM[i-1] = CELLS[0];
            WEIGHT[i-1] = Integer.parseInt(CELLS[1]);
            PRICE[i-1] = Integer.parseInt(CELLS[2]);
            Backpack.add(new Items(ITEM[i-1], WEIGHT[i-1], PRICE[i-1]));
              //println(ITEM[i-1] + " " + WEIGHT[i-1] + " " + PRICE[i-1]);
              //println(Backpack.get(i-1));
            }
            
        }  
   void calcFitness () {
     FITNESS = 0;
     MASS = 0;
     
     for (int j=0; j < ITEM.length; j++){
       for (int i = 0; i < ITEM.length; i++) {
         
           float SORT = random(0,1);
         if (SORT < 0.05) {
           BACKPACK[i] = 1;
           MASS += WEIGHT[i];
           FITNESS += PRICE[i];
           BACKPACK[BACKPACK.length-1] = FITNESS;
           BACKPACK[BACKPACK.length-2] = MASS;
           println(MASS);
           if (MASS < MAXWEIGHT) {
             BACKPACK[BACKPACK.length-2] = MASS;
              fill(0,255,0);
             } else {
             fill(255,0,0);
             BACKPACK[BACKPACK.length-2] = 0;
             }
         }
       BPNUM++;
       printBP();
       }
     }
     for (int i = 0; i < BACKPACK.length; i++) {
       BACKPACK[i] = 0;
     }
  }
  
  void printBP(){
    clear();
    for (int i = 0; i < BACKPACK.length; i++) {
       OUTPUT.print(BACKPACK[i] + " ");
       textSize(50);
       text(BACKPACK[i], 75, 150+i*50);
     }
     
     OUTPUT.println();
     OUTPUT.flush();
     if (BPNUM == 10) {
       OUTPUT.close();
     }
  }
}
  
