int rectX, rectY;      // Position of square button
int circleX, circleY;  // Position of circle button
int rectSize = 90;     // Diameter of rect
int circleSize = 93;   // Diameter of circle
color rectColor, circleColor, baseColor;
color rectHighlight, circleHighlight;
color currentColor;

int NUM_BUTTONS=6;
boolean buttonOne=false;
int buttonNumberOne=-1;
int buttonNumberTwo=-1;
boolean complete=false;
button[] a;
boolean[] overButton;

public class button{
  int x;
  int y;
  int diameter;
  color clr;
  color highlight;
  color selected;
  
  public button(int x, int y, int diameter, color clr, color highlight,color selected){
    this.x=x;
    this.y=y;
    this.diameter=diameter;
    this.clr=clr;
    this.highlight=highlight;
    this.selected=selected;
  }
  
}

void setup() {
  size(640, 360);
  overButton=new boolean[NUM_BUTTONS];
  a =new button[NUM_BUTTONS];//(50,50,50,color(255),color(204));
  for(int i=0;i<NUM_BUTTONS;i++){
    a[i]=new button(50,50*i+10,50,color(255),color(204),color(150));
  } 



  ellipseMode(CENTER);
}

void draw() {
  update();
  background(currentColor);
  stroke(255);
  for(int i=0;i<NUM_BUTTONS;i++){
    if(buttonNumberOne==i||buttonNumberTwo==i){
      fill(a[i].selected);
    }else if (overButton[i]) {
    fill(a[i].highlight);
  } else {
    fill(a[i].clr);
  }
  stroke(0);
  ellipse(a[i].x, a[i].y, a[i].diameter, a[i].diameter);
  }
  
}

void update() {
  overCircle();
  
}

void mousePressed() {
  for(int i=0;i<NUM_BUTTONS;i++)
    if (overButton[i]) {
      if(buttonOne==false){
        buttonNumberOne=i;
        buttonOne=true;
      }else if(complete==false ) {
        buttonNumberTwo=i;
        complete=true;
      }else{
        buttonNumberOne=i;
        buttonOne=true;
        complete=false;
        buttonNumberTwo=-1;
      }
    }
}

void overCircle() {
  for(int i=0;i<NUM_BUTTONS;i++){
  float disX = a[i].x - mouseX;
  float disY = a[i].y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < a[i].diameter/2 ) {
    overButton[i]=true;
  } else {
    overButton[i]=false;
  }
  }
}
