# Raspberry Pi Code

- Takes temperature and humidity readings every 60 seconds.
- Sends data to the web app.
- Works with either 3G/Ethernet or WiFi.

## Monitor Script

1. Download & Compile [Adafruit DHT Sensor Driver](https://github.com/adafruit/Adafruit-Raspberry-Pi-Python-Code).
2. Copy `Adafruit_DHT` to `/usr/local/bin/Adafruit_DHT`.
3. Test by typing `Adafruit_DHT 22 4` and verifying that a temperature and humidity reading is being made.
4. Edit `/etc/rc.local` to start the script automatically when the Raspberry Pi boots:

        screen -L -S monitor -m -d /home/pi/greenhouse_monitor/raspi_code/start_script.sh

  This will create a log file at `/screenlog.0`

## Ethernet Config

It's also a good idea to configure the Raspberry Pi to have a static
IP address so you can diagnose problems by connecting your laptop to the
Raspberry Pi directly via ethernet. This can be accomplished by editing
the `/etc/network/interfaces` file.

1. Change `iface eth0 inet dhcp` to `iface eth0 inet static`
2. Add the following below this line:

        address 192.168.100.1
        netmask 255.255.255.0
        network 192.168.100.0
        broadcast 192.168.100.255
        gateway 192.168.100.254

3. You should be able to SSH to the Raspberry Pi using a direct
   laptop->ethernet->raspi connection.

## 3G config:

TODO instructions for setting up Sakis3G and UMTSkeeper.
