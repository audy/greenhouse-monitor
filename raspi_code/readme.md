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
