<?php

//cors
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

//connection with database
$serverName = "DEJANA"; 
$connectionInfo = array( "Database"=>"Aviokompanija","CharacterSet" => "UTF-8");
$conn = sqlsrv_connect( $serverName, $connectionInfo);
if( $conn ) {
     //echo "Connection established.<br />";
}else{
     echo "Connection could not be established.<br />";
     die( print_r( sqlsrv_errors(), true));
}
?>