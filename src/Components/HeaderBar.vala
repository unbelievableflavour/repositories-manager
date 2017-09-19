using Granite.Widgets;

namespace RepositoriesManager {
public class HeaderBar : Gtk.HeaderBar {

    StackManager stackManager = StackManager.get_instance();
    ListManager listManager = ListManager.get_instance();
    
    public HeaderBar(){

        //Granite.Widgets.Utils.set_color_primary (this, Constants.BRAND_COLOR);

        var searchEntry = new Gtk.SearchEntry ();
        searchEntry.set_placeholder_text("Search repositories");
        searchEntry.set_tooltip_text("Search for repositories");
        searchEntry.search_changed.connect (() => {
            listManager.getList().getRepositories(searchEntry.text); 
        });

        var create_button = new Gtk.Button.with_label ("Create");
        create_button.margin_right = 12;
        create_button.clicked.connect (() => {
            new AddRepository();
        });

        var edit_button = new Gtk.Button.with_label ("Edit");
        edit_button.set_sensitive(false);
        edit_button.clicked.connect (() => {
        });

        var button_box = new Gtk.ButtonBox (Gtk.Orientation.HORIZONTAL);
        button_box.set_layout (Gtk.ButtonBoxStyle.START);
        button_box.pack_start (create_button);
        button_box.pack_start (edit_button);
      
        this.show_close_button = true;

        this.pack_start (button_box);
        this.pack_end (searchEntry);
    }
}
}
