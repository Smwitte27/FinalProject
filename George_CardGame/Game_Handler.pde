import java.util.Collections;

class Game {
  int numPlayers = 0;
  
  ArrayList<Player> players;
  
  boolean continuePlay = true;
  boolean inRound = false;

  int wildCard = 0;
  int upCard = 0;

  
  Game(ArrayList<String> names) {
    players = new ArrayList<Player>();

    for (String name : names) {
      players.add(new Player(name, names.indexOf(name)));
      
    }
  }
  
  public void newRound() {
  }
}


class Player {
  Hand hand = new Hand();
  TableTop table = new TableTop();
  
  PlayerFrame pf;

  String name = "";
  int seat = 0;

  Player(String n, int s) {
    name = n;
    seat = s;
    pf = new PlayerFrame(George_CardGame.this, 400, 400, name, seat);
  }

  public String getName() {
    return name;
  }

  public int getSeat() {
    return seat;
  }

  public void sortHand() {
    hand.sortHand(0);
  }

  public void sortHand(int i) {
    hand.sortHand(i);
  }

  public ArrayList<Card> getHand() {
    return hand.getCards();
  }

  public ArrayList<Card> getTable(Player other) {
    return other.table.getCards();
  }
}
