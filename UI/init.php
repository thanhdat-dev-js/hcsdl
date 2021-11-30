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

function console_log($value) {
  $message = "'" . addslashes($value) . "'";
  echo "<script>console.log($message)</script>";
}

function sql_string($value) {
  return "'$value'";
}

function sql_number($value) {
  return $value;
}

function sql_date($value) {
  $temp = sql_string($value);
  return "CAST($temp AS DATE)";
}
