import controlP5.*;

import processing.net.*;
import g4p_controls.*;

ControlFrame cf;

ArrayList<String> names = new ArrayList<String>();
//ArrayList<Player> players = new ArrayList<Player>();

boolean startScreen = true;

Server s;
Client c;

void setup() {
  size(700,400);
  cf = new ControlFrame(this, 400, 800, "Table");
  noStroke();
}

void joinGame() {
  c = new Client(this, "", 77777);
}

void startGame() {
  s = new Server(this, 77777);
}

void draw() {
  background(0, 128, 0);
  
  if (names.isEmpty()) {
    
  }
}



//http://learningprocessing.com/examples/
