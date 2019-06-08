import java.util.Collections;

class Game {
  int numPlayers = 0;
  int roundNumber = 0;
  int wildCard = 0;
  int upCard = 0;

  boolean continuePlay = true;
  
  ArrayList<Player> players;
  
  Round round;

  public Game(ArrayList<String> names) {
    players = new ArrayList<Player>();

    for (String name : names) {
      players.add(new Player(name, names.indexOf(name)));
    }
  }
  
  public int getWildCard() {
    return wildCard;
  }

  public void newRound() {
    
    if (roundNumber != 0) {
      for (Player p : players) {
        p.addPoints(round.getScore(p));
      }
    }
    roundNumber++;
    round = new Round(this, roundNumber);
  }
}


class Round {
  int roundNumber = 0;
  
  boolean roundRunning = true;
  
  ArrayList<Player> players;
  
  Game game;
  
  public Round(Game game, int num) {
    this.game = game;
    players = game.players;
    roundNumber = num;
  }
  
  //Calculates the players current score throughout round
  public void runningScore() {
    int score = 0;
    for (Player p : players) {
      score = 0;
      
      for (Card c : p.getHand()) {
        if (c.getRank() == 1 || c.getRank() == game.getWildCard()) {
          score -= 100;
        } else if (c.getRank() >= 10) {
          score -= 10;
        } else {
          score -= 5;
        }
      }
      
      for (Card c : p.getTable(p)) {
        if (c.getRank() == 1 || c.getRank() == game.getWildCard()) {
          score += 100;
        } else if (c.getRank() >= 10) {
          score += 10;
        } else {
          score += 5;
        }
      }
      
      p.updatePoints(score);
    }
  }
  
  public int getScore(Player p) {
    return p.getPoints();
  }
  
    public void endRound() {
    game.newRound();
  }
  
  //Check to see if anyone is out of cards, signalling the end of the round
  public void checkHands() {
    for (Player p : players) {
      if (p.getHand().size() == 0) {
        endRound();
      }
    }
  }
}



class Player {
  int roundPoints = 0;
  
  ArrayList<Integer> points = new ArrayList<Integer>();
  Hand hand = new Hand();
  TableTop table = new TableTop();

  PlayerFrame pf;

  String name = "";
  int seat = 0;

  public Player(String n, int s) {
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
  
  //Returns the cards currently in the players hand
  public ArrayList<Card> getHand() {
    return hand.getCards();
  }

  //Returns the cards laid down/played by the deesignated player
  public ArrayList<Card> getTable(Player other) {
    return other.table.getCards();
  }
  
  //Live point count for player during round
  public void updatePoints(int pointVal) {
    roundPoints = pointVal;
  }
  
  //Add points to arrayList after round
  public void addPoints(int pointVal) {
    points.add(pointVal);
  }
  
  //Returns total points from all rounds, including the current one
  public int getPoints() {
    int sum = 0;
    
    for (Integer pointVal : points) {
      sum += pointVal;
    }
    sum += roundPoints;
    return sum;
  }
}
