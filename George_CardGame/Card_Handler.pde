class Card implements Comparable<Card> {
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
  
  Card() {
  }
  
  public int getRank() {
    return rank;
  }
  
  int compareTo(Card other) {
    return this.getRank() - other.getRank();
  }
  
  public String toString() {
    return names[rank] + " of " + suit;
  }
}



abstract class Deck {
  ArrayList<Card> cards;
  
  public Card drawCard() {
    Card c = cards.get(int(random(cards.size())));
    cards.remove(cards.indexOf(c));
    return c;
  }
  
   public void drawCard(Deck other){
     cards.add(other.drawCard());
   }
   
   public ArrayList<Card> getCards() {
     return cards;
   }
}



class DeltDeck extends Deck {
  int decks;
  
  DeltDeck() {
    cards = new ArrayList<Card>();
  }
  
  DeltDeck(int p) {
    cards = new ArrayList<Card>();
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
  
  public ArrayList<Card> deal() {
    Card topCard = drawCard();
    ArrayList<Card> hand = new ArrayList<Card>();
    hand.add(topCard);
    
    for (int i=topCard.getRank(); i > 1; i--) {
      hand.add(drawCard());
    }
    return hand;
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

class Stock extends Deck{
  
  Stock(Deck toAdd) {
    cards = toAdd.getCards();
  }
}

class Hand extends Deck{
  
  Hand() {
  }
  
  //Sorting method for players hand, int determines how to sort
  public void sortHand(int i) {
  }
}

class DiscardPile extends Deck{
  
  DiscardPile() {
  }
}

class TableTop extends Deck{
  
  TableTop() {
  }
}
