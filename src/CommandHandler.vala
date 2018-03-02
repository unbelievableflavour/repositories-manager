namespace RepositoriesManager {
public class CommandHandler : Object {

    string[] env = Environ.get ();
    string homeDir = Environment.get_home_dir ();

    public void deleteRepo(string repository) {
        spawnAsync("remove", repository);
    }

    public void editRepo( string oldRepository, string newRepository) {
        spawnAsync("edit", oldRepository, newRepository);
    }

    public void addRepo(string repository) {
        spawnAsync("add", repository);
    }

    public void spawnAsync(string option, string name, string extraOption = ""){

        MainLoop loop = new MainLoop ();

        string[] arguments = {
            "pkexec",
            "env",
            "HOME=" + homeDir,
            "com.github.bartzaalberg.repositories-wizard",
            option,
            name,
            extraOption
        };

        Pid child_pid;

        try {
            Process.spawn_async ("/",
    			arguments,
    			env,
    			SpawnFlags.SEARCH_PATH | SpawnFlags.DO_NOT_REAP_CHILD,
    			null,
    			out child_pid);

            //ChildWatch.add (child_pid, (pid, status) => {
			//   Process.close_pid (pid);
			//    loop.quit ();
            //   ListBox listBox = ListBox.get_instance();
            //    listBox.getInstalledPackages();
		    //});

        } catch (SpawnError e) {
            new Alert("There was an error spawning the process. Details", e.message);
        }
    }
}
}
