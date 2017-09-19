using Granite.Widgets;

namespace RepositoriesManager {
public class ConfigFileReader : Gtk.ListBox{

   public string[] getRepositories (){
        string[] repositories = new string[0];

        var general = getRepositoryFile("sources.list");

        File[] files = {};        

        var d = Dir.open("/etc/apt/sources.list.d");

        files += getRepositoryFile("sources.list");

        while ((name = d.read_name()) != null) {
            files += getRepositoryFile("sources.list.d/" + name);
        }

        foreach (File file in files) {
            try {
                // Open file for reading and wrap returned FileInputStream into a
                // DataInputStream, so we can read line by line
                var lines = new DataInputStream (file.read ());
                string line;

                // Read lines until end of file (null) is reached
                while ((line = lines.read_line (null)) != null) {
                    
                    if(line == ""){
                        continue;
                    }

                    if(!("deb" in line)){
                        continue;
                    }

                    repositories += line;
                }
            } catch (Error e) {
                error ("%s", e.message);
            }
        }

        return repositories;
    }

    private File getRepositoryFile(string fileName){
        
        var sourcesFolder = File.new_for_path ("/etc/apt");
        if (!sourcesFolder.query_exists ()) {
            try {
                sourcesFolder.make_directory ();
            } catch (Error e) {
                error ("%s", e.message);
            }
        }

        var file = File.new_for_path ("/etc/apt/" + fileName);
        if (!file.query_exists ()) {
            try {
                file.create (FileCreateFlags.REPLACE_DESTINATION, null);
                getRepositoryFile(fileName);
            } catch (Error e) {
                error ("%s", e.message);
            }
        }
        return file;
    }

    public void writeToFile(string[] repositories){
        var file = getRepositoryFile("sources.list");

        try {
            if(file.query_exists() == true){
                var repositoriesRaw = convertOtherSettingsToString(repositories);

                file.delete(null);
                FileOutputStream fos = file.create (FileCreateFlags.REPLACE_DESTINATION, null);
                DataOutputStream dos = new DataOutputStream (fos);
                
                dos.put_string (repositoriesRaw, null);
            }
        } catch (Error e) {
            stderr.printf ("Error: %s\n", e.message);
        }
    }

    private string convertOtherSettingsToString(string[] settings){
        string rawSettingsString = "";
        
        foreach (string setting in settings) {
            string rawSetting = setting + "\n";
            rawSettingsString += rawSetting;
        }

        rawSettingsString += "\n";
        return rawSettingsString;
    }
}
}
