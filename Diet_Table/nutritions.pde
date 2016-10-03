



// increment neutrition of the new food
void increment_nutrition(int food_id,float current_weight){
  
    // update the weight of food in the database not the real weight but the current weight
  
  
  
    // query the food name and weight
     msql.query("SELECT FoodId,FoodName,Weight FROM food WHERE FoodId = %s", food_id );
     msql.next();
     String FoodID   = msql.getString("FoodId");
     print("food passed");
     String FoodName = msql.getString("FoodName");
     float food_weight = msql.getFloat("Weight");
  
    print("food weight");
    println(food_weight);
    
    // query get the nutrition names with id
    //  msql.query("SELECT NutritionId FROM diettable.nutrition");
    
     msql.query("SELECT COUNT(NutritionId) FROM diettable.nutrition");
     msql.next();
     int count_nutrition = msql.getInt(1);    
     
     // make the indevidual group
     if (FoodName!=null){
      cp5.addGroup(FoodName)
                .setBackgroundHeight(120)
                .setSize(120,180)
                .close()
                .setBackgroundColor(color(255,60))
                ;
     
      cp5.addTextlabel("Weight"+FoodName)
                    .setText(str(current_weight) + " gr: ")
                    .setPosition(60,0)
                    .setFont(createFont("Arial",10))
                    .setGroup(FoodName)
                    ;   
     
     for (int n_id=1; n_id<=count_nutrition; n_id++){
     
      // query the nutitions for the selected food  
      
            msql.query("SELECT Namount FROM diettable.nutritionamount WHERE FoodId = "+ FoodID +" AND NutritionId ="+ n_id);
            msql.next();
            float amount = msql.getFloat("Namount");
            print("--");
            print(amount);
            
      // Check the type of nutrition and increment the amount
      switch(n_id) {

            case 1:         // Calories
              
              // calcuate the amount based on weight
              amount  = ((current_weight) / (food_weight)) * amount;
      
              cp5.addTextlabel("Calories"+FoodName)
                    .setText("Cal: "+str(amount))
                    .setPosition(5,70)
                    .setFont(createFont("Arial",10))
                    .setGroup(FoodName)
                    ;   
              
              //                 
              Calories +=amount;
              cp5.getController("Calories").setValue(Calories);           
              
              break;
          
            case 2:         // Fat
              
               // calcuate the amount based on weight
              amount  = ((current_weight) / (food_weight)) * amount;
              
            cp5.addTextlabel("Fat"+FoodName)
                    .setText("Fat: " + str(amount))
                    .setPosition(5,80)
                    .setFont(createFont("Arial",10))
                    .setGroup(FoodName)
                    ;
              
        
              Fat +=amount;
              cp5.getController("Fat").setValue(Fat);     
              break;
    
            case 3:         // Cholesterol  
            
              // calcuate the amount based on weight
              amount  = ((current_weight) / (food_weight)) * amount;            
            
            cp5.addTextlabel("Cholesterol"+FoodName)
                    .setText("Cholesterol: " + str(amount))
                    .setPosition(5,90)
                    .setFont(createFont("Arial",10))
                    .setGroup(FoodName)
                    ;
              
              
              Cholesterol +=amount;
              cp5.getController("Chol").setValue(Cholesterol);   
             
              break;
          
            case 4:       //  Sodium
            
              // calcuate the amount based on weight
              amount  = ((current_weight) / (food_weight)) * amount;
              
            cp5.addTextlabel("Sodium"+FoodName)
                    .setText("Sodium: " + str(amount))
                    .setPosition(5,100)
                    .setFont(createFont("Arial",10))
                    .setGroup(FoodName)
                    ;
              
              
              Sodium +=amount;
              cp5.getController("Sodium").setValue(Sodium);   
              break;
          
            case 5:       // Potassium
            
              // calcuate the amount based on weight
              amount  = ((current_weight) / (food_weight)) * amount;
              
            cp5.addTextlabel("Potassium"+FoodName)
                    .setText("Potassium: " + str(amount))
                    .setPosition(5,110)
                    .setFont(createFont("Arial",10))
                    .setGroup(FoodName)
                    ;  
              
              
              
              Potassium +=amount;
              cp5.getController("Potassium").setValue(Potassium);
              
              break;
              
            case 6:       // Carbohydrate
            
            
              // calcuate the amount based on weight
              amount  = ((current_weight) / (food_weight)) * amount;
              
            cp5.addTextlabel("Carbohydrate"+FoodName)
                    .setText("Carbohydrate: " + str(amount))
                    .setPosition(5,120)
                    .setFont(createFont("Arial",10))
                    .setGroup(FoodName)
                    ;    
              
              
              Carbohydrate +=amount;
              cp5.getController("Carb").setValue(Carbohydrate);   
              break;
          
            case 7:       // Protein
              
              // calcuate the amount based on weight
              amount  = ((current_weight) / (food_weight)) * amount;   
              
            cp5.addTextlabel("Protein"+FoodName)
                    .setText("Protein: " + str(amount))
                    .setPosition(5,130)
                    .setFont(createFont("Arial",10))
                    .setGroup(FoodName)
                    ;     
                                   
              Protein +=amount;
              cp5.getController("Protein").setValue(Protein);   
              break;
          
            case 8:       // Calcium
            
            
          // calcuate the amount based on weight
              amount  = ((current_weight) / (food_weight)) * amount;    
              
            cp5.addTextlabel("Calcium"+FoodName)
                    .setText("Calcium: " + str(amount))
                    .setPosition(5,140)
                    .setFont(createFont("Arial",10))
                    .setGroup(FoodName)
                    ;  
              
              
              Calcium +=amount;
              cp5.getController("Calcium").setValue(Calcium);   
              break;
          
          
            case 9:       // Energry
            
            
           // calcuate the amount based on weight
              amount  = ((current_weight) / (food_weight)) * amount;   
              
            cp5.addTextlabel("Energy"+FoodName)
                    .setText("Energy: " + str(amount))
                    .setPosition(5,150)
                    .setFont(createFont("Arial",10))
                    .setGroup(FoodName)
                    ;  
      
              Energy +=amount;
              cp5.getController("Energy").setValue(Energy);   
              break;
          
            case 10:      // Iron
            
            // calcuate the amount based on weight
              amount  = ((current_weight) / (food_weight)) * amount;  
              
              
               
            cp5.addTextlabel("Iron"+FoodName)
                    .setText("Iron: " + str(amount))
                    .setPosition(5,160)
                    .setFont(createFont("Arial",10))
                    .setGroup(FoodName)
                    ;
              
              
              Iron +=amount;
              cp5.getController("Iron").setValue(Iron);   
              break;
}
  
        }
     }

}


// decrement neutrition of the new food
void remove_nutrition(int food_id,int current_weight){
  
    
    // query the food name
     msql.query("SELECT FoodId,FoodName FROM food WHERE FoodId = %s", food_id );
     msql.next();
     String FoodID   = msql.getString("FoodId");
     String FoodName = msql.getString("FoodName");
     float  food_weight = msql.getFloat("Weight");
     
    // query get the nutrition names with id
    //  msql.query("SELECT NutritionId FROM diettable.nutrition");
    
     msql.query("SELECT COUNT(NutritionId) FROM diettable.nutrition");
     msql.next();
     int count_nutrition = msql.getInt(1);    
     
     for (int n_id=1; n_id<=count_nutrition; n_id++){
     
      // query the nutitions for the selected food  
      
            msql.query("SELECT Namount FROM diettable.nutritionamount WHERE FoodId = "+ FoodID + " AND nutritionamount.NutritionId = %s", n_id );
            msql.next();
            float amount = msql.getFloat("Namount");
            
      // Check the type of nutrition and increment the amount
      switch(n_id) {

             case 1:         // Calories
            
              // calcuate the amount based on weight
              amount  = ((current_weight) / (food_weight)) * amount;
            
             if (Calories !=0.0){
              Calories -=amount;
              cp5.getController("Calories").setValue(Calories);           
             }
              break;
          
            case 2:         // Fat
              
              amount  = ((current_weight) / (food_weight)) * amount;
              
              if (Fat !=0.0){
              Fat -=amount;
              cp5.getController("Fat").setValue(Fat);     
              }
              break;
    
            case 3:         // Cholesterol
              
              
              amount  = ((current_weight) / (food_weight)) * amount;
              
              if (Cholesterol !=0.0){
              Cholesterol -=amount;
              cp5.getController("Chol").setValue(Cholesterol);   
              }
              break;
          
            case 4:       //  Sodium
              
              
              amount  = ((current_weight) / (food_weight)) * amount;
              
              if (Sodium !=0.0){
              Sodium -=amount;
              cp5.getController("Sodium").setValue(Sodium);   
              }
              break;
          
            case 5:       // Potassium
              
              
              
              amount  = ((current_weight) / (food_weight)) * amount; 
              
              if (Potassium !=0.0){
              Potassium -=amount;
              cp5.getController("Potassium").setValue(Potassium);   
              }
              break;
              
            case 6:       // Carbohydrate
              
              
              amount  = ((current_weight) / (food_weight)) * amount; 
              
              if (Carbohydrate !=0.0){
              Carbohydrate -=amount;
              cp5.getController("Carb").setValue(Carbohydrate);   
              }
              break;
          
            case 7:       // Protein
                 
              amount  = ((current_weight) / (food_weight)) * amount; 
           
             if (Protein !=0.0){
              Protein -=amount;
              cp5.getController("Protein").setValue(Protein);   
             }
              break;
          
            case 8:       // Calcium
    
            amount  = ((current_weight) / (food_weight)) * amount;
         
            if (Calcium !=0.0){
              Calcium -=amount;
              cp5.getController("Calcium").setValue(Calcium);   
            }
              break;
          
          
            case 9:       // Energry
     
              amount  = ((current_weight) / (food_weight)) * amount;   
        
              if (Energy !=0.0){
              Energy -=amount;
              cp5.getController("Energy").setValue(Energy);   
              }
              break;
          
            case 10:      // Iron
         
              amount  = ((current_weight) / (food_weight)) * amount;   
            
              if (Iron !=0.0 ){
              Iron -=amount;
              cp5.getController("Iron").setValue(Iron);   
              }
              break;
}
  
        }
  
}


void reset_nutrition(){
  
float Calories     =0.0;
float Iron         =0.0;
float Fat          =0.0;
float Sodium       =0.0;
float Cholesterol  =0.0;
float Potassium    =0.0;
float Carbohydrate =0.0;
float Protein      =0.0;
float Calcium      =0.0;
float Energy       =0.0;

}


