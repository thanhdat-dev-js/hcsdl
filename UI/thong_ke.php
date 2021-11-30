<?php
include('init.php');

$data_thong_ke = '';
$sql_doanh_so = "CALL tong_doanh_so_ban_online();";
$result_doanh_so = $conn->query($sql_doanh_so);

$conn->close();
include('init.php');

if (isset($_POST["btn_search"])) {

  $ma_dau_sach = $_POST["ma_dau_sach"];
  $sql_thong_ke = "CALL doanh_so_ban_online_dau_sach('" . $ma_dau_sach . "' );";
  $result_thong_ke = $conn->query($sql_thong_ke);
  if ($result_thong_ke->num_rows > 0) {
  
  } else {
    if ($conn->error) {
      $data_thong_ke = '<div class="alert alert-primary" role="alert"> ' . $conn->error . ' </div>'; 
    }
    else{
      $data_thong_ke = '<div class="alert alert-primary" role="alert">Đầu sách ' . $ma_dau_sach . ' chưa được mua </div>'; 
    }
  }
}
$conn->close();
include('init.php');
$sql_doanh_so = "CALL tong_doanh_so_ban_online();";
$result_doanh_so = $conn->query($sql_doanh_so);



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
      </div>
    </div>
  </nav>
  <h2 style="text-align: center;"></h2>


  <div class="container">
    <div class="myform d-flex">
      <h4>Doanh số bán Online từ <?php echo date('d-m-Y',strtotime("-365 day"));?> đến <?php echo date("d-m-Y");?> </h4>

    </div>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Ngày', 'Doanh số bán'],
          <?php
               
               while ($row0 = $result_doanh_so->fetch_assoc()){
                  echo "['".$row0['ngay']."',".$row0['tong_doanh_so_ban']."],";
                }
          ?>
        ]);

        var options = {
          chart: {
            legend: { position: 'bottom' }
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>

    <div id="columnchart_material" style="width: 1200px; height: 550px;"></div>
    

  </div>

  <div class="container">
    <div class="myform d-flex">
      <h4>Doanh số bán Online của Đầu sách </h4>

      <form class="d-flex" style="max-width: 500px; margin-left: auto;" method="POST" action="thong_ke.php">

        <input class="form-control me-2" type="search" name="ma_dau_sach" placeholder="Nhập mã đầu sách">

        <button class="btn btn-success " style="min-width: 100px;" name="btn_search" type="submit">Xem</button>
      </form>


    </div>
    <?php echo $data_thong_ke; ?>

  
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Ngày', 'Số lượng bán'],
           <?php
              if ($result_thong_ke->num_rows > 0) {
               while ($row = $result_thong_ke->fetch_assoc()){
                  echo "['".$row['ngay']."',".$row['doanh_so_ban']."],";
                }
              } else {
                echo "[' ', 0]";
              }
          ?>
        ]);

        var options = {
          title: 'Doanh số bán của Đầu sách <?php echo $ma_dau_sach; ?> từ <?php echo date('d-m-Y',strtotime("-365 day"));?> đến <?php echo date("d-m-Y");?>',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>


 <div id="curve_chart" style="width: 1400px; height: 650px"></div>

  </div>

  <div class="text-center">
    <button class="btn btn-secondary "  onclick="window.print()"><i class="bi bi-printer-fill"></i> In Biểu đồ</button>
  </div>


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
</body>

</html>