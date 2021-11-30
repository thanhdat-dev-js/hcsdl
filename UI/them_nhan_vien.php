<?php
include_once('init.php');

$not_enough_information = false;

if (isset($_POST["btn_create"])) {
  $ho = $_POST["ho"];
  $ten = $_POST["ten"];
  $ngay_sinh = $_POST["ngay_sinh"];
  $email = $_POST["email"];
  $sdt = $_POST["sdt"];
  $dia_chi = $_POST["dia_chi"];
  $cccd = $_POST["cccd"];
  $thoi_gian_bat_dau_lam = $_POST["thoi_gian_bat_dau_lam"];
  $luong = $_POST["luong"];
  $ma_chi_nhanh = $_POST["ma_chi_nhanh"];
  if ($_POST["la_quan_ly"] == "on")
    $la_quan_ly = 1;
  else
    $la_quan_ly = 0;

  if (
    empty($ten)
    || empty($ngay_sinh)
    || empty($email)
    || empty($sdt)
    || empty($cccd)
    || empty($luong)
    || empty($thoi_gian_bat_dau_lam)
    || empty($ma_chi_nhanh)
  ) {
    $not_enough_information = true;
  } else {
    $query = 'CALL them_nhan_vien('
      . sql_string($ho) . ', '
      . sql_string($ten) . ', '
      . sql_date($ngay_sinh) . ', '
      . sql_string($email) . ', '
      . sql_string($sdt) . ', '
      . sql_string($dia_chi) . ', '
      . sql_string($cccd) . ', '
      . sql_number($luong) . ', '
      . sql_date($thoi_gian_bat_dau_lam) . ', '
      . sql_string($ma_chi_nhanh) . ', '
      . sql_number($la_quan_ly) . ');';

    $result = $conn->query($query);
    if ($result) {
      header("Location: nhan_vien.php");
    }
  }
}

?>




<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <style>
    .myform {
      max-width: 500px;
      margin: auto;
    }
  </style>
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="./nhan_vien.php" style="font-weight: 700;">Bảng đầu sách</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item"> <a class="nav-link" href="#">Trang của P</a> </li>
          <li class="nav-item"> <a class="nav-link" href="#">Trang của H</a> </li>
          <li class="nav-item"> <a class="nav-link" href="dau_sach.php">Đầu sách</a> </li>
          <li class="nav-item"> <a class="nav-link" href="#">Trang của K</a> </li>
        </ul>
        <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a href="./nhan_vien.php" class="btn btn-primary">Trở về trang nhân viên</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <div class="container">
    <?php
    if ($not_enough_information) echo '<div class="alert alert-warning" role="alert">
          Vui lòng điền đầy đủ thông tin
        </div>';
    if ($conn->error) echo '<div class="alert alert-warning" role="alert">
          ' . $conn->error . '
        </div>';
    ?>
    <form action="" method="POST">
      <div class="myform">
        <div class="mb-3">
          <label for="ho" class="form-label">Họ</label>
          <input type="text" class="form-control" name="ho" id="ho">
        </div>
        <div class="mb-3">
          <label for="ho" class="form-label">Tên</label>
          <input type="text" class="form-control" name="ten" id="ten" require>
        </div>
        <div class="mb-3">
          <label for="cccd" class="form-label">Căn cước công dân</label>
          <input type="text" class="form-control" name="cccd" id="cccd" require>
        </div>
        <div class="mb-3">
          <label for="ngay_sinh" class="form-label">Ngày sinh</label>
          <input type="date" class="form-control" name="ngay_sinh" id="ngay_sinh" require>
        </div>
        <div class="mb-3">
          <label for="email" class="form-label">Email</label>
          <input type="email" class="form-control" name="email" id="email" require>
        </div>
        <div class="mb-3">
          <label for="sdt" class="form-label">Số điện thoại</label>
          <input type="text" class="form-control" name="sdt" id="sdt" require>
        </div>
        <div class="mb-3">
          <label for="dia_chi" class="form-label">Địa chỉ</label>
          <input type="text" class="form-control" name="dia_chi" id="dia_chi">
        </div>
        <div class="mb-3">
          <label for="thoi_gian_bat_dau_lam" class="form-label">Thời gian bắt đầu làm</label>
          <input type="date" class="form-control" name="thoi_gian_bat_dau_lam" id="thoi_gian_bat_dau_lam" require>
        </div>
        <div class="mb-3">
          <label for="luong" class="form-label">Lương</label>
          <input type="number" class="form-control" name="luong" id="luong" require>
        </div>
        <div class="mb-3">
          <label for="ma_chi_nhanh" class="form-label">Chi nhánh</label>
          <select class="form-select" name="ma_chi_nhanh" require>
            <?php
            $query = 'SELECT ma, ten FROM chi_nhanh ORDER BY ma;';
            $result = $conn->query($query);
            while ($row = $result->fetch_assoc()) {
              $ma = $row['ma'];
              $ten = $row['ten'];
              echo "<option value=$ma>$ten</option>";
            }
            ?>
          </select>
        </div>
        <!-- <div class="mb-3">
          <input type="checkbox" class="" name="la_quan_ly" id="la_quan_ly" require>
          <label for="la_quan_ly" class="form-label">Là quản lý?</label>
        </div> -->
        <button class="btn btn-primary" type="submit" name="btn_create">Thêm nhân viên</button>
      </div>

    </form>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
</body>

</html>
