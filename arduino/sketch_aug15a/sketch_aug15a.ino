#include <SPI.h>
#include <EthernetV2_0.h>

byte mac[] = {  
  0x00, 0xAA, 0xBB, 0xCC, 0xDE, 0x02 };
  
EthernetClient client;
#define W5200_CS  10
#define SDCARD_CS 4

int moistureSensor = 1;
void setup() {
  Serial.begin(9600);
  pinMode(SDCARD_CS,OUTPUT);
  digitalWrite(SDCARD_CS,HIGH);//Deselect the SD card
  
  // start the Ethernet connection:
  if (Ethernet.begin(mac) == 0) {
    Serial.println("Failed to configure Ethernet using DHCP");
    // no point in carrying on, so do nothing forevermore:
    for(;;);
  }
}

void loop() {
  int moistureVal = analogRead(moistureSensor);
  Serial.print("Moisture:");
  Serial.print(moistureVal);
  Serial.println();
  // dry be 100
  // post to db as dry and post water moisture level
  String var = "{\"water_usage\": {\"moisture\":"+ String(moistureVal) + "}}";
   int num = var.length();
   delay(2000);
   if(client.connect("https://intense-shore-4027.herokuapp.com", 80)){
     Serial.println("connected");

     // New lines according to ubidots support:

     client.println("POST /api/v1/water_usages HTTP/1.1");
     Serial.println("POST /api/v1/water_usages HTTP/1.1");
     client.println("Content-Type: application/json");
     client.println("Accept: application/json");
     client.println("Content-Length: "+String(num));
     client.println("Host: https://intense-shore-4027.herokuapp.com");
     client.print(var);
   } else {
     Serial.println("connection failed");
   }
}
