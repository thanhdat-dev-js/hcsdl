<?php
include_once('init.php');

if (isset($_POST["btn-del"])) {
  $ma = $_POST["ma"];
  $query = "DELETE FROM nhan_vien WHERE ma ='" . $ma . "';";
  $conn->query($query);
}


$query = "SELECT "
  . "    nhan_vien.ma, "
  . "    nhan_vien.ho, "
  . "    nhan_vien.ten, "
  . "    nhan_vien.cccd, "
  . "    nhan_vien.ngay_sinh, "
  . "    nhan_vien.email, "
  . "    nhan_vien.sdt, "
  . "    nhan_vien.dia_chi, "
  . "    nhan_vien.thoi_gian_bat_dau_lam, "
  . "    nhan_vien.luong, "
  . "    chi_nhanh.ten AS ten_chi_nhanh "
  . "FROM "
  . "    nhan_vien, chi_nhanh "
  . "WHERE "
  . "    nhan_vien.ma_chi_nhanh = chi_nhanh.ma "
  . "ORDER BY "
  . "    chi_nhanh.ma; ";
$result = $conn->query($query);
if ($result->num_rows > 0) {
  $col = 1;
  $data = '';
  while ($row = $result->fetch_assoc()) {
    $data .= '<tr>
        <td scope="col">' . $col . '</td>
        <td scope="col">' . $row["ho"] . '</td>
        <td scope="col">' . $row["ten"] . '</td>
        <td scope="col">' . $row["cccd"] . '</td>
        <td scope="col">' . $row["ngay_sinh"] . '</td>
        <td scope="col">' . $row["email"] . '</td>
        <td scope="col">' . $row["sdt"] . '</td>
        <td scope="col">' . $row["dia_chi"] . '</td>
        <td scope="col">' . $row["thoi_gian_bat_dau_lam"] . '</td>
        <td scope="col">' . $row["luong"] . '</td>
        <td scope="col">' . $row["ten_chi_nhanh"] . '</td>
        <td scope="col">
        <form action="sua_nhan_vien.php" method="GET">
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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="nhan_vien.php" style="font-weight: 700;">Bảng nhân viên (Toàn)</a>
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
            <a class="nav-link" href="./dau_sach.php">Đầu sách (Đạt)</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./don_hang_online.php">Đơn hàng online (Khang)</a>
          </li>
        </ul>
        <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
          <li class="nav-item" style="margin-right: 10px;">
            <a href="./tom_tat_thong_tin_nhap_sach_theo_nha_xuat_ban.php" class="btn btn-success ">Tóm tắt thông tin nhập sách theo nhà xuất bản</a>
          </li>
          <li class="nav-item" style="margin-right: 10px;">
            <a href="./doanh_thu_chi_nhanh.php" class="btn btn-secondary ">Doanh thu chi nhánh</a>
          </li>
          <li class="nav-item">
            <a href="./them_nhan_vien.php" class="btn btn-primary ">Thêm nhân viên</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <h2 style="text-align: center;"></h2>

  <div class="container">
    <h4>Danh sách nhân viên</h4>
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <th scope="col">STT</th>
          <th scope="col">Họ </th>
          <th scope="col">Tên</th>
          <th scope="col">CCCD</th>
          <th scope="col">Ngày sinh</th>
          <th scope="col">Email</th>
          <th scope="col">Số điện thoại</th>
          <th scope="col">Địa Chỉ</th>
          <th scope="col">Thời gian bắt đầu làm</th>
          <th scope="col">Lương</th>
          <th scope="col">Tên chi nhánh</th>
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
