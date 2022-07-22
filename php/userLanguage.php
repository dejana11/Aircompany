<?php

include_once("connection.php");

//kupljenje podataka
$received = json_decode(file_get_contents('php://input'), true);
$type =$received['type'];


switch ($type) {
      //izvrsavanje get metode
      case "get":
        $data=array();
        $id=$received['id'];
        $query = "SELECT JR.PkJeziciRadnika,J.Naziv,JR.FkJezikID FROM JeziciRadnika JR, Jezici J WHERE J.PkJezikID=JR.FkJezikID and JR.FkRadnikID=".$id;
        $result = sqlsrv_query( $conn,$query);

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
     //dodavanje jezika na korisnika
     case 'add':
        $model=$received['model'];
        $query = "INSERT INTO JeziciRadnika([FkJezikID],[FkRadnikID]) VALUES (?,?)";
        $params = array( array($model['FkJezikID'], SQLSRV_PARAM_IN),array($model['FkRadnikID'], SQLSRV_PARAM_IN));
        $stmt = sqlsrv_query( $conn, $query, $params);
        break;
    //izvrsavanje delete metode
    case "delete":
        $id=$received['id'];
        $query = "DELETE FROM JeziciRadnika WHERE PkJeziciRadnika=".$id;
        $stmt = sqlsrv_query( $conn, $query);
        break;
     default:
          break;
}
?>