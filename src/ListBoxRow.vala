using Granite.Widgets;

namespace RepositoriesManager {
public class ListBoxRow : Gtk.ListBoxRow {

    StackManager stackManager = StackManager.get_instance();

    private const int PROGRESS_BAR_HEIGHT = 5;
    private Settings settings = new Settings ("com.github.bartzaalberg.bookmark-manager");   
    private Gtk.Box vertical_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 6);
    
    public ListBoxRow (string repository){

        var splittedLine = repository.split(" ");

        var name_label = generateNameLabel(repository);
        var summary_label = generateSummaryLabel("Some Label");

        var enabledButton = new Gtk.CheckButton();
        
	    string firstCharacter = repository.substring (0, 1);
        stdout.printf(firstCharacter);

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

    public Gtk.Label generateSummaryLabel(string sshCommand){
        var summary_label = new Gtk.Label (sshCommand);
        summary_label.halign = Gtk.Align.START;

        return summary_label;
    }
}
}
