#include <SPI.h>
#include <EthernetV2_0.h>

byte mac[] = {  
  0x00, 0xAA, 0xBB, 0xCC, 0xDE, 0x02 };
  
EthernetClient client;
#define W5200_CS  10
#define SDCARD_CS 4
void setup() {
  Serial.begin(9600);
  pinMode(SDCARD_CS,OUTPUT);
  digitalWrite(SDCARD_CS,HIGH); //Deselect the SD card
  char server[] = "www.google.com";
  //char server[] = "http://192.168.1.122";

  // start the Ethernet connection:
  if (Ethernet.begin(mac) == 0) {
    Serial.println("Failed to configure Ethernet using DHCP");
    // no point in carrying on, so do nothing forevermore:
    for(;;);
  }
  // print your local IP address:
  Serial.print("My IP address: ");
  for (byte thisByte = 0; thisByte < 4; thisByte++) {
    // print the value of each byte of the IP address:
    Serial.print(Ethernet.localIP()[thisByte], DEC);
    Serial.print(".");
  }
  Serial.println();
  
  if (client.connect(server, 80)) {
    Serial.println("connected");
    // Make a HTTP request:
    client.println("GET /search?q=arduino HTTP:/1.1");
    //client.println("GET /api/v1/water_usages HTTP/1.1");
    //client.println("Host: http://192.168.1.122");
    client.println("Host: www.google.com");
    client.println("Connection: close");
    client.println();
  } else {
    Serial.println("Failed to connect");
  }
}

void loop() {

}


