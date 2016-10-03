
/////////////////////////////////////// weight detection ////////////////////////////////////

void calculate_weight(){
  
  println("value is:"+food_weight_temp);
  try
  {
   if ( myPort.available() > 0) {  
      // If data is available,
     weight_val = myPort.readStringUntil('\n'); 
     if(weight_val!=null){
        weight_val=trim(weight_val);
        food_weight_temp=float(weight_val);
        println("value is:"+food_weight_temp);
      }
    } 

  }
  catch(Exception ex){
    println("hi");
  }
  
  
}

void confirm_weight(){
 
 food_weight  = food_weight_temp;
  
  
}

