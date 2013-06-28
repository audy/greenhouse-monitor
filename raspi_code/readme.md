# GreenHouse Monitor - Raspberry Pi Code

- Take humidity temp readings.
- Store data in a database somewheres.
- Respond to text messages.
  - DATA # returns current temp and humidity.
  - HIGHS # returns highest/lowest temp. humidity in the last XX
    hours/days.
- Sends text message alerts if temp/humidity goes out of range.
- Sends 'testing' alert every so often so that I know it's working.
- Sends data to the web app running on Heroku every so often (optimize
  so that I don't run out of data before the month is over).
- The web app will also alert me if it stops hearing from the raspberry
  pi.

## Software Instructions

1. Compile Adafruit DHT Sensor Driver
2. Copy `Adafruit_DHT` to `/usr/local/bin/Adafruit_DHT`
3. Test by typing `Adafruit_DHT 22 4` and verifying that a temperature and humidity reading is being made.
4. Edit `/etc/rc.local` to start the script automatically when the Raspberry Pi boots:
```
screen -L -S monitor -m -d /home/pi/greenhouse_monitor/raspi_code/start_script.sh
```

This will create a log file at `/screenlog.0`

5. It's also a good idea to configure the Raspberry Pi to have a static
IP address so you can diagnose problems by connecting your laptop to the
Raspberry Pi directly via ethernet. This can be accomplished by editing
the `/etc/network/interfaces` file.

  - Change `iface eth0 inet dhcp` to `iface eth0 inet static`
  - Add the following below this line:
    ``` 
    address 192.168.100.1
    netmask 255.255.255.0
    network 192.168.100.0
    broadcast 192.168.100.255
    gateway 192.168.100.254
    ```
  - You should be able to SSH to the Raspberry Pi using a direct
    laptop->ethernet->raspi connection.

6. TODO instructions for setting up Sakis3G and UMTSkeeper.
