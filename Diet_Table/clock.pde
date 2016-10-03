
////////////////////////////////// Display the clock and date ///////////////////////////////////////////
void drawClock_date()
{
  int cp = 650;
  int cy = 40;
  int href = 27;
  noFill();
  strokeWeight(2);
  for (int i = 0; i < 12; i++) {
    float dx = cos(i * TWO_PI / 12);
    float dy = sin(i * TWO_PI / 12);
    stroke(255,255,255);
    line(cp + href * dx, cy + href * dy, cp + href * dx, cy + href * dy);
  }
  strokeWeight(3);
  drawH(15, hour(), 12);
  strokeWeight(2);
  drawH(25, minute(), 60);
  strokeWeight(1);
  stroke(#ff0000);
  drawH(25, second(), 60);
  strokeWeight(5);
  stroke(#00FFEC);
  point(650,40);

// draw the date
    String Date = day() + " / " + month() + " / " + year();
    
    textSize(15);
    fill(255);
    text(Date,610,90);

}


void drawH(float r, float v, int d) {
  int cpx = 650;
  int cpy = 40;
  float x = cpx + r * cos(v * TWO_PI / d - PI / 2.0f);
  float y = cpy + r * sin(v * TWO_PI / d - PI / 2.0f);
  line(cpx, cpy, x, y);
}

