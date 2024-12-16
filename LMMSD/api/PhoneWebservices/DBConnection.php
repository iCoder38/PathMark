<?php
$servername = "localhost";
$username   = "u437344631_LMU";
$password   = "LMMSDDBPASSWORD20@&()";
$db         = "u437344631_LMDB";

// Create connection
$LMdbConnection = mysqli_connect($servername, $username, $password,$db);

// Check connection
if (!$LMdbConnection) {
    die("Connection failed: " . mysqli_connect_error());
}

?>