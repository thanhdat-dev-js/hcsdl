## 1. Thủ tục insert dữ liệu
Mô tả chức năng: 
Thủ tục insert_dau_sach dùng để thêm (insert) dữ liệu vào bảng dau_sach với các tham số 
* ma
* ten
* tac_gia
* the_loai
* gia_nhap 
* gia_niem_yet
* so_luong
* ma_nha_xuat_ban

Kiểm tra gia_nhap phải nhỏ hơn gia_niem_yet, so_luong lon hon 0.
```
DELIMITER
    $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `them_dau_sach`(
    IN `gia_nhap` DECIMAL(11, 2),
    IN `gia_niem_yet` DECIMAL(11, 2),
    IN `ma_nha_xuat_ban` CHAR(12),
    IN `ma` CHAR(12),
    IN `so_luong` INT(11),
    IN `tac_gia` VARCHAR(50),
    IN `ten` VARCHAR(40),
    IN `the_loai` VARCHAR(255)
)
BEGIN
        IF gia_nhap < gia_niem_yet AND so_luong > 0 THEN
    INSERT INTO dau_sach(
        gia_nhap,
        gia_niem_yet,
        ma,
        ma_nha_xuat_ban,
        so_luong,
        tac_gia,
        ten,
        the_loai
    )
VALUES(
    gia_nhap,
    gia_niem_yet,
    ma,
    ma_nha_xuat_ban,
    so_luong,
    tac_gia,
    ten,
    the_loai
) ; ELSE SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT
    = "gia niem yet phai lon hon gia nhap va so luong sach phai lon hon 0" ;
    END IF ; END $$
DELIMITER
    ;
```



