namespace RepositoriesManager {
public class AddRepository : Gtk.Dialog {
  
    private ConfigFileReader configFileReader = new ConfigFileReader ();
    ListManager listManager = ListManager.get_instance();
    Gtk.Entry aptEntry;

    public AddRepository(){
        title = "Enter the complete APT line of the repository that you want to add as source.";
        var description = "The APT line includes the type, location and components of a repository, for example  'deb http://archive.ubuntu.com/ubuntu xenial main'.";
        set_default_size (630, 430);
        resizable = false;
 
        var image = new Gtk.Image.from_icon_name ("document-new", Gtk.IconSize.DIALOG);
        image.valign = Gtk.Align.START;

        var aptLabel = new Gtk.Label ("apt:");
        aptEntry = new Gtk.Entry ();
        aptEntry.set_placeholder_text ("deb http://archive.ubuntu.com/ubuntu xenial main");
        aptEntry.set_tooltip_text ("This is the link to the repository.");

        var primary_label = new Gtk.Label ("<b>%s</b>".printf (title));
        primary_label.use_markup = true;
        primary_label.selectable = true;
        primary_label.max_width_chars = 50;
        primary_label.wrap = true;
        primary_label.xalign = 0;

        var secondary_label = new Gtk.Label (description);
        secondary_label.use_markup = true;
        secondary_label.selectable = true;
        secondary_label.max_width_chars = 50;
        secondary_label.wrap = true;
        secondary_label.xalign = 0;

        var message_grid = new Gtk.Grid ();
        message_grid.column_spacing = 12;
        message_grid.row_spacing = 6;
        message_grid.margin_left = message_grid.margin_right = 12;
        message_grid.attach (image, 0, 0, 1, 2);
        message_grid.attach (primary_label, 1, 0, 1, 1);
        message_grid.attach (secondary_label, 1, 1, 1, 1);
        message_grid.attach (aptLabel, 0, 2, 1, 1);
        message_grid.attach (aptEntry, 1, 2, 1, 1);
        message_grid.show_all ();

        get_content_area ().add (message_grid);

        resizable = false;
        deletable =  false;
        skip_taskbar_hint = true;
        transient_for = null;
        
        var close_button = new Gtk.Button.with_label ("Close");
        close_button.margin_right = 12;
        close_button.clicked.connect (() => {
            this.destroy ();
        });

        var create_button = new Gtk.Button.with_label ("Create");
        create_button.get_style_context ().add_class (Gtk.STYLE_CLASS_SUGGESTED_ACTION);        
        create_button.clicked.connect (() => {
            createNewRepository();
        });

        var button_box = new Gtk.ButtonBox (Gtk.Orientation.HORIZONTAL);
        button_box.set_layout (Gtk.ButtonBoxStyle.END);
        button_box.pack_start (close_button);
        button_box.pack_end (create_button);
        button_box.margin = 12;
        button_box.margin_bottom = 0;

        get_content_area ().add (button_box);
        this.show_all ();
    }

    public void createNewRepository(){
        var repositories = configFileReader.getRepositories();

        if(isNotValid(aptEntry.text)){
            new Alert("Field is invalid", "The APT line includes the type, location and components of a repository, for example  'deb http://archive.ubuntu.com/ubuntu xenial main'.");
            return;
        }

        if(alreadyExists(aptEntry.text, repositories)){
            new Alert("This repository already exists", "Please choose a different name");
            return;
        }

        configFileReader.createNewFile(aptEntry.text);

        listManager.getList().getRepositories("");    
        this.destroy ();
    }

    public bool isNotValid(string inputField){
        if(inputField ==  ""){
            return true;
        }

        if(!("deb" in inputField) && !("deb-src" in inputField)){ 
            return true;
        }
        return false;
    }

    public bool alreadyExists(string newRepository, string[] repositories){
        foreach (string repository in repositories) {
           if(repository == newRepository) {
                return true;
           }
        }
        return false;
    }

}
}
