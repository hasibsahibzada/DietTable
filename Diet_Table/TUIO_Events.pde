
// --------------------------------------------------------------
// these callback methods are called whenever a TUIO event occurs
// there are three callbacks for add/set/del events for each object/cursor/blob type
// the final refresh callback marks the end of each TUIO frame

// called when an object is added to the scene
void addTuioObject(TuioObject tobj) {
  // if (verbose) 
  //println("add obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle());

  // increment the main nutrition list based on the weight that was confirmed by user
    increment_nutrition(tobj.getSymbolID(),food_weight);
  

  // play sound by puredata
      
      puredata.write("/add"+" "+1+";");
       
  
  
}

// called when an object is moved
void updateTuioObject (TuioObject tobj) {
  if (verbose) println("set obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle()
          +" "+tobj.getMotionSpeed()+" "+tobj.getRotationSpeed()+" "+tobj.getMotionAccel()+" "+tobj.getRotationAccel());

   
  // play sound by puredata
      
      puredata.write("/update"+" "+1+";");
   

}

// called when an object is removed from the scene
void removeTuioObject(TuioObject tobj) {
  if (verbose) println("del obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+")");
  
   // query database for the name
   msql.query("SELECT FoodId,FoodName FROM food WHERE FoodId = %s", tobj.getSymbolID());
   msql.next();
   String FoodGroup_name = msql.getString("FoodName");
  
  
  // hide the list of nutrition 
  hide_nut_list(FoodGroup_name);
  // decrease the nutrition of the food from main nutrition list
  remove_nutrition(tobj.getSymbolID(),100);


  // play sound by puredata
      
      puredata.write("/remove"+" "+1+";");
       

}



// --------------------------------------------------------------
// called at the end of each TUIO frame
void refresh(TuioTime frameTime) {
  if (verbose) println("frame #"+frameTime.getFrameID()+" ("+frameTime.getTotalMilliseconds()+")");
  if (callback) redraw();
}

