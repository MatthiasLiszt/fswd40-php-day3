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
                $img=$row['img'];
                echo "{ \"carId\": $carId, \"carType\": \"$carType\", \"capacity\": $capacity, \"power\": $power, \"seats\": $seats, \"prodYear\": $prodYear, \"tankCapacity\": $tankCapacity, \"img\": \"$img\" },";
               }
    echo "{\"nothing\": 0}";          
   }	
 } 


?>

<html>
<head>
<title>Googoo Car Rental</title>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="carhome.css">
</head>
<body>

<div id="showCars" class="container-fluid">...loading ,wait a second</div>	
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