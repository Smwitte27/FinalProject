import java.util.Collections;

class Game {
  int numPlayers = 0;
  ArrayList<Player> players;
  boolean continuePlay = true;
  boolean inRound = false;
  
  int wildCard = 0;
  int upCard = 0;
  
  Game(int p) {
    players = new ArrayList<Player>();
    
  }
}


class Player {
  Hand hand = new Hand();
  TableTop table = new TableTop();
  
  String name = "";
  int seat = 0;
  
  Player(String n, int s) {
    name = n;
    seat = s;
  }
  
  public String getName() {
    return name;
  }
  
  public int getSeat() {
    return seat;
  }
  
  public void sortHand() {
    Collections.sort(hand);
  }
  
  public ArrayList<Card> getHand() {
    return hand.getCards();
  }
  
  public ArrayList<Card> getTable() {
    return table.getCards();
  }
}
