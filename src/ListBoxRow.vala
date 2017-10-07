using Granite.Widgets;

namespace RepositoriesManager {
public class ListBoxRow : Gtk.ListBoxRow {

    private Gtk.Box vertical_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 6);
    public string debName;

    public ListBoxRow (string repository){
        
        debName = repository;

        var splittedLine = repository.split(" ");
        var filteredRepository = getFilteredArray(splittedLine);

        var name = filteredRepository[1];
        if(filteredRepository[0] == "deb-src"){
            name += " (Source Code)";
        }

        var name_label = generateNameLabel(name);
        var summary_label = generateSummaryLabel(filteredRepository);      

        var enabledButton = new Gtk.CheckButton();
        
	    string firstCharacter = repository.substring (0, 1);
        
        if(firstCharacter != "#"){
            enabledButton.active = true;
        }

        vertical_box.add (name_label);
        vertical_box.add (summary_label);
        
        var row = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 12);
        row.margin = 6;
        row.add(enabledButton);
        row.add (vertical_box);

        this.add (row);
        
    }

    public Gtk.Label generateNameLabel(string repository){
        var name_label = new Gtk.Label ("<b>%s</b>".printf (repository));
        name_label.use_markup = true;
        name_label.halign = Gtk.Align.START;

        return name_label;
    }

    public Gtk.Label generateSummaryLabel(string[] filteredRepository){
        var summary = filteredRepository[2];
        if(filteredRepository[3]!= null){
        summary += " " + filteredRepository[3];
        }

        if(filteredRepository[4]!= null){
        summary += " " + filteredRepository[4];
        }
        var summary_label = new Gtk.Label (summary);
        summary_label.halign = Gtk.Align.START;

        return summary_label;
    }

    public string[] getFilteredArray(string[] splittedLine){
        string[] filteredValue = {};
        foreach (string part in splittedLine) {
            if(part == ""){
                continue;  
            }          
            
            if(part == "#"){
                continue;  
            }
                
            if(part == "[arch=amd64]") {
                continue;
            }

            filteredValue += part;
        }
        return filteredValue;
    }
    
    public string getName(){
        return debName;
    }
}
}
