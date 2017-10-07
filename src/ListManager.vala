namespace RepositoriesManager {
public class ListManager : Object {
    
    static ListManager? instance;

    private ListBox listBox;
    private string activeRow;

    // Private constructor
    ListManager() {
        listBox = new ListBox ();
        activeRow = "";
    }
 
    // Public constructor
    public static ListManager get_instance() {
        if (instance == null) {
            instance = new ListManager();
        }
        return instance;
    }

    public ListBox getList() {
        return this.listBox;
    }

    public string getActiveRow() {
        return this.activeRow;
    }

    public void setActiveRow(string row) {
        this.activeRow = row;
    }
}
}
