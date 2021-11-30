<?php
include_once('init.php');
$data_quay = '';
if (isset($_POST["btn_search"])) {
    $ngay_bat_dau = $_POST['ngay_bat_dau'];
    $ngay_ket_thuc = $_POST['ngay_ket_thuc'];
    // echo $ngay_bat_dau . " " . $ngay_ket_thuc;
    $sql_quay = "CALL phuoc_get_data_1('" . $ngay_bat_dau . "','" . $ngay_ket_thuc . "');";
    // echo $sql_quay;
    $result_quay = $conn->query($sql_quay);
    // echo $result_quay;
    if ($result_quay->num_rows > 0) {
        $col = 1;
        while ($row = $result_quay->fetch_assoc()) {
            $data_quay .= '<tr>
          <td scope="col">' . $col . '</td>
          <td scope="col">' . $row["ma_quay"] . '</td>
          <td scope="col">' . $row["COUNT(ma_quay)"] . '</td>
        </tr>';
            $col++;
        }
    } else {
        $data_quay = '<div class="alert alert-primary" role="alert">
        Không tồn tại quầy nào có doanh thu trong khoảng ' . $_POST["ngay_bat_dau"] . " - " . $_POST['ngay_ket_thuc'] . '
      </div>';
    }
}


$conn->close();
require_once "./P_includes/header.php";
?>
<div class="container">
    <div class="myform d-flex">
        <h4>Tìm tất cả các quầy có thực hiện thanh toán trong khoảng ngày </h4>
        <form class="d-flex" style="max-width: 500px; margin-left: auto;" method="POST" action="phuoc_get_data_1.php">
            <input class="form-control me-2" type="date" name="ngay_bat_dau">
            <input class="form-control me-2" type="date" name="ngay_ket_thuc">
            <button class="btn btn-success " style="min-width: 100px;" name="btn_search" type="submit">Tìm kiếm</button>
        </form>
    </div>
    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Mã quầy</th>
                <th scope="col">Số lần</th>
            </tr>
        </thead>
        <tbody>
            <?php echo $data_quay ?>
        </tbody>
    </table>
</div>
<?php
require_once "./P_includes/footer.php";
?>