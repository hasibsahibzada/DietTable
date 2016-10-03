void get_weather_update(){

  // update the weather first
   weather.update();

// check if the city name is fitched 
  String cityname = weather.getCityName();

if (cityname !=null){
  
  int w_code= parseInt(weather.getWeatherConditionCode());
  
  weather_icon = loadImage("data/images/Weather/"+str(w_code)+".png");
 
  
   // load the weather image
  weather_icon.resize(80,80);
  image(weather_icon,0,0);
  
  textSize(12);
  // weather condition
  text(weather.getWeatherCondition(), 20, 80);
   // city name
  text(weather.getCityName(), 20, 95);
  text(+weather.getTemperature()+ " C ", 20, 110);
  
}
}
