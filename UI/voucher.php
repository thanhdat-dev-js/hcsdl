<?php
include_once('init.php');

if (isset($_POST["btn-del"])) {
  $ma = $_POST["ma"];
  $query_del = "DELETE FROM voucher WHERE ma ='" . $ma . "';";
  $conn->query($query_del);
}

$sql_voucher = "SELECT * FROM voucher";
$result_voucher = $conn->query($sql_voucher);
if ($result_voucher->num_rows > 0) {
  $col = 1;
  $data_voucher = '';
  while ($row = $result_voucher->fetch_assoc()) {
    $data_voucher .= '<tr>
        <td scope="col">' . $col . '</td>
        <td scope="col">' . $row["ma"] . '</td>
        <td scope="col">' . $row["thoi_gian_bat_dau_hieu_luc"] . '</td>
        <td scope="col">' . $row["thoi_gian_het_hieu_luc"] . '</td>
        <td scope="col">' . $row["ma_don_hang"] . '</td>
        <td scope="col">' . $row["ma_thanh_vien"] . '</td>
        <td scope="col">' . $row["da_su_dung"] . '</td>
        <td scope="col">
        <form action="./sua_voucher.php" method="GET">
        <input type="text" value="' . $row["ma"] . '" name ="ma" hidden>
        <button class="btn btn-secondary">Sửa</button></td>
        </form>
        <td scope="col">
          <form action="" method="POST">
            <input type="text" value="' . $row["ma"] . '" name ="ma" hidden>
            <button class="btn btn-success" type="submit" name="btn-del">Xóa</button>
          </form>
        </td>
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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="voucher.php" style="font-weight: 700;">Voucher</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link" href="#">Trang của P</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="dau_sach.php">Bảng đầu sách</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="nhan_vien.php">Nhân viên</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Trang của K</a>
          </li>
        </ul>
        <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
          <li class="nav-item" style="margin-right: 10px;">
            <a href="./get_data_voucher.php" class="btn btn-secondary ">Hiển thị dữ liệu với tham số</a>
          </li>
          <li class="nav-item">
            <a href="./them_voucher.php" class="btn btn-primary ">Thêm voucher</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <h2 style="text-align: center;"></h2>

  <div>
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <th scope="col">STT</th>
          <th scope="col">Mã voucher</th>
          <th scope="col">Ngày hiệu lực</th>
          <th scope="col">Ngày hết hiệu lực</th>
          <th scope="col">Mã đơn hàng</th>
          <th scope="col">Mã thành viên</th>
          <th scope="col">Đã sử dụng</th>
        </tr>
      </thead>
      <tbody>
        <?php echo $data_voucher ?>
      </tbody>
    </table>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
</body>

</html>
