INSERT INTO chi_nhanh(ma, ten, email, dia_chi) VALUES("CNH000000000", "Cơ Sở 1", "lienhe@sahafake.coso1.com", "Lô I5-3a, 3b, Khu Công Nghệ Cao, Tăng Nhơn Phú A, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh, Vietnam");
INSERT INTO chi_nhanh(ma, ten, email, dia_chi) VALUES("CNH000000001", "Cơ Sở 2", "lienhe@sahafake.coso2.com", "14A Số 12, Khu Phố 4, Quận 9, Thành phố Hồ Chí Minh 700000, Vietnam");
INSERT INTO sdt_chi_nhanh(ma_chi_nhanh, sdt) VALUES("CNH000000001", "0989000000");
INSERT INTO sdt_chi_nhanh(ma_chi_nhanh, sdt) VALUES("CNH000000000", "0989000001");
INSERT INTO sdt_chi_nhanh(ma_chi_nhanh, sdt) VALUES("CNH000000000", "0989000002");
INSERT INTO sdt_chi_nhanh(ma_chi_nhanh, sdt) VALUES("CNH000000001", "0989000003");
INSERT INTO sdt_chi_nhanh(ma_chi_nhanh, sdt) VALUES("CNH000000001", "0989000004");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000000", "Hoàng Gia", "Thi", STR_TO_DATE("30-6-1994", "%d-%m-%Y"), "hoang.gia.thi.265@sahafake.com", "0989000005", "Lô I5-1, đường N7, Khu Công Nghệ Cao, Phường Tăng Nhơn Phú A, Hồ Chí Minh, Vietnam", "070802000000", 4420000, STR_TO_DATE("8-3-2019", "%d-%m-%Y"), "CNH000000000", "NVI000000004");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000001", "Vũ Anh", "Mại", STR_TO_DATE("26-3-1984", "%d-%m-%Y"), "vu.anh.mai.266@sahafake.com", "0989000006", "VR79+87H, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000001", 4420000, STR_TO_DATE("20-4-2021", "%d-%m-%Y"), "CNH000000001", "NVI000000008");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000002", "Phạm Gia", "Nhật", STR_TO_DATE("16-12-1981", "%d-%m-%Y"), "pham.gia.nhat.267@sahafake.com", "0989000007", "Lot I-5C Saigon Hi-Tech Park, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000002", 8840000, STR_TO_DATE("14-4-2018", "%d-%m-%Y"), "CNH000000001", "NVI000000008");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000003", "Phan Anh", "Hiền", STR_TO_DATE("1-6-1992", "%d-%m-%Y"), "phan.anh.hien.268@sahafake.com", "0989000008", "Hoàng Hữu Nam, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000003", 13260000, STR_TO_DATE("1-3-2014", "%d-%m-%Y"), "CNH000000000", "NVI000000004");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000004", "Phạm Anh", "Tăng", STR_TO_DATE("12-6-1994", "%d-%m-%Y"), "pham.anh.tang.269@sahafake.com", "0989000009", "1 Đường Số 2, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000004", 13260000, STR_TO_DATE("16-1-2021", "%d-%m-%Y"), "CNH000000000", "NVI000000004");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000005", "Lý", "Phiến", STR_TO_DATE("19-9-1980", "%d-%m-%Y"), "ly.phien.270@sahafake.com", "0989000010", "Đường Số 2, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000005", 13260000, STR_TO_DATE("23-8-2013", "%d-%m-%Y"), "CNH000000001", "NVI000000008");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000006", "Đặng Thanh", "Bốn", STR_TO_DATE("22-10-1997", "%d-%m-%Y"), "dang.thanh.bon.271@sahafake.com", "0989000011", "262 Hoàng Hữu Nam, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh 700000, Vietnam", "070802000006", 13260000, STR_TO_DATE("31-10-2013", "%d-%m-%Y"), "CNH000000000", "NVI000000004");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000007", "Huỳnh", "Thuận", STR_TO_DATE("29-3-1990", "%d-%m-%Y"), "huynh.thuan.272@sahafake.com", "0989000012", "RQQW+HJX, Tăng Nhơn Phú A, Quận 9, Quận 9 Hồ Chí Minh, Vietnam", "070802000007", 13260000, STR_TO_DATE("5-2-2014", "%d-%m-%Y"), "CNH000000001", "NVI000000008");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000008", "Trần Thanh", "Lược", STR_TO_DATE("10-9-1999", "%d-%m-%Y"), "tran.thanh.luoc.273@sahafake.com", "0989000013", "20/1/3 Đường Số 295, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh 700000, Vietnam", "070802000008", 13260000, STR_TO_DATE("23-4-2015", "%d-%m-%Y"), "CNH000000001", "NVI000000008");
INSERT INTO nhan_vien(ma, ho, ten, ngay_sinh, email, sdt, dia_chi, cccd, luong, thoi_gian_bat_dau_lam, ma_chi_nhanh, ma_quan_ly) VALUES("NVI000000009", "Dương Gia", "Vương", STR_TO_DATE("4-3-1983", "%d-%m-%Y"), "duong.gia.vuong.274@sahafake.com", "0989000014", "7/11A,Đường 182,Phường Tăng Nhơn Phú A,Quận 9,Tp, Thành phố Hồ Chí Minh 70000, Vietnam", "070802000009", 13260000, STR_TO_DATE("6-5-2015", "%d-%m-%Y"), "CNH000000000", "NVI000000004");
INSERT INTO thu_ngan(ma, ma_quay, doanh_so) VALUES("NVI000000003", "QUA000000000", 16987000);
INSERT INTO thu_ngan(ma, ma_quay, doanh_so) VALUES("NVI000000005", "QUA000000001", 19732000);
INSERT INTO thu_ngan(ma, ma_quay, doanh_so) VALUES("NVI000000001", "QUA000000002", 18054000);
INSERT INTO thu_ngan(ma, ma_quay, doanh_so) VALUES("NVI000000009", "QUA000000003", 16306000);
INSERT INTO thu_ngan(ma, ma_quay, doanh_so) VALUES("NVI000000007", "QUA000000004", 16114000);
INSERT INTO thu_ngan(ma, ma_quay, doanh_so) VALUES("NVI000000002", "QUA000000005", 14946000);
INSERT INTO quan_ly(ma, ma_chi_nhanh) VALUES("NVI000000004", "CNH000000000");
INSERT INTO quan_ly(ma, ma_chi_nhanh) VALUES("NVI000000008", "CNH000000001");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000000", STR_TO_DATE("29-1-2021", "%d-%m-%Y"), 2, 3578000, "NVI000000005", "070802000012", "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000001", STR_TO_DATE("16-12-2020", "%d-%m-%Y"), 2, 1669000, "NVI000000001", "070802000011", "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000002", STR_TO_DATE("30-8-2021", "%d-%m-%Y"), 1, 2708000, "NVI000000003", null, "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000003", STR_TO_DATE("27-3-2020", "%d-%m-%Y"), 1, 1509000, "NVI000000007", "070802000010", "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000004", STR_TO_DATE("4-7-2020", "%d-%m-%Y"), 1, 684000, "NVI000000002", null, "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000005", STR_TO_DATE("1-9-2020", "%d-%m-%Y"), 1, 1509000, "NVI000000009", null, "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000006", STR_TO_DATE("19-6-2021", "%d-%m-%Y"), 2, 4052000, "NVI000000003", null, "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000007", STR_TO_DATE("12-2-2020", "%d-%m-%Y"), 2, 2773000, "NVI000000002", "070802000012", "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000008", STR_TO_DATE("21-7-2020", "%d-%m-%Y"), 2, 3693000, "NVI000000009", "070802000010", "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000009", STR_TO_DATE("25-4-2021", "%d-%m-%Y"), 1, 1764000, "NVI000000007", null, "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000010", STR_TO_DATE("22-11-2021", "%d-%m-%Y"), 2, 3108000, "NVI000000005", "070802000011", "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000011", STR_TO_DATE("10-1-2021", "%d-%m-%Y"), 2, 3229000, "NVI000000001", "070802000011", "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000012", STR_TO_DATE("18-9-2020", "%d-%m-%Y"), 1, 1509000, "NVI000000009", null, "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000013", STR_TO_DATE("30-5-2020", "%d-%m-%Y"), 2, 3273000, "NVI000000002", null, "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000014", STR_TO_DATE("18-10-2021", "%d-%m-%Y"), 1, 684000, "NVI000000001", "070802000012", "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000015", STR_TO_DATE("12-10-2020", "%d-%m-%Y"), 1, 2708000, "NVI000000003", null, "NVI000000004");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000016", STR_TO_DATE("16-1-2020", "%d-%m-%Y"), 2, 3273000, "NVI000000005", null, "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000017", STR_TO_DATE("13-9-2021", "%d-%m-%Y"), 2, 3108000, "NVI000000007", "070802000010", "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000018", STR_TO_DATE("30-10-2020", "%d-%m-%Y"), 1, 1885000, "NVI000000007", null, "NVI000000008");
INSERT INTO don_hang(ma, ngay_tao, so_luong, tong_tien, ma_thu_ngan, ma_thanh_vien, ma_quan_ly) VALUES("DHA000000019", STR_TO_DATE("8-9-2020", "%d-%m-%Y"), 1, 2234000, "NVI000000005", "070802000012", "NVI000000008");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000017", "QSA000000065");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000011", "QSA000000088");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000001", "QSA000000096");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000016", "QSA000000031");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000004", "QSA000000021");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000015", "QSA000000094");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000018", "QSA000000023");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000006", "QSA000000043");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000019", "QSA000000059");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000009", "QSA000000046");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000000", "QSA000000014");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000008", "QSA000000051");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000002", "QSA000000082");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000013", "QSA000000028");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000007", "QSA000000074");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000005", "QSA000000085");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000010", "QSA000000078");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000014", "QSA000000050");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000012", "QSA000000029");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000003", "QSA000000064");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000000", "QSA000000036");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000013", "QSA000000090");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000008", "QSA000000091");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000011", "QSA000000042");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000007", "QSA000000013");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000006", "QSA000000055");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000016", "QSA000000044");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000001", "QSA000000063");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000010", "QSA000000062");
INSERT INTO bao_gom(ma_don, ma_quyen_sach) VALUES("DHA000000017", "QSA000000077");
INSERT INTO don_hang_online(ma, ngay_dat, so_luong, tong_tien, ma_thanh_vien, ma_don_offline) VALUES("DHO000000000", STR_TO_DATE("9-5-2021", "%d-%m-%Y"), 15, 35682000, "070802000010", null);
INSERT INTO don_hang_online(ma, ngay_dat, so_luong, tong_tien, ma_thanh_vien, ma_don_offline) VALUES("DHO000000001", STR_TO_DATE("17-6-2021", "%d-%m-%Y"), 6, 9054000, "070802000012", null);
INSERT INTO don_hang_online(ma, ngay_dat, so_luong, tong_tien, ma_thanh_vien, ma_don_offline) VALUES("DHO000000002", STR_TO_DATE("12-5-2021", "%d-%m-%Y"), 1, 1764000, "070802000011", null);
INSERT INTO don_hang_online(ma, ngay_dat, so_luong, tong_tien, ma_thanh_vien, ma_don_offline) VALUES("DHO000000003", STR_TO_DATE("26-11-2020", "%d-%m-%Y"), 6, 3630000, "070802000011", null);
INSERT INTO don_hang_online(ma, ngay_dat, so_luong, tong_tien, ma_thanh_vien, ma_don_offline) VALUES("DHO000000004", STR_TO_DATE("14-11-2020", "%d-%m-%Y"), 15, 24210000, "070802000010", null);
INSERT INTO bao_gom_online(ma_don, ma_dau_sach, so_luong) VALUES("DHO000000002", "DSA000000004", 1);
INSERT INTO bao_gom_online(ma_don, ma_dau_sach, so_luong) VALUES("DHO000000000", "DSA000000009", 9);
INSERT INTO bao_gom_online(ma_don, ma_dau_sach, so_luong) VALUES("DHO000000001", "DSA000000005", 6);
INSERT INTO bao_gom_online(ma_don, ma_dau_sach, so_luong) VALUES("DHO000000003", "DSA000000003", 6);
INSERT INTO bao_gom_online(ma_don, ma_dau_sach, so_luong) VALUES("DHO000000004", "DSA000000000", 6);
INSERT INTO bao_gom_online(ma_don, ma_dau_sach, so_luong) VALUES("DHO000000000", "DSA000000001", 6);
INSERT INTO bao_gom_online(ma_don, ma_dau_sach, so_luong) VALUES("DHO000000004", "DSA000000006", 9);
INSERT INTO thanh_vien(cccd, ho, ten, email, sdt, dia_chi) VALUES("070802000010", "Dương Thanh", "Trưng", "duong.thanh.trung.275@gmail.com", "0989000015", "15D Số 12, Tăng Nhơn Phú A, Quận 9, Thành phố Hồ Chí Minh, Vietnam");
INSERT INTO thanh_vien(cccd, ho, ten, email, sdt, dia_chi) VALUES("070802000011", "Đỗ Anh", "Trấn", "do.anh.tran.276@gmail.com", "0989000016", "72 Đ. Lê Văn Việt, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh, Vietnam");
INSERT INTO thanh_vien(cccd, ho, ten, email, sdt, dia_chi) VALUES("070802000012", "Bùi Gia", "Lân", "bui.gia.lan.277@gmail.com", "0989000017", "VR79+87H, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000000", "Tâm lý học đặc biệt", "Hồ Thúc", "kiến thức", 615000, 684000, 10, "NXB000000001");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000001", "Bá tước Ca-lốt", "Vũ Gia Nông", "truyện", 1696000, 1885000, 10, "NXB000000000");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000002", "Chúa và con người", "Vũ Anh Giải", "kiến thức", 1880000, 2089000, 10, "NXB000000001");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000003", "Lời giải tiếng Anh 12", "Hồ Thanh Trúc", "giáo dục", 544000, 605000, 10, "NXB000000000");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000004", "Chinh phục IELTS", "Dương Ngữ", "giáo dục", 1587000, 1764000, 10, "NXB000000000");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000005", "Kế toán quản trị cho các doanh nghiệp", "Hoàng Anh Ly", "kỹ năng", 1358000, 1509000, 10, "NXB000000001");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000006", "Kiếp sinh nhân", "Phan Anh Thị", "đạo giáo", 2010000, 2234000, 10, "NXB000000001");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000007", "Cây Cam Của Bạn", "Võ Anh Hướng", "truyện", 1209000, 1344000, 10, "NXB000000000");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000008", "Hắc dạ hành", "Đỗ Anh Tân", "đạo giáo", 886000, 985000, 10, "NXB000000001");
INSERT INTO dau_sach(ma, ten, tac_gia, the_loai, gia_nhap, gia_niem_yet, so_luong, ma_nha_xuat_ban) VALUES("DSA000000009", "Vãn tình", "Trần Trâm", "truyện", 2437000, 2708000, 10, "NXB000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000000", "DSA000000003", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000001", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000002", "DSA000000005", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000003", "DSA000000007", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000004", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000005", "DSA000000008", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000006", "DSA000000004", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000007", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000008", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000009", "DSA000000006", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000010", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000011", "DSA000000008", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000012", "DSA000000004", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000013", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000014", "DSA000000007", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000015", "DSA000000006", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000016", "DSA000000005", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000017", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000018", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000019", "DSA000000001", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000020", "DSA000000003", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000021", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000022", "DSA000000008", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000023", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000024", "DSA000000002", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000025", "DSA000000007", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000026", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000027", "DSA000000006", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000028", "DSA000000004", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000029", "DSA000000005", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000030", "DSA000000009", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000031", "DSA000000004", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000032", "DSA000000003", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000033", "DSA000000001", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000034", "DSA000000007", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000035", "DSA000000002", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000036", "DSA000000006", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000037", "DSA000000008", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000038", "DSA000000000", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000039", "DSA000000005", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000040", "DSA000000003", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000041", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000042", "DSA000000001", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000043", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000044", "DSA000000005", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000045", "DSA000000007", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000046", "DSA000000004", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000047", "DSA000000006", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000048", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000049", "DSA000000008", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000050", "DSA000000000", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000051", "DSA000000009", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000052", "DSA000000001", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000053", "DSA000000003", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000054", "DSA000000008", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000055", "DSA000000007", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000056", "DSA000000005", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000057", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000058", "DSA000000004", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000059", "DSA000000006", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000060", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000061", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000062", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000063", "DSA000000008", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000064", "DSA000000005", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000065", "DSA000000004", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000066", "DSA000000006", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000067", "DSA000000009", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000068", "DSA000000003", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000069", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000070", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000071", "DSA000000009", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000072", "DSA000000000", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000073", "DSA000000008", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000074", "DSA000000002", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000075", "DSA000000005", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000076", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000077", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000078", "DSA000000004", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000079", "DSA000000006", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000080", "DSA000000006", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000081", "DSA000000000", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000082", "DSA000000009", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000083", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000084", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000085", "DSA000000005", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000086", "DSA000000008", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000087", "DSA000000004", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000088", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000089", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000090", "DSA000000005", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000091", "DSA000000008", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000092", "DSA000000004", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000093", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000094", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000095", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000096", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000097", "DSA000000002", "CNH000000000");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000098", "DSA000000001", "CNH000000001");
INSERT INTO quyen_sach(ma, ma_dau_sach, ma_chi_nhanh) VALUES("QSA000000099", "DSA000000006", "CNH000000000");
INSERT INTO nha_xuat_ban(ma, ten, email, sdt, dia_chi, website) VALUES("NXB000000000", "Hồng Đức", "lienhe@hongduc.com", "0989000018", "65 Tràng Thi, Hà Nội", "www.hongduc.com");
INSERT INTO nha_xuat_ban(ma, ten, email, sdt, dia_chi, website) VALUES("NXB000000001", "Kim đồng", "lienhe@kimdong.com", "0989000019", "55 Quang Trung, Hà Nội, Việt Nam", "www.kimdong.com");
INSERT INTO voucher(ma, thoi_gian_bat_dau_hieu_luc, thoi_gian_het_hieu_luc, ma_don_hang, ma_thanh_vien, da_su_dung) VALUES("VOU000000000", STR_TO_DATE("17-6-2021", "%d-%m-%Y"), STR_TO_DATE("31-8-2021", "%d-%m-%Y"), null, "070802000011", False);
INSERT INTO voucher(ma, thoi_gian_bat_dau_hieu_luc, thoi_gian_het_hieu_luc, ma_don_hang, ma_thanh_vien, da_su_dung) VALUES("VOU000000001", STR_TO_DATE("6-7-2021", "%d-%m-%Y"), STR_TO_DATE("29-8-2021", "%d-%m-%Y"), null, "070802000012", False);
INSERT INTO voucher(ma, thoi_gian_bat_dau_hieu_luc, thoi_gian_het_hieu_luc, ma_don_hang, ma_thanh_vien, da_su_dung) VALUES("VOU000000002", STR_TO_DATE("26-1-2021", "%d-%m-%Y"), STR_TO_DATE("24-2-2021", "%d-%m-%Y"), null, "070802000010", False);
INSERT INTO giam_gia(ma, phan_tram_giam, giam_toi_da) VALUES("VOU000000002", 0.94, 386000);
INSERT INTO giam_gia_van_chuyen(ma, phan_tram_giam, giam_toi_da) VALUES("VOU000000001", 0.41, 79000);
INSERT INTO giam_gia_van_chuyen(ma, phan_tram_giam, giam_toi_da) VALUES("VOU000000000", 0.36, 90000);
INSERT INTO ap_dung_cho(ma_voucher, ma_dau_sach) VALUES("VOU000000002", "DSA000000006");
INSERT INTO ap_dung_cho(ma_voucher, ma_dau_sach) VALUES("VOU000000002", "DSA000000009");
INSERT INTO ap_dung_cho(ma_voucher, ma_dau_sach) VALUES("VOU000000002", "DSA000000004");
