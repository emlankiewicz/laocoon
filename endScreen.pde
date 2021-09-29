PImage horse;

void endScreen() {
  background(#383E7C);

  strokeWeight(1);
  noFill();
  pushMatrix();
  stroke(sphereColor, 149, 242, random(50, 60));
  translate(width/2, height/2);
  rotateY(spin-2);
  rotateX(spin-1);
  sphereDetail(3);
  sphere(max);
  popMatrix();

  strokeWeight(1);
  noFill();
  pushMatrix();
  stroke(sphereColor, 149, 242, random(50, 60));
  translate(width/2, height/2);
  rotateY(spin-2);
  rotateX(spin-5);
  sphereDetail(3);
  sphere(400);
  popMatrix();
  
  spin += .05;

  for (int i = 0; i < numberOfStars; i++) {
    fill(random(150, 255), brightness[i]);
    ellipse(x[i], y[i], r[i], r[i]);
  }
  fill(titleColor, 160, 255, random(220, 250));
  textFont(console);
  textSize(30);
  textAlign(CENTER);
  text("Congratulations", width/2, 360);
  textSize(20);
  text("You are now calm", width/2, 410);
  
  titleColor +=titleShift;
    if (titleColor<=0) {
    titleShift=1;
  }

  if (titleColor>=255) {
    titleShift=-1;
  }

  fill(titleColor, 160, 255, random(220, 250));
  textFont(console);
  textSize(19);
  textAlign(CENTER);
  text("Press ESC and carry on", width/2, 540);
  fill(#FF83E6, random(220, 255));
  text("      ESC             ", width/2, 540);



  tint(titleColor, 160, 255, random(200, 250));
  image(horse, 480, 200, 50, 70);
}