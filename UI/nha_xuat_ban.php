<?php
require_once "./P_includes/header.php";
require_once "./init.php";

if (isset($_POST["btn-del"])) {
    $ma = $_POST["ma_nha_xuat_ban"];
    // echo $ma;
    $query_del = "DELETE FROM nha_xuat_ban WHERE ma ='" . $ma . "'";
    $conn->query($query_del);
}

$query = "SELECT * FROM nha_xuat_ban";
$stmt = mysqli_stmt_init($conn);
mysqli_stmt_prepare($stmt, $query);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$items = [];
if ($result->num_rows > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        $item = array(
            'ma' => $row['ma'],
            'ten' => $row['ten'],
            'email' => $row['email'],
            'sdt' => $row['sdt'],
            'dia_chi' => $row['dia_chi'],
            'website' => $row['website'],
        );
        array_push($items, $item);
    }
}
?>
<div>
    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th scope="col">Mã</th>
                <th scope="col">Tên </th>
                <th scope="col">Email</th>
                <th scope="col">SĐT</th>
                <th scope="col">Địa chỉ</th>
                <th scope="col">website</th>
            </tr>
        </thead>
        <tbody>
            <?php
            foreach ($items as $NXB) {
            ?>
                <tr>
                    <td scope="col"><?php echo $NXB['ma'] ?></td>
                    <td scope="col"><?php echo $NXB['ten'] ?></td>
                    <td scope="col"><?php echo $NXB['email'] ?></td>
                    <td scope="col"><?php echo $NXB['sdt'] ?></td>
                    <td scope="col"><?php echo $NXB['dia_chi'] ?></td>
                    <td scope="col"><?php echo $NXB['website'] ?></td>
                    <td scope="col">
                        <form action="sua_nha_xuat_ban.php" method="GET">
                            <input type="text" value='<?php echo $NXB["ma"] ?>' name="ma_nha_xuat_ban" hidden>
                            <button class="btn btn-secondary">Sửa</button>
                        </form>
                    </td>
                    <td scope="col">
                        <form action="" method="POST">
                            <input type="text" value="<?php echo $NXB["ma"]  ?>" name="ma_nha_xuat_ban" hidden>
                            <button class="btn btn-success" name="btn-del">Xóa</button>
                        </form>
                    </td>
                </tr>
            <?php } ?>
        </tbody>
    </table>
</div>

<?php
require_once "./P_includes/footer.php";
?>