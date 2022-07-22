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
          $procedure="{ CALL IzlistavanjeVijesti (?,?,?)}";
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
          $query = "INSERT INTO Vijesti([Naslov],[KratkiOpis],[Opis],[Slika],[FkRadnikID]) VALUES (?,?,?,?,?)";
          $params = array( array($model['Naslov'], SQLSRV_PARAM_IN),array($model['KratkiOpis'], SQLSRV_PARAM_IN),array($model['Opis'], SQLSRV_PARAM_IN),array($model['Slika'], SQLSRV_PARAM_IN),array($model['FkRadnikID'], SQLSRV_PARAM_IN));
          $stmt = sqlsrv_query( $conn, $query, $params);
          break;
     //izvrsavanje get metode
     case "get":
          $data=array();
          $id=$received['id'];
          $query = "SELECT v.PkVijestiID AS 'PkVijestiID',v.Naslov AS 'Naslov',v.KratkiOpis AS 'KratkiOpis',v.Opis AS 'Opis',v.Slika AS 'Slika',
          v.FkRadnikID AS 'FkRadnikID',K.Ime AS 'Ime',K.Prezime AS 'Prezime', UkupanBroj= COUNT(*) OVER() FROM Vijesti v,Korisnici K
          WHERE v.FkRadnikID=K.PkKorisnikID and  v.PkVijestiID=".$id;
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
          $query = "UPDATE Vijesti SET [Naslov]=(?),[KratkiOpis]=(?),[Opis]=(?),[Slika]=(?),[FkRadnikID]=(?) WHERE PkVijestiID=".$model['PkVijestiID'];
          $params = array( array($model['Naslov'], SQLSRV_PARAM_IN),array($model['KratkiOpis'], SQLSRV_PARAM_IN),array($model['Opis'], SQLSRV_PARAM_IN),array($model['Slika'], SQLSRV_PARAM_IN),array($model['FkRadnikID'], SQLSRV_PARAM_IN));
          $stmt = sqlsrv_query( $conn, $query,$params);
          break;
     case "delete":
          $model=$received['model'];
          unlink($model['Slika']);
          $query = "DELETE FROM Vijesti WHERE PkVijestiID=".$model['PkVijestiID'];
          $stmt = sqlsrv_query( $conn, $query);
          break;
    default:
        break;
}
?>