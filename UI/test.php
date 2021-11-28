<?php
include_once('init.php');

$query = 'SELECT ma, ten FROM chi_nhanh ORDER BY ma;';
$chi_nhanh = $conn->query($query);

$conn->close();
?>




<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
    <div class="mb-3">
      <label for="ten_chi_nhanh" class="form-label">Chi nhánh</label>
      <select class="form-select" name="ten_chi_nhanh" require>
        <?php 
            while ($row = $chi_nhanh->fetch_assoc()) {
                $ma = $row['ma'];
                $ten = $row['ten'];
                $seleted = ($first) ? " selected " : "  ";
                echo "<option value=$ma>$ten</option>";
            }
        ?>
      </select>
    </div>
</body>
</html>
