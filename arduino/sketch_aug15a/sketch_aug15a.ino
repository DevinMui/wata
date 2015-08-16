
#include <SPI.h>
#include <Ethernet.h>

char server[] = "http://localhost:3000/";
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED }; 
byte ip[] = {10, 1, 5, 231};
int moistureSensor = 1;
EthernetClient client;

void setup() {
  Serial.begin(9600);
  if (Ethernet.begin(mac) == 0) {
    Serial.println("Failed to configure Ethernet using DHCP");
    // no point in carrying on, so do nothing forevermore:
    // try to congifure using IP address instead of DHCP:
    Ethernet.begin(mac, ip);
  }
  delay(1000);
  Serial.println("connecting...");
  if(client.connect(server, 80)) {
    Serial.println("connected");
    client.println("GET /api/v1/water_usages/ HTTP/1.1");
    client.println("Host: http://localhost:3000");
    client.println("Connection: close");
    client.println();
  }
}

void loop() {
  int moistureVal = analogRead(moistureSensor);
  Serial.print("Moisture:");
  Serial.print(moistureVal);
  Serial.println();
    if(client.connect(server, 80)) {
    Serial.println("connected");
    client.println("GET /api/v1/water_usages/ HTTP/1.1");
    client.println("Host: http://localhost:3000");
    client.println("Connection: close");
    client.println();
  }
}
