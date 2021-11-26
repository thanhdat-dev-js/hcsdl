DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `next_id`(
    `id` CHAR(12)
)
RETURNS char(12)
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
        set @message = CONCAT(@name, " is null");
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END IF;
    IF val = "" THEN
        set @message = CONCAT(@name, " is empty");
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
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
        set @message = CONCAT(@name, " is null");
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END IF;
    IF val = "" THEN
        set @message = CONCAT(@name, " is empty");
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
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
        set @message = CONCAT(@name, " is null");
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
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
        set @message = CONCAT(@name, " is null");
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
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
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'length of id is not 12';
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
PROCEDURE `assert_age_aleast`(
    IN  `date_of_birth`         DATE,
    IN  `age_lower_bound`       INT
)
leave_label:
BEGIN
    IF ISNULL(date_of_birth) THEN
        LEAVE leave_label;
    END IF;

    set @age = TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE());
    IF @age < age_lower_bound THEN
        SET @age_str = CAST(@age AS CHAR);
        SET @alb_str = CAST(age_lower_bound AS CHAR);
        SET @message = CONCAT('age is ', @age_str, ', which is smaller than ', @alb_str);
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END IF;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `employee_minimum_salary`(
    `start_date`            DATE
)
RETURNS DECIMAL(11, 2)
BEGIN
    set @worked_years = TIMESTAMPDIFF(YEAR, start_date, CURDATE());
    set @salary = (FLOOR(@worked_years / 3) + 1) * 4420000;
    RETURN @salary;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `assert_employee_has_minimum_salary`(
    IN  `start_date`            DATE,
    IN  `salary`                DECIMAL(11, 2)
)
leave_label:
BEGIN
    IF ISNULL(start_date) OR ISNULL(salary) THEN
        LEAVE leave_label;
    END IF;

    set @min_salary = employee_minimum_salary(start_date);
    IF salary < @min_salary THEN
        SET @salary_str = CAST(salary AS CHAR);
        SET @min_salary_str = CAST(@min_salary AS CHAR);
        SET @message = CONCAT('salary is ', @salary_str, ', which is smaller minimun salary ', @min_salary_str);
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END IF;
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost`
FUNCTION `supervisor_minimum_salary`(
    `branch_id`                 CHAR(12)
)
RETURNS DECIMAL(11, 2)
BEGIN
    SET @salary = (
        SELECT MAX(nhan_vien.luong)
        FROM nhan_vien
        WHERE nhan_vien.ma_chi_nhanh = branch_id
    );
    return @salary;
END$$
DELIMITER ;




DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `assert_supervisor_has_minimum_salary`(
    IN  `branch_id`             CHAR(12),
    IN  `salary`                DECIMAL(11, 2)
)
leave_label:
BEGIN
    IF ISNULL(branch_id) OR ISNULL(salary) THEN
        LEAVE leave_label;
    END IF;

    set @min_salary = supervisor_minimum_salary(branch_id);
    IF salary < @min_salary THEN
        SET @salary_str = CAST(salary AS CHAR);
        SET @min_salary_str = CAST(@min_salary AS CHAR);
        SET @message = CONCAT('supervisor salary is ', @salary_str, ', which is smaller their employee maximum salary ', @min_salary_str);
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
    END IF;
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
    CALL assert_age_aleast(ngay_sinh, 18);
    CALL assert_has_value_varchar(email, "email");
    CALL assert_valid_email(email);
    CALL assert_has_value_char(sdt, "sdt");
    CALL assert_valid_phone(sdt);
    CALL assert_has_value_char(cccd, "cccd");
    CALL assert_has_value_decimal(luong, "luong");
    CALL assert_employee_has_minimum_salary(thoi_gian_bat_dau_lam, luong);
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
    IF ISNULL(ma_chi_nhanh) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'khong tim thay chi nhanh';
    END IF;

    IF la_quan_ly THEN
        SET ma_quan_ly = ma;
        CALL assert_supervisor_has_minimum_salary(ma_chi_nhanh, luong);
        -- not tested
    ELSE
        SET ma_quan_ly = (
            SELECT quan_ly.ma
            FROM quan_ly
            WHERE quan_ly.ma_chi_nhanh = ma_chi_nhanh
        );
        IF ISNULL(ma_chi_nhanh) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'khong tim thay quan ly';
            -- not tested
        END IF;
    END IF;

    INSERT INTO nhan_vien
    VALUES (ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly);

    if la_quan_ly THEN
        INSERT INTO nhan_vien
        VALUES (ma, ma_chi_nhanh);
    END IF;
END$$
DELIMITER ;



-- CALL them_nhan_vien(null, "a", CAST("2000-08-29" AS DATE), "a@a.a", "0123456789", null, "123123123123", 100000000, CAST("2017-07-20" AS DATE), "Co So 1", 0);






DELIMITER $$
CREATE TRIGGER `kiem_tra_luong_nhan_vien`
BEFORE INSERT ON `nhan_vien`
FOR EACH ROW
BEGIN
END $$
DELIMITER ;
