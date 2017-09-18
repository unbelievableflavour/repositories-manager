using Granite.Widgets;

namespace BookmarkManager {
public class ListBoxRow : Gtk.ListBoxRow {

    StackManager stackManager = StackManager.get_instance();

    private const int PROGRESS_BAR_HEIGHT = 5;
    private Settings settings = new Settings ("com.github.bartzaalberg.bookmark-manager"); 

 //   private Gtk.Image edit_image = new Gtk.Image.from_icon_name ("document-properties-symbolic", Gtk.IconSize.SMALL_TOOLBAR);
 //   private Gtk.Image delete_image = new Gtk.Image.from_icon_name ("edit-delete-symbolic", Gtk.IconSize.SMALL_TOOLBAR);

//    private Gtk.Image icon = new Gtk.Image.from_icon_name ("terminal", Gtk.IconSize.DND);        
    private Gtk.Box vertical_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 6);
    private Bookmark bookmark;
    
    public ListBoxRow (string repository){

        var splittedLine = repository.split(" ");

        //this.bookmark = bookmark;
        var name_label = generateNameLabel(repository);
        var summary_label = generateSummaryLabel("Some Label");

        var enabledButton = new Gtk.CheckButton();
        
        //var edit_button = generateEditButton(bookmark);
        //var delete_button = generateDeleteButton();

	    string firstCharacter = repository.substring (0, 1);
        stdout.printf(firstCharacter);

        if(firstCharacter != "#"){
            enabledButton.active = true;
        }

        vertical_box.add (name_label);
        vertical_box.add (summary_label);
        
        var bookmark_row = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 12);
        bookmark_row.margin = 6;
        bookmark_row.add(enabledButton);
        bookmark_row.add (vertical_box);
        //bookmark_row.pack_end (edit_button, false, false);
        //bookmark_row.pack_end (delete_button, false, false);

        this.add (bookmark_row);
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

//    public Gtk.EventBox generateDeleteButton(){
//        var delete_button = new Gtk.EventBox();
//        delete_button.add(delete_image);
//        delete_button.set_tooltip_text("Remote this bookmark");
//       delete_button.button_press_event.connect (() => {
//           new DeleteConfirm(bookmark);
//            return true;
//        });    
//
//        return delete_button;
//    }

//    public Gtk.EventBox generateEditButton(Bookmark bookmark){
//        var edit_button = new Gtk.EventBox();
//        edit_button.add(edit_image);
//        edit_button.set_tooltip_text("Edit this bookmark");
//        edit_button.button_press_event.connect (() => {
//            stackManager.setEditBookmark(bookmark);
//            stackManager.getStack().visible_child_name = "edit-bookmark-view";
//            return true;
//        });
//
//       return edit_button;
//    }
}
}
