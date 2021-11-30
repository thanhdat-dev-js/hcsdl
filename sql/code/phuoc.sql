DELIMITER $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `them_don_hang`(
    IN `ngay_tao` DATE,
    IN `so_luong` INT(11),
    IN `tong_tien` DECIMAL(11, 2),
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
        VALUES (ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly);
    END IF;
END $$

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