<?php

include_once("connection.php");

//kupljenje podataka
$received = json_decode(file_get_contents('php://input'), true);
$type =$received['type'];

switch ($type) {
    case "get":
        $data=array();
        $query = "SELECT * FROM Kompanija";
        $result = sqlsrv_query( $conn,  $query);

        if( $result === false)  
        {  
           echo "Error in query preparation/execution.\n";  
           die( print_r( sqlsrv_errors(), true));  
        }  
  
        while( $row = sqlsrv_fetch_array( $result))  
        {  
           $data=$row;
        }  
        echo json_encode($data);
    break;
    //izvrsavanje edit metode
    case "edit":
        $model=$received['model'];
        $query = "UPDATE Kompanija SET [Naziv] =(?),[Adresa]=(?),[Telefon]=(?),[E-mail]=(?)
        ,[PostanskiBroj]=(?)
        ,[Grad]=(?)
        ,[Opis]=(?)  WHERE PkKompanijaID=".$model['PkKompanijaID'];
        $params = array( array($model['Naziv'], SQLSRV_PARAM_IN),array($model['Adresa'], SQLSRV_PARAM_IN),
        array($model['Telefon'], SQLSRV_PARAM_IN),array($model['E-mail'], SQLSRV_PARAM_IN)
        ,array($model['PostanskiBroj'], SQLSRV_PARAM_IN),array($model['Grad'], SQLSRV_PARAM_IN),
        array($model['Opis'], SQLSRV_PARAM_IN));
        $stmt = sqlsrv_query( $conn, $query,$params);
    break;

}



?>