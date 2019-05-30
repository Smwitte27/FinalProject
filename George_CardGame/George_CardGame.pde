import controlP5.*;

import processing.net.*;
import g4p_controls.*;

ArrayList<String> names = new ArrayList<String>();
//ArrayList<Player> players = new ArrayList<Player>();

boolean startScreen = true;

ControlP5 cp5;

Server s;
Client c;

void setup() {
  size(700,400);
  noStroke();
  cp5 = new ControlP5(this);
  
  cp5.addSlider("SLIDER");
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
