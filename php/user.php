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
          $procedure="{ CALL IzlistavanjeKorisnika (?,?,?,?)}";
          $params = array(array($model['name'], SQLSRV_PARAM_IN),array($model['pageNumber'], SQLSRV_PARAM_IN),array($model['numberOfRows'], SQLSRV_PARAM_IN),array(null, SQLSRV_PARAM_IN));
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
          $procedure="{ CALL KreriranjeKorisnika (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
          $params = array( array($model['Ime'], SQLSRV_PARAM_IN),
          array($model['Prezime'], SQLSRV_PARAM_IN),
          array($model['JMBG'], SQLSRV_PARAM_IN),
          array($model['StrucnaSprema'], SQLSRV_PARAM_IN),
          array($model['FkZanimanjeID'], SQLSRV_PARAM_IN),
          array($model['DatumZaposljavanja'], SQLSRV_PARAM_IN),
          array($model['Adresa'], SQLSRV_PARAM_IN),
          array($model['Grad'], SQLSRV_PARAM_IN),
          array($model['Telefon'], SQLSRV_PARAM_IN),
          array($model['Pol'], SQLSRV_PARAM_IN),
          array($model['E_mail'], SQLSRV_PARAM_IN),
          array($model['Lozinka'], SQLSRV_PARAM_IN),
          array($model['BrojPasosa'], SQLSRV_PARAM_IN),
          array($model['KorisnickoIme'], SQLSRV_PARAM_IN),
          array($model['FkUlogaID'], SQLSRV_PARAM_IN));
          $stmt = sqlsrv_query( $conn, $procedure, $params);
          break;
     //izvrsavanje get metode
     case "get":
          $data=array();
          $id=$received['id'];
          $procedure="{ CALL IzlistavanjeKorisnika (?,?,?,?)}";
          $params = array(array('', SQLSRV_PARAM_IN),array(1, SQLSRV_PARAM_IN),array(1, SQLSRV_PARAM_IN),array($id, SQLSRV_PARAM_IN));
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
          $procedure="{ CALL IzmjenaKorisnika (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
          $params = array(array($model['PkKorisnikID'], SQLSRV_PARAM_IN),
          array($model['Ime'], SQLSRV_PARAM_IN),
          array($model['Prezime'], SQLSRV_PARAM_IN),
          array($model['JMBG'], SQLSRV_PARAM_IN),
          array($model['StrucnaSprema'], SQLSRV_PARAM_IN),
          array($model['FkZanimanjeID'], SQLSRV_PARAM_IN),
          array($model['DatumZaposljavanja'], SQLSRV_PARAM_IN),
          array($model['Adresa'], SQLSRV_PARAM_IN),
          array($model['Grad'], SQLSRV_PARAM_IN),
          array($model['Telefon'], SQLSRV_PARAM_IN),
          array($model['Pol'], SQLSRV_PARAM_IN),
          array($model['E_mail'], SQLSRV_PARAM_IN),
          array($model['Lozinka'], SQLSRV_PARAM_IN),
          array($model['BrojPasosa'], SQLSRV_PARAM_IN),
          array($model['KorisnickoIme'], SQLSRV_PARAM_IN),
          array($model['FkUlogaID'], SQLSRV_PARAM_IN));
          $stmt = sqlsrv_query( $conn, $procedure,$params);
          break;
     //izvrsavanje delete metode
     case "delete":
          $id=$received['id'];
          //brisanje svih letova radnika
          $queryFlights="DELETE FROM LetoviRadnika WHERE FkRadnikaID=".$id;
          $stmtFlights= sqlsrv_query( $conn, $queryFlights);
          //brisanje svih jezika radnika
          $queryLang="DELETE FROM JeziciRadnika WHERE FkRadnikID=".$id;
          $stmtLang= sqlsrv_query( $conn, $queryLang);
          //brisanje svih rezervacija korisnika
          $queryRezer="DELETE FROM Rezervacije WHERE FkKorisnikID=".$id;
          $stmtRezer= sqlsrv_query( $conn, $queryRezer);
          //brisanje svih vijesti korisnika
          $queryNews="DELETE FROM Vijesti WHERE FkRadnikID=".$id;
          $stmtNews= sqlsrv_query( $conn, $queryNews);
          //brisanje korisnika
          $query = "DELETE FROM Korisnici WHERE PkKorisnikID=".$id;
          $stmt = sqlsrv_query( $conn, $query);
          break;
     case "professions":
          $data=array();
          $id=$received['id'];
          $procedure="{ CALL IzlistavanjeZanimanjaRadnika (?)}";
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
     case "check":
          $data=array();   
          $model=$received['model']; 
          $query="";
          if($model['id']==null)
          {
               $query="SELECT Ime,Prezime FROM Korisnici WHERE KorisnickoIme='".$model['name']."' AND PkKorisnikID is not null";
          }
          else{
               $query = "SELECT Ime,Prezime FROM Korisnici WHERE KorisnickoIme='".$model['name']."' AND PkKorisnikID!=".$model['id'];
          }
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
     case "users":
          $data=array();  
          $query = "SELECT K.Ime,K.Prezime,K.PkKorisnikID FROM Korisnici K,
          Šifarnici S WHERE K.FkUlogaID=S.PkŠifraID AND S.Naziv LIKE '%korisnik%'";
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