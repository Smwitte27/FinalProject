class Game {
  int numPlayers = 0;
  ArrayList<Player> players;
  boolean continuePlay = true;
  boolean inRound = false;
  
  Game(int p) {
    players = new ArrayList<Player>();
  }
}

class Round {
  int wildCard = 0;
  int upCard = 0;
  
  Round() {
  }
}

class Player {
}
