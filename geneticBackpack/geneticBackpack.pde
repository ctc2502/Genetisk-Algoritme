ArrayList<Items> Backpack;
DATA D = new DATA();

void setup() {
  
  
  Backpack = new ArrayList<Items>();
  D.loadData();
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
  
 String[] genes;
 
 String[] ITEM = new String[ROWS.length];
 int[] WEIGHT = new int[ROWS.length];
 int[] PRICE = new int[ROWS.length];
 
 DATA() {
   /* genes = new String[AllItemList.size()];
   for (int i = 0; i < genes.length; i++){
     genes[i] = (String) random(Items);
   } */
 }

 void loadData() {
        ROWS = loadStrings("items.csv");
        HEADERS = ROWS[0].split(";");
        for (int j = 1; j < ROWS.length-1; j++) {
            String[] CELLS = ROWS[j].split(";");
            ITEM[j-1] = CELLS[0];
            WEIGHT[j-1] = Integer.parseInt(CELLS[1]);
            PRICE[j-1] = Integer.parseInt(CELLS[2]);
            Backpack.add(new Items(ITEM[j-1], WEIGHT[j-1], PRICE[j-1]));
              println(ITEM[j-1] + " " + WEIGHT[j-1] + " " + PRICE[j-1]);
              println(Backpack.get(j-1));
            }
        }
  /*
   void calcFitness (String target) {
     int score = 0;
     for (int i = 0; i < genes.length; i++) {
        if (genes[i] == target.StringAt(i)) {
          score++;
        }
     }
     fitness = (float)score / (float)target.length();
  } */
}
  
