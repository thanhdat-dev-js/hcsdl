<?php
include_once('init.php');

$check = false;

if (isset($_POST["btn_create"])) {
  $ten = $_POST["ten"];
  $tac_gia = $_POST["tac_gia"];
  $the_loai = $_POST["the_loai"];
  $gia_nhap = $_POST["gia_nhap"];
  $gia_niem_yet = $_POST["gia_niem_yet"];
  $so_luong = $_POST["so_luong"];
  $ma_nha_xuat_ban = $_POST["ma_nha_xuat_ban"];
  if (
    empty($ten) || empty($tac_gia) || empty($the_loai) ||    empty($gia_nhap)
                || empty($gia_niem_yet) ||    empty($so_luong) || empty($ma_nha_xuat_ban)
  ) {
    $check = true;
  } else {
    $sql = 'CALL them_dau_sach("' . $gia_nhap . '","'
      . $gia_niem_yet . '","'
      . $ma_nha_xuat_ban . '","'
      . $so_luong . '","'
      . $tac_gia . '","'
      . $ten . '","'
      . $the_loai
      . '")';
    $result = $conn->query($sql);
    if ($result) {
      header("Location: dau_sach.php");
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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
      <a class="navbar-brand" href="./dau_sach.php" style="font-weight: 700;">Bảng đầu sách</a>
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
            <a class="nav-link" href="#">Trang của H</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Trang của T</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Trang của K</a>
          </li>
        </ul>
        <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a href="./dau_sach.php" class="btn btn-primary">Trở về trang đầu sách</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <div class="container">
    <?php
    if ($check) echo '<div class="alert alert-warning" role="alert">
      Vui lòng điền đầy đủ thông tin
    </div>';
    if ($conn->error) echo '<div class="alert alert-warning" role="alert">
      ' . $conn->error . '
    </div>'
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
          <input type="text" class="form-control" name="ngay_sinh" id="ngay_sinh" require>
        </div>
        <div class="mb-3">
          <label for="email" class="form-label">Email</label>
          <input type="text" class="form-control" name="email" id="email" require>
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
          <input type="text" class="form-control" name="thoi_gian_bat_dau_lam" id="thoi_gian_bat_dau_lam" require>
        </div>
        <div class="mb-3">
          <label for="luong" class="form-label">Lương</label>
          <input type="number" class="form-control" name="luong" id="luong" require>
        </div>
        <div class="mb-3">
          <label for="ten_chi_nhanh" class="form-label">Chi nhánh</label>
          <select class="form-select" name="ten_chi_nhanh" require>
            <option selected value="NXB000000000">NXB000000000</option>
            <option value="NXB000000001">NXB000000001</option>
          </select>
        </div>
        <button class="btn btn-primary" type="submit" name="btn_create">Thêm nhân viên</button>
      </div>

    </form>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
</body>

</html>
