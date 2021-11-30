<?php
include_once('init.php');

$check = false;

if (isset($_POST["btn_create"])) {
    $ten = $_POST["ten"];
    $email = $_POST["email"];
    $sdt = $_POST["sdt"];
    $dia_chi = $_POST["dia_chi"];
    $website = $_POST["website"];
    if (
        empty($ten) || empty($email) || empty($sdt) ||    empty($dia_chi)
        || empty($website)
    ) {
        $check = true;
    } else {
        $sql = 'CALL them_nha_xuat_ban("' . $ten . '","'
            . $email . '","'
            . $sdt . '","'
            . $dia_chi . '","'
            . $website
            . '")';
        $result = $conn->query($sql);
        if ($result) {
            header("Location: nha_xuat_ban.php");
        }
    }
}
require_once "./P_includes/header.php";
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
                <input type="text" class="form-control" name="ten" id="ten" require>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="text" class="form-control" name="email" id="email" require>
            </div>
            <div class="mb-3">
                <label for="sdt" class="form-label">Số điện thoại</label>
                <input type="text" class="form-control" name="sdt" id="sdt" require>
            </div>
            <div class="mb-3">
                <label for="dia_chi" class="form-label">Địa chỉ</label>
                <input type="text" class="form-control" name="dia_chi" id="dia_chi" require>
            </div>
            <div class="mb-3">
                <label for="website" class="form-label">Website</label>
                <input type="text" class="form-control" name="website" id="website" require>
            </div>
            <button class="btn btn-primary" type="submit" name="btn_create">Thêm nhà xuất bản mới</button>
        </div>
    </form>
</div>
<?php
require_once "./P_includes/footer.php";
?>