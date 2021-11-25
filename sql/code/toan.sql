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
CREATE DEFINER=`root`@`localhost`
FUNCTION `is_valid_email`(
    `email` VARCHAR(60)
)
RETURNS tinyint(1)
BEGIN
    DECLARE res BOOLEAN;
    SET res = (SELECT email REGEXP '^.+@.+\..+$');
    RETURN res;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `assert_valid_email`(
    IN  email                   VARCHAR(60)
)
leave_label:
BEGIN
    IF ISNULL(email) THEN
        LEAVE leave_label;
    END IF;
    IF NOT is_valid_email(email) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid email';
    END IF;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `is_valid_phone`(
    `phone` CHAR(10)
)
RETURNS tinyint(1)
BEGIN
    DECLARE res BOOLEAN;
    SET res = (SELECT phone REGEXP '^0[0-9]{9}$');
    RETURN res;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `assert_valid_phone`(
    IN  `phone`                 CHAR(10)
)
leave_label:
BEGIN
    IF ISNULL(phone) THEN
        LEAVE leave_label;
    END IF;
    IF NOT is_valid_phone(phone) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid phone';
    END IF;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `assert_has_value_varchar`(
    IN  `val`                   VARCHAR(255),
    IN  `name`                  VARCHAR(40)
)
BEGIN
    set @name = IFNULL(name, "VARCHAR");
    IF ISNULL(val) THEN
    BEGIN
        set @message = CONCAT(@name, " is null");
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END;
    END IF;
    IF val = "" THEN
    BEGIN
        set @message = CONCAT(@name, " is empty");
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END;
    END IF;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `assert_has_value_char`(
    IN  `val`                   CHAR(255),
    IN  `name`                  VARCHAR(40)
)
BEGIN
    set @name = IFNULL(name, "CHAR");
    IF ISNULL(val) THEN
    BEGIN
        set @message = CONCAT(@name, " is null");
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END;
    END IF;
    IF val = "" THEN
    BEGIN
        set @message = CONCAT(@name, " is empty");
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END;
    END IF;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `assert_has_value_date`(
    IN  `val`                   DATE,
    IN  `name`                  VARCHAR(40)
)
BEGIN
    set @name = IFNULL(name, "DATE");
    IF ISNULL(val) THEN
    BEGIN
        set @message = CONCAT(@name, " is null");
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END;
    END IF;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `assert_has_value_decimal`(
    IN  `val`                   DECIMAL(11, 2),
    IN  `name`                  VARCHAR(40)
)
BEGIN
    set @name = IFNULL(name, "DECIMAL");
    IF ISNULL(val) THEN
    BEGIN
        set @message = CONCAT(@name, " is null");
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END;
    END IF;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `assert_id_length`(
    IN  `id`                    CHAR(255)
)
BEGIN
    IF ISNULL(id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'id is null';
    END IF;
    IF LENGTH(id) <> 12 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "id's length is not 12";
    END IF;
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
CREATE DEFINER=`root`@`localhost`
PROCEDURE `them_nhan_vien`(
    IN  `ho`                    VARCHAR(20),
    IN  `ten`                   VARCHAR(20),
    IN  `ngay_sinh`             DATE,
    IN  `email`                 VARCHAR(60),
    IN  `sdt`                   CHAR(10),
    IN  `dia_chi`               VARCHAR(200),
    IN  `cccd`                  CHAR(12),
    IN  `luong`                 DECIMAL(11,2),
    IN  `thoi_gian_bat_dau_lam` DATE,
    IN  `ten_chi_nhanh`         VARCHAR(40),
    IN  `la_quan_ly`            BOOLEAN
)
BEGIN
    DECLARE ma                  CHAR(12);
    DECLARE ma_chi_nhanh        CHAR(12);
    DECLARE ma_quan_ly          CHAR(12);

    CALL assert_has_value_varchar(ten, "ten");
    CALL assert_has_value_date(ngay_sinh, "ngay_sinh");
    -- kiem tra duoi 18 tuoi
    CALL assert_has_value_varchar(email, "email");
    CALL assert_valid_email(email);
    CALL assert_has_value_char(sdt, "sdt");
    CALL assert_valid_phone(sdt);
    CALL assert_has_value_char(cccd, "cccd");
    CALL assert_has_value_decimal(luong, "luong");
    -- kiem tra dieu kien luong
    CALL assert_has_value_date(thoi_gian_bat_dau_lam, "thoi_gian_bat_dau_lam");

    SET ma = (
        SELECT max(nhan_vien.ma) FROM nhan_vien
    );
    SET ma = next_id(ma);

    SET ma_chi_nhanh = (
        SELECT chi_nhanh.ma
        FROM chi_nhanh
        WHERE chi_nhanh.ten = ten_chi_nhanh
    );
    -- kiem tra khong tim thay chi nhanh

    IF la_quan_ly THEN
        SET ma_quan_ly = ma;
    ELSE
        SET ma_quan_ly = (
            SELECT quan_ly.ma
            FROM quan_ly
            WHERE quan_ly.ma_chi_nhanh = ma_chi_nhanh
        );
    END IF;
    -- kiem tra khong tim thay quan ly

    INSERT INTO nhan_vien
    VALUES
        (ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly);

    if la_quan_ly THEN
        INSERT INTO nhan_vien
        VALUES (ma, ma_chi_nhanh);
    END IF;
END$$
DELIMITER ;
