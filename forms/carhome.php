<?php



define('DBHOST', 'localhost');
define('DBUSER', 'root');
define('DBPASS', '');
define('DBNAME', 'cr09_matthias_liszt_carrental');

function connectDB()
  {$conn = mysqli_connect(DBHOST,DBUSER,DBPASS,DBNAME);


     if ( !$conn ) {
      die("Connection failed : " . mysqli_error());
     }
    return $conn; 
   }  

 function getAllCars($connect){
  $sql="select * from car";
  $result=mysqli_query($connect,$sql);

  if(mysqli_num_rows($result)>0)
   {
   	while($row = mysqli_fetch_assoc($result))
   	           {
                $carId=$row['carId'];
                $carType=$row['carType'];
                $capacity=$row['capacity'];
                $power=$row['power'];
                $seats=$row['seats'];
                $prodYear=$row['prodYear'];
                $tankCapacity=$row['tankCapacity'];
                echo "{ \"carId\": $carId, \"carType\": \"$carType\", \"capacity\": $capacity, \"power\": $power, \"seats\": $seats, \"prodYear\": $prodYear, \"tankCapacity\": $tankCapacity },";
               }
    echo "{\"nothing\": 0}";          
   }	
 } 


?>

<html>
<head>
<title>Googoo Car Rental</title>	
</head>
<body>

<div id="showCars"></div>	
<div id="dbData" style="display:none;">[  
 <?php
   $connect=connectDB();
   getAllCars($connect);
 ?>
 ]
</div>	
<script src="carhome.js"></script>
</body>
</html>