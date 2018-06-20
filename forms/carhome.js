
var carData;


function showCars(){
 var cars=[];
 carData.pop();
 carData.map(function(x){var e=`<div class="col-sm-5 col-md-5 col-lg-5 car">
 	                            <img class="dummyimage" src="../pics/${x.img}" />
 	                            <p>${x.carType}</p>
 	                            <p>${x.power} kW</p>
 	                            <p>${x.prodYear}</p>   
 	                            </div>
 	                           `;
 	                     cars.push(e);      

                        });	
 //console.log(cars.join(''));
 $("#showCars").html(cars.join(''));	
	
}

function parseCarData(){	
 var data=document.getElementById('dbData').textContent;
 var p=JSON.parse(data);
 //console.log(JSON.stringify(p));
 carData=p;
}

setTimeout(parseCarData,1500);
setTimeout(showCars,1500);

