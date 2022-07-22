<?php

include_once("connection.php");

//kupljenje podataka
$received = json_decode(file_get_contents('php://input'), true);
$type =$received['type'];


switch ($type) {
     //izvrsavanje search metode
     case 'get':
          $data=array();
          $id=$received['id'];
          $procedure="{ CALL IzlistavanjeUsputnihStanica (?)}";
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
     //izvrsavanje create metode
     case "add":
          $model=$received['model'];
          $query = "INSERT INTO UsputneStanice([FkLetID],[FkFilijalaID]) VALUES (?,?)";
          $params = array( array($model['FkLetID'], SQLSRV_PARAM_IN),array($model['FkFilijalaID'], SQLSRV_PARAM_IN));
          $stmt = sqlsrv_query( $conn, $query, $params);
          break;
     //izvrsavanje delete metode
     case "delete":
          $id=$received['id'];
          $query = "DELETE FROM UsputneStanice WHERE PkUsputneStaniceId=".$id;
          $stmt = sqlsrv_query( $conn, $query);
          break;
     default:
          break;
}
?>