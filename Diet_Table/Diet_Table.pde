
import processing.serial.*;
Serial myPort;  // Create object from Serial class
String weight_val;     // Data received from the serial port


// oscP5
import oscP5.*;
import processing.net.*;

// OSC 
OscP5 oscP5;
Client puredata;

// import the TUIO library
import TUIO.*;

// declare a TuioProcessing client
TuioProcessing tuioClient;

// MySQL imports
import de.bezier.data.sql.*;
MySQL msql,msql_food,mysql_nutrition,mysql_amount_nutrition;


// Nutrition bar and Menu list imports    control p5
import controlP5.*;
ControlP5 cp5;



// Weight values
float food_weight = 0;
float food_weight_temp = 0.23;


// for network connection
import processing.net.*;


// variable for the nutritions
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


// nutrition array
float[] nutirition_data  = new float[20];

// food sound 
 import ddf.minim.*;
 Minim food_add;
 AudioPlayer food_add_sound;
 AudioInput input_food_add;

// food image
 PImage photo;

// import the yahoo weather library
import com.onformative.yahooweather.*;
YahooWeather weather;
int updateIntervallMillis = 30; 
// weather images
PImage weather_icon;


// Account 
PImage profile_pic;


// background
PImage Background_Image;

// these are some helper variables which are used
// to create scalable graphical feedback
float cursor_size = 15;
float object_size = 60;
float table_size = 760;
float scale_factor = 1;
PFont font;

boolean verbose = false; // print console debug messages
boolean callback = true; // updates only after callbacks


void setup()
{
  

   ///////////////////////////////////////// Database Connection //////////////////////////////////////
  // database users
    String user     = "diet";
    String pass     = "";
    
  // database name
    String database = "diettable";
    
    msql = new MySQL( this, "localhost", database, user, "");
    
    if ( msql.connect() )
    {
       print("connected ");
    }
    else
    {
    print("connection failed !!");
    }
  
  
  ////////////////////////////////////Control p5 library///////////////////////////////////////////
  cp5 = new ControlP5(this); 
  cp5.setColorForeground(255);
  
  ////////////////////////////////////////// GUI setup /////////////////////////////////////////////
  Background_Image = loadImage("data/images/background.jpg");
  image(Background_Image,0,0);
 // noCursor();
  size(displayWidth,displayHeight);
  noStroke();
  fill(0);
  
  // periodic updates
  if (!callback) {
    frameRate(60); //<>//
    loop();
  } else noLoop(); // or callback updates 
  
  font = createFont("Arial", 18);
  scale_factor = height/table_size;
  
  // finally we create an instance of the TuioProcessing client
  // since we add "this" class as an argument the TuioProcessing class expects
  // an implementation of the TUIO callback methods in this class (see below)
  tuioClient  = new TuioProcessing(this);

///////////////////////////////////////////// Weather /////////////////////////////////////////////////
// load weimar weather, 704770 -- indicates weimar, you can get the codes from https://weather.yahoo.com by chosing your desired location 
// the code is at the very end of the URL
  weather = new YahooWeather(this, 704770, "c", updateIntervallMillis);


  
/////////////////////////////////////////// Nutiritions //////////////////////////////////////////////
 place_sliders();    // the sum of all nutritions

////////////////////////////////////////// food sound ////////////////////////////////////////////////
 food_add = new Minim(this);
 food_add_sound = food_add.loadFile("data/sounds/put_food.wav");
 input_food_add = food_add.getLineIn();

///////////////////////////////////////////// food Weight /////////////////////////////////////////////

text("weight",10,100);

cp5.addButton("Confirm")
     .setValue(0)
     .setPosition(displayWidth-250,displayHeight/1.13)
     ;


///////////////////////////////////////////// User Login //////////////////////////////////////////////

  Group login = cp5.addGroup("User Login")
                .setPosition(displayWidth-310,displayHeight/30)                
                .setWidth(300)
                .activateEvent(true)
                .setBackgroundColor(color(255,80))
                .setBackgroundHeight(100)
                .setLabel("User Login")
                ;
    
  // text fields  
    
cp5.addTextfield("Username")
     .setPosition(10,10)
     .setValue("Username .. ")
     .setLabelVisible(false)
     .setGroup(login)
     ;
                 
 cp5.addTextfield("Password")
     .setValue("Password ..")
     .setPosition(10,40)
     .setPasswordMode(true)
     .setLabelVisible(false)
     .setGroup(login)
     ;
         
cp5.getController("Username").getCaptionLabel().setVisible(false);     
cp5.getController("Password").getCaptionLabel().setVisible(false);      
   
   // login button  
 cp5.addButton("Login")
     .setValue(0)
     .setPosition(20,70)
     .setGroup(login)
     ;

 // Logout button  
 cp5.addButton("Logout")
     .setValue(0)
     .setPosition(100,70)
     .setGroup(login)
     ;


// profile picture
  profile_pic = loadImage("data/images/user/profile.png");



//////////////////////////////////////// OSC ArrayList ///////////////////   
 // create a new instance of oscP5. 
 // 12000 is the port number you are listening for incoming osc messages.
 puredata = new Client(this,"127.0.0.1",8000);


//////////////////////////////////////// define serial port /////////////////////
String portName = Serial.list()[0];
myPort = new Serial(this,portName, 9600); 

////////////////////////////////////////// Play startup sound //////////////////////////////
puredata.write("/start"+" "+1+";");


}


void draw()
{
  
  
  // renew the background
  image(Background_Image,0,0);

  image(profile_pic,displayWidth-130,displayHeight/40);

  calculate_weight();


  ///////////////////////////////////////////// Object Recognition ///////////////////////////////////////
  textFont(font,18*scale_factor);
  float obj_size = object_size*scale_factor; 
   
  ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();
  for (int i=0;i<tuioObjectList.size();i++) {
     TuioObject tobj = tuioObjectList.get(i);
     stroke(0);
    // fill(0,0,0);
     noFill();
     pushMatrix();
     translate(tobj.getScreenX(width),tobj.getScreenY(height));
     //rotate(tobj.getAngle());
     
     ellipse(-obj_size/2,-obj_size/2,obj_size,obj_size);
     
     
  // to print the name
     msql.query("SELECT FoodId,FoodName FROM food WHERE FoodId = %s", tobj.getSymbolID());
     msql.next();
 
     String FoodName = msql.getString("FoodName");
   
   if (FoodName !=null){
     //text(""+FoodName, tobj.getScreenX(width), tobj.getScreenY(height));

     // call the Nutrition list for each food here
     load_nut_list(tobj.getScreenX(width), tobj.getScreenY(height),tobj.getAngle(),FoodName);
  }
  
     popMatrix();
     fill(100,200,22);
   
   }
   
   
   ///////////////////////////////////////////////// Draw Clock /////////////////////////////////////////////

      drawClock_date();
  
   ///////////////////////////////////////////////// Draw Weather ///////////////////////////////////////////

 //     get_weather_update();
      
      
   ////////////////////////////////////////////////// Draw Weight ///////////////////////////////////////////
textSize(32);
text(food_weight_temp + " gr",displayWidth-150,displayHeight/1.1);  

      
}











void load_nut_list(int x, int y,float rotate, String group){
  
  if (x>0 && y>0 && group !=null ){
  
   /*    for rotation
    PVector v1;
   v1 = new PVector(x, y);
   v1.rotate(rotate-4);
   print("rot: ");
   println(rotate);
   */

  photo = loadImage("./data/images/food/"+group+".png");
  photo.resize(60,60);
  image(photo, -90,10);
  
  cp5.getGroup(group).setPosition(x-90,y+10);

                    

   
  }

   //rotate(20);


}


void hide_nut_list(String group){
 
  if (group !=null){
  cp5.getGroup(group).remove(); 
  }
}


void controlEvent(ControlEvent theEvent) {
  
  if (theEvent.getController().getName() == "Confirm"){
    confirm_weight();
  }
  
  
  if(theEvent.isGroup()) {
    println("got an event from group "
            +theEvent.getGroup().getName()
            +", isOpen? "+theEvent.getGroup().isOpen()
            );
            
  } else if (theEvent.isController()){
    println("got something from a controller "
            +theEvent.getController().getName()
            );
  }
}




