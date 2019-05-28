import processing.net.*;

Server s;
Client c;

void setup() {
  size(800, 850, P2D);
  //fullScreen(P2D);
}

void joinGame() {
  c = new Client(this, "", 77777);
}

void startGame() {
  s = new Server(this, 77777);
}

void draw() {
  background(0, 128, 0);
}

//http://learningprocessing.com/examples/
