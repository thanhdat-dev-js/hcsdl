<?php
include_once('init.php');

$check = false;

$ma_don_online = $_GET["ma_don_online"];
$data_don_hang .= '';

if (isset($_POST["btn_create"])) {
  $ma_dau_sach = $_POST["ma_dau_sach"];
  $so_luong = $_POST["so_luong"];
  if (
    empty($ma_dau_sach) || empty($so_luong) 
  ) {
    $check = true;
  } else {
    $sql = 'CALL them_bao_gom_online("' . $ma_don_online . '","'
      . $ma_dau_sach . '","'
      . $so_luong . '")';

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
      Vui lòng điền đầy đủ thông tin !
    </div>';
    if ($conn->error) echo '<div class="alert alert-warning" role="alert">
      ' . $conn->error . '
    </div>'
    ?>
    <form action="" method="POST">
      <div class="myform">

        <div class="mb-3">
          <label for="ten" class="form-label">Mã Đơn hàng</label>
          <h4><?php echo $ma_don_online ?></h4>
        </div>

         <div class="mb-3">
          <label for="ma_dau_sach" class="form-label">Mã nhà xuất bản</label>
          <select class="form-select" name="ma_dau_sach" require>
            <option selected value="">Chọn Mã đầu sách</option>
            <?php
                $sql_dau_sach = "SELECT ma, ten FROM dau_sach;";
                $result_dau_sach = $conn->query($sql_dau_sach);
               while ($row = $result_dau_sach->fetch_assoc()){
                  echo "<option value='" . $row["ma"] . "'>" . $row["ma"] . " - " . $row["ten"] . "</option>";
                }
            ?>  
          </select>
        </div>
        
        <div class="mb-3">
          <label for="so_luong" class="form-label">Số lượng</label>
          <input type="number" class="form-control" name="so_luong" id="so_luong" require>
        </div>
       
        <button class="btn btn-primary" type="submit" name="btn_create">Thêm vào Đơn hàng</button>
      </div>

    </form>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
</body>

</html>