<?php
include_once('init.php');

$ma = $_GET["ma"];
$sql_get = 'SELECT * FROM voucher WHERE ma = "' . $ma . '";';
$result  = $conn->query($sql_get);
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $ma    = $row["ma"];
    $thoi_gian_bat_dau_hieu_luc    = $row["thoi_gian_bat_dau_hieu_luc"];
    $thoi_gian_het_hieu_luc    = $row["thoi_gian_het_hieu_luc"];
    $ma_don_hang    = $row["ma_don_hang"];
    $ma_thanh_vien    = $row["ma_thanh_vien"];
    $da_su_dung    = $row["da_su_dung"];
  }
} else {
  echo "0 results";
}
$check = false;

if (isset($_POST["btn_edit"])) {
  $ma = $_POST["ma"];
  $thoi_gian_bat_dau_hieu_luc = $_POST["thoi_gian_bat_dau_hieu_luc"];
  $thoi_gian_het_hieu_luc = $_POST["thoi_gian_het_hieu_luc"];
  $ma_don_hang = $_POST["ma_don_hang"];
  $ma_thanh_vien = $_POST["ma_thanh_vien"];
  $da_su_dung = $_POST["da_su_dung"];
  if (
    empty($ma) || empty($thoi_gian_bat_dau_hieu_luc) || empty($thoi_gian_het_hieu_luc) ||    empty($ma_don_hang)
    || empty($ma_thanh_vien) ||    empty($da_su_dung)
  ) {
    
    $check = true;
  } else {
    $da_su_dung = ($_POST["da_su_dung"] == "true")?1:0;
    $sql = 'UPDATE voucher '
      . 'SET ' . ' ma = "'
      . $ma . '", thoi_gian_bat_dau_hieu_luc = "'
      . $thoi_gian_bat_dau_hieu_luc . '", thoi_gian_het_hieu_luc = "'
      . $thoi_gian_het_hieu_luc . '", ma_don_hang = "'
      . $ma_don_hang . '", ma_thanh_vien = "'
      . $ma_thanh_vien . '", da_su_dung = '
      . $da_su_dung . ' WHERE ma = "' . $ma . '";';

    $result = $conn->query($sql);
    if ($result) {
      header("Location: voucher.php");
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
      <a class="navbar-brand" href="./voucher.php" style="font-weight: 700;">Bảng voucher</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
            <a class="nav-link" href="nhan_vien.php">Nhân viên</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Trang của K</a>
          </li>
        </ul>
        <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a href="./voucher.php" class="btn btn-primary">Trở về trang voucher</a>
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
          <label for="ten" class="form-label">Mã voucher</label>
          <input type="text" class="form-control" value="<?php echo $ma ?>" name="ma" id="ma" readonly require>
        </div>
        <div class="mb-3">
          <label for="tac_gia" class="form-label">Thời gian bắt đầu hiệu lực</label>
          <input type="date" class="form-control" value="<?php echo $thoi_gian_bat_dau_hieu_luc ?>" name="thoi_gian_bat_dau_hieu_luc" id="thoi_gian_bat_dau_hieu_luc" require>
        </div>
        <div class="mb-3">
          <label for="the_loai" class="form-label">Thời gian hết hiệu lực</label>
          <input type="date" class="form-control" value="<?php echo $thoi_gian_het_hieu_luc ?>" name="thoi_gian_het_hieu_luc" id="thoi_gian_het_hieu_luc" require>
        </div>
        <div class="mb-3">
          <label for="gia_nhap" class="form-label">Mã đơn hàng</label>
          <select class="form-select" name="ma_don_hang" value="" require>
                        <?php
                        $query = 'SELECT ma FROM don_hang ORDER BY ma;';
                        $result = $conn->query($query);
                        while ($row = $result->fetch_assoc()) {
                            $ma = $row['ma'];
                            $selected = ' ';
                            if ($ma == $ma_don_hang)
                                $selected = ' selected ';
                            echo "<option value=$ma $selected>$ma</option>";
                        }
                        ?>

                    </select>
        </div>
        <div class="mb-3">
          <label for="gia_niem_yet" class="form-label">Mã thành viên</label>
          <select class="form-select" name="ma_thanh_vien" name="ma_don_hang" value=""  require>
            <?php
            $query = 'SELECT cccd FROM thanh_vien ORDER BY cccd;';
            $result = $conn->query($query);
            while ($row = $result->fetch_assoc()) {
              $cccd = $row['cccd'];
              $selected = ' ';
              if ($cccd == $ma_thanh_vien)
                $selected = ' selected ';
              echo "<option value=$cccd $selected>$cccd</option>";
            }
            ?>

          </select>
        </div>
        <div class="mb-3">
          <label for="so_luong" class="form-label">Tình trạng (đã sử dụng thì nhập 1, ngược lại nhập 0)</label>
          <select class="form-select" name="da_su_dung" id="da_su_dung" value="<?php echo $da_su_dung ?>" require>
            <option value="false">Chưa sử dụng</option>
            <option value="true">Đã sử dụng</option>
          </select>
          <button class="btn btn-primary" type="submit" name="btn_edit">Sửa</button>
        </div>

    </form>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
</body>

</html>