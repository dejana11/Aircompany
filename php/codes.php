<?php

include_once("connection.php");

//kupljenje podataka
$received = json_decode(file_get_contents('php://input'), true);
$type =$received['type'];


switch ($type) {
     //dohvatanje uloga,zanimanja i strucnih sprema
     case 'codes':
        $data=array();
        $query = "SELECT * FROM Šifarnici WHERE Alias='strucna_sprema' AND FkRoditeljID is not null or Alias='uloga' and
        FkRoditeljID is not null or Alias='zanimanje' and FkRoditeljID is not null AND Obrisan=0";
        ini_set('mssql.charset', 'UTF-8');
        $result = sqlsrv_query( $conn,  $query);

        if( $result === false)  
        {  
          echo "Error in query preparation/execution.\n";  
          die( print_r( sqlsrv_errors(), true));  
        }  
  
        while($row = sqlsrv_fetch_array( $result))  
        {  
            $data[]=$row;
        }  
        echo json_encode($data);
        break;
    //izvrsavanje search metode
     case 'search':
          $data=array();
          $model=$received['model'];
          $procedure="{ CALL IzlistavanjeSifara (?,?,?)}";
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
          $query = "INSERT INTO Šifarnici([Naziv],[FkRoditeljID],[Alias],[Obrisan]) VALUES (?,?,?,?)";
          $params = array( array($model['Naziv'], SQLSRV_PARAM_IN),array($model['FkRoditeljID'], SQLSRV_PARAM_IN),
          array($model['Alias'], SQLSRV_PARAM_IN),array(0, SQLSRV_PARAM_IN));
          $stmt = sqlsrv_query( $conn, $query, $params);
          break;
     //izvrsavanje get metode
     case "get":
          $data=array();
          $id=$received['id'];
          $query = "SELECT * FROM Šifarnici WHERE PkŠifraID=".$id;
          $result = sqlsrv_query( $conn, $query);

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
          $query = "UPDATE Šifarnici SET [Naziv] =(?),[FkRoditeljID]=(?),[Alias]=(?) WHERE PkŠifraID=".$model['PkŠifraID'];
          $params = array( array($model['Naziv'], SQLSRV_PARAM_IN),array($model['FkRoditeljID'], SQLSRV_PARAM_IN),array($model['Alias'], SQLSRV_PARAM_IN));
          $stmt = sqlsrv_query( $conn, $query,$params);
          break;
     //izvrsavanje delete metode
     case "delete":
          $id=$received['id'];
          $query = "UPDATE Šifarnici SET [Obrisan]=1 WHERE PkŠifraID=".$id;
          $stmt = sqlsrv_query( $conn, $query);
          break;
     //dohvatanje pod sifara
     case "child":
          $data=array();
          $id=$received['id'];
          $query = "SELECT * FROM Šifarnici WHERE FkRoditeljID=".$id." AND Obrisan=0";
          $result = sqlsrv_query( $conn, $query);

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
     //dohvatanje sifara po aliasu 
     case "type":
          $data=array();
          $alias=$received['alias'];
          $query = "SELECT * FROM Šifarnici WHERE Alias='".$alias."' AND FkRoditeljID IS NOT NULL AND Obrisan=0";
          $result = sqlsrv_query( $conn, $query);
     
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