
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



