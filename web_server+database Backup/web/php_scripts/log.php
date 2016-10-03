<?php
$value4 = $_POST['username'];
$value5 = $_POST['password'];

$sql = "INSERT INTO demo (username, password) VALUES ('$value', '$value2')"; 

if (!mysql_query(sql)) {
die ('Error: '. mysql_error());
}

mysql_close();
?> 