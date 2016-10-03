
void place_sliders(){
  
  print(displayWidth);

     cp5.addSlider("Calories")
     .setPosition(displayWidth-1250,displayHeight/1.26)
     .setSize(15,100)
     .setRange(0,500)
     .lock()
     .setValue(Calories)
     ;
    
     cp5.addSlider("Fat")
     .setPosition(displayWidth-1200,displayHeight/1.26)
     .setSize(15,100)
     .lock()
     .setRange(0,80)
     .setValue(Fat)
     ;
     
     cp5.addSlider("Chol")
     .setPosition(displayWidth-1150,displayHeight/1.26)
     .setSize(15,100)
     .lock()
     .setRange(0,255)
     .setValue(Cholesterol)
     ;
     
     cp5.addSlider("Sodium")
     .setPosition(displayWidth-1100,displayHeight/1.26)
     .setSize(15,100)
     .lock()
     .setRange(0,255)
     .setValue(Sodium)
     ;
     
     cp5.addSlider("Potassium")
     .setPosition(displayWidth-1050,displayHeight/1.26)
     .setSize(15,100)
     .lock()
     .setRange(0,255)
     .setValue(Potassium)
     ;
  
    cp5.addSlider("Carb")
     .setPosition(displayWidth-1000,displayHeight/1.26)
     .setSize(15,100)
     .lock()
     .setRange(0,255)
     .setValue(Carbohydrate)
     ;
       cp5.addSlider("Protein")
     .setPosition(displayWidth-950,displayHeight/1.26)
     .setSize(15,100)
     .lock()
     .setRange(0,255)
     .setValue(Protein)
     ;
       cp5.addSlider("Calcium")
     .setPosition(displayWidth-900,displayHeight/1.26)
     .setSize(15,100)
     .lock()
     .setRange(0,255)
     .setValue(Calcium)
     ;
       cp5.addSlider("Energy")
     .setPosition(displayWidth-850,displayHeight/1.26)
     .setSize(15,100)
     .lock()
     .setRange(0,255)
     .setValue(Energy)
     ;
     
       cp5.addSlider("Iron")
     .setPosition(displayWidth-800,displayHeight/1.26)
     .setSize(15,100)
     .lock()
     .setRange(0,255)
     .setValue(Iron)
     ;
}

