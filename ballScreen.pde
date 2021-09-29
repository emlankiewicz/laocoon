int numberOfStars = 400;
float[] x = new float[numberOfStars];
float[] y = new float[numberOfStars];
float[] r = new float[numberOfStars];
float [] brightness = new float [numberOfStars];
float [] brightnessChange = new float [numberOfStars];

float timeToShrink = -1;
float timeToExpand = 0;

int min = 125;
int max = 300;

int growth = 125;
int sizeChange = 0;

float spin = 0;

float shift = 0;
float sphereColor = 0;

float backgroundColor = 0;
float backgroundChange = 0;

float progress = 0;

float askCalmYet = -1;

void ballScreen(){
  background(backgroundColor, 45, 107);
  fill(backgroundColor, 45, 107);
  rect(0,0,width,height);
  backgroundColor +=backgroundChange;

  if (backgroundColor<=20) {
    backgroundChange+=.005;
  }

  if (backgroundColor>=90) {
    backgroundChange+= -.005;
  }

  noStroke();

  ///////////////////////// Stars //////////////////////////////

  for (int i = 0; i < numberOfStars; i++) {
    fill(random(150, 255), brightness[i]);
    ellipse(x[i], y[i], r[i], r[i]);

    /// Star brightness //
    brightness[i] +=brightnessChange[i];

    if (brightness[i]<=0) {
      brightnessChange[i]+=3;
    }

    if (brightness[i]>=255) {
      brightnessChange[i]+=-3;
    }
  }



  ///////////////////// Moving Spheres //////////////////////////////////////////////
  strokeWeight(1.5);
  noFill();
  pushMatrix();
  stroke(sphereColor, 149, 242, random(50, 100));
  translate(width/2, height/2);
  rotateZ(spin);
  rotateX(spin);
  sphereDetail(int(8 * progress) + 3);
  sphere(growth);
  popMatrix();

  strokeWeight(1.5);
  noFill();
  pushMatrix();
  stroke(sphereColor, 149, 242, random(50, 100));
  translate(width/2, height/2);
  rotateZ(spin+3);
  rotateX(spin+1);
  sphereDetail(int(8 * progress) + 3);
  sphere(growth);
  popMatrix();


  /////////// Smallest Sphere ///////////////////////////////
  strokeWeight(1);
  noFill();
  pushMatrix();
  stroke(sphereColor, 149, 242, random(50, 75));
  translate(width/2, height/2);
  rotateZ(spin+5);
  rotateX(spin+1);
  sphereDetail(int(8 * progress) + 3);
  sphere(min);
  popMatrix();

  /////////// Largest Sphere ///////////////////////////////
  strokeWeight(1);
  noFill();
  pushMatrix();
  stroke(sphereColor, 149, 242, random(50, 60));
  translate(width/2, height/2);
  rotateY(spin-5);
  rotateX(spin-10);
  sphereDetail(int(8 * progress) + 3);
  sphere(max);
  popMatrix();

  ////////////////// Rotation ///////////////////////////////
  spin += .005;

  /// Color Change ////
  sphereColor +=shift;

  if (sphereColor<=0) {
    shift=1;
  }

  if (sphereColor>=255) {
    shift=-1;
  }


  /////////////////////////// Size & Polygon Change ////////////////////////////////
  float maxDiff = max - min;
  float curDiff = growth - min;
  progress = curDiff/maxDiff;


  if (timeToExpand >= 0) {
    if (millis() >= timeToExpand) {
      if (growth <= max) {
        growth = growth+1;
      } else {
        //done rising
        timeToShrink = millis() +  1.5 * 1000;
        timeToExpand = -1;
      }
    }
  } else if (timeToShrink >= 0) {
    if (millis() >= timeToShrink) {
      if (growth >= min) {
        growth = growth-1;
      } else {
        timeToExpand = millis() +  1.5 * 1000;
        timeToShrink = -1;
      }
    }
  }
}