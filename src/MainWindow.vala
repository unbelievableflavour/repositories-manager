using Granite.Widgets;

namespace RepositoriesManager {
public class MainWindow : Gtk.Window{

    private ListManager listManager = ListManager.get_instance();
    private StackManager stackManager = StackManager.get_instance();
    private HeaderBar headerBar = HeaderBar.get_instance();

    public MainWindow (Gtk.Application application) {
        Object (application: application,
                resizable: true,
                height_request: 600,
                width_request: 610);
    }

    construct {
        set_titlebar (headerBar);

        stackManager.loadViews(this);

        listManager.getList().getRepositories("");

        stackManager.getStack().visible_child_name = "list-view";

        addShortcuts();
    }

    private void addShortcuts(){
            key_press_event.connect ((e) => {
                switch (e.keyval) {
                    case Gdk.Key.q:
                      if ((e.state & Gdk.ModifierType.CONTROL_MASK) != 0) {
                        this.destroy ();
                      }
                      break;
                }

                return false;
            });
        }
}
}
