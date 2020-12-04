Table inventory;
public static ArrayList<Items> AllItemList = new ArrayList<Items>();

void setup() {
  inventory = loadTable("items.csv");

        for(int i = 0; i<inventory.getRowCount();++i){
            AllItemList.add(new Items(inventory.getString(i,0)/*,inventory.getInt(i,1),inventory.getInt(i,2)*/));
            System.out.println(AllItemList.get(AllItemList.size()-1).name);
        }
}
