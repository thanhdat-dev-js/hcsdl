<?php
include_once('init.php');

if (isset($_POST["btn-del"])) {
  $ma = $_POST["ma_sach"];
  $query_del = "DELETE FROM dau_sach WHERE ma ='" . $ma . "'";
  $conn->query($query_del);
}

$sql_dau_sach = "SELECT * FROM dau_sach ORDER BY ma_nha_xuat_ban;";
$result_dau_sach = $conn->query($sql_dau_sach);
if ($result_dau_sach->num_rows > 0) {
  $col = 1;
  $data_dau_sach = '';
  while ($row = $result_dau_sach->fetch_assoc()) {
    $data_dau_sach .= '<tr>
        <td scope="col">' . $col . '</td>
        <td scope="col">' . $row["ma"] . '</td>
        <td scope="col">' . $row["ten"] . '</td>
        <td scope="col">' . $row["tac_gia"] . '</td>
        <td scope="col">' . $row["the_loai"] . '</td>
        <td scope="col">' . $row["gia_nhap"] . '</td>
        <td scope="col">' . $row["gia_niem_yet"] . '</td>
        <td scope="col">' . $row["so_luong"] . '</td>
        <td scope="col">' . $row["ma_nha_xuat_ban"] . '</td>
        <td scope="col">
        <form action="sua_dau_sach.php" method="GET">
        <input type="text" value="' . $row["ma"] . '" name ="ma_sach" hidden>
        <button class="btn btn-secondary">Sửa</button></td>
        </form>
        <td scope="col">
          <form action="" method="POST">
            <input type="text" value="' . $row["ma"] . '" name ="ma_sach" hidden>
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
      <a class="navbar-brand" href="dau_sach.php" style="font-weight: 700;">Bảng đầu sách (Đạt)</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link" href="./nha_xuat_ban.php">Nhà xuất bản (Phước)</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./voucher.php">Voucher (Hòa)</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./nhan_vien.php">Nhân viên (Toàn)</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./don_hang_online.php">Đơn hàng online (Khang)</a>
          </li>
        </ul>
        <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
          <li class="nav-item" style="margin-right: 10px;">
            <a href="./get_data_2.php" class="btn btn-success ">Tìm nhà xuất bản có số đầu sách lớn hơn</a>
          </li>
          <li class="nav-item" style="margin-right: 10px;">
            <a href="./get_data_1.php" class="btn btn-secondary ">Tìm các đầu sách thuộc nhà xuất bản</a>
          </li>
          <li class="nav-item">
            <a href="./them_dau_sach.php" class="btn btn-primary ">Thêm đầu sách mới</a>
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
          <th scope="col">Mã sách</th>
          <th scope="col">Tên sách</th>
          <th scope="col">Tác giả</th>
          <th scope="col">Thể loại</th>
          <th scope="col">Giá nhập</th>
          <th scope="col">Giá niêm yết</th>
          <th scope="col">Số lượng</th>
          <th scope="col">Mã nhà xuất bản</th>
        </tr>
      </thead>
      <tbody>
        <?php echo $data_dau_sach ?>
      </tbody>
    </table>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
</body>

</html>