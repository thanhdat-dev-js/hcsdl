
<?php
include_once('init.php');

$query = 'CALL doanh_thu_chi_nhanh()';
$result = $conn->query($query);
if ($result->num_rows > 0) {
  $col = 1;
  $data = '';
  while ($row = $result->fetch_assoc()) {
    $data .= '<tr>
        <td scope="col">' . $col . '</td>
        <td scope="col">' . $row["ten"] . '</td>
        <td scope="col">' . $row["doanh_so"] . '</td>
        <td scope="col">
      </tr>';
    $col++;
  }
} else {
  echo "0 results";
}
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
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="nhan_vien.php" style="font-weight: 700;">Bảng nhân viên</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </nav>
  <h2 style="text-align: center;"></h2>

  <div class="container">
    <h4>Doanh thu chi nhánh</h4>
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <th scope="col">STT</th>
          <th scope="col">Tên</th>
          <th scope="col">Doanh số</th>
        </tr>
      </thead>
      <tbody>
        <?php echo $data ?>
      </tbody>
    </table>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
</body>

</html>
