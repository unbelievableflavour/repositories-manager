using Granite.Widgets;

namespace RepositoriesManager {
public class HeaderBar : Gtk.HeaderBar {

    static HeaderBar? instance;

    ListManager listManager = ListManager.get_instance();
    Gtk.Button edit_button = new Gtk.Button.with_label ("Edit");    
    Gtk.Button delete_button = new Gtk.Button.with_label ("Delete");

    public HeaderBar(){

        //Granite.Widgets.Utils.set_color_primary (this, Constants.BRAND_COLOR);

        var searchEntry = new Gtk.SearchEntry ();
        searchEntry.set_placeholder_text("Search repositories");
        searchEntry.set_tooltip_text("Search for repositories");
        searchEntry.search_changed.connect (() => {
            listManager.getList().getRepositories(searchEntry.text); 
        });

        var create_button = new Gtk.Button.with_label ("Create");
        create_button.margin_end = 12;
        create_button.clicked.connect (() => {
            new AddRepository();
        });

        edit_button.set_sensitive(false);
        edit_button.margin_end = 12;
        edit_button.clicked.connect (() => {
            new EditRepository(listManager.getActiveRow());
        });

        delete_button.set_sensitive(false);
        delete_button.clicked.connect (() => {
            new DeleteConfirm(listManager.getActiveRow());
        });

        var button_box = new Gtk.ButtonBox (Gtk.Orientation.HORIZONTAL);
        button_box.set_layout (Gtk.ButtonBoxStyle.START);
        button_box.pack_start (create_button);
        button_box.pack_start (edit_button);
        button_box.pack_start (delete_button);
      
        this.show_close_button = true;

        this.pack_start (button_box);
        this.pack_end (searchEntry);

        this.show();
    }

    public static HeaderBar get_instance() {
        if (instance == null) {
            instance = new HeaderBar();
        }
        return instance;
    }

    public void setButtonsActive(){
        if(listManager.getActiveRow() != ""){
           edit_button.set_sensitive(true);
           delete_button.set_sensitive(true);
        }
    }
}
}
