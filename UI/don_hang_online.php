<?php
include_once('init.php');

if (isset($_POST["btn-del"])) {
  $ma = $_POST["ma_don_online"];
  $query_del = "DELETE FROM don_hang_online WHERE ma ='" . $ma . "';";
  $conn->query($query_del);
}

$sql_don_hang_online = "SELECT 
                          ma, DATE_FORMAT(ngay_dat, '%d-%m-%Y') AS ngay_dat, so_luong, FORMAT(tong_tien,0) AS tong_tien, 
                          ma_thanh_vien, CONCAT(ho,' ',ten) AS ho_ten,
                          ma_don_offline
                        FROM
                          don_hang_online,
                          thanh_vien
                        WHERE
                          ma_thanh_vien = cccd";

$result_don_hang_online = $conn->query($sql_don_hang_online);
if ($result_don_hang_online->num_rows > 0) {
  $col = 1;
  $data_don_hang_online = '';
  while ($row = $result_don_hang_online->fetch_assoc()) {
    $data_don_hang_online .= '<tr>
        <td scope="col">' . $col . '</td>
        <td scope="col">' . $row["ma"] . '</td>
        <td scope="col">' . $row["ngay_dat"] . '</td>
        <td scope="col">' . $row["so_luong"] . '</td>
        <td scope="col">' . $row["tong_tien"] . '</td>
        <td scope="col">' . $row["ma_thanh_vien"] . '</td>
        <td scope="col">' . $row["ho_ten"] . '</td>
        <td scope="col">' . $row["ma_don_offline"] . '</td>
        <td scope="col">

        <form action="bao_gom_online.php" method="GET">
        <input type="text" value="' . $row["ma"] . '" name ="ma_don_online" hidden>
        <button class="btn btn-secondary">Xem chi tiết</button></td>
        </form>
        <td scope="col">
          <form action="" method="POST">
            <input type="text" value="' . $row["ma"] . '" name ="ma_don_online" hidden>
            <button class="btn btn-success" type="submit" name="btn-del"><i class="bi bi-trash-fill"></i></button>
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="don_hang_online.php" style="font-weight: 700;">Bảng Đơn hàng Online</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
            <a class="nav-link" href="nha_xuat_ban.php">Nhà xuất bản</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="voucher.php">Voucher</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="nhan_vien.php">Nhân viên</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="dau_sach.php">Bảng đầu sách</a>
          </li>
        </ul>
        <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
          <li class="nav-item" style="margin-right: 10px;">
            <a href="./tra_cuu.php" class="btn btn-secondary "><i class="bi bi-search"></i> Tra Cứu</a>
          </li>
          <li class="nav-item" style="margin-right: 10px;">
            <a href="./thong_ke.php" class="btn btn-secondary "><i class="bi bi-graph-up"></i> Thống Kê</a>
          </li>
          <li class="nav-item">
            <a href="./tao_don_hang_online.php" class="btn btn-primary "><i class="bi bi-file-earmark-plus"></i> Tạo Đơn hàng mới</a>
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
          <th scope="col">Mã đơn Online</th>
          <th scope="col">Ngày đặt</th>
          <th scope="col">Số lượng sách</th>
          <th scope="col">Tổng tiền (VNĐ)</th>
          <th scope="col">Mã thành viên</th>
          <th scope="col">Họ Tên Thành viên</th>
          <th scope="col">Mã đơn Offline</th>
        </tr>
      </thead>
      <tbody>
        <?php echo $data_don_hang_online ?>
      </tbody>
    </table>
  </div>


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
</body>

</html>