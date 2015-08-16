int moistureSensor = 1;
void setup() {
  Serial.begin(9600);
}

void loop() {
  int moistureVal = analogRead(moistureSensor);
  Serial.print("Moisture:");
  Serial.print(moistureVal);
  Serial.println();
}
