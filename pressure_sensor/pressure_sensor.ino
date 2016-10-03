
void setup() 
{
  // Start serial at 9600 baud
  Serial.begin(9600); 
}

    void loop() 
{
  // Read the input on analog pin 0:
  int sensorValue = analogRead(A0);
  
  // Convert the analog reading to weight (which goes from 0 - 1023) to a voltage (0 - 5V):
  float w = map(sensorValue, 0, 1023, 0, 10);  // map up to 10 kg

  Serial.println(w);    // 
  
  // Wait 100 milliseconds
  delay(100);
}
