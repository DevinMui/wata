int moistureSensor = 1;
void setup() {
  //byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED }; 
  //byte ip[] = {10, 1, 5, 231};
  //Ethernet.begin(mac, ip, dns, gateway);
  Serial.begin(9600);
}

void loop() {
  int moistureVal = analogRead(moistureSensor);
  Serial.print("Moisture:");
  Serial.print(moistureVal);
  Serial.println();
}
