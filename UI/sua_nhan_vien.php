<?php
include_once('init.php');
include_once('console_log.php');

$not_enough_information = false;
$id_error = false;


$ma = $_GET["ma"];
console_log($ma);
$query = "SELECT * FROM nhan_vien WHERE '$ma' = nhan_vien.ma;";
$result = $conn->query($query);
if ($result->num_rows > 0) {
  $nhan_vien = $result->fetch_assoc();
} else {
  $id_error = true;
  $id_cause_error = $ma;
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
      <a class="navbar-brand" href="./nhan_vien.php" style="font-weight: 700;">Bảng Nhân Viên</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item"> <a class="nav-link" href="#">Trang của P</a> </li>
          <li class="nav-item"> <a class="nav-link" href="#">Trang của H</a> </li>
          <li class="nav-item"> <a class="nav-link" href="#">Trang của T</a> </li>
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
    $prefix = '<div class="alert alert-warning" role="alert">';
    $postfix = '</div>';
    if ($not_enough_information)
      echo $prefix . 'Vui lòng điền đầy đủ thông tin' . $postfix;
    if ($id_error)
      echo $prefix . 'Không tìm thấy nhân viên với mã: ' . $id_cause_error . $postfixt;
    if ($conn->error)
      echo $prefix . $conn->error . $postfix;
    ?>
    <form action="" method="POST">
      <div class="myform">
        <?php
        function make_input_form($type, $name, $label, $value, $required)
        {
          $req = " ";
          if ($required) {
            $req = " require ";
          }
          $html = "<div class='mb-3'>";
          $html .= "<label for='$name' class='form-label'>$label</label>";
          $html .= "<input type='$type' class='form-control' name='$name' id='$name' value='$value' $req>";
          $html .= "</div>";
          echo $html;
        }

        make_input_form('text', 'ho', 'Họ', $nhan_vien["ho"], false);
        make_input_form('text', 'ten', 'Tên', $nhan_vien["ten"], true);
        make_input_form('text', 'cccd', 'Căn cước công dân', $nhan_vien["cccd"], true);
        make_input_form('date', 'ngay_sinh', 'Ngày sinh', $nhan_vien["ngay_sinh"], true);
        make_input_form('email', 'email', 'Email', $nhan_vien["email"], true);
        make_input_form('text', 'sdt', 'Số điện thoại', $nhan_vien["sdt"], true);
        make_input_form('text', 'dia_chi', 'Địa chỉ', $nhan_vien["dia_chi"], false);
        make_input_form('date', 'thoi_gian_bat_dau_lam', 'Thời gian bắt đầu làm', $nhan_vien["thoi_gian_bat_dau_lam"], true);
        make_input_form('number', 'luong', 'Lương', $nhan_vien["luong"], true);
        ?>
        <div class="mb-3">
          <label for="ma_chi_nhanh" class="form-label">Chi nhánh</label>
          <select class="form-select" name="ma_chi_nhanh" require>
            <?php
            $query = 'SELECT ma, ten FROM chi_nhanh ORDER BY ma;';
            $result = $conn->query($query);
            while ($row = $result->fetch_assoc()) {
              $ma = $row['ma'];
              $ten = $row['ten'];
              $selected = ' ';
              if ($ma == $nhan_vien['ma_chi_nhanh'])
                $selected = ' selected ';
              echo "<option value=$ma $selected>$ten</option>";
            }
            ?>
          </select>
        </div>
        <!-- <div class="mb-3">
          <input type="checkbox" class="" name="la_quan_ly" id="la_quan_ly" require>
          <label for="la_quan_ly" class="form-label">Là quản lý?</label>
        </div> -->
        <button class="btn btn-primary" type="submit" name="btn_edit">Sửa</button>
      </div>

    </form>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
</body>

</html>