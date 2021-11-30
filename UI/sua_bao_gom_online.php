<?php
include_once('init.php');

$ma_dau_sach = $_GET["ma_dau_sach"];
$ma_don_online = $_GET["ma_don_online"];

$sql_get = 'SELECT so_luong FROM bao_gom_online WHERE ma_don = "'.$ma_don_online .'" AND ma_dau_sach = "' . $ma_dau_sach .'" ;';
$result  = $conn->query($sql_get);
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $so_luong_old   = $row["so_luong"];
  }
} else {
  echo "0 results";
}
$check = false;

if (isset($_POST["btn_edit"])) {
  $so_luong = $_POST["so_luong"];
  if (
     empty($so_luong)
  ) {
    $check = true;
  } else {
    $sql = 'UPDATE bao_gom_online '
      . 'SET ' . ' so_luong ="'
      . $so_luong . '" WHERE ma_don = "' . $ma_don_online . '" AND ma_dau_sach = "' . $ma_dau_sach . '" ;';
    $result = $conn->query($sql);
    if ($result) {
      header("Location: bao_gom_online.php?ma_don_online=$ma_don_online");
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
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
      <a class="navbar-brand" href="./don_hang_online.php" style="font-weight: 700;">Bảng Đơn hàng Online</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link" href="#">Trang của Phước</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Trang của Hoà</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Trang của Toàn</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Trang của Đạt</a>
          </li>
        </ul>
        <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a href="./bao_gom_online.php?ma_don_online=<?php echo $ma_don_online; ?>" class="btn btn-primary"><i class="bi bi-arrow-90deg-left"></i> Trở về Chi tiết Đơn hàng</a>
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
     </div>';
    ?>
    <form action="" method="POST">
      <div class="myform">
        <div class="mb-3">
          <label for="ten" class="form-label">Mã Đơn hàng</label>
          <h4><?php echo $ma_don_online ?></h4>
        </div>
        <div class="mb-3">
          <label for="tac_gia" class="form-label">Mã Đầu sách</label>
           <h4><?php echo $ma_dau_sach ?></h4>
         
        </div>
        
        <div class="mb-3">
          <label for="so_luong" class="form-label">Số lượng</label>
          <input type="number" class="form-control" value="<?php echo $so_luong_old ?>" name="so_luong" id="so_luong"
            require>
        </div>
      
        <button class="btn btn-primary" type="submit" name="btn_edit">Cập nhật</button>
      </div>

    </form>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
</body>

</html>