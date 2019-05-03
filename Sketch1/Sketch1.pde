int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

class Visualizer {
  float x, y;
  float [] values;
  float [] speeds;

  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    values = new float[10];
    speeds = new float[10];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, 400, 200);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+100, x+400, y+100);

    for (int i  = 0; i < 10; i++) {
      //changes color based on range 
      if (values[i] <= MAX_VALUE && values[i] > 50) fill(255, 0, 0) ;
      else if (values[i] <= 50 && values[i] > 0) fill(255, 128, 0) ; 
      else if (values[i] <= 0 && values[i] > -50) fill(255, 255, 0); 
      else if (values[i] <= -50) fill(0, 255, 0);
      rect(x + 40 * i, y + 100, 40, values[i]);
    }
  }

  void update() {
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.
      if (values[i] < MIN_VALUE) speeds[i] *= -1;
      if (values[i] > MAX_VALUE) speeds[i] *= -1;
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
