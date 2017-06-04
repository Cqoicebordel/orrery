// Orrery.js from Cqoicebordel
// http://www.cqoicebordel.net


// Name, color, angle, x, y
var planets = [["Mercure", 	"#B87848"],
			   ["Venus", 	"#EAD0A5"],
			   ["Terre", 	"#619ABA"],
			   ["Mars", 	"#B42406"],
			   ["Jupiter", 	"#EE9D5F"],
			   ["Saturne", 	"#DEC0AD"],
			   ["Uranus", 	"#C8EDD7"],
			   ["Neptune", 	"#4B89FF"],
			   ["Pluton", 	"#A5825A"]];

// Name, color, folder, planetIndex, index, angle, x, y
var moons = [["Lune",     		"#A9A9A8", "e1", 2, 0],
			 ["Phobos", 		"#989898", "m1", 3, 0],
			 ["Deimos",   		"#757575", "m2", 3, 1],
			 ["Io",       		"#D56E10", "j1", 4, 0],
			 ["Europe",   		"#A19879", "j2", 4, 1],
			 ["Ganymede", 		"#C9B19C", "j3", 4, 2],
			 ["Callisto", 		"#553D3F", "j4", 4, 3],
			 ["Mimas",    		"#B9B9B9", "s1", 5, 0],
			 ["Encelade", 		"#E3E3E3", "s2", 5, 1],
			 ["T&eacute;thys",	"#C8C8C8", "s3", 5, 2],
			 ["Dion&eacute;",	"#BCBCBC", "s4", 5, 3],
			 ["Rh&eacute;a",	"#D5CFBF", "s5", 5, 4],
			 ["Titan",    		"#C09858", "s6", 5, 5],
			 ["Hyp&eacute;rion","#B4A392", "s7", 5, 6],
			 ["Japet",    		"#929383", "s8", 5, 7],
			 ["Miranda",  		"#D6C3C4", "u5", 6, 0],
			 ["Ariel",    		"#AA9489", "u1", 6, 1],
			 ["Umbriel",  		"#F2CF82", "u2", 6, 2],
			 ["Titania",  		"#C4A68D", "u3", 6, 3],
			 ["Ob&eacute;ron",	"#BEB6AA", "u4", 6, 4],
			 ["Triton",   		"#F5DBA5", "n1", 7, 0],
			 ["Charon",   		"#A2917B", "p1", 8, 0],
			 ["Styx",     		"#A2917B", "p5", 8, 1],
			 ["Nix",      		"#F0C085", "p2", 8, 2],
			 ["Kerb&eacute;ros","#BD8871", "p4", 8, 3],
			 ["Hydre",			"#AE7063", "p3", 8, 4]];

// Config
var months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
var r = 8;
var rM = 3;
var margin = 50;
var marginMoon = 15;
var width = Math.max(document.documentElement.clientWidth, window.innerWidth || 0)-20;
var height = Math.max(document.documentElement.clientHeight, window.innerHeight || 0)-20;
var ratio = Math.min(width,height)/190;
var ratioM = Math.min(width,height)/190;

// Get planet angle from the Sun
function getAnglePlanet(p, day){
	if (p.Name != "Sun") {
		var ec = p.EclipticAngularCoordinates (day);
		return ec.longitude;
	}
}

// Calculate display coordinates from angle
function coordinatesPlanet(numberPlanet, angle){
	var angleRad = angle*(Math.PI / 180);
	return [-(margin+ratio*numberPlanet)*Math.sin(angleRad), -(margin+ratio*numberPlanet)*Math.cos(angleRad)];
}

// Get the angle of a moon from the data stored in the CSVs
function getAngleMoon(data){
	for(var i=0; i<data.length; i++){
		if(data[i][0] == dateCSV){
			return [(parseFloat(data[i][1]) + (now.getUTCMinutes() * (parseFloat(data[i+1][1]) - parseFloat(data[i][1])))/60), (parseFloat(data[i][2]) + (now.getUTCMinutes() * (parseFloat(data[i+1][2]) - parseFloat(data[i][2])))/60)];
		}
	}
}

// Get display coordinates of a moon, based on the coordinates of the parent planet, and the index of the moon
function coordinatesMoon(xPlanet, yPlanet, indexMoon, angle){
	var angleRad = angle*(Math.PI / 180);
	return [xPlanet-(marginMoon+ratioM*indexMoon)*Math.sin(angleRad), yPlanet-(marginMoon+ratioM*indexMoon)*Math.cos(angleRad)];
}

// Update the display
function update(){
	day = Astronomy.DayValue(new Date());
	now = new Date();
	dateCSV = now.getUTCFullYear() + "-" + months[now.getUTCMonth()] + "-" + ((now.getUTCDate()<10)?"0"+now.getUTCDate():now.getUTCDate()) + " " + ((now.getUTCHours()<10)?"0"+now.getUTCHours():now.getUTCHours()) + ":00:00";
	
	for (var i in Astronomy.Body) {
		planets[i][2] = getAnglePlanet(Astronomy.Body[i], day);
		var coord = coordinatesPlanet(i+1, planets[i][2]);
		planets[i][3] = coord[0];
		planets[i][4] = coord[1];
		d3.select("#p"+i)
		  .attr("cx", planets[i][3])
		  .attr("cy", planets[i][4]);
		d3.select("#titlep"+i).html(planets[i][0] + " - " + planets[i][2]);
	}

	for (let i=0; i<moons.length; i++){
		d3.text("./data/"+moons[i][2]+"/"+now.getUTCFullYear()+"-"+((now.getUTCMonth()+1<10)?"0"+(now.getUTCMonth()+1):(now.getUTCMonth()+1))+".csv", function(text){
			var data = d3.csvParseRows(text);
			var moonAngle = getAngleMoon(data);
			moons[i][5] = moonAngle[0];
			moons[i][6] = moonAngle[1]
			var coord = coordinatesMoon(planets[moons[i][3]][3], planets[moons[i][3]][4], moons[i][4], moons[i][5]);
			moons[i][7] = coord[0];
			moons[i][8] = coord[1];
			d3.select("#m"+i)
			  .attr("cx", moons[i][7])
			  .attr("cy", moons[i][8])
			  .attr("r", rM + (moons[i][6]/40));
			d3.select("#titlem"+i).html(moons[i][0] + " - " + moons[i][5] + "x" + moons[i][6]);
		});
	}
}

var now = new Date(); 
var dateCSV = now.getUTCFullYear() + "-" + months[now.getUTCMonth()] + "-" + ((now.getUTCDate()<10)?"0"+now.getUTCDate():now.getUTCDate()) + " " + ((now.getUTCHours()<10)?"0"+now.getUTCHours():now.getUTCHours()) + ":00:00";

// Main display area
var svg = d3.select("body").append("svg")
			.attr("width", width)
			.attr("height", height)
			.append("g")
			.attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

// Display the Sun
svg.append("circle").attr("cx", 0)
					.attr("cy", 0)
					.attr("r", 3*r)
					.attr("fill", "yellow");



var day = Astronomy.DayValue(new Date());

// Display the planets
for (var i in Astronomy.Body) {
	planets[i] = planets[i].concat(getAnglePlanet(Astronomy.Body[i], day));
	planets[i] = planets[i].concat(coordinatesPlanet(i+1, planets[i][2]));
	svg.append("circle")
	   .attr("cx", 0)
	   .attr("cy", 0)
	   .attr("r", ratio*(i+1)+margin)
	   .attr("fill", "none")
	   .attr("stroke", "grey");
	svg.append("circle")
	   .attr("cx", planets[i][3])
	   .attr("cy", planets[i][4])
	   .attr("r", r)
	   .attr("fill", planets[i][1])
	   .attr("id", "p"+i)
	   .append("svg:title").attr("id", "titlep"+i).html(planets[i][0] + " - " + planets[i][2]);
}

// Display the moons
for (let i=0; i<moons.length; i++){
	d3.text("./data/"+moons[i][2]+"/"+now.getUTCFullYear()+"-"+((now.getUTCMonth()+1<10)?"0"+(now.getUTCMonth()+1):(now.getUTCMonth()+1))+".csv", function(text){
		var data = d3.csvParseRows(text);
		moons[i] = moons[i].concat(getAngleMoon(data));
		moons[i] = moons[i].concat(coordinatesMoon(planets[moons[i][3]][3], planets[moons[i][3]][4], moons[i][4], moons[i][5]));
		svg.append("circle")
			.attr("cx", moons[i][7])
			.attr("cy", moons[i][8])
			.attr("r", rM + (moons[i][6]/40))
			.attr("fill", moons[i][1])
			.attr("id", "m"+i)
			.append("svg:title").attr("id", "titlem"+i).html(moons[i][0] + " - " + moons[i][5] + "x" + moons[i][6]);
	});
}

// Autoupdates every minutes
window.setInterval(update, 60000);
