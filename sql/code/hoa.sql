DELIMITER $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `them_voucher`(
    IN `ma` CHAR(12),
    IN `thoi_gian_bat_dau_hieu_luc` DATE,
    IN `thoi_gian_het_hieu_luc` DATE,
    IN `ma_don_hang` CHAR(12),
    IN `ma_thanh_vien` CHAR(12),
    IN `da_su_dung` BIT
)
BEGIN
    IF thoi_gian_bat_dau_hieu_luc < thoi_gian_het_hieu_luc THEN
        INSERT INTO voucher(ma, thoi_gian_bat_dau_hieu_luc, thoi_gian_het_hieu_luc, ma_don_hang, ma_thanh_vien, da_su_dung)
        VALUES(ma, thoi_gian_bat_dau_hieu_luc, thoi_gian_het_hieu_luc, ma_don_hang, ma_thanh_vien, da_su_dung) ;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Thoi gian bat dau hieu luc phai truoc thoi gian het hieu luc (YYYY/MM/DD)" ;
    END IF ;
END $$

CALL them_voucher("VC0001234",DATE "2021-10-30",DATE "2021-12-12","DHA000000017","D070802000010",0)
CALL them_voucher("VC000123456",DATE "2021-12-30",DATE "2021-12-12","DHA000000018","070802000010",0)


-- DELIMITER $$
-- CREATE TRIGGER `before_giam_gia_insert`
-- BEFORE INSERT ON `voucher`
-- FOR EACH ROW
-- BEGIN
--     DECLARE tongtien DECIMAL(11,2);
--     DECLARE madon CHAR(12);

--     DECLARE giamtheophantram DECIMAL(11,2);
--     DECLARE phantramgiam DECIMAL(3, 2);
--     DECLARE giamtoida DECIMAL(11,2);

--     SET madon = (SELECT ma_don_hang FROM voucher WHERE ma = NEW.ma);
--     SET tongtien = ( SELECT tong_tien FROM don_hang WHERE don_hang.ma = madon );
--     SET phantramgiam = NEW.phan_tram_giam;
--     SET giamtoida = NEW.giam_toi_da;

--     SET giamtheophantram = tongtien * phantramgiam;

--     IF giamtheophantram >= giamtoida THEN 
--         UPDATE don_hang SET tong_tien = tongtien - giamtoida WHERE don_hang.ma = madon;
--     ELSE
--         UPDATE don_hang SET tong_tien = tongtien - giamtheophantram WHERE don_hang.ma = madon;
--     END IF;
--     UPDATE voucher SET da_su_dung = 1 WHERE ma = NEW.ma;
-- END $$
-- DELIMITER ;


DELIMITER $$
CREATE TRIGGER `before_danh_dau_insert`
BEFORE INSERT ON `giam_gia`
FOR EACH ROW
BEGIN
    UPDATE voucher SET da_su_dung = 1 WHERE ma = NEW.ma;
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER after_xoa_quyen_sach_khoi_bao_gom
AFTER DELETE ON bao_gom
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
    WHERE quyen_sach.ma = OLD.ma_quyen_sach;

    SELECT so_luong, tong_tien
    INTO update_so_luong, update_tong_tien
    FROM don_hang
    WHERE don_hang.ma= OLD.ma_don;
    
    SELECT gia_niem_yet
    INTO update_tien
    FROM dau_sach
    WHERE dau_sach.ma = update_ma_dau_sach;
    
    SET update_tong_tien = update_tong_tien + update_tien;
    set update_so_luong = update_so_luong - 1;
    
    UPDATE don_hang
    SET so_luong = update_so_luong, tong_tien = update_tong_tien
    WHERE ma = OLD.ma_don;
END $$
DELIMITER ;




DELIMITER
$$
CREATE DEFINER = `root`@`localhost`
PROCEDURE `get_voucher`(
IN `sdt_thanh_vien` CHAR(10)
)
BEGIN
SELECT
voucher.ma,
thoi_gian_bat_dau_hieu_luc,
thoi_gian_het_hieu_luc,
thanh_vien.sdt,
da_su_dung
FROM
voucher,
thanh_vien
WHERE
voucher.ma_thanh_vien = thanh_vien.cccd
AND thanh_vien.sdt = sdt_thanh_vien
ORDER BY 
voucher.ma;
END $$

CALL get_voucher('0989000015')

DELIMITER
$$
CREATE DEFINER = `root`@`localhost`
PROCEDURE `get_voucher_1`(
IN `soluong` INT
)
BEGIN
SELECT
COUNT(voucher.ma_thanh_vien),
thanh_vien.ho,
thanh_vien.ten
FROM
thanh_vien,
voucher
WHERE
voucher.ma_thanh_vien = thanh_vien.cccd
GROUP BY
voucher.ma_thanh_vien
HAVING
COUNT(voucher.ma_thanh_vien) > soluong
ORDER BY
COUNT(voucher.ma_thanh_vien) ;
END $$

CALL get_voucher_1(1)


DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `so_voucher_giam_gia_giam_toi_da_lon_hon_n` (`giagiam` DECIMAL(11,2)) RETURNS INT(11) BEGIN
    DECLARE total INT;
    DECLARE temp INT;
    DECLARE done INT DEFAULT false;
    DECLARE cur CURSOR FOR SELECT giam_toi_da from giam_gia;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;

    IF giagiam <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'tham số giagiam phải > 0';
    END IF;
    SET total = 0;
    OPEN cur;
    FETCH cur INTO temp;
    WHILE(NOT done)
    DO
        IF temp > giagiam
        THEN
        SET total = total + 1;
        END IF;
        FETCH cur INTO temp;
    END WHILE;

    CLOSE cur;
    RETURN total;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `so_voucher_co_thoi_gian_hieu_luc_sau_ngay` (`ngay` DATE) RETURNS INT(11) BEGIN
    DECLARE total INT;
    DECLARE temp DATE;
    DECLARE done INT DEFAULT false;
    DECLARE cur CURSOR FOR SELECT thoi_gian_bat_dau_hieu_luc FROM voucher;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;

    
    SET total = 0;
    OPEN cur;
    FETCH cur INTO temp;
    WHILE(NOT done)
    DO
        IF temp > ngay
        THEN
        SET total = total + 1;
        END IF;
        FETCH cur INTO temp;
    END WHILE;

    CLOSE cur;
    RETURN total;
END$$
DELIMITER ;