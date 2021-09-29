/*

Final Project
"Laocoön - Just keep breathing"
by Emily Lankiewicz

Instructions:
Follow all on screen prompts.

An exploration into taking out the human element from an anti-anxiety program.
Distress is treated as a variable rather than an emotion or feeling. Inspired 
by Classical motifs (and the biproduct of taking art history and computer 
science courses back-to-back). In the myth of the Trojan war the tragic 
character Laocoön famously warns, referring to the Trojan Horse, "Beware of 
Greeks bearing gifts." He proceeds to cause a scene and raise alarm in the 
city. When nothing could calm him or silence him Poseidon sent sea snakes to 
kill him. Maybe if Laocoön had access to his namesake program he could have 
been spared? (probably not).

*/


import ddf.minim.*;

Minim minim = new Minim(this);
AudioPlayer theme;
AudioPlayer breathingSong;
AudioPlayer prompt;
AudioPlayer space;
AudioPlayer finalScreen;

PFont console;
PFont title;

int screen = 0;

void setup() {
  size(1000, 700, P3D);
  console = createFont("joystix monospace.ttf", 60);
  title = createFont("Inversionz.otf", 150);
  noCursor();

  horse = loadImage("Horse.png");

  theme = minim.loadFile("151780__weaverfishable__8bit-mix.wav");
  breathingSong = minim.loadFile("154972__setuniman__nervous-and-calm-together-0n-16mi.wav");
  prompt = minim.loadFile("341231__jeremysykes__coin00.wav");
  space = minim.loadFile("350876__cabled-mess__coin-c-09.wav");
  finalScreen = minim.loadFile("335361__cabled-mess__little-happy-tune-22-10.wav");


  //For Splash Screen
  columns = w/scale;
  rows = h/scale;
  titleGrid = new float[columns][rows];
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < columns; x++) {
      titleGrid[x][y] = map(noise(x, y), 0, 1, -100, 100);
    }
  }
  //For Stars

  for (int i = 0; i < numberOfStars; i++) {
    x[i] = random(0, width);
    y[i] = random(0, height);
    r[i] = random(1, 3);
    brightness[i] = random(0, 255);
    brightnessChange[i] = 0;
  }
}






void draw() {
  if (screen == 0) {
    splashScreen();
    theme.play();
  } else if (screen == 1) {
    ballScreen();
    theme.mute();
    breathingSong.play();
    prompt.rewind();
  } else if (screen == 2) {
    questionScreen();
    breathingSong.pause();
    breathingSong.rewind();
    prompt.play();
  } else if (screen == 3) {
    endScreen();
    finalScreen.play();
  }

  if (millis() > askCalmYet) {
    if (screen == 1) {
      screen = 2;
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    if (screen == 0) {
      startBreathing();
      space.play();
      space.rewind();
    }
  }

  if (screen == 2) {
    if (key == CODED) {
      if (keyCode == RIGHT) {
        arrowNoStatus=225;
        arrowYesStatus=0;
        starterArrow = 0;
      } else if (keyCode == LEFT) {
        arrowNoStatus=0;
        arrowYesStatus=225;
        starterArrow = 0;
      }
    }
  }

  if (screen == 2) {
    if ((arrowYesStatus>=225) || (starterArrow>=255)) 
      if (keyPressed) { 
        if (key == ' ') { 
          screen = 3;
          space.play();
          space.rewind();
        }
      }
  }

  if (screen == 2) {
    if (arrowNoStatus>=225) 
      if (keyPressed) { 
        if (key == ' ') { 
          startBreathing();
          space.play();
          space.rewind();
        }
      }
  }
}

void startBreathing() {
  screen=1;
  askCalmYet = millis() + 30 * 1000;
}
