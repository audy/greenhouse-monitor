# GreenHouse Monitor

A temperature and humidity data logger and alert system I built to save
the orange trees at our greenhouse at the University of Florida.

![This is what it looks like](http://i.imgur.com/kcUbzLx.jpg)

(Demo of web app)[http://triplab.ad.ufl.edu:4567/]

## How does it work?

- RaspberryPi
- Temperature and Humidity sensor
- 3G Cellular Data Dongle
- Web App running on the cloud somewhere (Heroku is fine) that receives
  data from the sensor
- Can also send data/receive commands via text message

## Instructions

0. Buy Supplies
  - (1) Raspberry Pi
  - (1) DHT22 Temperature and Humidity sensor
  - (1) Breadboard and (4) Jumper wires
  - (1) 4-10 Ohm resistor
  - (1) Greenhouse
1. Configure Raspberry Pi
  - [DHT22 Circuit](http://learn.adafruit.com/dht)
  - [Software](https://github.com/audy/greenhouse-monitor/tree/master/raspi_code)
2. [Configure web app](https://github.com/audy/greenhouse-monitor/tree/master/web_app)

## LICENSE

The MIT License (MIT)

Copyright (c) 2013 Austin G. Davis-Richardson

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
