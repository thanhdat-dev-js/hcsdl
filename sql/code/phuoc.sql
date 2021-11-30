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

    IF ISNULL(email) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Email khong duoc null";
    END IF;
    IF email = "" THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Email khong duoc rong";
    END IF;

    IF ISNULL(ten) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Ten khong duoc null";
    END IF;
    IF ten = "" THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Ten khong duoc rong";
    END IF;

    IF NOT (SELECT email REGEXP '^.+@.+\..+$') THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Invalid Email";
    END IF;

    IF NOT (SELECT sdt REGEXP '^0[0-9]{9}$') THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Invalid Phone";
    END IF;

    SET ma = (SELECT MAX(nha_xuat_ban.ma) FROM nha_xuat_ban);
    SET ma = next_id(ma);
    INSERT INTO nha_xuat_ban
    VALUES (ma, ten, email, sdt, dia_chi, website);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `kiem_tra_nha_xuat_ban`
BEFORE UPDATE ON `nha_xuat_ban`
FOR EACH ROW
BEGIN
    IF NOT (SELECT NEW.email REGEXP '^.+@.+\..+$') THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Invalid Email";
    END IF;

    IF NOT (SELECT NEW.sdt REGEXP '^0[0-9]{9}$') THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Invalid Phone";
    END IF;
    -- CALL assert_valid_email(NEW.email);
    -- CALL assert_valid_phone(NEW.sdt);
END $$
DELIMITER ;

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


DELIMITER $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `phuoc_get_data_1`(
    IN `ngay_bat_dau` DATE,
    IN `ngay_ket_thuc` DATE
)
BEGIN
    IF ngay_bat_dau > ngay_ket_thuc THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Invalid Date Range";
    END IF;
    SELECT
        thu_ngan.ma_quay, COUNT(ma_quay)
    FROM
        thu_ngan,
        don_hang
    WHERE
        don_hang.ma_thu_ngan = thu_ngan.ma AND
        don_hang.ngay_tao >= ngay_bat_dau AND
        don_hang.ngay_tao <= ngay_ket_thuc
    GROUP BY
        thu_ngan.ma_quay
    ORDER BY
        COUNT(ma_quay);
END $$
DELIMITER ;

DELIMITER $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `phuoc_get_data_2`(
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
        AVG(tong_tien);
END $$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `so_don_hang_trong_ngay` (`check_date` DATE)
RETURNS INT(11)
BEGIN
    DECLARE total INT;
    DECLARE temp INT;
    DECLARE done INT DEFAULT false;
    DECLARE cur CURSOR FOR SELECT ngay_tao from don_hang;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;
    set @dif = TIMESTAMPDIFF(DAY, check_date, CURDATE());
    IF @dif < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ngay nay chua xay ra';
    END IF;

    SET total = 0;
    OPEN cur;
    FETCH cur INTO temp;
    WHILE(NOT done)
    DO
        IF temp = check_date
        THEN
        SET total = total + 1;
        END IF;
        FETCH cur INTO temp;
    END WHILE;

    CLOSE cur;
    RETURN total;
END $$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `so_don_hang_co_tong_tien_lon_hon` (`num` INT)
RETURNS INT(11)
BEGIN
    DECLARE total INT;
    DECLARE temp INT;
    DECLARE done INT DEFAULT false;
    DECLARE cur CURSOR FOR SELECT tong_tien from don_hang;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;

    IF num <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'tham số đầu vào num phải > 0';
    END IF;

    SET total = 0;
    OPEN cur;
    FETCH cur INTO temp;
    WHILE(NOT done)
    DO
        IF temp > num
        THEN
        SET total = total + 1;
        END IF;
        FETCH cur INTO temp;
    END WHILE;
    CLOSE cur;
    RETURN total;
END $$
DELIMITER ;
