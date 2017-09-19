using Granite.Widgets;

namespace RepositoriesManager {
public class MainWindow : Gtk.Window{

    private Settings settings = new Settings ("com.github.bartzaalberg.bookmark-manager");

    private ListManager listManager = ListManager.get_instance();
    private StackManager stackManager = StackManager.get_instance();

    construct {
        set_default_size(800, 510);
        set_size_request (800, 510);
        set_titlebar (new HeaderBar());
        set_resizable(false);

        stackManager.loadViews(this);

        listManager.getList().getRepositories("");

        stackManager.getStack().visible_child_name = "list-view";
    }
}
}
