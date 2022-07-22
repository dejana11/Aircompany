<?php

include_once("connection.php");

//kupljenje podataka
$received = json_decode(file_get_contents('php://input'), true);
$type =$received['type'];


switch ($type) {
     //izvrsavanje search metode
     case 'search':
          $data=array();
          $model=$received['model'];
          $procedure="{ CALL IzlistavanjeKlasa (?,?,?)}";
          $params = array(array($model['name'], SQLSRV_PARAM_IN),array($model['pageNumber'], SQLSRV_PARAM_IN),array($model['numberOfRows'], SQLSRV_PARAM_IN));
          $result = sqlsrv_query( $conn, $procedure,$params);

          if( $result === false)  
          {  
            echo "Error in query preparation/execution.\n";  
            die( print_r( sqlsrv_errors(), true));  
          }  
  
          while( $row = sqlsrv_fetch_array( $result))  
          {  
             $data[]=$row;
          }  
          echo json_encode($data);
          break;
     //izvrsavanje create metode
     case "create":
          $model=$received['model'];
          $query = "INSERT INTO Klasa([Naziv],[Cijena],[Obrisan]) VALUES (?,?,?)";
          $params = array( array($model['Naziv'], SQLSRV_PARAM_IN),array($model['Cijena'], SQLSRV_PARAM_IN),array(0, SQLSRV_PARAM_IN));
          $stmt = sqlsrv_query( $conn, $query, $params);
          break;
     //izvrsavanje get metode
     case "get":
          $data=array();
          $id=$received['id'];
          $query = "SELECT * FROM Klasa WHERE PkKlasaID=".$id;
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
          $query = "UPDATE Klasa SET [Naziv] =(?),[Cijena]=(?) WHERE PkKlasaID=".$model['PkKlasaID'];
          $params = array( array($model['Naziv'], SQLSRV_PARAM_IN),array($model['Cijena'], SQLSRV_PARAM_IN));
          $stmt = sqlsrv_query( $conn, $query,$params);
          break;
    //izvrsavanje delete metode
     case "delete":
          $id=$received['id'];
          $query = "UPDATE Klasa SET [Obrisan]=1 WHERE PkKlasaID=".$id;
          $stmt = sqlsrv_query( $conn, $query);
          break;
     default:
          break;
}
?>