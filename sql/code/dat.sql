DELIMITER $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `them_dau_sach`(
    IN `gia_nhap` DECIMAL(11, 2),
    IN `gia_niem_yet` DECIMAL(11, 2),
    IN `ma_nha_xuat_ban` CHAR(12),
    IN `so_luong` INT(11),
    IN `tac_gia` VARCHAR(50),
    IN `ten` VARCHAR(40),
    IN `the_loai` VARCHAR(255)
)
BEGIN
    DECLARE ma CHAR(12) ;
    SET ma =( SELECT MAX(dau_sach.ma) FROM dau_sach) ;
    SET ma = next_id(ma) ;

    IF gia_nhap < gia_niem_yet AND so_luong > 0 THEN
        INSERT INTO dau_sach( gia_nhap, gia_niem_yet, ma, ma_nha_xuat_ban, so_luong, tac_gia, ten, the_loai)
        VALUES( gia_nhap, gia_niem_yet, ma, ma_nha_xuat_ban, so_luong, tac_gia, ten, the_loai) ;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "gia niem yet phai lon hon gia nhap va so luong sach phai lon hon 0" ;
    END IF ;
END $$
DELIMITER ;



DELIMITER $$
CREATE TRIGGER `giam_so_luong_dau_sach`
BEFORE INSERT ON `bao_gom_online`
FOR EACH ROW
BEGIN
    DECLARE soluong INT;
    SET soluong = ( SELECT so_luong FROM dau_sach WHERE ma = NEW.ma_dau_sach);

    IF NEW.so_luong > soluong THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'So luong sach khong du';
    ELSE
        UPDATE dau_sach SET so_luong = soluong - NEW.so_luong WHERE ma = NEW.ma_dau_sach;
    END IF;
END $$
DELIMITER ;



DELIMITER $$
CREATE TRIGGER `hoan_so_luong_dau_sach`
AFTER DELETE ON `bao_gom_online`
FOR EACH ROW
BEGIN
    DECLARE soluong INT;
    SET soluong = ( SELECT so_luong FROM dau_sach WHERE ma = OLD.ma_dau_sach);

    UPDATE dau_sach
    SET so_luong = soluong + OLD.so_luong
    WHERE ma = OLD.ma_dau_sach;
END $$
DELIMITER ;


 DELIMITER $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `get_data_1`(
    IN `ten_nha_xuat_ban` VARCHAR(50)
)
BEGIN
    SELECT
        dau_sach.ten AS ten_dau_sach,
        tac_gia,
        the_loai,
        nha_xuat_ban.ten AS ten_nha_xuat_ban,
        gia_niem_yet
    FROM
        dau_sach,
        nha_xuat_ban
    WHERE
        dau_sach.ma_nha_xuat_ban = nha_xuat_ban.ma AND nha_xuat_ban.ten = ten_nha_xuat_ban
    ORDER BY
        gia_niem_yet ;
END $$
DELIMITER ;


DELIMITER $$
CREATE DEFINER = `root`@`localhost`
PROCEDURE `get_data_2`(
    IN `soluong` INT
)
BEGIN
    SELECT
        COUNT(ma_nha_xuat_ban), nha_xuat_ban.ten
    FROM
        dau_sach, nha_xuat_ban
    WHERE
        dau_sach.ma_nha_xuat_ban = nha_xuat_ban.ma
    GROUP BY
        ma_nha_xuat_ban
    HAVING
        COUNT(ma_nha_xuat_ban) > soluong
    ORDER BY
        COUNT(ma_nha_xuat_ban) ;
END $$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `so_dau_sach_gia_nhap_lon_n` (`gianhap` DECIMAL(11,2)) RETURNS INT(11) BEGIN
DECLARE total INT;
    DECLARE temp INT;
    DECLARE done INT DEFAULT false;
    DECLARE cur CURSOR FOR SELECT gia_nhap from dau_sach;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;

    IF gianhap <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'tham số đầu vào (giá nhập) phải > 0';
    END IF;
    SET total = 0;
    OPEN cur;
    FETCH cur INTO temp;
    WHILE(NOT done)
    DO
        IF temp > gianhap
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
FUNCTION `so_dau_sach_it_hon_n_cuon` (`max_sl` INT)
RETURNS INT(11)
BEGIN
    DECLARE total INT;
    DECLARE temp INT;
    DECLARE done INT DEFAULT false;
    DECLARE cur CURSOR FOR SELECT so_luong from dau_sach;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;

    IF max_sl <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'tham số đầu vào max_sl phải > 0';
    END IF;

    SET total = 0;
    OPEN cur;
    FETCH cur INTO temp;
    WHILE(NOT done)
    DO
        IF temp < max_sl
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
CREATE PROCEDURE `get_dau_sach`() 
BEGIN
        SELECT * 
        FROM `dau_sach` 
        ORDER BY ma_nha_xuat_ban;
END $$
DELIMITER ;
