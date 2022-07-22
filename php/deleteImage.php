<?php

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

//kupljenje podataka
$received = json_decode(file_get_contents('php://input'), true);
$image =$received['image'];

//brisanje slike
unlink($image);

?>