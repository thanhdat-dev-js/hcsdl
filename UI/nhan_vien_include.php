
<?php
function console_log($value)
{
    $message = "'" . addslashes($value) . "'";
    echo "<script>console.log($message)</script>";
}

function sql_string($value)
{
    return "'$value'";
}

function sql_number($value)
{
    return $value;
}

function sql_date($value)
{
    $temp = sql_string($value);
    return "CAST($temp AS DATE)";
}
?>