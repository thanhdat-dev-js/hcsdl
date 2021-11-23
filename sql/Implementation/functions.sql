
CREATE PROCEDURE them_nha_xuat_ban (
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
END;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `next_id`(`id` CHAR(12)) RETURNS char(12) CHARSET utf8mb4
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