using Granite.Widgets;

namespace RepositoriesManager {
public class App:Granite.Application{

    public static MainWindow window = null;

    construct {
        application_id = Constants.APPLICATION_ID;
        program_name = Constants.APP_NAME;
        app_years = "2017-2018";
        exec_name = Constants.EXEC_NAME;
        app_launcher = Constants.DESKTOP_NAME;

        build_version = Constants.VERSION;
        app_icon = "com.github.bartzaalberg.repositories-manager";
        main_url = "https://github.com/bartzaalberg/repositories-manager";
        bug_url = "https://github.com/bartzaalberg/repositories-manager/issues";
    }

    protected override void activate () {
        new_window ();
    }

    public void new_window () {
        if (window != null) {
            window.present ();
            return;
        }

        window = new MainWindow (this);
        window.show_all ();
    }

    public static int main (string[] args) {
        var app = new RepositoriesManager.App ();
        return app.run (args);
    }
}
}

