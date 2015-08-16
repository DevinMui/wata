import serial
import requests
import json

url = "https://intense-shore-4027.herokuapp.com/api/v1/water_usages/"
ser = serial.Serial('/dev/cu.usbmodem1411', 9600)
def create_data(moisture):
  headers = {'content-type': 'application/json', 'accept': 'application/json'}
  # GA coordinates
  values = {'water_usage': {'moisture' : moisture}}
  values = json.dumps(values)
  d = requests.post(url, data=values, headers=headers)
  return d.text

while True:
	data = int(ser.readline())
	create_data(data)
	print "Moisture: " + str(data)