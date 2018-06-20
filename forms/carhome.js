
var carData;


function showCars(){
	
}

function parseCarData(){	
 var data=document.getElementById('dbData').textContent;
 var p=JSON.parse(data);
 console.log(JSON.stringify(p));
}

setInterval(parseCarData,3000);
