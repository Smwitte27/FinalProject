class Card {
  int rank = 0;
  String suit = null;
  
  String[] names = {"Null", "Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"};
  String[] suits = {"Null", "Diamonds", "Clubs", "Hearts", "Spades"};
  
  Card(int r, String s) {
    rank = r;
    suit = s;
  }
  
  Card(int r, int s) {
    rank = r;
    suit = suits[s];
  }
  
  public int getRank() {
    return rank;
  }
  
  public String toString() {
    return names[rank] + " of " + suit;
  }
}


class DrawPile {
  int decks;
  ArrayList<Card> cards = new ArrayList<Card>();
  
  DrawPile(int p) {
    getNumDecks(p);
    
    for (int d=decks; d > 0; d--) {
      for (int s=1; s <= 4; s++) {
        for (int r=1; r <= 52; r++) {
          if (r != 2) {
          cards.add(new Card(s, r));
          }
        }
      }
    }
  }
  
  public Card[] deal() {
    Card topCard = drawCard();
    Card[] hand = new Card[topCard.getRank()];
    hand[0] = topCard;
    
    for (int i=topCard.getRank(); i > 1; i--) {
      hand[i] = drawCard();
    }
    return hand;
  }
  
  public Card drawCard() {
      Card c = cards.get(int(random(cards.size())));
      cards.remove(cards.indexOf(c));
      
      return c;
  }
  
  void shuffle() {
    ArrayList<Card> temp = cards;
    
    for (Card c : cards) {
      c = temp.get(int(random(temp.size())));
      temp.remove(temp.indexOf(c));
    }
    
    for (int i=0; i < cards.size(); i++) {
      int card1 = int(random(cards.size()));
      int card2 = int(random(cards.size()));
      
      Card heldCard = cards.get(card1);
      cards.set(card1, cards.get(card2));
      cards.set(card2, heldCard);
    }
  }
  
  void getNumDecks(int p) {
    for (int i=p; i > 0; i = i-4) {
      decks++;
    }
  }
}
