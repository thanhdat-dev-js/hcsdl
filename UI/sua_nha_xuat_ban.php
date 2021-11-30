<?php
require_once "./P_includes/header.php";
include_once('init.php');
$ma = $_GET["ma_nha_xuat_ban"];
$sql_get = 'SELECT * FROM nha_xuat_ban WHERE ma = "' . $ma . '";';
$result  = $conn->query($sql_get);
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $ma_1    = $row["ma"];
        $ten_1    = $row["ten"];
        $email_1    = $row["email"];
        $sdt_1    = $row["sdt"];
        $dia_chi_1    = $row["dia_chi"];
        $website_1    = $row["website"];
    }
} else {
    echo "0 results";
}
$check = false;

if (isset($_POST["btn_edit"])) {
    $ten = $_POST["ten"];
    // $ma = $_POST["ma"];
    $email = $_POST["email"];
    $sdt = $_POST["sdt"];
    $dia_chi = $_POST["dia_chi"];
    $website = $_POST["website"];
    if (
        empty($ten) || empty($ma) || empty($email) ||    empty($sdt)
        || empty($dia_chi) ||    empty($website)
    ) {
        $check = true;
    } else {
        $sql = 'UPDATE nha_xuat_ban '
            . 'SET ' . ' ten = "'
            . $ten . '", email = "'
            . $email . '", sdt = "'
            . $sdt . '", dia_chi = "'
            . $dia_chi . '", website = "'
            . $website . '" WHERE ma = "' . $ma . '";';
        $result = $conn->query($sql);
        if ($result) {
            header("Location: nha_xuat_ban.php");
        }
    }
}
?>
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
                <label for="ten" class="form-label">Tên nhà xuất bản</label>
                <input type="text" class="form-control" value="<?php echo $ten_1 ?>" name="ten" id="ten" require>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="text" class="form-control" value="<?php echo $email_1 ?>" name="email" id="email" require>
            </div>
            <div class="mb-3">
                <label for="sdt" class="form-label">SĐT</label>
                <input type="text" class="form-control" value="<?php echo $sdt_1 ?>" name="sdt" id="sdt" require>
            </div>
            <div class="mb-3">
                <label for="dia_chi" class="form-label">Địa chỉ</label>
                <input type="text" class="form-control" value="<?php echo $dia_chi_1 ?>" name="dia_chi" id="dia_chi" require>
            </div>
            <div class="mb-3">
                <label for="website" class="form-label">Website</label>
                <input type="text" class="form-control" value="<?php echo $website_1 ?>" name="website" id="website" require>
            </div>
            <button class="btn btn-primary" type="submit" name="btn_edit">Sửa</button>
        </div>

    </form>
</div>
<?php
require_once "./P_includes/footer.php";
?>