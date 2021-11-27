SELECT
	dau_sach.ten
FROM
	thanh_vien, don_hang_online, bao_gom_online, dau_sach
WHERE
	'070802000010' = thanh_vien.cccd AND
    thanh_vien.cccd = don_hang_online.ma_thanh_vien AND
    don_hang_online.ma = bao_gom_online.ma_don AND
    bao_gom_online.ma_dau_sach = dau_sach.ma;
