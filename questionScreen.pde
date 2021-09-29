float arrowYesStatus;
float arrowNoStatus;
float starterArrow=255;

void questionScreen() {
  background(50, 45, 107);


  strokeWeight(1);
  noFill();
  pushMatrix();
  stroke(sphereColor, 149, 242, random(50, 60));
  translate(width/2, height/2);
  rotateY(spin-5);
  rotateX(spin-10);
  sphereDetail(3);
  sphere(max);
  popMatrix();


  strokeWeight(1);
  noFill();
  pushMatrix();
  stroke(sphereColor, 149, 242, random(50, 75));
  translate(width/2, height/2);
  rotateZ(spin+5);
  rotateX(spin+1);
  sphereDetail(3);
  sphere(min);
  popMatrix();

  spin += .005;

  fill(#FF83E6, random(200, 255));
  textFont(console);
  textSize(25);
  text("Yes", (width/2)-130, (height/2)+100);

  fill(#FF83E6, arrowYesStatus);
  textFont(console);
  textSize(25);
  text(">", (width/2)-178, (height/2)+100);

  fill(#FF83E6, starterArrow);
  textFont(console);
  textSize(25);
  text(">", (width/2)-178, (height/2)+100);

  fill(#FF83E6, random(200, 255));
  textFont(console);
  textSize(25);
  text("No", (width/2)+120, (height/2)+100);

  fill(#FF83E6, arrowNoStatus);
  textFont(console);
  textSize(25);
  text(">", (width/2)+80, (height/2)+100);

  fill(#688CF5, random(220, 255));
  textFont(console);
  textSize(27);
  textAlign(CENTER);
  text("Are you calm yet?", width/2, 250);

  fill(#688CF5, random(220, 255));
  textFont(console);
  textSize(17);
  textAlign(CENTER);
  text("Use the arrows to move and space to select the right answer.", width/2, 350);
  fill(#FF83E6, random(220, 255));
  textFont(console);
  textSize(17);
  textAlign(CENTER);
  text("        arrows             space                            ", width/2, 350);
}