/// Load file
boolean loadfile;
String currentFilename;
String loadPath;

void fileSelected(File selection) {
  if (selection == null) {
    loadPath = null;
  } else {
    loadPath = selection.getAbsolutePath();
  }
}

String selectFile() {

    selectInput("Select file", "fileSelected");  // Opens file chooser

    loadfile = false;

    if (loadPath == null) {
        // If a file was not selected   

        return "-";
    } 
    else {
        // If a file was selected, print path to file
        if (loadPath.equals("\0")) {
            loadPath = "-";
        }
        return loadPath;
    }
}
