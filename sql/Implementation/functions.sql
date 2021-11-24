DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `next_id`(
    `id` CHAR(12)
)
RETURNS char(12) CHARSET utf8mb4
BEGIN
    DECLARE prefix CHAR(3);
    DECLARE postfix CHAR(9);
    DECLARE num INT;

    SET prefix = LEFT(id, 3);
    SET postfix = RIGHT(id, 9);
    SET num = CAST(postfix AS INT) + 1;
    SET postfix = LPAD(num, 9, '0');

    RETURN CONCAT(prefix, postfix);
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `is_valid_email`(`email` VARCHAR(60)) RETURNS tinyint(1)
BEGIN
    DECLARE res BOOLEAN;
    SET res = (SELECT email REGEXP '^.@.\..$');
    RETURN res;
END$$
DELIMITER ;



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
    SET ma = (
        SELECT MAX(nha_xuat_ban.ma) FROM nha_xuat_ban
    );
    SET ma = next_id(ma);

    INSERT INTO
        nha_xuat_ban
    VALUES
        (ma, ten, email, sdt, dia_chi, website);
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `them_nhan_vien`(
    IN `ho` VARCHAR(20),
    IN `ten` VARCHAR(20),
    IN `email` VARCHAR(60),
    IN `sdt` CHAR(10),
    IN `dia_chi` VARCHAR(200),
    IN `cccd` CHAR(12),
    IN `luong` DECIMAL(11,2),
    IN `thoi_gian_bat_dau_lam` DATE,
    IN `ten_chi_nhanh` VARCHAR(40),
    IN `la_quan_ly` BOOLEAN
)
BEGIN
    DECLARE ma                  CHAR(12);
    DECLARE ma_chi_nhanh        CHAR(12);
    DECLARE ma_quan_ly          CHAR(12);

    SET ma = (
        SELECT max(nhan_vien.ma) FROM nhan_vien
    );

    SET ma_chi_nhanh = (
        SELECT chi_nhanh.ma
        FROM chi_nhanh
        WHERE chi_nhanh.ten = ten_chi_nhanh
    );

    IF la_quan_ly THEN
        SET ma_quan_ly = ma;
    ELSE
        SET ma_quan_ly = (
            SELECT quan_ly.ma
            FROM quan_ly
            WHERE quan_ly.ma_chi_nhanh = ma_chi_nhanh
        );
    END IF;

    INSERT INTO
        nhan_vien
    VALUES
        (ma, ho, ten, email, sdt, dia_chi, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly);

    if la_quan_ly THEN
        INSERT INTO
            nhan_vien
        VALUES
            (ma, ma_chi_nhanh);
    END IF;

END$$
DELIMITER ;
