

ALTER TABLE
    sdt_chi_nhanh
ADD FOREIGN KEY
    (ma_chi_nhanh) REFERENCES chi_nhanh(ma);

ALTER TABLE
    nhan_vien
ADD FOREIGN KEY
    (ma_quan_ly) REFERENCES nhan_vien(ma),
ADD FOREIGN KEY
    (ma_chi_nhanh) REFERENCES chi_nhanh(ma);

ALTER TABLE
    thu_ngan
ADD FOREIGN KEY
    (ma) REFERENCES nhan_vien(ma);

ALTER TABLE
    quan_ly
ADD FOREIGN KEY
    (ma) REFERENCES nhan_vien(ma),
ADD FOREIGN KEY
    (ma_chi_nhanh) REFERENCES chi_nhanh(ma);

ALTER TABLE
    don_hang
ADD FOREIGN KEY
    (ma_thu_ngan) REFERENCES thu_ngan(ma),
ADD FOREIGN KEY
    (ma_thanh_vien) REFERENCES thanh_vien(cccd),
ADD FOREIGN KEY
    (ma_quan_ly) REFERENCES quan_ly(ma);

ALTER TABLE
    bao_gom
ADD FOREIGN KEY
    (ma_don) REFERENCES don_hang(ma),
ADD FOREIGN KEY
    (ma_quyen_sach) REFERENCES quyen_sach(ma);

ALTER TABLE
    don_hang_online
ADD FOREIGN KEY
    (ma_thanh_vien) REFERENCES thanh_vien(cccd),
ADD FOREIGN KEY
    (ma_don_offline) REFERENCES don_hang(ma);

ALTER TABLE
    bao_gom_online
ADD FOREIGN KEY
    (ma_don) REFERENCES don_hang_online(ma),
ADD FOREIGN KEY
    (ma_dau_sach) REFERENCES dau_sach(ma);

ALTER TABLE
    dau_sach
ADD FOREIGN KEY
    (ma_nha_xuat_ban) REFERENCES nha_xuat_ban(ma);

ALTER TABLE
    quyen_sach
ADD FOREIGN KEY
    (ma_dau_sach) REFERENCES dau_sach(ma),
ADD FOREIGN KEY
    (ma_chi_nhanh) REFERENCES chi_nhanh(ma);

ALTER TABLE
    voucher
ADD FOREIGN KEY
    (ma_don_hang) REFERENCES don_hang(ma),
ADD FOREIGN KEY
    (ma_thanh_vien) REFERENCES thanh_vien(cccd);

ALTER TABLE
    giam_gia
ADD FOREIGN KEY
    (ma) REFERENCES voucher(ma);

ALTER TABLE
    giam_gia_van_chuyen
ADD FOREIGN KEY
    (ma) REFERENCES voucher(ma);

ALTER TABLE
    ap_dung_cho
ADD FOREIGN KEY
    (ma_voucher) REFERENCES voucher(ma),
ADD FOREIGN KEY
    (ma_dau_sach) REFERENCES dau_sach(ma);


