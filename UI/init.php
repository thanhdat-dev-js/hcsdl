<?php
  $db_host = '127.0.0.1';
  $db_user = 'root';
  $db_password = 'root';
  $db_db = 'sahafake';
  $db_port = 8889;

  $conn = new mysqli(
    $db_host,
    $db_user,
    $db_password,
    $db_db,
  $db_port
  );

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

  // echo 'Success: A proper connection to MySQL was made.';
  // echo '<br>';
  // echo 'Host information: '.$mysqli->host_info;
  // echo '<br>';
  // echo 'Protocol version: '.$mysqli->protocol_version;
