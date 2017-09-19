using Granite.Widgets;

namespace RepositoriesManager {
public class HeaderBar : Gtk.HeaderBar {

    StackManager stackManager = StackManager.get_instance();
    ListManager listManager = ListManager.get_instance();
    
    public HeaderBar(){

        var searchEntry = new Gtk.SearchEntry ();
        searchEntry.set_placeholder_text("Search repositories");
        searchEntry.set_tooltip_text("Search for repositories");
        searchEntry.search_changed.connect (() => {
            listManager.getList().getRepositories(searchEntry.text); 
        });

        var settings_button = new Gtk.Button.from_icon_name ("document-properties", Gtk.IconSize.LARGE_TOOLBAR);
        settings_button.set_tooltip_text("Change your preferences");
        settings_button.clicked.connect (() => {
            new Preferences ();
        });

        Granite.Widgets.Utils.set_color_primary (this, Constants.BRAND_COLOR);
      
        this.show_close_button = true;
        //this.pack_start (add_button);
        this.pack_start (searchEntry);
        this.pack_end (settings_button);        
    }
}
}
