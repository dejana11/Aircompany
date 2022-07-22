<?php

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

$target_dir = "upload/";
$target_file = $target_dir . basename($_FILES["image"]["name"]);
$path ="upload/".basename($_FILES["image"]["name"]);
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

if (!file_exists($target_dir))
{
    @mkdir($target_dir, 0777);
}               
move_uploaded_file($_FILES['image']['tmp_name'], $target_file) ;

echo json_encode($path);

?>