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
        for (int j = 0; j < ROWS.length; j++) {
            String[] CELLS = ROWS[j].split(";");
            for (int i = 2; i < CELLS.length; i++) {
              println(CELLS[0] + CELLS[1] + CELLS[2]);
            }
        }
    }
