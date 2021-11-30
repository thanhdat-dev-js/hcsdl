<?php
include_once('init.php');

$data_tra_cuu = '';

if (isset($_POST["btn_search"])) {
  $ma_dau_sach = $_POST["ma_dau_sach"];
  $so_luong = $_POST["so_luong"];
  if ( empty($ma_dau_sach) || empty($so_luong)){
    $data_tra_cuu = '<div class="alert alert-primary" role="alert"> Vui lòng điền đầy đủ thông tin !  </div>'; 
  } else {

  $sql_tra_cuu = "CALL mua_dau_sach_nhieu_hon_x('" . $ma_dau_sach . "', '" . $so_luong . "' );";
  $result_tra_cuu = $conn->query($sql_tra_cuu);
  if ($result_tra_cuu->num_rows > 0) {
    $col = 1;
    while ($row = $result_tra_cuu->fetch_assoc()) {
      $data_tra_cuu .= '<tr>
          <td scope="col">' . $col . '</td>
          <td scope="col">' . $row["ma_thanh_vien"] . '</td>
          <td scope="col">' . $row["ho_ten"] . '</td>
          <td scope="col">' . $row["so_luong_mua"] . '</td>    
        </tr>';
      $col++;
    }
  } else {
    if ($conn->error) {
      $data_tra_cuu = '<div class="alert alert-primary" role="alert"> ' . $conn->error . ' </div>'; 
    }
    else {
      $data_tra_cuu = '<div class="alert alert-primary" role="alert">Không có khách hàng nào mua đầu sách ' . $ma_dau_sach . ' với số lượng từ ' . $so_luong . ' </div>'; 
      }
    }
  }
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
      </div>
    </div>
  </nav>
  <h2 style="text-align: center;"></h2>

  <div class="container">
    <div class="myform d-flex">
      <h4>Khách hàng mua nhiều của một Đầu sách </h4>

      <form class="d-flex" style="max-width: 500px; margin-left: auto;" method="POST" action="tra_cuu.php">

        <input class="form-control me-2" type="search" name="ma_dau_sach" placeholder="Nhập mã đầu sách">
        <input class="form-control me-2" type="number" name="so_luong" placeholder="Nhập số lượng">

        <button class="btn btn-success " style="min-width: 100px;" name="btn_search" type="submit">Tìm
          kiếm</button>
      </form>

    </div>
    <h6>Mã đầu sách: <?php echo $ma_dau_sach ?> | Số lượng mua từ: <?php echo $so_luong ?> </h6>
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <th scope="col">STT</th>
          <th scope="col">Mã Thành viên</th>
          <th scope="col">Họ Tên Thành viên</th>
          <th scope="col">Số lượng mua</th>
        </tr>
      </thead>
      <tbody>
        <?php echo $data_tra_cuu ?>
      </tbody>
    </table>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
</body>

</html>