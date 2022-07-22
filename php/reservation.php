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
          $procedure="{ CALL IzlistavanjeRezervacije  (?,?,?,?,?,?)}";
          $params = array(array($model['id'], SQLSRV_PARAM_IN),array($model['from'], SQLSRV_PARAM_IN), array($model['to'], SQLSRV_PARAM_IN),
          array($model['date'], SQLSRV_PARAM_IN),
          array($model['pageNumber'], SQLSRV_PARAM_IN),
          array($model['numberOfRows'], SQLSRV_PARAM_IN));
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
          $query = "INSERT INTO Rezervacije([FkKorisnikID],[FkLetID],[BrojSjedista],[FkKlasaID],[UkupnaCijena]) VALUES (?,?,?,?,?)";
          $params = array( array($model['FkKorisnikID'], SQLSRV_PARAM_IN),array($model['FkLetID'], SQLSRV_PARAM_IN),
          array($model['BrojSjedista'], SQLSRV_PARAM_IN),array($model['FkKlasaID'], SQLSRV_PARAM_IN),
          array($model['UkupnaCijena'], SQLSRV_PARAM_IN));
          $stmt = sqlsrv_query( $conn, $query, $params);
          break;
     //izvrsavanje get metode
     case "get":
          $data=array();
          $id=$received['id'];
          $query = "SELECT * FROM Rezervacije WHERE PkRezervacijeID=".$id;
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
          $query = "UPDATE Rezervacije SET [FkKorisnikID] =(?),[FkLetID]=(?),[BrojSjedista]=(?),[FkKlasaID]=(?),[UkupnaCijena]=(?)
          WHERE PkRezervacijeID=".$model['PkRezervacijeID'];
          $params = array( array($model['FkKorisnikID'], SQLSRV_PARAM_IN),array($model['FkLetID'], SQLSRV_PARAM_IN),
          array($model['BrojSjedista'], SQLSRV_PARAM_IN),array($model['FkKlasaID'], SQLSRV_PARAM_IN),
          array($model['UkupnaCijena'], SQLSRV_PARAM_IN));
          $stmt = sqlsrv_query( $conn, $query,$params);
          break;
     //izvrsavanje delete metode
     case "delete":
          $id=$received['id'];
          $query = "DELETE FROM Rezervacije WHERE PkRezervacijeID=".$id;
          $stmt = sqlsrv_query( $conn, $query);
          break;
     default:
          break;
}
?>