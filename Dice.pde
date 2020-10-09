int sum; //total of all dice
int avg; //keeps total even after click resets total, to find average
int timesRolled; //to find average
//outside class b/c we're counted total for all dice, not per die
class Dice {
  //define variables
   int myRoll, myX, myY, mySize;

//constructor - the initializer for objects
//dont change the vars in the constructor  
  Dice () {
    //initialize all ur vars
    myX = 0;
    myY = 0;
    myRoll = 0; //current roll # (1-6)
    mySize = 0; //size of dice
  }
  
//member function
//seperate different fucntions, dont put too many things in one function
//what the obejct does
  public int roll(){
    //roll the random dice num
    myRoll = (int)((Math.random()*6)+1);
    return myRoll;
    //System.out.println(myRoll);
  }
  
  void show(int x, int y, int side, int roll) {
    //draw the white die (no dots)
    mySize = side;
    rect(x, y, side, side, 10);
    //draw the dots
    if (roll == 1) {
      fill(0);
      ellipse(x + (mySize/2),y + (mySize/2), mySize/4, mySize/4);
      fill(255);
    } else if (roll == 2) {
      fill(0);
      ellipse(x + mySize/5, y + mySize/5,mySize/4, mySize/4);
      ellipse(x + 4*(mySize/5), y + 4*(mySize/5), mySize/4, mySize/4);
      fill(255);
    } else if (roll == 3) {
      fill(0);
      ellipse(x + mySize/5, y + mySize/5,mySize/4, mySize/4);
      ellipse(x + 2.5*(mySize/5), y + 2.5*(mySize/5), mySize/4, mySize/4);
      ellipse(x + 4*(mySize/5), y + 4*(mySize/5), mySize/4, mySize/4);
      fill(255);
    } else if (roll == 4) {
      fill(0);
      ellipse(x + (mySize/5), y + (mySize/5), mySize/4, mySize/4);
      ellipse(x + 4*(mySize/5), y + (mySize/5), mySize/4, mySize/4);
      ellipse(x + (mySize/5), y + 4*(mySize/5), mySize/4, mySize/4);
      ellipse(x + 4*(mySize/5), y + 4*(mySize/5), mySize/4, mySize/4);
      fill(255);
    } else if (roll == 5) {
      fill(0);
      ellipse(x + (mySize/5), y + (mySize/5), mySize/4, mySize/4);
      ellipse(x + 4*(mySize/5), y + (mySize/5), mySize/4, mySize/4);
      ellipse(x + (mySize/2),y + (mySize/2), mySize/4, mySize/4);
      ellipse(x + (mySize/5), y + 4*(mySize/5), mySize/4, mySize/4);
      ellipse(x + 4*(mySize/5), y + 4*(mySize/5), mySize/4, mySize/4);
      fill(255);
    } else if (roll == 6) {
      fill(0);
      ellipse(x + (mySize/5), y + (mySize/5), mySize/4, mySize/4);
      ellipse(x + 4*(mySize/5), y + (mySize/5), mySize/4, mySize/4);
      ellipse(x + (mySize/5), y + 2.5*(mySize/5), mySize/4, mySize/4);
      ellipse(x + 4*(mySize/5), y + 2.5*(mySize/5), mySize/4, mySize/4);
      ellipse(x + (mySize/5), y + 4*(mySize/5), mySize/4, mySize/4);
      ellipse(x + 4*(mySize/5), y + 4*(mySize/5), mySize/4, mySize/4);
      fill(255);
    }
  }
  
  void total() {
    //add dice's # to total to display at the end 
    sum += myRoll;
    avg += myRoll;
    //System.out.println(avg);
  }
}


//declare your objects above setup
//Dice ----

Dice moe;

void setup (){
  size(750,750);
  moe = new Dice();
  noLoop();
  //---- = new Dice ();
}

void draw() {
  background(#3aa14b);
  int i = 30;
  int j = 20;
  while(j < 700) {
    while(i < 750) {
      moe.show(i, j, 50, moe.roll());
      moe.total();
      i+=80;
    }
    i = 30;
    j+= 70;
  }
  //display stats: total, rolls, and average
  textSize(32);
  text("Total: " + sum, 25, 735);
  timesRolled += 1;
  text("Times rolled: " + timesRolled, 210, 735);
  text("Average: " + avg/timesRolled, 500, 735);
}

void mousePressed() {
  sum = 0;
  moe.roll();
  redraw();
}
