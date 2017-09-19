namespace RepositoriesManager {
public class ListBookmarks : Gtk.Grid {
       
   ListManager listManager = ListManager.get_instance();

   public ListBookmarks(){ 
       
        var box = new Gtk.Box (Gtk.Orientation.VERTICAL, 6);
        box.add(listManager.getList());
        
        var scrolledWindow = new Gtk.ScrolledWindow(null, null);
        scrolledWindow.hscrollbar_policy = Gtk.PolicyType.NEVER;        
        scrolledWindow.min_content_height = 300;
        scrolledWindow.add(box);
        
        var create_button = new Gtk.Button.with_label ("Create");
        create_button.get_style_context ().add_class (Gtk.STYLE_CLASS_SUGGESTED_ACTION);
        create_button.margin_right = 12;
        create_button.clicked.connect (() => {
            new AddRepository();
        });

        var edit_button = new Gtk.Button.with_label ("Edit");
        edit_button.clicked.connect (() => {
        });

        var button_box = new Gtk.ButtonBox (Gtk.Orientation.HORIZONTAL);
        button_box.set_layout (Gtk.ButtonBoxStyle.START);
        button_box.pack_start (create_button);
        button_box.pack_start (edit_button);
        button_box.margin = 12;

        this.attach (scrolledWindow, 0, 0, 1, 1);
        this.attach (button_box, 0, 1, 1, 1);
        
        this.show_all();
    }
}
}
