using Granite.Widgets;

namespace BookmarkManager {
public class MainWindow : Gtk.Window{

    private Settings settings = new Settings ("com.github.bartzaalberg.bookmark-manager");

    private BookmarkListManager bookmarkListManager = BookmarkListManager.get_instance();
    private StackManager stackManager = StackManager.get_instance();

    construct {
        set_default_size(800, 510);
        set_size_request (800, 510);
        set_titlebar (new HeaderBar());
       
        stackManager.loadViews(this);

        bookmarkListManager.getList().getRepositories("");

        stackManager.getStack().visible_child_name = "list-view";

        if(settings.get_string ("sshname") == ""){
            stackManager.getStack().visible_child_name = "welcome-view";
        }
    }
}
}
