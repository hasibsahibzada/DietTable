<?php
$value = $_POST['name'];
$value2 = $_POST['email'];
$value3 = $_POST['fat'];
$value4 = $_POST['username'];
$value5 = $_POST['password'];

$sql = "INSERT INTO demo (name, email, username, password) VALUES ('$value', '$value2', '$value3', '$value4')"; 

if (!mysql_query(sql)) {
die ('Error: '. mysql_error());
}

mysql_close();
?> 