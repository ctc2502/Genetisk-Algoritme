Table inventory;
public static ArrayList<Items> AllItemList = new ArrayList<Items>();

String[] ROWS;
String[] HEADERS;

void setup() {
  inventory = loadTable("items.csv");
  loadData();

        for(int i = 0; i<inventory.getRowCount();++i){
            
            //System.out.println(AllItemList.get(AllItemList.size()-1).name);
        }
}

 void loadData() {
        ROWS = loadStrings("items.csv");
        HEADERS = ROWS[0].split(";");
        for (int j = 1; j < ROWS.length; j++) {
            String[] CELLS = ROWS[j].split(";");
            int WEIGHT = Integer.parseInt(CELLS[1]);
            int PRICE = Integer.parseInt(CELLS[2]);
              println(CELLS[0] + " " + WEIGHT + " " + PRICE);
            }
        }
