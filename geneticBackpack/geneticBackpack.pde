ArrayList<Items> AllItemList;
DATA D = new DATA();

int TOTALSPACE = 24;

void setup() {
  AllItemList = new ArrayList<Items>();
  D.loadData();
  println(AllItemList.size());
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
  String[] ROWS;
  String[] HEADERS;
  
 String[] genes;
 
 String ITEM;
 int WEIGHT;
 int PRICE;
 
 DATA() {
   /* genes = new String[AllItemList.size()];
   for (int i = 0; i < genes.length; i++){
     genes[i] = (String) random(Items);
   } */
 }

 void loadData() {
        ROWS = loadStrings("items.csv");
        HEADERS = ROWS[0].split(";");
        for (int j = 1; j < ROWS.length; j++) {
            String[] CELLS = ROWS[j].split(";");
            ITEM = CELLS[0];
            WEIGHT = Integer.parseInt(CELLS[1]);
            PRICE = Integer.parseInt(CELLS[2]);
            AllItemList.add(new Items(ITEM, WEIGHT, PRICE));
              println(ITEM + " " + WEIGHT + " " + PRICE);
              //println(AllItemList.get(0));
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
  
