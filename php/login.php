<?php
include_once("connection.php");

$data=array();

$received = json_decode(file_get_contents('php://input'), true);
$username=$received['KorisnickoIme'];
$password=$received['Lozinka'];

$procedure="{ CALL ProvjeraKorisnika (?,?)}";
$params = array( array($username, SQLSRV_PARAM_IN),array($password, SQLSRV_PARAM_IN));
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


?>