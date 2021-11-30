<?php
include_once('init.php');
$data_quay = '';
if (isset($_POST["btn_search"])) {
    $min_tien = $_POST['min_tien'];
    $sql_quay = "CALL phuoc_get_data_2('" . $min_tien .  "');";
    // echo $sql_quay;
    $result_quay = $conn->query($sql_quay);
    // echo $result_quay;
    if ($result_quay->num_rows > 0) {
        $col = 1;
        while ($row = $result_quay->fetch_assoc()) {
            $data_quay .= '<tr>
          <td scope="col">' . $col . '</td>
          <td scope="col">' . $row["ma_quay"] . '</td>
          <td scope="col">' . $row["AVG(tong_tien)"] . '</td>
        </tr>';
            $col++;
        }
    } else {
        $data_quay = '<div class="alert alert-primary" role="alert">
        Không tồn tại quầy nào có doanh thu trung bình lớn hơn ' . $_POST["min_tien"] . '
      </div>';
    }
}


$conn->close();
require_once "./P_includes/header.php";
?>
<div class="container">
    <div class="myform d-flex">
        <h4>Tìm tất cả các quầy có lợi nhuận trung bình lớn hơn </h4>
        <form class="d-flex" style="max-width: 500px; margin-left: auto;" method="POST" action="phuoc_get_data_2.php">
            <input class="form-control me-2" type="number" name="min_tien" placeholder="Tối thiểu">
            <button class="btn btn-success " style="min-width: 100px;" name="btn_search" type="submit">Tìm kiếm</button>
        </form>
    </div>
    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Mã quầy</th>
                <th scope="col">Trung bình lợi nhuận</th>
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