int columns;
int rows;
int scale = 70;
int w = 2000;
int h = 2000;

float titleShift = 0;
float titleColor = 0;

float [][] titleGrid;

void splashScreen() {
  background(50, 45, 107);
  //Title Page
  textFont(title);
  fill(titleColor, 160, 255, random(230, 250));
  text("laocoön", 220, 300);
  titleColor +=titleShift;

  if (titleColor<=0) {
    titleShift=1;
  }

  if (titleColor>=255) {
    titleShift=-1;
  }

  fill(titleColor, 160, 255, random(220, 255));
  textFont(console);
  textSize(20);
  text("Just keep breathing.", 500, height/2);

  fill(#7779E3, random(220, 255));
  textSize(15);
  text("version 3.14", 10, 25);
  textSize(12);
  text("©2017 Poseidon inc. ", 800, 690);

  fill(#C0B8FC,random(220, 255));
  textSize(27);
  text("Press space to begin", 280, 600);


  //Title Page background  
  stroke(titleColor, 160, 255, random(20, 40));
  noFill();

  translate(width/2, height/2);
  rotateX(PI/3);

  translate(-w/2, -h/2);

  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < columns; x++) {
      vertex (x*scale, y*scale, titleGrid[x][y]);
      vertex (x*scale, (y+1)*scale, titleGrid[x][y+1]);
    }
    endShape();
  }
}