
-- ! 2 Trigger:
-- * them_quyen_sach_vao_don_hang->cập nhật số lượng + tổng tiềN trong đơn hàng
DELIMITER //
CREATE TRIGGER after_them_quyen_sach_vao_don_hang 
AFTER INSERT ON bao_gom
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
END;
DELIMITER ;
-- TODO xoa_quyen_sach_khoi_don_hang->cập nhật số lượng + tổng tiềN trong đơn hàng