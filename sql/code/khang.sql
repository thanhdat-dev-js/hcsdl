-- Tạo Mã đơn cho đơn hàng tiếp theo.

DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `ma_don_moi`(
    `ma_don` CHAR(12))
RETURNS CHAR(12)
BEGIN
    DECLARE loai_don CHAR(3);
    DECLARE ma_so CHAR(9);
    DECLARE temp INT;

    SET loai_don = LEFT(ma_don, 3);
    SET ma_so = RIGHT(ma_don, 9);
    SET temp = CAST(ma_so AS SIGNED) + 1;
    SET ma_so = LPAD(CAST(temp AS CHAR), 9, "0");

    RETURN CONCAT(loai_don, ma_so);
END $$

DELIMITER ;



-- Tạo Đơn hàng Online mới.

DELIMITER $$

CREATE PROCEDURE `tao_don_hang_online`(
	IN `ma_thanh_vien` CHAR(12))
BEGIN
	DECLARE ma_don CHAR(12);
    SET ma_don = (SELECT MAX(ma) FROM don_hang_online);
	SET ma_don = ma_don_moi(ma_don);
	-- Kiem tra Ma thanh vien nhap vao.
	IF (SELECT COUNT(*) FROM thanh_vien WHERE cccd = ma_thanh_vien) = 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Mã Thành viên không tồn tại !";
	END IF;
	-- Tao don hang Online moi
	INSERT INTO don_hang_online
	VALUES (ma_don, CURDATE(), 0, 0, ma_thanh_vien, NULL);

END $$

DELIMITER ;

-- CALL tao_don_hang_online()


-- Thêm Đầu sách vào một Đơn hàng Online đã có

DELIMITER $$

CREATE DEFINER = `root`@`localhost` PROCEDURE `them_bao_gom_online` (
	IN `ma_don` CHAR(12),
	IN `ma_dau_sach` CHAR(12),
	IN `so_luong` INT)
BEGIN
	-- Kiem tra ma don hang nhap vao.
	IF (SELECT COUNT(*)  FROM don_hang_online WHERE ma = ma_don) = 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Mã Đơn hàng không tồn tại !";
	END IF;
	-- Kiem tra ma dau sach nhap vao.
	IF (SELECT COUNT(*) FROM dau_sach WHERE ma = ma_dau_sach) = 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Mã đầu sách không tồn tại !";
	END IF;
	-- Kiem tra dau sach dã co trong don hang hay chua
	IF (SELECT COUNT(*)
		FROM bao_gom_online
		WHERE bao_gom_online.ma_don = ma_don AND bao_gom_online.ma_dau_sach = ma_dau_sach ) > 0 THEN

		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Đầu sách đã có trong đơn hàng !";
	END IF;
	-- Kiem tra so luong sach them vao.
	IF so_luong <= 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Số lượng nhập phải lớn hơn 0";
	END IF;
	-- Them dau sach vao don hang online.
	INSERT INTO bao_gom_online
	VALUES (ma_don, ma_dau_sach, so_luong);
END $$

DELIMITER ;

-- CALL them_bao_gom_online ("DHO000000003", "DSA000000009", 1);

-- Mã đơn hàng không hợp lệ
-- CALL them_bao_gom_online ("DHO000000005", "DSA000000009", 1);

-- Mã đầu sách không hợp lệ
-- CALL them_bao_gom_online ("DHO000000003", "DSA00000000A", 1);

-- Đầu sách đã có trong đơn hàng
-- CALL them_bao_gom_online ("DHO000000003", "DSA000000009", 1);

-- Số lượng không hợp lệ
-- CALL them_bao_gom_online ("DHO000000003", "DSA000000009", 0);

-- Trigger: Cập nhật số lượng và tổng tiền của Đon hàng sau khi thêm sách.

DELIMITER $$

CREATE TRIGGER `them_bao_gom_online`
AFTER INSERT
ON `bao_gom_online` FOR EACH ROW
BEGIN
	DECLARE so_luong_sach INT;
	DECLARE tong_tien_sach DECIMAL(10,2);
	-- Tinh tong so luong sach co trong don hang online.
	SELECT
		SUM(so_luong) INTO so_luong_sach
	FROM
		bao_gom_online
	WHERE
		ma_don = NEW.ma_don;
	-- Tinh tong tien sach cua don hang online.
	SELECT
		SUM(bao_gom_online.so_luong * gia_niem_yet) INTO tong_tien_sach
	FROM
		bao_gom_online,
		dau_sach
	WHERE
		ma_don = NEW.ma_don AND ma_dau_sach = ma;
	-- Cap nhat tong so luong sach, tong tien trong don hang online.
	UPDATE
		don_hang_online
	SET
		so_luong = so_luong_sach,
		tong_tien = tong_tien_sach
	WHERE
		ma = NEW.ma_don;

END $$

DELIMITER ;



-- CALL them_bao_gom_online ("DHO000000000", "DSA000000005", 2);

-- Trigger: Cập nhật số lượng và tổng tiền của Đon hàng sau khi cập nhật số lượng sách.

DELIMITER $$

CREATE TRIGGER `sua_bao_gom_online`
AFTER  UPDATE
ON `bao_gom_online` FOR EACH ROW
BEGIN
	DECLARE so_luong_sach INT;
	DECLARE tong_tien_sach DECIMAL(10,2);
	-- Tinh tong so luong sach co trong don hang online
	SELECT
		SUM(so_luong) INTO so_luong_sach
	FROM
		bao_gom_online
	WHERE
		ma_don = OLD.ma_don;
	-- Tinh tong tien sach cua don hang online
	SELECT
		SUM(bao_gom_online.so_luong * gia_niem_yet) INTO tong_tien_sach
	FROM
		bao_gom_online, dau_sach
	WHERE
		ma_don = OLD.ma_don AND ma_dau_sach = ma;
	-- Cap nhat tong so luong sach, tong tien trong don hang sau
	UPDATE
		don_hang_online
	SET
		so_luong = so_luong_sach,
		tong_tien = tong_tien_sach
	WHERE
		ma = OLD.ma_don;

END $$

DELIMITER ;

-- UPDATE
-- 	bao_gom_online
-- SET
-- 	so_luong = 4
-- WHERE
-- 	ma_don = "DHO000000004" AND
-- 	ma_dau_sach = "DSA000000009";


-- Trigger: Xoá các bao_gom_online tương ứng khi xoá một Đon hàng.

DELIMITER $$

CREATE TRIGGER `xoa_don_hang_online`
BEFORE DELETE
ON `don_hang_online` FOR EACH ROW
BEGIN
	DELETE FROM
		bao_gom_online
	WHERE
		ma_don = OLD.ma;
END $$

DELIMITER ;

-- DELETE FROM
-- 	don_hang_online
-- WHERE
-- 	ma = "DHO000000004";


-- Thông tin các Đầu sách trong một Đơn hàng Online.

DELIMITER $$

CREATE DEFINER = `root`@`localhost` PROCEDURE `thong_tin_don_hang_online` (
	IN `ma_don_hang_online` CHAR(12))
BEGIN
	-- Kiem tra ma don hang nhap vao.
	IF (SELECT COUNT(*)  FROM don_hang_online WHERE ma = ma_don_hang_online) = 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Mã Đơn hàng không tồn tại !";
	END IF;
	SELECT
		ma_dau_sach,
		ten,
		the_loai,
		bao_gom_online.so_luong,
		FORMAT(gia_niem_yet,0) AS gia_niem_yet,
		FORMAT(bao_gom_online.so_luong * gia_niem_yet, 0) AS tong_cong
	FROM
		don_hang_online,
		bao_gom_online,
		dau_sach
	WHERE
		don_hang_online.ma = ma_don_hang_online AND
		ma_don = don_hang_online.ma AND
		ma_dau_sach = dau_sach.ma
	ORDER BY
		ma_dau_sach;

END $$

DELIMITER ;


-- CALL thong_tin_don_hang_online("DHO000000000");

-- Mã đơn hàng không hợp lệ
-- CALL thong_tin_don_hang_online("DHO00000000A");

-- Các khách hàng mua Đầu sách với số lượng > x

DELIMITER $$

CREATE DEFINER = `root`@`localhost` PROCEDURE `mua_dau_sach_nhieu_hon_x` (
	IN `ma_dau_sach_kt` CHAR(12),
	IN `so_luong_kt` INT)
BEGIN
	-- Kiem tra ma dau sach nhap vao.
	IF (SELECT COUNT(*) FROM dau_sach WHERE ma = ma_dau_sach_kt) = 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Mã đầu sách không tồn tại !";
	END IF;
	SELECT
		ma_thanh_vien,
		CONCAT(ho," ", ten) AS ho_ten,
		SUM(bao_gom_online.so_luong) AS so_luong_mua
	FROM
		don_hang_online,
		bao_gom_online,
		thanh_vien
	WHERE
		ma_dau_sach = ma_dau_sach_kt AND
		ma_don = don_hang_online.ma AND
		ma_thanh_vien = cccd
	GROUP BY
		ma_thanh_vien
	HAVING
		SUM(bao_gom_online.so_luong) > so_luong_kt
	ORDER BY
		SUM(bao_gom_online.so_luong) DESC;
END $$

DELIMITER ;

-- CALL mua_dau_sach_nhieu_hon_x("DSA000000005",2);

-- Mã đầu sách không tồn tại
-- CALL mua_dau_sach_nhieu_hon_x("DSA00000000A",2);

-- Số Đơn hàng Online có số lượng sách > x

DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `don_mua_nhieu_hon_x_cuon` (
	`SoLuong` INT)
RETURNS INT
BEGIN
	DECLARE total INT DEFAULT 0;
	DECLARE num INT;
	DECLARE finished INT DEFAULT 0;
	DECLARE curSoLuong CURSOR FOR SELECT so_luong FROM don_hang_online;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

	IF SoLuong <= 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Số lượng nhập phải lớn hơn 0";
	END IF;

	OPEN curSoLuong;
	getSoLuong: LOOP
		FETCH curSoLuong INTO num;
		IF finished = 1 THEN
			LEAVE getSoLuong;
		END IF;
		IF num > SoLuong THEN
			SET total = total + 1;
		END IF;
	END LOOP getSoLuong;
	CLOSE curSoLuong;

	RETURN total;

END $$

DELIMITER ;

-- SELECT don_mua_nhieu_hon_x_cuon(4);

-- Số lượng nhập không hợp lệ.
-- SELECT don_mua_nhieu_hon_x_cuon(-1);


-- So sánh độ lệnh doanh thu Online của một Đầu sách

DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `do_lech_doanh_thu` (
	`ma_sach` CHAR(12),
	`ngay_nhap_vao` VARCHAR(12))
RETURNS DECIMAL
BEGIN
	DECLARE ngay DATE;
	DECLARE doanh_thu DECIMAL(11,2); 			   -- Doanh thu ngay nhap vao
	DECLARE doanh_thu_ngay_gan_nhat DECIMAL(11,2); -- Doanh thu ngay gan nhat voi ngay nhap
	DECLARE ngay_gan_nhat DATE; 				   -- ngay gan nhat (co doanh thu)
	DECLARE i INT; 								   -- Bien chay i

	SET ngay = STR_TO_DATE(ngay_nhap_vao, "%d-%m-%Y");
	-- Kiem tra ngay nhap vao phai tu 01-01-2021
	IF ngay < '2021-01-01' THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Ngày nhập vào phải từ ngày 01-01-2021";
	END IF;
	-- Kiem tra ma dau sach nhap vao
	IF (SELECT COUNT(*) FROM dau_sach WHERE ma = ma_sach) = 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Không tìm thấy mã đầu sách";
	END IF;
	-- Bang chua doanh thu online cua dau sach theo ngay
	CREATE TEMPORARY TABLE doanh_thu_theo_ngay (
		ngay_dat_dau_sach DATE,
		doanh_thu_dau_sach DECIMAL(11,2));
	-- Them du lieu doanh thu dau sach theo ngay vao bang
	INSERT INTO doanh_thu_theo_ngay (ngay_dat_dau_sach, doanh_thu_dau_sach)
	SELECT
		ngay_dat,
		SUM(bao_gom_online.so_luong * (gia_niem_yet - gia_nhap)) AS doanh_thu_sach
	FROM
		dau_sach,
		bao_gom_online,
		don_hang_online
	WHERE
		bao_gom_online.ma_dau_sach = ma_sach  AND
		bao_gom_online.ma_dau_sach = dau_sach.ma AND
		ma_don = don_hang_online.ma
	GROUP BY
		ngay_dat;

	-- Neu trong ngay nhap vao, dau sach khong duoc dat thi doanh thu bang 0,
	-- nguoc lai, lay doanh thu trong ngay do.
	IF (SELECT COUNT(*)
		FROM doanh_thu_theo_ngay
		WHERE doanh_thu_theo_ngay.ngay_dat_dau_sach = ngay) = 0 THEN

		SET doanh_thu = 0;

	ELSE
		SELECT
			doanh_thu_theo_ngay.doanh_thu_dau_sach INTO doanh_thu
		FROM
			doanh_thu_theo_ngay
		WHERE
			doanh_thu_theo_ngay.ngay_dat_dau_sach = ngay;
	END IF;

	-- Thuc hien loop de kiem tra ngay gan nhat co doanh thu
	SET ngay_gan_nhat = ngay;
	SET i = 0;

	WHILE (i<365) DO
		SET ngay_gan_nhat = DATE_SUB(ngay_gan_nhat, INTERVAL 1 DAY);
		IF (SELECT COUNT(*)
			FROM doanh_thu_theo_ngay
			WHERE doanh_thu_theo_ngay.ngay_dat_dau_sach = ngay_gan_nhat) > 0 THEN

			SELECT
				doanh_thu_theo_ngay.doanh_thu_dau_sach INTO doanh_thu_ngay_gan_nhat
			FROM
				doanh_thu_theo_ngay
			WHERE
				doanh_thu_theo_ngay.ngay_dat_dau_sach = ngay_gan_nhat;

			DROP TEMPORARY TABLE doanh_thu_theo_ngay;
			RETURN doanh_thu - doanh_thu_ngay_gan_nhat;
		END IF;

		SET i = i + 1;
	END WHILE;
	-- Khong tim thay ngay gan nhat co doanh thu thi xem nhu doanh thu ngay gan nhat la 0.
	-- Tra ve doanh thu ngay nhap vao
	DROP TEMPORARY TABLE doanh_thu_theo_ngay;
	RETURN doanh_thu;
END $$

DELIMITER ;



-- SELECT FORMAT(do_lech_doanh_thu("DSA000000008","14-04-2021"),0) AS do_lech;

-- Ngày nhập không hợp lệ
-- SELECT FORMAT(do_lech_doanh_thu("DSA000000008","21-11-2020"),0) AS do_lech;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` PROCEDURE `doanh_so_ban_online_dau_sach`(
	IN ma_sach CHAR(12))
BEGIN
	-- Kiem tra ma dau sach nhap vao
	IF (SELECT COUNT(*) FROM dau_sach WHERE ma = ma_sach) = 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Mã đầu sách không tồn tại !";
	END IF;

	SELECT
		DATE_FORMAT(ngay_dat, '%d-%m-%Y') AS ngay,
		SUM(bao_gom_online.so_luong) AS doanh_so_ban
	FROM
		bao_gom_online,
		don_hang_online
	WHERE
		bao_gom_online.ma_dau_sach = ma_sach AND
		ma_don = don_hang_online.ma
	GROUP BY
		ngay_dat
	HAVING
		ngay_dat > DATE_SUB(CURDATE() , INTERVAL 365 DAY)
	ORDER BY
		ngay_dat;

END $$

DELIMITER ;


-- CALL doanh_so_ban_online_dau_sach("DSA000000005")

-- Tổng doanh số bán Online của các đầu sách theo ngày


DELIMITER $$

CREATE DEFINER = `root`@`localhost` PROCEDURE `tong_doanh_so_ban_online`()
BEGIN
	SELECT
		DATE_FORMAT(ngay_dat, '%d-%m-%Y') AS ngay,
		SUM(don_hang_online.so_luong) AS tong_doanh_so_ban
	FROM
		don_hang_online
	GROUP BY
		ngay_dat
	HAVING
		ngay_dat > DATE_SUB(CURDATE() , INTERVAL 365 DAY)
	ORDER BY
		ngay_dat;

END $$

DELIMITER ;


-- CALL tong_doanh_so_ban_online();




