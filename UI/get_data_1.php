<?php
include_once('init.php');
$data_dau_sach = '';
if (isset($_POST["btn_search"])) {
  $sql_dau_sach = "CALL get_data_1('" . $_POST["ten_nha_xuat_ban"] . "');";
  $result_dau_sach = $conn->query($sql_dau_sach);
  if ($result_dau_sach->num_rows > 0) {
    $col = 1;
    while ($row = $result_dau_sach->fetch_assoc()) {
      $data_dau_sach .= '<tr>
          <td scope="col">' . $col . '</td>
          <td scope="col">' . $row["ten_dau_sach"] . '</td>
          <td scope="col">' . $row["tac_gia"] . '</td>
          <td scope="col">' . $row["the_loai"] . '</td>
          <td scope="col">' . $row["ten_nha_xuat_ban"] . '</td>
          <td scope="col">' . $row["gia_niem_yet"] . '</td>
        </tr>';
      $col++;
    }
  } else {
    $data_dau_sach = '<div class="alert alert-primary" role="alert">
    Không tồn tại nhà xuất bản tên ' . $_POST["ten_nha_xuat_ban"] . '
  </div>';
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
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="dau_sach.php" style="font-weight: 700;">Bảng đầu sách</a>
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
            <a class="nav-link" href="nhan_vien.php">Nhân viên</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Trang của K</a>
          </li>
        </ul>
        <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
          <li class="nav-item" style="margin-right: 10px;">
            <a href="./dau_sach.php" class="btn btn-primary">Trở về trang đầu sách</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <h2 style="text-align: center;"></h2>

  <div class="container">
    <div class="myform d-flex">
      <h4>Tìm tất cả các đầu sách thuộc nhà xuất bản </h4>
      <form class="d-flex" style="max-width: 500px; margin-left: auto;" method="POST" action="get_data_1.php">
        <input class="form-control me-2" type="search" name="ten_nha_xuat_ban" placeholder="Nhập tên nhà xuất bản">
        <button class="btn btn-success " style="min-width: 100px;" name="btn_search" type="submit">Tìm
          kiếm</button>
      </form>
    </div>
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <th scope="col">STT</th>
          <th scope="col">Tên đầu sách</th>
          <th scope="col">Tác giả</th>
          <th scope="col">Thể loại</th>
          <th scope="col">Tên nhà xuất bản</th>
          <th scope="col">Giá niêm yết</th>
        </tr>
      </thead>
      <tbody>
        <?php echo $data_dau_sach ?>
      </tbody>
    </table>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
</body>

</html>