<?php
$servername = "localhost";
$username = "diet";
$password = "";
$db_name  = 'diettable';

// Create connection
$conn = mysql_connect($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
echo "Connected successfully";

// select database
$db_selected = mysql_selectdb($db_name, $conn);
if (!$db_selected) {
    die ('Can\'t use diettable database : ' . mysql_error());
}


?>

