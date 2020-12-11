ArrayList<Items> Backpack;
PrintWriter OUTPUT;
DATA D = new DATA();

void setup() {
  Backpack = new ArrayList<Items>();
  OUTPUT = createWriter("data.txt");
  
  D.loadData();
  D.calcFitness();
}

void draw() {
 /* for (int i = 0; i < population.length; i++) {
    population[i].calcFitness(target);
  }

  ArrayList<DNA> matingPool = new ArrayList<DNA>(); 

  for (int i = 0; i < population.length; i++) {
    int nnnn = int(population[i].fitness * 100);
    for (int j = 0; j <nnnn; j++) {              
      matingPool.add(population[i]);
    } */
}

class DATA {
  String[] ROWS = new String[24];
  String[] HEADERS;
  
 String[] ITEM = new String[ROWS.length];
 int[] WEIGHT = new int[ROWS.length];
 int[] PRICE = new int[ROWS.length];
 
 int MAXWEIGHT;
 int FITNESS;
 int MASS;
 int BPNUM;
 
 int[] BACKPACK = new int[ROWS.length];
 
 
 
 DATA() {
  MAXWEIGHT = 2500;
  FITNESS = 0;
  MASS = 0;
  BPNUM = 0;
 }

 void loadData() {
        ROWS = loadStrings("items.csv");
        HEADERS = ROWS[0].split(";");
        for (int i = 1; i < ROWS.length; i++) {
            String[] CELLS = ROWS[i].split(";");
            ITEM[i-1] = CELLS[0];
            WEIGHT[i-1] = Integer.parseInt(CELLS[1]);
            PRICE[i-1] = Integer.parseInt(CELLS[2]);
            Backpack.add(new Items(ITEM[i-1], WEIGHT[i-1], PRICE[i-1]));
              println(ITEM[i-1] + " " + WEIGHT[i-1] + " " + PRICE[i-1]);
              println(Backpack.get(i-1));
            }
        }  
   void calcFitness () {
     for (int j=0; j < 10; j++){
       for (int i = 0; i < ITEM.length; i++) {
         float SORT = random(1);
         if (SORT > 0.5) {
           BACKPACK[i] = 1;
           MASS += WEIGHT[i];
           FITNESS += PRICE[i];
           BACKPACK[10] = FITNESS;
           BACKPACK[11] = MASS;
           if (MASS > MAXWEIGHT) {
             BACKPACK[10] = 0;
           }
         }
       }
       BPNUM++;
       printBP();
     }
     
     for (int i = 0; i < BACKPACK.length; i++) {
       BACKPACK[i] = 0;
     }
  }
  
  void printBP(){
    for (int i = 0; i < BACKPACK.length; i++) {
       OUTPUT.print(BACKPACK[i] + " ");
     }
     OUTPUT.println();
     OUTPUT.flush();
     if (BPNUM == 5) {
       OUTPUT.close();
     }
  }
}
  
