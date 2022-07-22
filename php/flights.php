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
          $procedure="{ CALL IzlistavanjeLetova (?,?,?,?,?,?)}";
          $params = array(array(null, SQLSRV_PARAM_IN),array($model['from'], SQLSRV_PARAM_IN), array($model['to'], SQLSRV_PARAM_IN),
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
          $query = "INSERT INTO Letovi([BrojLeta],[FkMjestoPolijetanja],[FkMjestoSlijetanja]
          ,[DatumLeta],[VrijemePolijetanja],[VrijemeSlijetanja],[FkAvionID],[FkStutusLetaID],[Cijena]) VALUES (?,?,?,?,?,?,?,?,?)";
          $params = array( array($model['BrojLeta'], SQLSRV_PARAM_IN),array($model['FkMjestoPolijetanja'], SQLSRV_PARAM_IN),
          array($model['FkMjestoSlijetanja'], SQLSRV_PARAM_IN),array($model['DatumLeta'], SQLSRV_PARAM_IN),array($model['VrijemePolijetanja'], SQLSRV_PARAM_IN),
          array($model['VrijemeSlijetanja'], SQLSRV_PARAM_IN),array($model['FkAvionID'], SQLSRV_PARAM_IN),
          array($model['FkStutusLetaID'], SQLSRV_PARAM_IN),array($model['Cijena'], SQLSRV_PARAM_IN));
          $stmt = sqlsrv_query( $conn, $query, $params);
          break;
     //izvrsavanje get metode
     case "get":
          $data=array();
          $id=$received['id'];
          $procedure="{ CALL IzlistavanjeLetova (?,?,?,?,?,?)}";
          $params = array(array($id, SQLSRV_PARAM_IN),array(null, SQLSRV_PARAM_IN), array(null, SQLSRV_PARAM_IN),
          array(null, SQLSRV_PARAM_IN),
          array(1, SQLSRV_PARAM_IN),
          array(1, SQLSRV_PARAM_IN));
          $result = sqlsrv_query( $conn, $procedure,$params);

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
          $query = "UPDATE Letovi SET [BrojLeta] =(?),[FkMjestoPolijetanja]=(?),[FkMjestoSlijetanja]=(?),[DatumLeta]=(?),
          [VrijemePolijetanja]=(?),[VrijemeSlijetanja]=(?),[FkAvionID]=(?),[FkStutusLetaID]=(?),[Cijena]=(?) WHERE PkLetID=".$model['PkLetID'];
          $params = array( array($model['BrojLeta'], SQLSRV_PARAM_IN),array($model['FkMjestoPolijetanja'], SQLSRV_PARAM_IN),
          array($model['FkMjestoSlijetanja'], SQLSRV_PARAM_IN),array($model['DatumLeta'], SQLSRV_PARAM_IN),array($model['VrijemePolijetanja'], SQLSRV_PARAM_IN),
          array($model['VrijemeSlijetanja'], SQLSRV_PARAM_IN),array($model['FkAvionID'], SQLSRV_PARAM_IN),
          array($model['FkStutusLetaID'], SQLSRV_PARAM_IN),array($model['Cijena'], SQLSRV_PARAM_IN));
          $stmt = sqlsrv_query( $conn, $query,$params);
          break;
     //izvrsavanje delete metode
     case "delete":
          $id=$received['id'];
          //brisanje svih rezervacija
          $queryRezer="DELETE FROM Rezervacije WHERE FkLetID=".$id;
          $stmtRezer= sqlsrv_query( $conn, $queryRezer);
          //brisanje svih usputnih stanica leta
          $queryStation="DELETE FROM UsputneStanice WHERE FkLetID=".$id;
          $stmtStation= sqlsrv_query( $conn, $queryStation); 
          //brisanje svih letova radnika
          $queryUser="DELETE FROM LetoviRadnika WHERE FkLetID=".$id;
          $stmtUser= sqlsrv_query( $conn, $queryUser); 
          //brisanje leta
          $query = "DELETE FROM Letovi WHERE PkLetID=".$id;
          $stmt = sqlsrv_query( $conn, $query);
          break;
     //izvrsavanje user get metode
     case "user":
          $data=array();
          $id=$received['id'];
          $procedure="{ CALL IzlistavanjeLetovaPojedinacnogRadnika(?)}";
          $params = array(array($id, SQLSRV_PARAM_IN));
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
     default:
          break;
}
?>