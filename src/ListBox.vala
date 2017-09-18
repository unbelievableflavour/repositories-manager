using Granite.Widgets;

namespace BookmarkManager {
public class ListBox : Gtk.ListBox{

    private ConfigFileReader configFileReader = new ConfigFileReader ();
    private StackManager stackManager = StackManager.get_instance();

    public void empty(){
        this.foreach ((ListBoxRow) => {
            this.remove(ListBoxRow);
        }); 
    }

    public void getRepositories(string searchWord = ""){
        this.empty();

        stackManager.getStack().visible_child_name = "list-view";

        var repositories = configFileReader.getRepositories();

        if(listisEmpty(repositories)) {
            stackManager.getStack().visible_child_name = "empty-view";
            return;
        }

        if(searchWordDoesntMatchAnyInList(searchWord, repositories)) {
            stackManager.getStack().visible_child_name = "not-found-view";
            return;
        }

        foreach (string repository in repositories) {
            if(searchWord == ""){
                this.add (new ListBoxRow (repository));
                continue;
            }

            if(searchWord in repository){             
                this.add (new ListBoxRow (repository));
            }
        }

        this.show_all();
    }

    private bool listisEmpty(string[] repositories){
        return repositories.length == 0;    
    }

    private bool searchWordDoesntMatchAnyInList(string searchWord, string[] repositories){
        int matchCount = 0;
        
        if(searchWord == ""){
            return false;
        }

        foreach (string repository in repositories) {
            if(searchWord in repository){
                matchCount++;                
            }
        }
        return matchCount == 0;    
    }
}
}
