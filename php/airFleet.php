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
          $procedure="{ CALL IzlistavanjeAvioflote (?,?,?)}";
          $params = array(array($model['type'], SQLSRV_PARAM_IN),array($model['pageNumber'], SQLSRV_PARAM_IN),array($model['numberOfRows'], SQLSRV_PARAM_IN));
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
     //izvrsavanje get metode
     case "getall":
          $data=array();
          $query = "SELECT * FROM Avioflota";
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
          $query = "INSERT INTO Avioflota([FkTipID],[SerijskiBroj],[BrojSjedista],[KapacitetRezervoara],[Nosivost]) VALUES (?,?,?,?,?)";
          $params = array( array($model['FkTipID'], SQLSRV_PARAM_IN),array($model['SerijskiBroj'], SQLSRV_PARAM_IN),
          array($model['BrojSjedista'], SQLSRV_PARAM_IN),
          array($model['KapacitetRezervoara'], SQLSRV_PARAM_IN),
          array($model['Nosivost'], SQLSRV_PARAM_IN));
          $stmt = sqlsrv_query( $conn, $query, $params);
          break;
     //izvrsavanje get metode
     case "get":
          $data=array();
          $id=$received['id'];
          $query = "SELECT * FROM Avioflota WHERE PkAvionID=".$id;
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
          $query = "UPDATE Avioflota SET [FkTipID] =(?),[SerijskiBroj]=(?),[BrojSjedista]=(?),[KapacitetRezervoara]=(?),[Nosivost]=(?) WHERE PkAvionID=".$model['PkAvionID'];
          $params = array( array($model['FkTipID'], SQLSRV_PARAM_IN),array($model['SerijskiBroj'], SQLSRV_PARAM_IN),
          array($model['BrojSjedista'], SQLSRV_PARAM_IN),
          array($model['KapacitetRezervoara'], SQLSRV_PARAM_IN),
          array($model['Nosivost'], SQLSRV_PARAM_IN));
          $stmt = sqlsrv_query( $conn, $query,$params);
          break;
     //izvrsavanje delete metode
     case "delete":
          $id=$received['id'];
          //brisanje svih letova koje letim datim avionom 
          $queryFlight="DELETE FROM Letovi WHERE FkAvionID=".$id;
          $stmtFlight= sqlsrv_query( $conn, $queryFlight);
          //brisanje aviona
          $query= "DELETE FROM Avioflota WHERE PkAvionID=".$id;
          $stmt = sqlsrv_query( $conn, $query);
          break;
     default:
          break;
}
?>