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
          $procedure="{ CALL IzistavanjeFilijala (?,?,?)}";
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
     //izvrsavanje getall metode
     case 'getall':
          $data=array();
          $query = "SELECT * FROM Filijale";
          $result = sqlsrv_query( $conn,  $query);

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
          $query = "INSERT INTO Filijale([Grad],[Slika]) VALUES (?,?)";
          $params = array( array($model['Grad'], SQLSRV_PARAM_IN),array($model['Slika'], SQLSRV_PARAM_IN));
          $stmt = sqlsrv_query( $conn, $query, $params);
          break;
     //izvrsavanje get metode
     case "get":
          $data=array();
          $id=$received['id'];
          $query = "SELECT * FROM Filijale WHERE PkFilijalaID=".$id;
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
          $query = "UPDATE Filijale SET [Grad] =(?),[Slika]=(?) WHERE PkFilijalaID=".$model['PkFilijalaID'];
          $params = array( array($model['Grad'], SQLSRV_PARAM_IN),array($model['Slika'], SQLSRV_PARAM_IN));
          $stmt = sqlsrv_query( $conn, $query,$params);
          break;
    //izvrsavanje delete metode
     case "delete":
          $id=$received['id'];
          //brisanje svih letova koje polaze od date filijale 
          $queryFrom="DELETE FROM Letovi WHERE FkMjestoPolijetanja=".$id;
          $stmtFrom= sqlsrv_query( $conn, $queryFrom);
          //brisanje svih letova koje dolaze na datu filijalu 
          $queryTo="DELETE FROM Letovi WHERE FkMjestoSlijetanja=".$id;
          $stmtTo= sqlsrv_query( $conn, $queryTo);
          //brisanje filijala
          $query = "DELETE FROM Filijale WHERE PkFilijalaID=".$id;
          $stmt = sqlsrv_query( $conn, $query);
          break;
     default:
          break;
}
?>