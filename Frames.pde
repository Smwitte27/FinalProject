class ControlFrame extends PApplet {

  int w, h;
  String name;

  PApplet parent;
  ControlP5 cp5;

  public ControlFrame(PApplet _parent, int _w, int _h, String _name) {
    super();   
    parent = _parent;
    w=_w;
    h=_h;
    name = _name;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(w, h);
  }

  public void setup() {
    surface.setLocation(10, 10);
    cp5 = new ControlP5(this);

    cp5.addToggle("auto")
      .plugTo(parent, "auto")
      .setPosition(10, 70)
      .setSize(50, 50)
      .setValue(true);

    cp5.addKnob("blend")
      .plugTo(parent, "c3")
      .setPosition(100, 300)
      .setSize(200, 200)
      .setRange(0, 255)
      .setValue(200);

    cp5.addNumberbox("color-red")
      .plugTo(parent, "c0")
      .setRange(0, 255)
      .setValue(255)
      .setPosition(100, 10)
      .setSize(100, 20);

    cp5.addNumberbox("color-green")
      .plugTo(parent, "c1")
      .setRange(0, 255)
      .setValue(128)
      .setPosition(100, 70)
      .setSize(100, 20);

    cp5.addNumberbox("color-blue")
      .plugTo(parent, "c2")
      .setRange(0, 255)
      .setValue(0)
      .setPosition(100, 130)
      .setSize(100, 20);

    cp5.addSlider("speed")
      .plugTo(parent, "speed")
      .setRange(0, 0.1)
      .setValue(0.01)
      .setPosition(100, 240)
      .setSize(200, 30);
  }

  void draw() {
    background(190);
  }
}

class PlayerFrame extends PApplet {
  int w, h, seat;
  String name;
  PFont font;

  PApplet parent;
  ControlP5 cp5;

  public PlayerFrame(PApplet _parent, int _w, int _h, String _name, int _seat) {
    super();   
    parent = _parent;
    w=_w;
    h=_h;
    name = _name;
    seat = _seat;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(w, h);
  }

  public void setup() {
    surface.setLocation(10, 10);
    font = createFont("Arial", 40);
    cp5 = new ControlP5(this);

    cp5.addTextlabel("Player " + seat + ": " + name)
      .plugTo(parent, "Label")
      .setText("Player " + seat + ": " + name)
      .setFont(font)
      .setWidth(300)
      .setPosition(w/2 - 150, 25);
  }

  void draw() {
    background(0, 128, 0);
  }
}
