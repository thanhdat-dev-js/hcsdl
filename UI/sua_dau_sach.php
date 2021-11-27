<?php
include_once('init.php');
$ma = $_GET["ma_sach"];
$sql_get = 'SELECT * FROM dau_sach WHERE ma = "' . $ma . '";';
$result  = $conn->query($sql_get);
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $ma_1    = $row["ma"];
    $ten_1    = $row["ten"];
    $tac_gia_1    = $row["tac_gia"];
    $the_loai_1    = $row["the_loai"];
    $gia_nhap_1    = $row["gia_nhap"];
    $gia_niem_yet_1    = $row["gia_niem_yet"];
    $so_luong_1    = $row["so_luong"];
    $ma_nha_xuat_ban_1    = $row["ma_nha_xuat_ban"];
  }
} else {
  echo "0 results";
}
$check = false;

if (isset($_POST["btn_edit"])) {
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
    $sql = 'UPDATE dau_sach '
      . 'SET ' . ' ma = "'
      . $ma . '", ten = "'
      . $ten . '", the_loai = "'
      . $the_loai . '", tac_gia = "'
      . $tac_gia . '", gia_nhap = "'
      . $gia_nhap . '", gia_niem_yet = "'
      . $gia_niem_yet . '", so_luong ="'
      . $so_luong . '", ma_nha_xuat_ban ="'
      . $ma_nha_xuat_ban . '" WHERE ma = "' . $ma . '";';
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
          <label for="ten" class="form-label">Tên sách</label>
          <input type="text" class="form-control" value="<?php echo $ten_1 ?>" name="ten" id="ten" require>
        </div>
        <div class="mb-3">
          <label for="tac_gia" class="form-label">Tác giả</label>
          <input type="text" class="form-control" value="<?php echo $tac_gia_1 ?>" name="tac_gia" id="tac_gia" require>
        </div>
        <div class="mb-3">
          <label for="the_loai" class="form-label">Thể Loại</label>
          <input type="text" class="form-control" value="<?php echo $the_loai_1 ?>" name="the_loai" id="the_loai"
            require>
        </div>
        <div class="mb-3">
          <label for="gia_nhap" class="form-label">Giá nhập</label>
          <input type="number" class="form-control" value="<?php echo $gia_nhap_1 ?>" name="gia_nhap" id="gia_nhap"
            require>
        </div>
        <div class="mb-3">
          <label for="gia_niem_yet" class="form-label">Giá niêm yết</label>
          <input type="number" class="form-control" value="<?php echo $gia_niem_yet_1 ?>" name="gia_niem_yet"
            id="gia_niem_yet" require>
        </div>
        <div class="mb-3">
          <label for="so_luong" class="form-label">Số lượng</label>
          <input type="number" class="form-control" value="<?php echo $so_luong_1 ?>" name="so_luong" id="so_luong"
            require>
        </div>
        <div class="mb-3">
          <label for="so_luong" class="form-label">Mã nhà xuất bản</label>
          <select class="form-select" value="<?php echo $ma_nha_xuat_ban_1 ?>" name="ma_nha_xuat_ban" require>
            <option value="NXB000000000">NXB000000000</option>
            <option value="NXB000000001">NXB000000001</option>
          </select>
        </div>
        <button class="btn btn-primary" type="submit" name="btn_edit">Sửa</button>
      </div>

    </form>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
</body>

</html>