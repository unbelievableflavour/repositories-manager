namespace RepositoriesManager {
public class App {

    public static int main(string[] args) {

        string option = args[1];
        string name = args[2];
        string newRepository = args[3];

        if(option == "remove"){
           deletePackage(name);
           return 0;
        }

        if(option == "add"){
           addPackage(name);
           return 0;
        }

        if(option == "edit"){
           editPackage(name, newRepository);
           return 0;
        }

        return 0;
    }

    public static void deletePackage(string repository) {
        var splittedLine = repository.split(" ");
        var filteredRepository = getFilteredArray(splittedLine);

        var file = File.new_for_path("/etc/apt/sources.list.d/" + filteredRepository[1] + ".list");
    
        try {
            if(file.query_exists() == true){
                file.delete(null);            
            }
        } catch (Error e) {
            stdout.printf("An error occured" + e.message);
        }
    }

    public static void addPackage(string repository) {
        var splittedLine = repository.split(" ");
        var filteredRepository = getFilteredArray(splittedLine);

        var file = File.new_for_path("/etc/apt/sources.list.d/" + filteredRepository[1] + ".list");
    
        try {
            if(file.query_exists() == true){
                stdout.printf("Error: The file already exists");
            }

            FileOutputStream fos = file.create (FileCreateFlags.REPLACE_DESTINATION, null);
            DataOutputStream dos = new DataOutputStream (fos);
            
            dos.put_string (repository, null);
            
        } catch (Error e) {
            stdout.printf("An error occured" + e.message);
        }
    }

    public static void editPackage(string oldRepository, string newRepository) {
        var splittedLine = oldRepository.split(" "); 
        var filteredRepository = getFilteredArray(splittedLine); 
 
        var file = File.new_for_path("/etc/apt/sources.list.d/" + filteredRepository[1] + ".list"); 
     
        try { 
            if(file.query_exists() == true){ 
                file.delete(null);             
                FileOutputStream fos = file.create (FileCreateFlags.REPLACE_DESTINATION, null); 
                DataOutputStream dos = new DataOutputStream (fos); 
 
                dos.put_string (newRepository, null); 
            } 
        } catch (Error e) { 
            stdout.printf("An error occured" + e.message);
        }
    }

    public static string[] getFilteredArray(string[] splittedLine){
        string[] filteredValue = {};
        foreach (string part in splittedLine) {
            if(part == ""){
                continue;  
            }          
            
            if(part == "#"){
                continue;  
            }
                
            if(part == "[arch=amd64]") {
                continue;
            }

            filteredValue += part;
        }
        return filteredValue;
    }
}
}

