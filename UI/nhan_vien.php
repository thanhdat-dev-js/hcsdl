<?php
include_once('init.php');

if (isset($_POST["btn-del"])) {
  $ma = $_POST["ma_sach"];
  $query = "DELETE FROM dau_sach WHERE ma ='" . $ma . "';";
  $conn->query($query);
}

$query = "SELECT\n"
    . "    nhan_vien.ho,\n"
    . "    nhan_vien.ten,\n"
    . "    nhan_vien.cccd,\n"
    . "    nhan_vien.ngay_sinh,\n"
    . "    nhan_vien.email,\n"
    . "    nhan_vien.sdt,\n"
    . "    nhan_vien.dia_chi,\n"
    . "    nhan_vien.thoi_gian_bat_dau_lam,\n"
    . "    nhan_vien.luong,\n"
    . "    chi_nhanh.ten AS ten_chi_nhanh\n"
    . "FROM\n"
    . "    nhan_vien, chi_nhanh\n"
    . "WHERE\n"
    . "    nhan_vien.ma_chi_nhanh = chi_nhanh.ma\n"
    . "ORDER BY\n"
    . "    chi_nhanh.ma;\n";

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
      <a class="navbar-brand" href="dau_sach.php" style="font-weight: 700;">Bảng nhân viên</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item"> <a class="nav-link" href="#">Trang của P</a> </li>
          <li class="nav-item"> <a class="nav-link" href="#">Trang của H</a> </li>
          <li class="nav-item"> <a class="nav-link" href="#">Trang của T</a> </li>
          <li class="nav-item"> <a class="nav-link" href="#">Trang của K</a>
          </li>
        </ul>
        <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
          <li class="nav-item" style="margin-right: 10px;">
            <a href="#" class="btn btn-secondary ">Hiển thị dữ liệu với tham số</a>
          </li>
          <li class="nav-item">
            <a href="./them_nhan_vien.php" class="btn btn-primary ">Thêm nhân viên mới</a>
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
