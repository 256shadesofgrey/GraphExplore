import processing.opengl.*;

boolean render = true;
float degOffset = 0.0;
float circleRadius;
int relaxValue;
int heavyOrderNumber;

/// Color propertities
color textFloatColor   = #00ff00; 
color textDefaultColor = #ffff00;

color nodeColor   = #ffffff;    // #F0C070
color selectColor = #FF3030;
color fixedColor  = #FF8080;
color edgeColor   = #000000;

/// Document font
PFont font;
PFont menuFont;
/// Load an image 
PShape s;

////////////////////////////////////////////////////////////

///
/// Setup the program.
///
void setup() {
    size(1280, 720, OPENGL);

    circleRadius = height/2;

    frameRate(100);

    graphCount = 0;
    heavyOrderNumber = 10;
    currentFilename = "c-fat200-1.clq";

    loadDIMACS_CLQ(currentFilename);

    menuFont = createFont("Helvetica-29", 29);
    font = createFont("SansSerif", 18);
    textFont(font);

    s = loadShape("bot.jpg");

    //   lights();
    smooth();
}

void draw() {

    if (loadfile) {
        selectAndLoadCLQ();
    }

    if (render) {
        background( 200, 120, 0);

        if (edgeCount > 10000) {
            relaxValue = 5;
        }
        else {
            relaxValue = 2;
        }

        for (int i = 0; i < edgeCount; i++) edges[i].relax();
        for (int i = 0; i < nodeCount; i++) nodes[i].relax();

        for (int i = 0; i < nodeCount; i++) nodes[i].update(relaxValue);

        for (int i = 0; i < edgeCount; i++) edges[i].draw();
        for (int i = 0; i < nodeCount; i++) nodes[i].draw();

        if (selection != null) {
            for (int i = 0; i < edgeCount; i++) {
                if (edges[i].from.isEqual(selection)) {
                    edges[i].draw();
                }
            }
            selection.draw();
        }
    }


    ///key
fill(textDefaultColor);
    textFont(menuFont);

    textAlign(LEFT);
    text(currentFilename, 20, 40);
    text(heavyOrderNumber, 20, 75);
}
