# Orrery
Orrery, displaying the major planets and moons of the Solar System.

This orrery allow to display the angle of the major planets and their moons.
Attention ! It doesn't respect size or distance, it only take into account angles from the Sun, and from the parent planet for the moons.
Note, it's not that visible, but there is a little 3D effect, particularly on the moons of Uranus, to display more accurately the positions of the moons, before or behind the planet from the POV of the observer.

### Usage
Two possibilities : 
Either you clone the repo in the right folder of your web server
Or you download the archive in the releases, then you have to run the script in the data folder, which will download and format data from the NASA to our use. It will take a loooonnng time, and around 190MB of disk space (but you can change the timespan of the data you want in the script). Finally, you can open the index.html, or if you have a PHP enabled web server, index.php.
You can also do a pseudo-animation by pressing 'p' for play (and for 'pause', also).
That's all !

Note : You have access to more information when hovering over the objects.

### Legals
The licence is WTFTHYW. I would love you to keep my pseudo around somewhere, if you fork/use the code, but whatever.

### Acknowledgements
This project uses :
* [D3.js](https://d3js.org) for displaying everything
* astronomy.js from Don Cross http://cosinekitty.com/solar_system.html to calculate the position of the planets. I did a bit of modifications/cleaning in this last one, but nothing drastic.
* [NASA's HORIZONS system](https://ssd.jpl.nasa.gov/?horizons), which is awesome and allow you to get the position of almost any celestial object !
* Also http://www.howmanypeopleareinspacerightnow.com, to know how many people are in space right now (obviously). This feature is only an easter egg, of course.

### Disclaimer
This project was only a personal tool, and so, isn't tested that much, and I'm not even sure that it works fairly well. So don't trust it with your life, not even for your Kerbal life.
