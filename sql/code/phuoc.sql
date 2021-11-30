
DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `them_nha_xuat_ban`(
    IN  ten                     VARCHAR(40),
    IN  email                   VARCHAR(60),
    IN  sdt                     CHAR(10),
    IN  dia_chi                 VARCHAR(200),
    IN  website                 VARCHAR(255)
)
BEGIN
    DECLARE ma CHAR(12);

    CALL assert_has_value_varchar(ten, "ten");
    CALL assert_has_value_varchar(email, "email");
    CALL assert_valid_email(email);
    CALL assert_valid_phone(sdt);

    SET ma = (SELECT MAX(nha_xuat_ban.ma) FROM nha_xuat_ban);
    SET ma = next_id(ma);
    INSERT INTO nha_xuat_ban
    VALUES (ma, ten, email, sdt, dia_chi, website);
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER `kiem_tra_nha_xuat_ban`
BEFORE INSERT ON `nha_xuat_ban`
FOR EACH ROW
BEGIN
    CALL assert_valid_email(NEW.email);
    CALL assert_valid_phone(NEW.sdt);
END $$
DELIMITER ;



DELIMITER $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `them_don_hang`(
    IN `ngay_tao` char(12),
    IN `ma_thu_ngan` char(12),
    IN `ma_thanh_vien` char(12),
    IN `ma_quan_ly` char(12)
)
BEGIN
    DECLARE ma CHAR(12) ;
    DECLARE them_ma_quay CHAR(12);
    SET ma =( SELECT MAX(don_hang.ma) FROM don_hang) ;
    SET ma = next_id(ma) ;
    SELECT ma_quay
    INTO them_ma_quay
    FROM thu_ngan
    WHERE thu_ngan.ma = ma_thu_ngan;
    IF them_ma_quay IS NULL THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Thu ngan khong ton tai" ;
    ELSE 
        INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly)
        VALUES (ma, ngay_tao, 0, 0, ma_thu_ngan, ma_thanh_vien, ma_quan_ly);
    END IF;
END $$
--  cau 2
DELIMITER $$
CREATE TRIGGER `after_them_quyen_sach_vao_bao_gom`
AFTER INSERT ON `bao_gom`
FOR EACH ROW
BEGIN
	DECLARE update_ma_don_hang varchar(12);
    DECLARE update_tong_tien DECIMAL;
    DECLARE update_so_luong INT;
    DECLARE update_tien DECIMAL;
    DECLARE update_ma_dau_sach varchar(12);
    
    SELECT ma_dau_sach
    INTO update_ma_dau_sach
    FROM quyen_sach
    WHERE quyen_sach.ma = NEW.ma_quyen_sach;

    SELECT so_luong, tong_tien
    INTO update_so_luong, update_tong_tien
    FROM don_hang
    WHERE don_hang.ma= NEW.ma_don;
    
    SELECT gia_niem_yet
    INTO update_tien
    FROM dau_sach
    WHERE dau_sach.ma = update_ma_dau_sach;
    
    SET update_tong_tien = update_tong_tien + update_tien;
    set update_so_luong = update_so_luong + 1;
    
    UPDATE don_hang
    SET so_luong = update_so_luong, tong_tien = update_tong_tien
    WHERE ma = NEW.ma_don;
END $$
DELIMITER ;

-- Câu 3
-- a
DELIMITER
    $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `phuoc_get_data_1`(
    IN `ngay_bat_dau` DATE,
    IN `ngay_ket_thuc` DATE
)
BEGIN
    SELECT
        thu_ngan.ma
    FROM
        thu_ngan,
        don_hang
    WHERE
        don_hang.ma_thu_ngan = thu_ngan.ma AND
        don_hang.ngay_tao >= ngay_bat_dau AND
        don_hang.ngay_tao <= ngay_ket_thuc
    ORDER BY 
        thu_ngan.ma
END $$

DELIMITER
    $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `phuoc_get_data_2`(
    -- IN `ma_quay` CHAR(12)
    IN `min_tien` DECIMAL(11,2)
)
BEGIN
    SELECT
       ma_quay ,AVG(tong_tien)
    FROM
        thu_ngan,
        don_hang
    WHERE
        don_hang.ma_thu_ngan = thu_ngan.ma
    GROUP BY
        ma_quay
    HAVING 
        AVG(tong_tien) > min_tien
    ORDER BY 
        AVG(tong_tien)
END $$