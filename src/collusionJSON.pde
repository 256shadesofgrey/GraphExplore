import java.util.Iterator;

void selectAndLoadCollusion() {

    currentFilename = selectFile();

    if (currentFilename.endsWith("json")) {
        clearContent();
        loadCollusion(currentFilename);
    }
}



void loadCollusion(String filename) {

    String[] lines;
    JSONObject readJSON = null;
    JSONObject readJSON_2 = null;

    lines = loadStrings(filename);

    readJSON = loadJSONObject(lines[0]);

    Iterator it_1 = readJSON.keys().iterator();
    while (it_1.hasNext ()) {
        String key = (String) it_1.next();

        try {
            readJSON_2 = readJSON.getJSONObject(key);
        } 
        catch(Exception e) {
            println("JSON read exception");
        }
        try {
            readJSON_2 = readJSON_2.getJSONObject("referrers");
        } 
        catch(Exception e) {
            println("JSON read exception_2");
        }

        Iterator it_2 = readJSON_2.keys().iterator();
        while (it_2.hasNext ()) {
            String key_2 = (String) it_2.next();
            addEdge(key, key_2);
//            addEdge(key, "http://"+key+"/favicon.ico", key_2, "http://"+key_2+"/favicon.ico");

        }
    }
    
    graphCount++;
}
