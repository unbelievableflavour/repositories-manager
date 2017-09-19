namespace RepositoriesManager {
public class AddRepository : Gtk.Dialog {
  
    ListManager listManager = ListManager.get_instance();

    public AddRepository(){
        title = "Enter the complete APT line of the repository that you want to add as source";
        set_default_size (630, 430);
        resizable = false;
 
        var image = new Gtk.Image.from_icon_name ("document-new", Gtk.IconSize.DIALOG);
        image.valign = Gtk.Align.START;

        var aptLabel = new Gtk.Label ("apt:");
        var aptEntry = new Gtk.Entry ();
        aptEntry.set_placeholder_text ("deb http://packages.linuxmint.com/ julia main");
        aptEntry.set_tooltip_text ("This is the link to the repository.");

        var primary_label = new Gtk.Label (title);
        primary_label.selectable = true;
        primary_label.max_width_chars = 50;
        primary_label.wrap = true;
        primary_label.xalign = 0;

        var secondary_label = new Gtk.Label ("The APT line includes the type, location and components of a repository, for example  'deb http://archive.ubuntu.com/ubuntu xenial main'.");
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
        close_button.clicked.connect (() => {
            this.destroy ();
        });

        var button_box = new Gtk.ButtonBox (Gtk.Orientation.HORIZONTAL);
        button_box.set_layout (Gtk.ButtonBoxStyle.END);
        button_box.pack_start (close_button);
        button_box.margin = 12;
        button_box.margin_bottom = 0;

        get_content_area ().add (button_box);
        this.show_all ();
    }



    public bool isNotValid(string inputField){
        if(inputField ==  ""){
            return true;
        }
        return false;
    }
}
}
